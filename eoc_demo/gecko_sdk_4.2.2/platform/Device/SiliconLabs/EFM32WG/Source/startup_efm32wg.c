// clang-format off
/***************************************************************************//**
 * @file
 * @brief CMSIS Compatible EFM32WG startup file in C.
 *        Should be used with GCC 'GNU Tools ARM Embedded'
 *******************************************************************************
 * # License
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is Third Party Software licensed by Silicon Labs from a third party
 * and is governed by the sections of the MSLA applicable to Third Party
 * Software and the additional terms set forth below.
 *
 ******************************************************************************/
/*
 * Copyright (c) 2009-2018 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdbool.h>
#include "em_device.h"        /* The correct device header file. */

#define TOTAL_INTERRUPTS    (16 + EXT_IRQ_COUNT)

/*---------------------------------------------------------------------------
 * External References
 *---------------------------------------------------------------------------*/
extern uint32_t __INITIAL_SP;

extern __NO_RETURN void __PROGRAM_START(void);

#if defined (__START) && defined (__GNUC__)
extern int  __START(void) __attribute__((noreturn));    /* main entry point */
void Copy_Table();
void Zero_Table();
#endif /* __START */

/*---------------------------------------------------------------------------
 * Internal References
 *---------------------------------------------------------------------------*/
__NO_RETURN void Reset_Handler(void);
void Default_Handler(void);

#if defined (__GNUC__)
#ifndef __STACK_SIZE
#define __STACK_SIZE    0x00000400
#endif /* __STACK_SIZE */

#ifndef __HEAP_SIZE
#define __HEAP_SIZE    0x00000C00
#endif /* __HEAP_SIZE */
#endif /* __GNUC__ */

/*----------------------------------------------------------------------------
 * Exception / Interrupt Handler
 *----------------------------------------------------------------------------*/
/* Cortex-M Processor Exceptions */
void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void DebugMon_Handler(void);
void SVC_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);
void sl_app_properties(void);        /* Prototype to please MISRA checkers. */

/* Part Specific Interrupts */
void DMA_IRQHandler(void);
void GPIO_EVEN_IRQHandler(void);
void TIMER0_IRQHandler(void);
void USART0_RX_IRQHandler(void);
void USART0_TX_IRQHandler(void);
void USB_IRQHandler(void);
void ACMP0_IRQHandler(void);
void ADC0_IRQHandler(void);
void DAC0_IRQHandler(void);
void I2C0_IRQHandler(void);
void I2C1_IRQHandler(void);
void GPIO_ODD_IRQHandler(void);
void TIMER1_IRQHandler(void);
void TIMER2_IRQHandler(void);
void TIMER3_IRQHandler(void);
void USART1_RX_IRQHandler(void);
void USART1_TX_IRQHandler(void);
void LESENSE_IRQHandler(void);
void USART2_RX_IRQHandler(void);
void USART2_TX_IRQHandler(void);
void UART0_RX_IRQHandler(void);
void UART0_TX_IRQHandler(void);
void UART1_RX_IRQHandler(void);
void UART1_TX_IRQHandler(void);
void LEUART0_IRQHandler(void);
void LEUART1_IRQHandler(void);
void LETIMER0_IRQHandler(void);
void PCNT0_IRQHandler(void);
void PCNT1_IRQHandler(void);
void PCNT2_IRQHandler(void);
void RTC_IRQHandler(void);
void BURTC_IRQHandler(void);
void CMU_IRQHandler(void);
void VCMP_IRQHandler(void);
void LCD_IRQHandler(void);
void MSC_IRQHandler(void);
void AES_IRQHandler(void);
void EBI_IRQHandler(void);
void EMU_IRQHandler(void);
void FPUEH_IRQHandler(void);

/*----------------------------------------------------------------------------
 * Exception / Interrupt Vector table
 *----------------------------------------------------------------------------*/

#if defined (__GNUC__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
#endif

#if defined (__ICCARM__)
#pragma data_alignment=256
extern const tVectorEntry __VECTOR_TABLE[TOTAL_INTERRUPTS];
const tVectorEntry        __VECTOR_TABLE[TOTAL_INTERRUPTS] __VECTOR_TABLE_ATTRIBUTE = {
#elif defined(__GNUC__)
extern const tVectorEntry __VECTOR_TABLE[TOTAL_INTERRUPTS];
const tVectorEntry __VECTOR_TABLE[TOTAL_INTERRUPTS] __attribute__((aligned(256)))
__VECTOR_TABLE_ATTRIBUTE = {
#else
extern const tVectorEntry __VECTOR_TABLE[TOTAL_INTERRUPTS];
const tVectorEntry __VECTOR_TABLE[TOTAL_INTERRUPTS] __VECTOR_TABLE_ATTRIBUTE = {
#endif
  /* Cortex-M Exception Handlers */
  { .topOfStack = &__INITIAL_SP },            /* Initial Stack Pointer */
  { Reset_Handler             },              /* Reset Handler */
  { NMI_Handler               },              /* NMI Handler */
  { HardFault_Handler         },              /* Hard Fault Handler */
  { MemManage_Handler         },              /* MPU Fault Handler */
  { BusFault_Handler          },              /* Bus Fault Handler */
  { UsageFault_Handler        },              /* Usage Fault Handler */
  { Default_Handler           },              /* Reserved */
  { Default_Handler           },              /* Reserved */
  { Default_Handler           },              /* Reserved */
#ifdef BOOTLOADER_ENABLE
  { (pFunc) & mainStageTable },
#else
  { Default_Handler           },              /* Reserved */
#endif
  { SVC_Handler               },              /* SVCall Handler */
  { DebugMon_Handler          },              /* Debug Monitor Handler */
  { sl_app_properties         },              /* Application properties*/
  { PendSV_Handler            },              /* PendSV Handler */
  { SysTick_Handler           },              /* SysTick Handler */

  /* External interrupts */
  { DMA_IRQHandler            },              /* 0 */
  { GPIO_EVEN_IRQHandler      },              /* 1 */
  { TIMER0_IRQHandler         },              /* 2 */
  { USART0_RX_IRQHandler      },              /* 3 */
  { USART0_TX_IRQHandler      },              /* 4 */
  { USB_IRQHandler            },              /* 5 */
  { ACMP0_IRQHandler          },              /* 6 */
  { ADC0_IRQHandler           },              /* 7 */
  { DAC0_IRQHandler           },              /* 8 */
  { I2C0_IRQHandler           },              /* 9 */
  { I2C1_IRQHandler           },              /* 10 */
  { GPIO_ODD_IRQHandler       },              /* 11 */
  { TIMER1_IRQHandler         },              /* 12 */
  { TIMER2_IRQHandler         },              /* 13 */
  { TIMER3_IRQHandler         },              /* 14 */
  { USART1_RX_IRQHandler      },              /* 15 */
  { USART1_TX_IRQHandler      },              /* 16 */
  { LESENSE_IRQHandler        },              /* 17 */
  { USART2_RX_IRQHandler      },              /* 18 */
  { USART2_TX_IRQHandler      },              /* 19 */
  { UART0_RX_IRQHandler       },              /* 20 */
  { UART0_TX_IRQHandler       },              /* 21 */
  { UART1_RX_IRQHandler       },              /* 22 */
  { UART1_TX_IRQHandler       },              /* 23 */
  { LEUART0_IRQHandler        },              /* 24 */
  { LEUART1_IRQHandler        },              /* 25 */
  { LETIMER0_IRQHandler       },              /* 26 */
  { PCNT0_IRQHandler          },              /* 27 */
  { PCNT1_IRQHandler          },              /* 28 */
  { PCNT2_IRQHandler          },              /* 29 */
  { RTC_IRQHandler            },              /* 30 */
  { BURTC_IRQHandler          },              /* 31 */
  { CMU_IRQHandler            },              /* 32 */
  { VCMP_IRQHandler           },              /* 33 */
  { LCD_IRQHandler            },              /* 34 */
  { MSC_IRQHandler            },              /* 35 */
  { AES_IRQHandler            },              /* 36 */
  { EBI_IRQHandler            },              /* 37 */
  { EMU_IRQHandler            },              /* 38 */
  { FPUEH_IRQHandler          },              /* 39 */
};

#if defined (__GNUC__)
#pragma GCC diagnostic pop
#endif

#if defined (__START) && defined (__GNUC__)
void Copy_Table()
{
  uint32_t        *pSrc, *pDest;
  extern uint32_t __etext;
  extern uint32_t __data_start__;
  extern uint32_t __data_end__;
  pSrc  = &__etext;
  pDest = &__data_start__;

  for (; pDest < &__data_end__; ) {
    *pDest++ = *pSrc++;
  }
}

void Zero_Table()
{
  uint32_t        *pDest;
  extern uint32_t __bss_start__;
  extern uint32_t __bss_end__;
  pDest = &__bss_start__;

  for (; pDest < &__bss_end__; ) {
    *pDest++ = 0UL;
  }
}
#endif /* __START */

/*---------------------------------------------------------------------------
 * Reset Handler called on controller reset
 *---------------------------------------------------------------------------*/
__NO_RETURN void Reset_Handler(void)
{
#ifndef __NO_SYSTEM_INIT
  SystemInit();                    /* CMSIS System Initialization */
#endif

#if defined (__GNUC__) && defined (__START)
  Copy_Table();
  Zero_Table();
  __START();
#else
  __PROGRAM_START();               /* Enter PreMain (C library entry point) */
#endif /* __GNUC__ */
}

#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION >= 6010050)
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wmissing-noreturn"
#endif

__WEAK void NMI_Handler(void)
{
    Default_Handler();
}
__WEAK void HardFault_Handler(void)
{
    Default_Handler();
}
__WEAK void MemManage_Handler(void)
{
    Default_Handler();
}
__WEAK void BusFault_Handler(void)
{
    Default_Handler();
}
__WEAK void UsageFault_Handler(void)
{
    Default_Handler();
}
__WEAK void DebugMon_Handler(void)
{
    Default_Handler();
}
__WEAK void SVC_Handler(void)
{
    Default_Handler();
}
__WEAK void PendSV_Handler(void)
{
    Default_Handler();
}
__WEAK void SysTick_Handler(void)
{
    Default_Handler();
}
__WEAK void sl_app_properties(void)
{
    Default_Handler();
}

/* Part Specific Interrupts */
__WEAK void DMA_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void GPIO_EVEN_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void TIMER0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void USART0_RX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void USART0_TX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void USB_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void ACMP0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void ADC0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void DAC0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void I2C0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void I2C1_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void GPIO_ODD_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void TIMER1_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void TIMER2_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void TIMER3_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void USART1_RX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void USART1_TX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void LESENSE_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void USART2_RX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void USART2_TX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void UART0_RX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void UART0_TX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void UART1_RX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void UART1_TX_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void LEUART0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void LEUART1_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void LETIMER0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void PCNT0_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void PCNT1_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void PCNT2_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void RTC_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void BURTC_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void CMU_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void VCMP_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void LCD_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void MSC_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void AES_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void EBI_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void EMU_IRQHandler(void)
{
    Default_Handler();
}
__WEAK void FPUEH_IRQHandler(void)
{
    Default_Handler();
}

/*----------------------------------------------------------------------------
 * Default Handler for Exceptions / Interrupts
 *----------------------------------------------------------------------------*/
void Default_Handler(void)
{
  __disable_irq();

  // Break if debugger attached to help with debugging
  if (CoreDebug->DHCSR & CoreDebug_DHCSR_C_DEBUGEN_Msk)
  {
    __BKPT(1);
  }

  for (;;) {}
}

#if defined(__ARMCC_VERSION) && (__ARMCC_VERSION >= 6010050)
  #pragma clang diagnostic pop
#endif
