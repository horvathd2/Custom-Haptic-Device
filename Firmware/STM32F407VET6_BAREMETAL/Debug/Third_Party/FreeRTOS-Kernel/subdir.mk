################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/FreeRTOS-Kernel/croutine.c \
../Third_Party/FreeRTOS-Kernel/event_groups.c \
../Third_Party/FreeRTOS-Kernel/list.c \
../Third_Party/FreeRTOS-Kernel/queue.c \
../Third_Party/FreeRTOS-Kernel/stream_buffer.c \
../Third_Party/FreeRTOS-Kernel/tasks.c \
../Third_Party/FreeRTOS-Kernel/timers.c 

OBJS += \
./Third_Party/FreeRTOS-Kernel/croutine.o \
./Third_Party/FreeRTOS-Kernel/event_groups.o \
./Third_Party/FreeRTOS-Kernel/list.o \
./Third_Party/FreeRTOS-Kernel/queue.o \
./Third_Party/FreeRTOS-Kernel/stream_buffer.o \
./Third_Party/FreeRTOS-Kernel/tasks.o \
./Third_Party/FreeRTOS-Kernel/timers.o 

C_DEPS += \
./Third_Party/FreeRTOS-Kernel/croutine.d \
./Third_Party/FreeRTOS-Kernel/event_groups.d \
./Third_Party/FreeRTOS-Kernel/list.d \
./Third_Party/FreeRTOS-Kernel/queue.d \
./Third_Party/FreeRTOS-Kernel/stream_buffer.d \
./Third_Party/FreeRTOS-Kernel/tasks.d \
./Third_Party/FreeRTOS-Kernel/timers.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/FreeRTOS-Kernel/%.o Third_Party/FreeRTOS-Kernel/%.su Third_Party/FreeRTOS-Kernel/%.cyclo: ../Third_Party/FreeRTOS-Kernel/%.c Third_Party/FreeRTOS-Kernel/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -DSTM32F407xx -c -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/STM32F4xx/Include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/portable" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Inc" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/Third_Party/FreeRTOS-Kernel/include" -I"D:/STM32CubeIDE/workspace_1.19.0/STM32F407VET6_BAREMETAL/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-FreeRTOS-2d-Kernel

clean-Third_Party-2f-FreeRTOS-2d-Kernel:
	-$(RM) ./Third_Party/FreeRTOS-Kernel/croutine.cyclo ./Third_Party/FreeRTOS-Kernel/croutine.d ./Third_Party/FreeRTOS-Kernel/croutine.o ./Third_Party/FreeRTOS-Kernel/croutine.su ./Third_Party/FreeRTOS-Kernel/event_groups.cyclo ./Third_Party/FreeRTOS-Kernel/event_groups.d ./Third_Party/FreeRTOS-Kernel/event_groups.o ./Third_Party/FreeRTOS-Kernel/event_groups.su ./Third_Party/FreeRTOS-Kernel/list.cyclo ./Third_Party/FreeRTOS-Kernel/list.d ./Third_Party/FreeRTOS-Kernel/list.o ./Third_Party/FreeRTOS-Kernel/list.su ./Third_Party/FreeRTOS-Kernel/queue.cyclo ./Third_Party/FreeRTOS-Kernel/queue.d ./Third_Party/FreeRTOS-Kernel/queue.o ./Third_Party/FreeRTOS-Kernel/queue.su ./Third_Party/FreeRTOS-Kernel/stream_buffer.cyclo ./Third_Party/FreeRTOS-Kernel/stream_buffer.d ./Third_Party/FreeRTOS-Kernel/stream_buffer.o ./Third_Party/FreeRTOS-Kernel/stream_buffer.su ./Third_Party/FreeRTOS-Kernel/tasks.cyclo ./Third_Party/FreeRTOS-Kernel/tasks.d ./Third_Party/FreeRTOS-Kernel/tasks.o ./Third_Party/FreeRTOS-Kernel/tasks.su ./Third_Party/FreeRTOS-Kernel/timers.cyclo ./Third_Party/FreeRTOS-Kernel/timers.d ./Third_Party/FreeRTOS-Kernel/timers.o ./Third_Party/FreeRTOS-Kernel/timers.su

.PHONY: clean-Third_Party-2f-FreeRTOS-2d-Kernel

