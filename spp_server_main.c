/***********************************************************************************************//**
 * \file   spp_server_main.c
 * \brief  SPP server example
 *
 *
 ***************************************************************************************************
 * <b> (C) Copyright 2016 Silicon Labs, http://www.silabs.com</b>
 ***************************************************************************************************
 * This file is licensed under the Silabs License Agreement. See the file
 * "Silabs_License_Agreement.txt" for details. Before using this software for
 * any purpose, you must agree to the terms of that agreement.
 **************************************************************************************************/

/* Board headers */
#include "ble-configuration.h"
#include "board_features.h"

/* Bluetooth stack headers */
#include "bg_types.h"
#include "native_gecko.h"
#include "gatt_db.h"


#include <stdio.h>
#include "retargetserial.h"
#include "sleep.h"
#include "spp_utils.h"
#include "em_usart.h"

/***************************************************************************************************
  Local Macros and Definitions
 **************************************************************************************************/

#define STATE_ADVERTISING 1
#define STATE_CONNECTED   2
#define STATE_SPP_MODE    3

/* maximum number of iterations when polling UART RX data before sending data over BLE connection
 * set value to 0 to disable optimization -> minimum latency but may decrease throughput */
#define UART_POLL_TIMEOUT  5000

/***************************************************************************************************
 Local Variables
 **************************************************************************************************/
static uint8 _conn_handle = 0xFF;
static int _main_state;

tsCounters _sCounters;

static uint8 _max_packet_size = 20; /* maximum bytes per one packet */
static uint8 _min_packet_size = 20; /* target minimum bytes for one packet */

static void reset_variables()
{
	_conn_handle = 0xFF;
	_main_state = STATE_ADVERTISING;

	_max_packet_size = 20;

	memset(&_sCounters, 0, sizeof(_sCounters));
}


/* this is called periodically when SPP data mode is active */
static void send_spp_data()
{
	uint8 len = 0;
	uint8 data[256];
	uint16 result;

	int c;
	int timeout = 0;

	// read up to _max_packet_size characters from local buffer
	while(len < _max_packet_size)
	{
		  c = RETARGET_ReadChar();

		  if(c >= 0)
		  {
			  data[len++] = (uint8)c;
		  }
		  else if(len == 0)
		  {
			  /* if the first ReadChar() fails then return immediately */
			  return;
		  }
		  else
		  {
			  /* speed optimization: if there are some bytes to be sent but the length is still
			   * below the preferred minimum packet size, then wait for additional bytes
			   * until timeout. Target is to put as many bytes as possible into each air packet */

			  // conditions for exiting the while loop and proceed to send data:
			  if(timeout++ > UART_POLL_TIMEOUT)
				  break;
			  else if(len >= _min_packet_size)
				  break;
		  }
	}

	if(len > 0)
	{
		// stack may return "out-of-memory" error if the local buffer is full -> in that case, just keep trying until the command succeeds
		do
		{
			result = gecko_cmd_gatt_server_send_characteristic_notification(_conn_handle, gattdb_gatt_spp_data, len, data)->result;
			_sCounters.num_writes++;
		}
		while(result == bg_err_out_of_memory);
		if(result != 0)
		{
			printf("unexpected error: %x\r\n", result);
		}
		else
		{
			_sCounters.num_pack_sent++;
			_sCounters.num_bytes_sent += len;
		}
	}
}

/**
 * @brief  SPP server mode main loop
 */
void spp_server_main(void)
{
	int i;

  while (1) {
    /* Event pointer for handling events */
    struct gecko_cmd_packet* evt;
    
    if(_main_state == STATE_SPP_MODE)
    {
    	/* if SPP data mode is active, use non-blocking gecko_peek_event() */
    	evt = gecko_peek_event();

    	if(evt == NULL)
    	{
    		/* no stack events to be handled -> send data from local TX buffer */
    		send_spp_data();
    		continue;  /* jump directly to next iteration i.e. call gecko_peek_event() again */
    	}
    }
    else
    {
    	/* SPP data mode not active -> check for stack events using the blocking API */
    	evt = gecko_wait_event();
    }

    /* Handle events */
    switch (BGLIB_MSG_ID(evt->header)) {

      /* This boot event is generated when the system boots up after reset.
       * Here the system is set to start advertising immediately after boot procedure. */
    case gecko_evt_system_boot_id:

    	reset_variables();
    	gecko_cmd_gatt_set_max_mtu(247);

    	gecko_cmd_le_gap_set_mode(le_gap_general_discoverable, le_gap_undirected_connectable);
    	break;


    	/* Connection opened event */
    case gecko_evt_le_connection_opened_id:

    	_conn_handle = evt->data.evt_le_connection_opened.connection;
    	printf("connected");
    	_main_state = STATE_CONNECTED;

    	/* request connection parameter update.
    	 * conn.interval min 20ms, max 40ms, slave latency 4 intervals,
    	 * supervision timeout 2 seconds
    	 * (These should be compliant with Apple Bluetooth Accessory Design Guidelines, both R7 and R8) */
    	gecko_cmd_le_connection_set_parameters(_conn_handle, 24, 40, 0, 200);
    	break;

    case gecko_evt_le_connection_parameters_id:
    	printf("Conn.parameters: interval %u units, txsize %u\r\n",
    	evt->data.evt_le_connection_parameters.interval,
		evt->data.evt_le_connection_parameters.txsize);
    	break;

    case gecko_evt_gatt_mtu_exchanged_id:
    	/* calculate maximum data per one notification / write-without-response, this depends on the MTU.
    	 * up to ATT_MTU-3 bytes can be sent at once  */
    	_max_packet_size = evt->data.evt_gatt_mtu_exchanged.mtu - 3;
    	_min_packet_size = _max_packet_size; /* try to send maximum length packets whenever possible */
    	printf("MTU exchanged: %d\r\n", evt->data.evt_gatt_mtu_exchanged.mtu);
    	break;

    case gecko_evt_le_connection_closed_id:
    	printf("DISCONNECTED!\r\n");

    	/* show statistics (rx/tx counters) after disconnect: */
    	printStats(&_sCounters);

    	reset_variables();
    	SLEEP_SleepBlockEnd(sleepEM2); // enable sleeping

    	/* restart advertising */
    	gecko_cmd_le_gap_set_mode(le_gap_general_discoverable, le_gap_undirected_connectable);
    	break;

    case gecko_evt_gatt_server_characteristic_status_id:
    {
    	struct gecko_msg_gatt_server_characteristic_status_evt_t *pStatus;
    	pStatus = &(evt->data.evt_gatt_server_characteristic_status);

    	if(pStatus->characteristic == gattdb_gatt_spp_data)
    	{
    		if(pStatus->status_flags == gatt_server_client_config)
    		{
    			// Characteristic client configuration (CCC) for spp_data has been changed
    			if(pStatus->client_config_flags == gatt_notification)
    			{
    				printf("SPP mode ON\r\n");
    				_main_state = STATE_SPP_MODE;
    				SLEEP_SleepBlockBegin(sleepEM2); // disable sleeping
    			}
    			else
    			{
    				printf("SPP mode OFF\r\n");
    				_main_state = STATE_CONNECTED;
    				SLEEP_SleepBlockEnd(sleepEM2); // enable sleeping
    			}

    		}
    	}
    }
    break;

    case gecko_evt_gatt_server_attribute_value_id:
    {
    	 for(i=0;i<evt->data.evt_gatt_server_attribute_value.value.len;i++)
    	 {
    		 USART_Tx(RETARGET_UART, evt->data.evt_gatt_server_attribute_value.value.data[i]);
    	 }

    	 _sCounters.num_pack_received++;
    	 _sCounters.num_bytes_received += evt->data.evt_gatt_server_attribute_value.value.len;
    }
    break;

    default:
    	break;
    }
  }
}

