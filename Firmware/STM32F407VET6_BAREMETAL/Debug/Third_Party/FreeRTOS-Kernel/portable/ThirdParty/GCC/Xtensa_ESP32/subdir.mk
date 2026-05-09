################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.c \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port.c \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.c \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.c \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.c \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.c 

S_UPPER_SRCS += \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.S \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.S \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.S \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.S \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.S 

OBJS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.o 

S_UPPER_DEPS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.d 

C_DEPS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.d \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/%.o Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/%.su Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/%.cyclo: ../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/%.c Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/%.o: ../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/%.S Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32

clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32:
	-$(RM) ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/FreeRTOS-openocd.su ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port.su ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_common.su ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/port_systick.su ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/portasm.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_context.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_init.su ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_loadstore_handler.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_overlay_os_hook.su ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vector_defaults.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/Xtensa_ESP32/xtensa_vectors.o

.PHONY: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-GCC-2f-Xtensa_ESP32

