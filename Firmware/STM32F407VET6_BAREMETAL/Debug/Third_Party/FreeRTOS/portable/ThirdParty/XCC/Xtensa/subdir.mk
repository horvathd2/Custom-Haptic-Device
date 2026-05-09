################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.c \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.c \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.c \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.c \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.c 

S_UPPER_SRCS += \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.S \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.S \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.S \
../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.S 

OBJS += \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.o \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.o 

S_UPPER_DEPS += \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.d \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.d \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.d \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.d 

C_DEPS += \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.d \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.d \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.d \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.d \
./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.o Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.su Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.cyclo: ../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.c Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.o: ../Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/%.S Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-XCC-2f-Xtensa

clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-XCC-2f-Xtensa:
	-$(RM) ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/port.su ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portasm.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/portclib.su ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_context.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_init.su ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr.su ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_intr_asm.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.cyclo ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.o ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_overlay_os_hook.su ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.d ./Third_Party/FreeRTOS/portable/ThirdParty/XCC/Xtensa/xtensa_vectors.o

.PHONY: clean-Third_Party-2f-FreeRTOS-2f-portable-2f-ThirdParty-2f-XCC-2f-Xtensa

