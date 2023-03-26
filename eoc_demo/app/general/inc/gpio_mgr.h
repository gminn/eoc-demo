/**
 * @file gpio_mgr.h
 * @author Gillian Minnehan
 * @brief GPIO manager library
 * @version 0.1
 * @date 2023-03-26
 *
 * @copyright Copyright (c) 2023
 *
 */

#ifndef GPIO_MGR_H
#define GPIO_MGR_H

#include "em_gpio.h"

typedef enum {
    PORT_A = gpioPortA,
    PORT_B = gpioPortB,
    PORT_C = gpioPortC,
    PORT_D = gpioPortD,
    PORT_E = gpioPortE,
    PORT_F = gpioPortF,
} gpio_port_t;

typedef enum {
    DISABLED = gpioModeDisabled,
    INPUT = gpioModeInput,
    OUTPUT = gpioModePushPull,
} gpio_mode_t;

void configure_gpio(gpio_port_t port, uint8_t pin, gpio_mode_t mode);

void set_gpio(gpio_port_t port, uint8_t pin, int direction);

#endif /* GPIO_MGR_H */