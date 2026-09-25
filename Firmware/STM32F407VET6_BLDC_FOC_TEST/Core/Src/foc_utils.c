/*
 * foc.c
 *
 *  Created on: May 9, 2026
 *      Author: H.Dani
 */

#include "foc_utils.h"
#include "as5600.h"
#include "main.h"
#include "math.h"
#include "string.h"
#include "stdlib.h"
#include "stdint.h"

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

/* LOCAL STATIC FUNCTIONS */

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

static void align_rotor(BLDC_t *bldc_self)
{
	uint8_t u8DelayMs = 500;
	uint8_t u8Index = 0;

	/* Set one phase of the motor to VDC, the rest to GND */
	bldc_self->duty_pwm1 = bldc_self->pwm_period;
	bldc_self->duty_pwm2 = 0;
	bldc_self->duty_pwm3 = 0;

	/* Set duty cycles for the PWM timers */
	bldc_self->htim_pwm->Instance->CCR1 = bldc_self->duty_pwm1;
	bldc_self->htim_pwm->Instance->CCR2 = bldc_self->duty_pwm2;
	bldc_self->htim_pwm->Instance->CCR3 = bldc_self->duty_pwm3;

	/* Delay for 500ms to determine electrical angle */
	for(u8Index; u8Index <= u8DelayMs; u8Index++)
	{

	}
}

static uint8_t compute_sv_sector(float alpha, float beta)
{
	uint8_t u8Sector = SVPWM_SECTOR_V1;

	if(beta >=	0 && beta < alpha * SQRT3)
	{
		u8Sector = SVPWM_SECTOR_V1;
	}
	else if(beta >= alpha * SQRT3 && beta >= alpha * -SQRT3)
	{
		u8Sector = SVPWM_SECTOR_V2;
	}
	else if(beta < alpha * -SQRT3 && beta > 0)
	{
		u8Sector = SVPWM_SECTOR_V3;
	}
	else if(beta <= 0 && beta > alpha * SQRT3)
	{
		u8Sector = SVPWM_SECTOR_V4;
	}
	else if(beta <= alpha * SQRT3 && beta <= alpha * -SQRT3)
	{
		u8Sector = SVPWM_SECTOR_V5;
	}
	else if(beta > alpha * -SQRT3 && beta < 0)
	{
		u8Sector = SVPWM_SECTOR_V6;
	}
	else
	{
		/* MISRA compliance */
	}

	return u8Sector;
}

/* GLOBAL FUNCTIONS */

uint16_t get_mechanical_angle(BLDC_t *bldc_self)
{
	/* Convert raw encoder value to mechanical angle in degrees */
	return bldc_self->as5600_enc.raw_angle * ENC_TO_DEG;
}

uint16_t get_electrical_angle(BLDC_t *bldc_self)
{
	/* Convert mechanical angle to electrical angle */
	return get_mechanical_angle(bldc_self)* bldc_self->pole_pairs;
}

void set_phase_duty_cycle(BLDC_t *bldc_self)
{
	bldc_self->htim_pwm->Instance->CCR1 = bldc_self->duty_pwm1;
	bldc_self->htim_pwm->Instance->CCR2 = bldc_self->duty_pwm2;
	bldc_self->htim_pwm->Instance->CCR3 = bldc_self->duty_pwm3;
}

bldc_err_t motor_align(BLDC_t *bldc_self)
{
	bldc_self->duty_pwm1 = 5999;
	bldc_self->duty_pwm2 = 0;
	bldc_self->duty_pwm3 = 0;

	set_phase_duty_cycle(bldc_self);

	bldc_self->delay(500);

	if(as5600_read_angle(&bldc_self->as5600_enc) != AS_OK)
	{
		return BLDC_FAIL;
	}

	/* Store the mechanical angle offset for deriving the electrical angle */
	bldc_self->theta_m_offset = bldc_self->as5600_enc->raw_angle;

	bldc_self->duty_pwm1 = 0;
	bldc_self->duty_pwm2 = 0;
	bldc_self->duty_pwm3 = 0;

	bldc_self->delay(500);

	set_phase_duty_cycle(bldc_self);

	return BLDC_OK;
}

void compute_svpwm(BLDC_t *bldc_self)
{
	uint16_t t1 = 0;
	uint16_t t2 = 0;
	uint16_t t0 = 0;

	uint8_t sector = compute_sv_sector(bldc_self->ialpha, bldc_self->ibeta);

	float theta_s = bldc_self->theta_e - (sector - 1) * PI_DIV_THREE;

	uint8_t m = 1; /* TODO: Update svpwm equations used, remove m */

	t1 = bldc_self->pwm_period * m * (sinf(60-bldc_self->theta_e))/sinf(60);
	t2 = bldc_self->pwm_period * m * (sinf(bldc_self->theta_e))/sinf(60);
	t0 = bldc_self->pwm_period - t1 - t2;

	switch(sector)
	{
		case SVPWM_SECTOR_V1:

			bldc_self->duty_pwm1 = (t1 + t2 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm2 = (t2 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm3 = (t0/2)/bldc_self->pwm_period;

			break;
		case SVPWM_SECTOR_V2:

			bldc_self->duty_pwm1 = (t1 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm2 = (t1 + t2 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm3 = (t0/2)/bldc_self->pwm_period;

			break;
		case SVPWM_SECTOR_V3:

			bldc_self->duty_pwm1 = (t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm2 = (t1 + t2 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm3 = (t2 + t0/2)/bldc_self->pwm_period;

			break;
		case SVPWM_SECTOR_V4:

			bldc_self->duty_pwm1 = (t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm2 = (t1 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm3 = (t1 + t2 + t0/2)/bldc_self->pwm_period;

			break;
		case SVPWM_SECTOR_V5:

			bldc_self->duty_pwm1 = (t2 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm2 = (t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm3 = (t1 + t2 + t0/2)/bldc_self->pwm_period;

			break;
		case SVPWM_SECTOR_V6:

			bldc_self->duty_pwm1 = (t1 + t2 + t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm2 = (t0/2)/bldc_self->pwm_period;
			bldc_self->duty_pwm3 = (t1 + t0/2)/bldc_self->pwm_period;

			break;
	}

	/* Clamp duty cycle outputs */
	bldc_self->duty_pwm1 = (bldc_self->duty_pwm1 > bldc_self->pwm_period) ? bldc_self->pwm_period : bldc_self->duty_pwm1;
	bldc_self->duty_pwm2 = (bldc_self->duty_pwm2 > bldc_self->pwm_period) ? bldc_self->pwm_period : bldc_self->duty_pwm2;
	bldc_self->duty_pwm3 = (bldc_self->duty_pwm3 > bldc_self->pwm_period) ? bldc_self->pwm_period : bldc_self->duty_pwm3;
}

void bldc_move(BLDC_t *bldc_self, int32_t setpoint)
{
	bldc_self->pi_pos.current_pos = bldc_self->theta_m;
	bldc_self->pi_pos.setpoint = setpoint;

	compute_pi(&bldc_self->pi_pos);

	/* Set PWM for phases */
	set_phase_duty_cycle(bldc_self);
}

bldc_err_t init_motor_foc(BLDC_t *self,
						  TIM_HandleTypeDef *htim_pwm,
						  AS5600_t as5600_enc,
						  ADC_HandleTypeDef *ADC_current_sensor,
						  uint8_t pole_pairs,
						  uint32_t pwm_freq,
						  float kp, float ki,
						  void (*delayFunction)(uint32_t))
{
	if(self == NULL)
	{
		return BLDC_FAIL;
	}

	memset(self, 0, sizeof(BLDC_t));

	self->delay = delayFunction;

	self->htim_pwm = htim_pwm;
	self->as5600_enc = as5600_enc;
	self->ADC_current_sensor = ADC_current_sensor;
	self->pi_pos.kp = kp;
	self->pi_pos.ki = ki;
	self->pole_pairs = pole_pairs;

	self->pwm_freq = pwm_freq;	/* TODO: change method of getting PWM frequency */
	self->pwm_period = (1/(float)self->pwm_freq)*100000;

	/* Align rotor on startup to determine electrical angle offset */
	if(motor_align(self) != BLDC_OK)
	{
		return BLDC_FAIL;
	}

	return BLDC_OK;
}
