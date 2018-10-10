/***********************************************************************************************//**
 * \file   spp_client_main.c
 * \brief  SPP client example
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

#define DISCONNECTED	0
#define SCANNING		1
#define FIND_SERVICE	2
#define FIND_CHAR		3
#define ENABLE_NOTIF 	4
#define DATA_MODE		5
#define DISCONNECTING   6


// SPP service UUID: 4880c12c-fdcb-4077-8920-a450d7f9b907
const uint8 serviceUUID[16] = {0x07, 0xb9, 0xf9, 0xd7, 0x50, 0xa4, 0x20, 0x89, 0x77, 0x40, 0xcb, 0xfd, 0x2c, 0xc1, 0x80, 0x48};

// SPP data UUID: fec26ec4-6d71-4442-9f81-55bc21d658d6
const uint8 charUUID[16] = {0xd6, 0x58, 0xd6, 0x21, 0xbc, 0x55, 0x81, 0x9f, 0x42, 0x44, 0x71, 0x6d, 0xc4, 0x6e, 0xc2, 0xfe};

/* soft timer handles */
#define RESTART_TIMER    1
#define GPIO_POLL_TIMER  3

/* maximum number of iterations when polling UART RX data before sending data over BLE connection
 * set value to 0 to disable optimization -> minimum latency but may decrease throughput */
#define UART_POLL_TIMEOUT  5000

/***************************************************************************************************
 Local Variables
 **************************************************************************************************/
static uint8 _conn_handle = 0xFF;
static int _main_state;
static uint32 _service_handle;
static uint16 _char_handle;

tsCounters _sCounters;

/* default maximum packet size is 20 bytes. this is adjusted after connection is opened based
 * on the connection parameters */
static uint8 _max_packet_size = 20;
static uint8 _min_packet_size = 20; /* target minimum bytes for one packet */

static void reset_variables()
{
	_conn_handle = 0xFF;
	_main_state = DISCONNECTED;
	_service_handle = 0;
	_char_handle = 0;

	_max_packet_size = 20;

	memset(&_sCounters, 0, sizeof(_sCounters));

}


static int process_scan_response(struct gecko_msg_le_gap_scan_response_evt_t *pResp)
{
	// decoding advertising packets is done here. The list of AD types can be found
	// at: https://www.bluetooth.com/specifications/assigned-numbers/Generic-Access-Profile

    int i = 0;
    int ad_match_found = 0;
	int ad_len;
    int ad_type;

    char name[32];

    while (i < (pResp->data.len - 1))
    {

        ad_len  = pResp->data.data[i];
        ad_type = pResp->data.data[i+1];

        if (ad_type == 0x08 || ad_type == 0x09 )
        {
            // type 0x08 = Shortened Local Name
            // type 0x09 = Complete Local Name
            memcpy(name, &(pResp->data.data[i+2]), ad_len-1);
            name[ad_len-1] = 0;
            printf(name);

        }

        // 4880c12c-fdcb-4077-8920-a450d7f9b907
        if (ad_type == 0x06 || ad_type == 0x07)
        {
        	// type 0x06 = Incomplete List of 128-bit Service Class UUIDs
        	// type 0x07 = Complete List of 128-bit Service Class UUIDs
        	if(memcmp(serviceUUID, &(pResp->data.data[i+2]),16) == 0)
        	{
        		printf("Found SPP device\r\n");
        		ad_match_found = 1;
        	}
        }

        //jump to next AD record
        i = i + ad_len + 1;
    }

    return(ad_match_found);
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
			result = gecko_cmd_gatt_write_characteristic_value_without_response(_conn_handle, _char_handle, len, data)->result;
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

/*
 * This function is called periodically to poll PB0, PB1 GPIO inputs
 *
 */
void button_poll(void)
{
	  if((GPIO_PinInGet(BSP_BUTTON0_PORT, BSP_BUTTON0_PIN) == 0) || (GPIO_PinInGet(BSP_BUTTON1_PORT, BSP_BUTTON1_PIN) == 0))
	  {
		  if(_conn_handle != 0xFF)
		  {
			  gecko_cmd_endpoint_close(_conn_handle);
			  _main_state = DISCONNECTING;
		  }
	  }
}

/**
 * @brief  SPP client mode main loop
 */
void spp_client_main(void)
{
	int i;

	while (1) {
		/* Event pointer for handling events */
		struct gecko_cmd_packet* evt;

		if(_main_state == DATA_MODE)
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

    	// start discovery
    	gecko_cmd_le_gap_discover(le_gap_discover_generic);
    	_main_state = SCANNING;
    	break;

    case gecko_evt_le_gap_scan_response_id:

    	// process scan responses: this function returns 1 if we found the service we are looking for
    	if(process_scan_response(&(evt->data.evt_le_gap_scan_response)) > 0)
    	{
    		struct gecko_msg_le_gap_open_rsp_t *pResp;

    		// match found -> stop discovery and try to connect
    		gecko_cmd_le_gap_end_procedure();

    		pResp = gecko_cmd_le_gap_open(evt->data.evt_le_gap_scan_response.address, evt->data.evt_le_gap_scan_response.address_type);

    		// make copy of connection handle for later use (for example, to cancel the connection attempt)
    		_conn_handle = pResp->connection;

    	}
    	break;

    	/* Connection opened event */
    case gecko_evt_le_connection_opened_id:

    	printf("connected\r\n");

    	// start timer for periodically polling button inputs
		gecko_cmd_hardware_set_soft_timer(32768/10, GPIO_POLL_TIMER, 0);

    	//	 start service discovery (we are only interested in one UUID)
    	gecko_cmd_gatt_discover_primary_services_by_uuid(_conn_handle, 16, serviceUUID);
    	_main_state = FIND_SERVICE;

    	break;

    case gecko_evt_le_connection_closed_id:
    	printf("DISCONNECTED!\r\n");

    	_main_state = DISCONNECTED;

    	/* show statistics (rx/tx counters) after disconnect: */
    	printStats(&_sCounters);

    	reset_variables();

    	// stop GPIO poll timer:
    	gecko_cmd_hardware_set_soft_timer(0, GPIO_POLL_TIMER, 0);

    	SLEEP_SleepBlockEnd(sleepEM2); // enable sleeping after disconnect

    	// create one-shot soft timer that will restart discovery after 1 second delay
    	gecko_cmd_hardware_set_soft_timer(32768, RESTART_TIMER, true);
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

    case gecko_evt_gatt_service_id:

    	if(evt->data.evt_gatt_service.uuid.len == 16)
    	{
    		if(memcmp(serviceUUID, evt->data.evt_gatt_service.uuid.data,16) == 0)
    		{
    			printf("service discovered\r\n");
    			_service_handle = evt->data.evt_gatt_service.service;
    		}
    	}
    	break;

    case gecko_evt_gatt_procedure_completed_id:

    	switch(_main_state)
    	{
    	case FIND_SERVICE:

    		if (_service_handle > 0)
    		{
    			// Service found, next search for characteristics
    			gecko_cmd_gatt_discover_characteristics(_conn_handle, _service_handle);
    			_main_state = FIND_CHAR;
    		}
    		else
    		{
    			// no service found -> disconnect
    			printf("SPP service not found?\r\n");
    			gecko_cmd_endpoint_close(_conn_handle);
    		}

    		break;

    	case FIND_CHAR:
    		if (_char_handle > 0)
    		{
    			// Char found, turn on indications
    			gecko_cmd_gatt_set_characteristic_notification(_conn_handle, _char_handle, gatt_notification);
    			_main_state = ENABLE_NOTIF;
    		}
    		else
    		{
    			// no characteristic found? -> disconnect
    			printf("SPP char not found?\r\n");
    			gecko_cmd_endpoint_close(_conn_handle);
    		}
    		break;

    	case ENABLE_NOTIF:
    		_main_state = DATA_MODE;
    		printf("SPP mode ON\r\n");
    		SLEEP_SleepBlockBegin(sleepEM2); // disable sleeping when SPP mode active
    		break;

    	default:
    		break;
    	}
    	break;

    	case gecko_evt_gatt_characteristic_id:

    		if(evt->data.evt_gatt_characteristic.uuid.len == 16)
    		{
    			if(memcmp(charUUID, evt->data.evt_gatt_characteristic.uuid.data,16) == 0)
    			{
    				printf("char discovered");
    				_char_handle = evt->data.evt_gatt_characteristic.characteristic;
    			}
    		}

    		break;

    	case gecko_evt_gatt_characteristic_value_id:

    		if(evt->data.evt_gatt_characteristic_value.characteristic == _char_handle)
    		{
    	    	 for(i=0;i<evt->data.evt_gatt_server_attribute_value.value.len;i++)
    	    	 {
    	    		 USART_Tx(RETARGET_UART, evt->data.evt_gatt_server_attribute_value.value.data[i]);
    	    	 }
    	    	 _sCounters.num_pack_received++;
    	    	 _sCounters.num_bytes_received += evt->data.evt_gatt_server_attribute_value.value.len;
    		}
    		break;

    		/* Software Timer event */
    	case gecko_evt_hardware_soft_timer_id:

    		switch (evt->data.evt_hardware_soft_timer.handle) {

    		case RESTART_TIMER:
    			gecko_cmd_le_gap_discover(le_gap_discover_generic);
    			_main_state = SCANNING;
    			break;

    		case GPIO_POLL_TIMER:
    			button_poll();
    			break;

    		default:
    			break;
    		}
    		break;

               	break;

      default:

        break;
    }
  }
}

