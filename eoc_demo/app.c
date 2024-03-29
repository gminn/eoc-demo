/**
 * @file app.c
 * @author Silicon Labs, edited by Gillian Minnehan for EOC 2023 Talk Demo
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

#include "assert.h"
#include "em_cmu.h"
#include "em_gpio.h"
#include "em_msc.h"

static void counter_demo(bool call_printf);
static void gpio_toggle_demo(bool call_printf);
static void usage_fault_demo(void);
static void disassembly_opt_demo(void);
static void reading_memory_demo(void);

// Constants
#define DWT_CTRL_ADDR (uint32_t *)0xE0001000
#define DWT_CYCCNT_ADDR (uint32_t *)0xE0001004
#define DWT_NOCYCCNT_BIT_OFFSET 25U
#define DWT_NOCYCCNT_BITMASK (1 << DWT_NOCYCCNT_BIT_OFFSET)
#define ENABLE_DIV_0_TRP (0x10)
#define FLASH_INFORMATION_BLK_START_ADDR (uint32_t *)(0x0FE00000)

/**
 * @brief Initializes the application
 *
 */
void app_init(void) {
    // Counter demo
    counter_demo(true);   // call printf
    counter_demo(false);  // don't call printf

    // GPIO toggle demo
    gpio_toggle_demo(true);   // call printf
    gpio_toggle_demo(false);  // don't call printf

    // Usage fault demo
    usage_fault_demo();

    // Disassembly / optimization demo
    disassembly_opt_demo();

    // Reading memory demo
    reading_memory_demo();
}

/**
 * @brief Demonstrate counting cycles with a call to printf
 *
 * @param call_printf whether to call printf (true) or not (false)
 */
static void counter_demo(bool call_printf) {
    bool cycle_count_not_en =
        (*(DWT_CTRL_ADDR) & DWT_NOCYCCNT_BITMASK) >> DWT_NOCYCCNT_BIT_OFFSET;
    assert(!cycle_count_not_en);  // Failure means the cycle counter is not
                                  // enabled on this MCU
    const uint32_t irq_state = __get_PRIMASK();
    __disable_irq();

    uint32_t *cycle_counter_reg = DWT_CYCCNT_ADDR;
    *cycle_counter_reg = 0;

    if (call_printf) {
        printf("Testing printf time!\n");
    }

    float elapsed_counts = *cycle_counter_reg;

    __set_PRIMASK(irq_state);

    float sys_clk_freq = CMU_ClockFreqGet(cmuClock_CORE);
    float seconds = elapsed_counts / sys_clk_freq;
    float ms = seconds * 1000;
    float us = ms * 1000;
    printf("Execution time of printf: %f s, %f ms, %f us\n", seconds, ms, us);
}

/**
 * @brief Demonstrate using a gpio to time a call to printf
 *
 * @note A logic analyzer or oscilloscope should be used to capture the time
 * between the gpio toggles
 *
 * @param call_printf whether to call printf (true) or not (false)
 */
static void gpio_toggle_demo(bool call_printf) {
    GPIO_PinModeSet(gpioPortD, 7, gpioModePushPull, 0);  // Configure GPIO
    const uint32_t irq_state = __get_PRIMASK();
    __disable_irq();

    // Toggle on
    GPIO_PinOutSet(gpioPortD, 7);

    if (call_printf) {
        printf("Testing printf time!\n");
    }

    // Toggle off
    GPIO_PinOutClear(gpioPortD, 7);
    __set_PRIMASK(irq_state);
}

static void usage_fault_demo(void) {
    // Enable trapping on divide by zero in the Configuration and Control
    // Register (CCR) inside the System Control Block (SCB)
    SCB->CCR |= ENABLE_DIV_0_TRP;

    // Divide by zero
    // Check out UFSR inside CFSR (upper 16 bits of 0xE000ED28) to see
    // div by zero flag set
    volatile int test = 5 / 0;
    printf("Result of div by zero: %i\n", test);
}

/**
 * @brief Demonstrate using disassembly to understand compiler optimizations
 *
 * NOTE: delays should NOT be done this way. This is a spin delay, versus more
 * optimal delays that put the thread to sleep, thus giving the CPU to other
 * tasks.
 */
static void disassembly_opt_demo(void) {
    // Without volatile, this loop will get compiled out
    // Ensure optimizations are on to see this behavior (i.e., remove -O0
    // compiler flag that was set for debugging)
    for (int i = 0; i < 1000000000; i++) {
        // Busy loop
    }

    // With volatile, this loop does not get compiled out
    for (volatile int i = 0; i < 1000000000; i++) {
        // Busy loop
    }
}

/**
 * @brief Demonstrate how to use the memory view to understand contents of flash
 *
 */
static void reading_memory_demo(void) {
    // The Embedded Online Conference 2023 is #1 (the best)!
    uint32_t eoc_bytes = 0x1E0C2023;

    // Pull up the MEMORY window, at FLASH_INFORMATION_BLK_START_ADDR
    // See values go from 0xFF --> new values
    MSC_Status_TypeDef status =
        MSC_WriteWord(FLASH_INFORMATION_BLK_START_ADDR, (void *)&eoc_bytes, 4);
    assert(status == mscReturnOk);

    // See values go back to 0xFF when the page is erased
    status = MSC_ErasePage(FLASH_INFORMATION_BLK_START_ADDR);
    assert(status == mscReturnOk);
}
