################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/port.c 

OBJS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/port.o 

C_DEPS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/port.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/%.o Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/%.su Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/%.cyclo: ../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/%.c Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-GCC-2f-ATmega

clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-GCC-2f-ATmega:
	-$(RM) ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/port.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/port.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/port.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/GCC/ATmega/port.su

.PHONY: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-GCC-2f-ATmega

