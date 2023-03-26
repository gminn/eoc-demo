/**
 * @file gpio_mgr.c
 * @author your name (you@domain.com)
 * @brief
 * @version 0.1
 * @date 2023-03-26
 *
 * @copyright Copyright (c) 2023
 *
 */

#include "gpio_mgr.h"

void configure_gpio(gpio_port_t port, uint8_t pin, gpio_mode_t mode) {
    GPIO_PinModeSet(port, pin, mode, 0);  // 0 -- start low
}

void set_gpio(gpio_port_t port, uint8_t pin, int direction) {
    if (direction == 0) {
        GPIO_PinOutClear(port, pin);  // set low
    } else {
        GPIO_PinOutSet(port, pin);  // set high
    }
}