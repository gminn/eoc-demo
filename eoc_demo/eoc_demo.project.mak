####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 14                                              #
####################################################################

BASE_SDK_PATH = /Users/minnegm1/SimplicityStudio/SDKs/gecko_sdk
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
COPIED_SDK_PATH ?= gecko_sdk_4.2.2

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DDEBUG_EFM=1' \
 '-DEFM32WG990F256=1' \
 '-DSL_BOARD_NAME="BRD2400A"' \
 '-DSL_BOARD_REV="C01"' \
 '-DconfigNUM_SDK_THREAD_LOCAL_STORAGE_POINTERS=2' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1'

ASM_DEFS += \
 '-DDEBUG_EFM=1' \
 '-DEFM32WG990F256=1' \
 '-DSL_BOARD_NAME="BRD2400A"' \
 '-DSL_BOARD_REV="C01"' \
 '-DconfigNUM_SDK_THREAD_LOCAL_STORAGE_POINTERS=2' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1'

INCLUDES += \
 -Iconfig \
 -Iautogen \
 -I. \
 -I$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFM32WG/Include \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
 -I$(COPIED_SDK_PATH)/platform/service/cli/inc \
 -I$(COPIED_SDK_PATH)/platform/service/cli/src \
 -I$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(COPIED_SDK_PATH)/platform/CMSIS/RTOS2/Include \
 -I$(COPIED_SDK_PATH)/platform/service/device_init/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/dmadrv/inc \
 -I$(COPIED_SDK_PATH)/platform/emdrv/common/inc \
 -I$(COPIED_SDK_PATH)/platform/emlib/inc \
 -I$(COPIED_SDK_PATH)/util/third_party/freertos/cmsis/Include \
 -I$(COPIED_SDK_PATH)/util/third_party/freertos/kernel/include \
 -I$(COPIED_SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM4F \
 -I$(COPIED_SDK_PATH)/platform/service/iostream/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/leddrv/inc \
 -I$(COPIED_SDK_PATH)/platform/common/toolchain/inc \
 -I$(COPIED_SDK_PATH)/platform/service/system/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -std=c99 \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 --specs=nano.specs \
 -g

CXX_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -std=c++11 \
 -fno-rtti \
 -fno-exceptions \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 --specs=nano.specs \
 -g

ASM_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -imacros sl_gcc_preinclude.h \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -Wl,--gc-sections


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
	# No post-build defined

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o: $(COPIED_SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/hardware/board/src/sl_board_control_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o

$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o: $(COPIED_SDK_PATH)/hardware/board/src/sl_board_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/hardware/board/src/sl_board_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/hardware/board/src/sl_board_init.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o

$(OUTPUT_DIR)/sdk/platform/CMSIS/RTOS2/Source/os_systick.o: $(COPIED_SDK_PATH)/platform/CMSIS/RTOS2/Source/os_systick.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/CMSIS/RTOS2/Source/os_systick.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/CMSIS/RTOS2/Source/os_systick.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/CMSIS/RTOS2/Source/os_systick.d
OBJS += $(OUTPUT_DIR)/sdk/platform/CMSIS/RTOS2/Source/os_systick.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o: $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_slist.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o: $(COPIED_SDK_PATH)/platform/common/src/sl_string.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sl_string.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sl_string.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o

$(OUTPUT_DIR)/sdk/platform/common/src/sli_cmsis_os2_ext_task_register.o: $(COPIED_SDK_PATH)/platform/common/src/sli_cmsis_os2_ext_task_register.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/src/sli_cmsis_os2_ext_task_register.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/src/sli_cmsis_os2_ext_task_register.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sli_cmsis_os2_ext_task_register.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sli_cmsis_os2_ext_task_register.o

$(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.o: $(COPIED_SDK_PATH)/platform/common/toolchain/src/sl_memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/common/toolchain/src/sl_memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/common/toolchain/src/sl_memory.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32WG/Source/startup_efm32wg.o: $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFM32WG/Source/startup_efm32wg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFM32WG/Source/startup_efm32wg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFM32WG/Source/startup_efm32wg.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32WG/Source/startup_efm32wg.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32WG/Source/startup_efm32wg.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32WG/Source/system_efm32wg.o: $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFM32WG/Source/system_efm32wg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFM32WG/Source/system_efm32wg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFM32WG/Source/system_efm32wg.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32WG/Source/system_efm32wg.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32WG/Source/system_efm32wg.o

$(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_led.o: $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_led.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_led.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_led.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_led.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_led.o

$(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_simple_led.o: $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_simple_led.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_simple_led.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/driver/leddrv/src/sl_simple_led.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_simple_led.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/leddrv/src/sl_simple_led.o

$(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmactrl.o: $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmactrl.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmactrl.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmactrl.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmactrl.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmactrl.o

$(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o: $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_burtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_burtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_burtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_cmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_cmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_cmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_core.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_core.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_core.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_dma.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_dma.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_dma.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_dma.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_dma.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_dma.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_emu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_emu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_emu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_msc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtc.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_rtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_rtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_rtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o: $(COPIED_SDK_PATH)/platform/emlib/src/em_usart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/emlib/src/em_usart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/emlib/src/em_usart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_arguments.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_arguments.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_command.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_command.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_input.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_input.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_io.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_io.o

$(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.o: $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/cli/src/sl_cli_tokenize.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cli/src/sl_cli_tokenize.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s0.o: $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s0.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s0.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s0.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s0.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s0.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_hfxo_s0.o: $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_hfxo_s0.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_hfxo_s0.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_hfxo_s0.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_hfxo_s0.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_hfxo_s0.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_lfxo_s0.o: $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_lfxo_s0.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_lfxo_s0.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_lfxo_s0.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_lfxo_s0.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_lfxo_s0.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_nvic.o: $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_nvic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_nvic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/device_init/src/sl_device_init_nvic.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_nvic.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_nvic.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_retarget_stdio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdlib_config.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdlib_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdlib_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_stdlib_config.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdlib_config.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_stdlib_config.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_usart.o: $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_usart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_usart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/iostream/src/sl_iostream_usart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_usart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_usart.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o: $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtc.o: $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o: $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o: $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_kernel.o: $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_kernel.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_kernel.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/platform/service/system/src/sl_system_kernel.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_kernel.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_kernel.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/cmsis/Source/cmsis_os2.o: $(COPIED_SDK_PATH)/util/third_party/freertos/cmsis/Source/cmsis_os2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/cmsis/Source/cmsis_os2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/cmsis/Source/cmsis_os2.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/cmsis/Source/cmsis_os2.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/cmsis/Source/cmsis_os2.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/croutine.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/croutine.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/croutine.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/croutine.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/croutine.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/croutine.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/event_groups.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/event_groups.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/event_groups.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/event_groups.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/event_groups.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/event_groups.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/list.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/list.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/list.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/list.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/list.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/list.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM4F/port.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM4F/port.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM4F/port.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM4F/port.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM4F/port.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM4F/port.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/MemMang/heap_4.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/portable/MemMang/heap_4.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/portable/MemMang/heap_4.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/portable/MemMang/heap_4.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/MemMang/heap_4.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/MemMang/heap_4.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/queue.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/queue.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/queue.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/queue.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/queue.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/queue.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/stream_buffer.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/stream_buffer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/stream_buffer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/stream_buffer.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/stream_buffer.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/stream_buffer.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/tasks.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/tasks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/tasks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/tasks.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/tasks.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/tasks.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/timers.o: $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/timers.c
	@$(POSIX_TOOL_PATH)echo 'Building $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/timers.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(COPIED_SDK_PATH)/util/third_party/freertos/kernel/timers.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/timers.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/timers.o

$(OUTPUT_DIR)/project/app.o: app.c
	@$(POSIX_TOOL_PATH)echo 'Building app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app.c
CDEPS += $(OUTPUT_DIR)/project/app.d
OBJS += $(OUTPUT_DIR)/project/app.o

$(OUTPUT_DIR)/project/autogen/sl_board_default_init.o: autogen/sl_board_default_init.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_board_default_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_board_default_init.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_board_default_init.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_board_default_init.o

$(OUTPUT_DIR)/project/autogen/sl_cli_command_table.o: autogen/sl_cli_command_table.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cli_command_table.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cli_command_table.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cli_command_table.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cli_command_table.o

$(OUTPUT_DIR)/project/autogen/sl_cli_instances.o: autogen/sl_cli_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cli_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cli_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cli_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cli_instances.o

$(OUTPUT_DIR)/project/autogen/sl_device_init_clocks.o: autogen/sl_device_init_clocks.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_device_init_clocks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_device_init_clocks.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_device_init_clocks.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_device_init_clocks.o

$(OUTPUT_DIR)/project/autogen/sl_event_handler.o: autogen/sl_event_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_event_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_event_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.o

$(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o: autogen/sl_iostream_handles.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_iostream_handles.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_iostream_handles.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o

$(OUTPUT_DIR)/project/autogen/sl_iostream_init_uart_instances.o: autogen/sl_iostream_init_uart_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_iostream_init_uart_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_iostream_init_uart_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_iostream_init_uart_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_iostream_init_uart_instances.o

$(OUTPUT_DIR)/project/autogen/sl_simple_led_instances.o: autogen/sl_simple_led_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_simple_led_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_simple_led_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_simple_led_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_simple_led_instances.o

$(OUTPUT_DIR)/project/autogen/sli_cli_hooks.o: autogen/sli_cli_hooks.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sli_cli_hooks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sli_cli_hooks.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sli_cli_hooks.d
OBJS += $(OUTPUT_DIR)/project/autogen/sli_cli_hooks.o

$(OUTPUT_DIR)/project/cli.o: cli.c
	@$(POSIX_TOOL_PATH)echo 'Building cli.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ cli.c
CDEPS += $(OUTPUT_DIR)/project/cli.d
OBJS += $(OUTPUT_DIR)/project/cli.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA