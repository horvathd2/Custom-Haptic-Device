/*
 * foc.h
 *
 *  Created on: May 9, 2026
 *      Author: H.Dani
 */

#ifndef INC_FOC_UTILS_H_
#define INC_FOC_UTILS_H_

#include "main.h"
#include "as5600.h"
#include "pi_utils.h"

/* MACROS */

#define ENCODER_RESOLUTION	AS5600_RESOLUTION
#define POLE_PAIRS_5010		7

#define PI					3.141592653f
#define TWO_PI				6.283185306f
#define PI_DIV_THREE		1.047197551f
#define INV_SQRT3 			0.577350269f
#define TWO_BY_SQRT3 		1.154700538f
#define ONE_BY_SQRT3 		0.577350269f
#define SQRT3_BY_TWO 		0.866025403f
#define SQRT3 				1.732050807f
#define ENC_TO_RAD			0.001533980f
#define RAD_TO_DEG			57.29577951f
#define ENC_TO_DEG			0.087890625f

#define SVPWM_SECTOR_V1		1	/* 0 - 60 */
#define SVPWM_SECTOR_V2		2	/* 60 - 120 */
#define SVPWM_SECTOR_V3		3	/* 120 - 180 */
#define SVPWM_SECTOR_V4		4	/* 180 - 240 */
#define SVPWM_SECTOR_V5		5	/* 240 - 300 */
#define SVPWM_SECTOR_V6		6	/* 300 - 360 */

/* TYPEDEFS AND STRUCTS */

typedef enum{
	BLDC_OK = 0x00,
	BLDC_FAIL = 0x01,
}bldc_status_t;

typedef uint8_t bldc_err_t;

typedef struct{
	PI_t pi_pos;
	AS5600_t as5600_enc;
	ADC_HandleTypeDef *ADC_current_sensor;
	TIM_HandleTypeDef *htim_pwm;
	float ia, ib, ic;
	float ialpha, ibeta;	/* TODO: SWITCH FROM FLOAT TO INT? */
	float m_q, m_d;
	float theta_m, theta_e;
	uint16_t pwm_period;
	uint16_t duty_pwm1;
	uint16_t duty_pwm2;
	uint16_t duty_pwm3;
}BLDC_t;

/* FUNCTION PROTOTYPES */



#endif /* INC_FOC_UTILS_H_ */
