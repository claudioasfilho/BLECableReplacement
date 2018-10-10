/***********************************************************************************************//**
 * \file   spp_utils.c
 * \brief  Generic utils used by the SPP server and client
 *
 *
 ***************************************************************************************************
 * <b> (C) Copyright 2016 Silicon Labs, http://www.silabs.com</b>
 ***************************************************************************************************
 * This file is licensed under the Silabs License Agreement. See the file
 * "Silabs_License_Agreement.txt" for details. Before using this software for
 * any purpose, you must agree to the terms of that agreement.
 **************************************************************************************************/

#include "spp_utils.h"
#include <stdio.h>

/* needed for board specific GPIO mappings :*/
#include "hal-config-board.h"

/**
 *  SPP startup code, called from main.c. Start SPP either in server mode
 *  (implemented in spp_server_main.c) or client mode (spp_client_main.c)
 *
 *  Mode is selected based on pushbutton PB0/PB1 status at startup.
 *  - Default behavior (both buttons released) -> start in SERVER mode
 *  - if either PB0 or PB1 pressed during reset -> start in CLIENT mode
 *
 *  This function never returns. It jumps into SPP main loop in either
 *  server or client role and runs there until device is rebooted.
 * */
void spp_main(void)
{
	RETARGET_SerialInit();

	GPIO_PinModeSet(BSP_BUTTON0_PORT, BSP_BUTTON0_PIN, gpioModeInput, 1);
	GPIO_PinModeSet(BSP_BUTTON1_PORT, BSP_BUTTON1_PIN, gpioModeInput, 1);

	/* keeping either PB0 or PB1 pressed during reboot selects 'client mode' */
	if((GPIO_PinInGet(BSP_BUTTON0_PORT, BSP_BUTTON0_PIN) == 0) || (GPIO_PinInGet(BSP_BUTTON1_PORT, BSP_BUTTON1_PIN) == 0))
	{
		printf("* SPP client mode *\r\n");
		spp_client_main();
	}
	else
	{
		printf("* SPP server mode *\r\n");
		spp_server_main();
	}
}

void printStats(tsCounters *psCounters)
{
	printf("Outgoing data:\r\n");
	printf(" bytes/packets sent: %d / %d ", psCounters->num_bytes_sent, psCounters->num_pack_sent);
	printf(", num writes: %d\r\n", psCounters->num_writes);
#ifdef RX_OVERFLOW_TRACKING
	if(rxOverFlow)
	{
		printf(" NOTE: RX buffer overflowed %d times\r\n", rxOverFlow);
	}
	else
	{
		printf(" no RX buffer overflow detected\r\n");
	}
#else
	printf("(RX buffer overflow is not tracked)\r\n");
#endif

	printf("Incoming data:\r\n");
	printf(" bytes/packets received: %d / %d\r\n", psCounters->num_bytes_received, psCounters->num_pack_received);

	return;
}


