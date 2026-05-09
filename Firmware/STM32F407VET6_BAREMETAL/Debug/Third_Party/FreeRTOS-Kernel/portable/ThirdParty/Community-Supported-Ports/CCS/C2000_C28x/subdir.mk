################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/port.c 

OBJS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/port.o 

C_DEPS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/port.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/%.o Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/%.su Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/%.cyclo: ../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/%.c Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-CCS-2f-C2000_C28x

clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-CCS-2f-C2000_C28x:
	-$(RM) ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/port.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/port.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/port.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCS/C2000_C28x/port.su

.PHONY: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-CCS-2f-C2000_C28x

