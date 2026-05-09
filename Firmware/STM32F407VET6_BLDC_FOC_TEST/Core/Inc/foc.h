/*
 * foc.h
 *
 *  Created on: May 9, 2026
 *      Author: H.Dani
 */

#ifndef INC_FOC_H_
#define INC_FOC_H_

#include "main.h"
#include "as5600.h"

#define ENCODER_RESOLUTION	AS5600_RESOLUTION
#define POLE_PAIRS_5010		7

#define PI					3.141592653f
#define TWO_PI				6.283185306f
#define INV_SQRT3 			0.577350269f	//1/sqrt(3)
#define TWO_BY_SQRT3 		1.154700538f
#define ONE_BY_SQRT3 		0.577350269f
#define SQRT3_BY_TWO 		0.866025403f
#define SQRT3 				1.732050807f
#define ENC_TO_RAD			0.001533980f
#define RAD_TO_DEG			57.29577951f
#define ENC_TO_DEG			0.087890625f

typedef enum{
	BLDC_OK = 0x00,
	BLDC_FAIL = 0x01,
}bldc_status_t;

typedef uint8_t bldc_err_t;

typedef struct BLDC_t BLDC_t;

typedef struct{
	float ctrl_signal;
	float kp, ki, kd;
	float p_err, i_err, d_err;
	uint32_t us_time;
	uint32_t d_time;
	uint32_t prev_time;
	int32_t setpoint;
	int32_t current_pos;
	int32_t prev_error;
}PID;

struct BLDC_t{
	PID pid_pos;
	AS5600_t as5600_enc;
	ADC_HandleTypeDef *ADC_current_sensor;
	TIM_HandleTypeDef *htim_pwm;
	float ia, ib, ic;		//phase currents
	float ialpha, ibeta;
	float m_q, m_d;
	float theta_m, theta_e; //mechanical and electrical angles
	uint16_t pwm1;
	uint16_t pwm2;
	uint16_t pwm3;
};

#endif /* INC_FOC_H_ */
