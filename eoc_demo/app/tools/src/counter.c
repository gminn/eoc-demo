/**
 * @file counter.c
 * @author Gillian Minnehan
 * @brief Counter tool source file
 * @version 0.1
 * @date 2023-03-17
 *
 * @copyright Copyright (c) 2023
 *
 */

#include "counter.h"

#include <stdio.h>

#include "assert.h"
#include "em_cmu.h"

#define DWT_CTRL_ADDR 0xE0001000
#define DWT_CYCCNT_ADDR 0xE0001004
#define DWT_NOCYCCNT_BIT_OFFSET 25
#define DWT_NOCYCCNT_BITMASK (1 << DWT_NOCYCCNT_BIT_OFFSET)

void counter_init(void) {
    // Ensure cycle counter feature is enabled
    bool cycle_count_not_en =
        (*(uint32_t *)(DWT_CTRL_ADDR)&DWT_NOCYCCNT_BITMASK) >> DWT_NOCYCCNT_BIT_OFFSET;
    assert(!cycle_count_not_en);  // Failure means the cycle counter is not enabled on this MCU
}

void start_counter(bool disable_interrupts) {
    // TODO: Process input, save to static variable
    (void)(disable_interrupts);

    // Clear the cycle counter
    uint32_t *cycle_counter_reg = (uint32_t *)(DWT_CYCCNT_ADDR);
    *cycle_counter_reg = 0;
}

float get_elapsed_time(void) {
    // TODO: Re-enable interrupts if needed
    float elapsed_counts = *(uint32_t *)(DWT_CYCCNT_ADDR);
    float sys_clk_freq = CMU_ClockFreqGet(cmuClock_CORE);
    float seconds = elapsed_counts / sys_clk_freq;
    float ms = seconds * 1000;
    float us = ms * 1000;
    return us;
}

uint32_t get_elapsed_count(void) {
    // TODO: Re-enable interrupts if needed
    uint32_t elapsed_counts = *(uint32_t *)(DWT_CYCCNT_ADDR);
    return elapsed_counts;
}