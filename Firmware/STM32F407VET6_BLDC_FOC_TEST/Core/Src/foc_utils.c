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

static uint8_t compute_sv_sector(float *alpha, float *beta)
{
	if(*beta >=	0 && *beta < *alpha * SQRT3)
	{
		return SVPWM_SECTOR_V1;
	}
	else if(*beta >= *alpha * SQRT3 && *beta >= *alpha * -SQRT3)
	{
		return SVPWM_SECTOR_V2;
	}
	else if(*beta < *alpha * -SQRT3 && *beta > 0)
	{
		return SVPWM_SECTOR_V3;
	}
	else if(*beta <= 0 && *beta > *alpha * SQRT3)
	{
		return SVPWM_SECTOR_V4;
	}
	else if(*beta <= *alpha * SQRT3 && *beta <= *alpha * -SQRT3)
	{
		return SVPWM_SECTOR_V5;
	}
	else if(*beta > *alpha * -SQRT3 && *beta < 0)
	{
		return SVPWM_SECTOR_V6;
	}
	else
	{
		/* MISRA compliance */
	}
}


/* GLOBAL FUNCTIONS */

void compute_svpwm(float *alpha, float *beta)
{
	uint16_t t1 = 0;
	uint16_t t2 = 0;
	uint16_t t0 = 0;

	uint8_t sector = compute_sv_sector(alpha, beta);

	switch(sector)
	{
		case SVPWM_SECTOR_V1:

			break;
		case SVPWM_SECTOR_V2:

			break;
		case SVPWM_SECTOR_V3:

			break;
		case SVPWM_SECTOR_V4:

			break;
		case SVPWM_SECTOR_V5:

			break;
		case SVPWM_SECTOR_V6:

			break;
		default:

			break;
	}
}

void bldc_move(BLDC_t *self, int32_t setpoint)
{
	self->pi_pos.current_pos = self->theta_m;
	self->pi_pos.setpoint = setpoint;

	compute_pi(&self->pi_pos);

	/* Set PWM for phases */
	self->htim_pwm->Instance->CCR1 = self->pwm1;
	self->htim_pwm->Instance->CCR2 = self->pwm2;
	self->htim_pwm->Instance->CCR3 = self->pwm3;

}

void bldc_move_foc(BLDC_t *self, int32_t setpoint)
{
	/* Convert raw encoder value to mechanical angle in degrees */
	self->theta_m = self->as5600_enc.raw_angle * ENC_TO_DEG;
	/* Convert mechanical angle to electrical angle */
	self->theta_e = self->theta_m * POLE_PAIRS_5010;

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


