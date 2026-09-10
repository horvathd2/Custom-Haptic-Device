/*
 * pi_utils.c
 *
 *  Created on: Sep 5, 2026
 *      Author: H.Dani
 */

#include "pi_utils.h"

/* LOCAL STATIC FUNCTIONS */

static void compute_pi(PI_t *pi_self)
{
	pi_self->us_time = HAL_GetTick();
	pi_self->d_time = (pi_self->us_time - pi_self->prev_time);

	if (pi_self->d_time < 1) pi_self->d_time = 1;

	pi_self->p_err	= pi_self->setpoint - pi_self->current_pos;
	pi_self->i_err	= pi_self->i_err + (pi_self->p_err * pi_self->d_time);

	pi_self->ctrl_signal = (pi_self->kp * pi_self->p_err) +
					   (pi_self->ki * pi_self->i_err);

	pi_self->prev_error	= pi_self->p_err;
	pi_self->prev_time	= pi_self->us_time;
}

/* GLOBAL FUNCTIONS */

