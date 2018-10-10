################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include protocol/bluetooth/lib/EFR32BG13P/GCC/subdir.mk
-include platform/emlib/src/subdir.mk
-include platform/emdrv/sleep/src/subdir.mk
-include platform/Device/SiliconLabs/EFR32BG13P/Source/GCC/subdir.mk
-include platform/Device/SiliconLabs/EFR32BG13P/Source/subdir.mk
-include hardware/kit/common/drivers/subdir.mk
-include hardware/kit/common/bsp/subdir.mk
-include app/bluetooth/common/util/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: SPP-Server_BG13.axf

# Tool invocations
SPP-Server_BG13.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -T "/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/efr32bg13p632f512gm48.ld" -Xlinker --gc-sections -Xlinker -Map="SPP-Server_BG13.map" -mfpu=fpv4-sp-d16 -mfloat-abi=softfp --specs=nano.specs -o SPP-Server_BG13.axf -Wl,--start-group "./app/bluetooth/common/util/infrastructure.o" "./application_properties.o" "./gatt_db.o" "./init_app.o" "./init_board_efr32xg1.o" "./init_mcu_efr32xg1.o" "./main.o" "./pti.o" "./retargetio.o" "./retargetserial.o" "./spp_client_main.o" "./spp_server_main.o" "./spp_utils.o" "./hardware/kit/common/bsp/bsp_stk.o" "./hardware/kit/common/drivers/mx25flash_spi.o" "./platform/Device/SiliconLabs/EFR32BG13P/Source/GCC/startup_efr32bg13p.o" "./platform/Device/SiliconLabs/EFR32BG13P/Source/system_efr32bg13p.o" "./platform/emdrv/sleep/src/sleep.o" "./platform/emlib/src/em_assert.o" "./platform/emlib/src/em_cmu.o" "./platform/emlib/src/em_core.o" "./platform/emlib/src/em_cryotimer.o" "./platform/emlib/src/em_crypto.o" "./platform/emlib/src/em_emu.o" "./platform/emlib/src/em_gpio.o" "./platform/emlib/src/em_i2c.o" "./platform/emlib/src/em_msc.o" "./platform/emlib/src/em_rmu.o" "./platform/emlib/src/em_rtcc.o" "./platform/emlib/src/em_se.o" "./platform/emlib/src/em_system.o" "./platform/emlib/src/em_timer.o" "./platform/emlib/src/em_usart.o" "/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/lib/EFR32BG13P/GCC/libbluetooth.a" "/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/lib/EFR32BG13P/GCC/libpsstore.a" "/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/lib/EFR32BG13P/GCC/libmbedtls.a" "/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg13_gcc_release.a" "/Users/clfilho/SimplicityStudio/BLE/SPP-Server_BG13/protocol/bluetooth/lib/EFR32BG13P/GCC/binapploader.o" -lm -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: SPP-Server_BG13.hex'
	arm-none-eabi-objcopy -O ihex "SPP-Server_BG13.axf" "SPP-Server_BG13.hex"
	@echo ' '

	@echo 'Building bin file: SPP-Server_BG13.bin'
	arm-none-eabi-objcopy -O binary "SPP-Server_BG13.axf" "SPP-Server_BG13.bin"
	@echo ' '

	@echo 'Building s37 file: SPP-Server_BG13.s37'
	arm-none-eabi-objcopy -O srec "SPP-Server_BG13.axf" "SPP-Server_BG13.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "SPP-Server_BG13.axf"
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) SPP-Server_BG13.axf
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
