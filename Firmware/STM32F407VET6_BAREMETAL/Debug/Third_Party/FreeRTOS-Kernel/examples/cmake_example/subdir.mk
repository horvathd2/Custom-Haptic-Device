################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS-Kernel/examples/cmake_example/main.c 

OBJS += \
./Third_Party/FreeRTOS-Kernel/examples/cmake_example/main.o 

C_DEPS += \
./Third_Party/FreeRTOS-Kernel/examples/cmake_example/main.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS-Kernel/examples/cmake_example/%.o Third_Party/FreeRTOS-Kernel/examples/cmake_example/%.su Third_Party/FreeRTOS-Kernel/examples/cmake_example/%.cyclo: ../Third_Party/FreeRTOS-Kernel/examples/cmake_example/%.c Third_Party/FreeRTOS-Kernel/examples/cmake_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-examples-2f-cmake_example

clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-examples-2f-cmake_example:
	-$(RM) ./Third_Party/FreeRTOS-Kernel/examples/cmake_example/main.cyclo ./Third_Party/FreeRTOS-Kernel/examples/cmake_example/main.d ./Third_Party/FreeRTOS-Kernel/examples/cmake_example/main.o ./Third_Party/FreeRTOS-Kernel/examples/cmake_example/main.su

.PHONY: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-examples-2f-cmake_example

