################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_support.s 

C_SRCS += \
../Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.c \
../Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/port.c 

OBJS += \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.o \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_support.o \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/port.o 

S_DEPS += \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_support.d 

C_DEPS += \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.d \
./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/port.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/%.o Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/%.su Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/%.cyclo: ../Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/%.c Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/%.o: ../Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/%.s Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_v1

clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_v1:
	-$(RM) ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.d ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.o ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_freertos_exceptions.su ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_support.d ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/arc_support.o ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/port.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/port.d ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/port.o ./Third_Party/FreeRTOS/portable/ThirdParty/GCC/ARC_v1/port.su

.PHONY: clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-GCC-2f-ARC_v1

