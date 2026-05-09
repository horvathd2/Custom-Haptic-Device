/*
 * foc.c
 *
 *  Created on: May 9, 2026
 *      Author: H.Dani
 */

#include "foc.h"
#include "as5600.h"
#include "main.h"
#include "math.h"
#include "string.h"
#include "stdlib.h"

/*
 *
 * 	TO DO:
 * 	 - IMPLEMENT 2 MODES OF CONTROL:
 * 	 	1. FOC CONTROL FOR TORQUE/POSITION/SPEED (LOWER LEVEL)
 * 	 		measure as5600 encoder angle, ia, ib currents
 * 	 		ia ib - measured phase currents, ic = -(ia+ib)
 * 	 		pass ia ib ic into clarke => alpha beta
 * 	 		pass alpha beta and encoder angle theta into park => d and q
 * 	 	2. VIRTUAL SPRING DAMPER FOR TORQUE (HIGHER LEVEL)
 *
 *
 * */

/*
 *
 * MECHANICAL ANGLE CONVERSION:
 * 	angle(rad) = (raw_value*2pi)/4096
 *
 */

static void clarke_transform(float ia, float ib, float *alpha, float *beta)
{
    *alpha = ia;
    *beta = INV_SQRT3 * (ia + 2.0f * ib);
}

static void park_transform(float alpha, float beta, float theta, float *d, float *q)
{
    *d = alpha * cosf(theta) + beta * sinf(theta); //compute once, so replace with a precomputed var sin_theta/ cos_theta
    *q = beta * cosf(theta) - alpha * sinf(theta); //ADD LUT!!!
}

static void inverse_clarke_transform(float alpha, float beta, float *ia, float *ib, float *ic)
{
	*ia = alpha;
	*ib = -0.5f * alpha + SQRT3_BY_TWO * beta;   // cos(120°), sin(120°)
	*ic = -0.5f * alpha - SQRT3_BY_TWO * beta;
}

static void inverse_park_transform(float vd, float vq, float sin_theta, float cos_theta, float *alpha, float *beta)
{
	*alpha = vd * cos_theta - vq * sin_theta;
	*beta = vd * sin_theta + vq * cos_theta;
}

static void compute_pid(PID *pid)
{
	pid->us_time = HAL_GetTick();
	pid->d_time = (pid->us_time - pid->prev_time);

	if (pid->d_time < 1) pid->d_time = 1;

	pid->p_err	= pid->setpoint - pid->current_pos;
	pid->d_err	= (pid->p_err - pid->prev_error)/pid->d_time;
	pid->i_err	= pid->i_err + (pid->p_err * pid->d_time);

	pid->ctrl_signal = (pid->kp * pid->p_err) +
					   (pid->kd * pid->d_err) +
					   (pid->ki * pid->i_err);

	pid->prev_error	= pid->p_err;
	pid->prev_time	= pid->us_time;
}

bldc_err_t bldc_move(BLDC_t *self, int32_t setpoint)
{
	self->pid_pos.current_pos = self->theta_m;
	self->pid_pos.setpoint = setpoint;

	compute_pid(&self->pid_pos);

	//Set PWM for phases
	self->htim_pwm->Instance->CCR1 = self->pwm1;
	self->htim_pwm->Instance->CCR2 = self->pwm2;
	self->htim_pwm->Instance->CCR3 = self->pwm3;

	return BLDC_OK;
}

bldc_err_t bldc_move_foc(BLDC_t *self, int32_t setpoint)
{
	// Convert raw encoder value to mechanical angle in degrees
	self->theta_m = self->as5600_enc.raw_angle * ENC_TO_DEG;
	// Convert mechanical angle to electrical angle
	self->theta_e = self->theta_m * POLE_PAIRS_5010;



	return BLDC_OK;
}

bldc_err_t init_motor_foc(BLDC_t *self,
						  TIM_HandleTypeDef *htim_pwm,
						  AS5600_t as5600_enc,
						  ADC_HandleTypeDef *ADC_current_sensor,
						  float kp, float ki, float kd)
{
	if(self == NULL)
		return BLDC_FAIL;

	memset(self, 0, sizeof(BLDC_t));

	self->htim_pwm = htim_pwm;
	self->as5600_enc = as5600_enc;
	self->pid_pos.kp = kp;
	self->pid_pos.ki = ki;
	self->pid_pos.kd = kd;

	return BLDC_OK;
}


