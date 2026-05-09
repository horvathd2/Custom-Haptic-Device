################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.c 

OBJS += \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.o 

C_DEPS += \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.o Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.su Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.cyclo: ../Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/%.c Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM

clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM:
	-$(RM) ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.d ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.o ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARM_TFM/os_wrapper_freertos.su

.PHONY: clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARM_TFM

