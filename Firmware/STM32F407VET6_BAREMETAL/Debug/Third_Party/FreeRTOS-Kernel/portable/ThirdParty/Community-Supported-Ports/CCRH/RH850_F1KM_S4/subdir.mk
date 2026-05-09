################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/portasm.s 

C_SRCS += \
../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/port.c 

OBJS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/port.o \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/portasm.o 

S_DEPS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/portasm.d 

C_DEPS += \
./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/port.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/%.o Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/%.su Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/%.cyclo: ../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/%.c Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/%.o: ../Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/%.s Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-CCRH-2f-RH850_F1KM_S4

clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-CCRH-2f-RH850_F1KM_S4:
	-$(RM) ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/port.cyclo ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/port.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/port.o ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/port.su ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/portasm.d ./Third_Party/FreeRTOS-Kernel/portable/ThirdParty/Community-Supported-Ports/CCRH/RH850_F1KM_S4/portasm.o

.PHONY: clean-Third_Party-2f-FreeRTOS-2d-Kernel-2f-portable-2f-ThirdParty-2f-Community-2d-Supported-2d-Ports-2f-CCRH-2f-RH850_F1KM_S4

