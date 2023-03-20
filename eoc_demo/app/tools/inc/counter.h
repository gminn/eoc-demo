/**
 * @file counter.h
 * @author Gillian Minnehan
 * @brief Header for counter
 * @version 0.1
 * @date 2023-03-17
 *
 * @copyright Copyright (c) 2023
 *
 */
#ifndef COUNTER_H
#define COUNTER_H

#include <stdbool.h>
#include <stdint.h>

/**
 * @brief Initialize counter module
 *
 * @note Must be called once before calling start_counter the first time
 *
 */
void counter_init(void);

/**
 * @brief Set the counter start
 *
 * @param disable_interrupts
 */
void start_counter(bool disable_interrupts);

/**
 * @brief Get the elapsed time in seconds since start_counter() was called
 *
 * @return float elapsed time in microseconds
 */
float get_elapsed_time(void);

/**
 * @brief Get the elapsed count in cycles since start_counter() was called
 *
 * @return uint32_t elapsed cycles
 */
uint32_t get_elapsed_count(void);

#endif /* COUNTER_H */