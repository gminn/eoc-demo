/**
 * @file app.c
 * @author Silicon Labs, edited by Gillian Minnehan
 * @brief Top level application functions
 * @version 0.1
 * @date 2023-03-17
 *
 * @copyright Copyright 2020 Silicon Laboratories Inc. www.silabs.com
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 */

#include <stdio.h>

#include "counter.h"

/**
 * @brief Initializes the application
 *
 */
void app_init(void) {
    counter_init();
    start_counter(true);
    printf("Testing counter!\n");
    float elapsed_time_us = get_elapsed_time();
}
