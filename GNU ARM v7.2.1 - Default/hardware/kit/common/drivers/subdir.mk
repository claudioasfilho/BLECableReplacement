################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hardware/kit/common/drivers/mx25flash_spi.c 

OBJS += \
./hardware/kit/common/drivers/mx25flash_spi.o 

C_DEPS += \
./hardware/kit/common/drivers/mx25flash_spi.d 


# Each subdirectory must supply rules for building sources it contributes
hardware/kit/common/drivers/mx25flash_spi.o: ../hardware/kit/common/drivers/mx25flash_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/drivers/mx25flash_spi.d" -MT"hardware/kit/common/drivers/mx25flash_spi.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


