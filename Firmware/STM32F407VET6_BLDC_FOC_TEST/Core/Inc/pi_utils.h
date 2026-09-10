/*
 * pi_utils.h
 *
 *  Created on: Sep 5, 2026
 *      Author: H.Dani
 */

#ifndef INC_PI_UTILS_H_
#define INC_PI_UTILS_H_

/* MACROS */

/* TYPEDEFS AND STRUCTS */

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
}PI_t;

/* FUNCTION PROTOTYPES */



#endif /* INC_PI_UTILS_H_ */
