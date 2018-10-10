################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../application_properties.c \
../gatt_db.c \
../init_app.c \
../init_board_efr32xg1.c \
../init_mcu_efr32xg1.c \
../main.c \
../pti.c \
../retargetio.c \
../retargetserial.c \
../spp_client_main.c \
../spp_server_main.c \
../spp_utils.c 

OBJS += \
./application_properties.o \
./gatt_db.o \
./init_app.o \
./init_board_efr32xg1.o \
./init_mcu_efr32xg1.o \
./main.o \
./pti.o \
./retargetio.o \
./retargetserial.o \
./spp_client_main.o \
./spp_server_main.o \
./spp_utils.o 

C_DEPS += \
./application_properties.d \
./gatt_db.d \
./init_app.d \
./init_board_efr32xg1.d \
./init_mcu_efr32xg1.d \
./main.d \
./pti.d \
./retargetio.d \
./retargetserial.d \
./spp_client_main.d \
./spp_server_main.d \
./spp_utils.d 


# Each subdirectory must supply rules for building sources it contributes
application_properties.o: ../application_properties.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"application_properties.d" -MT"application_properties.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gatt_db.o: ../gatt_db.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"gatt_db.d" -MT"gatt_db.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_app.o: ../init_app.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_app.d" -MT"init_app.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_board_efr32xg1.o: ../init_board_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_board_efr32xg1.d" -MT"init_board_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_mcu_efr32xg1.o: ../init_mcu_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_mcu_efr32xg1.d" -MT"init_mcu_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"main.d" -MT"main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

pti.o: ../pti.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"pti.d" -MT"pti.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

retargetio.o: ../retargetio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"retargetio.d" -MT"retargetio.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

retargetserial.o: ../retargetserial.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"retargetserial.d" -MT"retargetserial.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

spp_client_main.o: ../spp_client_main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"spp_client_main.d" -MT"spp_client_main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

spp_server_main.o: ../spp_server_main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"spp_server_main.d" -MT"spp_server_main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

spp_utils.o: ../spp_utils.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DRETARGET_VCOM=' '-DEFR32BG13P632F512GM48=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/CMSIS/Include" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/bsp" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/halconfig" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emlib/src" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/common" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/EFR32BG13_BRD4104A/config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/hardware/kit/common/drivers" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader/api" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/common/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/app/bluetooth/common/util" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/gpiointerrupt/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/uartdrv/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/halconfig/inc/hal-config" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/emdrv/sleep/inc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13" -I"/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"spp_utils.d" -MT"spp_utils.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

