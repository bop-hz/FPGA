/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#define INTC_GPIO_INTERRUPT_ID	XPAR_FABRIC_AXI_GPIO_1_IP2INTC_IRPT_INTR
#define INTC_DEVICE_ID	XPAR_PS7_SCUGIC_0_DEVICE_ID

#define GPIO_LED_DEVICE_ID  XPAR_AXI_GPIO_0_DEVICE_ID
#define GPIO_BUTTON_DEVICE_ID XPAR_AXI_GPIO_1_DEVICE_ID
#define Delay 10000000L
#define LED 1
#define BTN_INT XGPIO_IR_CH1_MASK
XScuGic INTCInst;
XGpio GpioLED,GpioBTN;
void BTN_Intr_Handler(void* InstPtr);
void IntrSystemSetup(XScuGic *XScuGicInstancePtr);
void IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr);
int main()
{


	int status,ii;


    init_platform();
    status = XGpio_Initialize(&GpioLED, GPIO_LED_DEVICE_ID);
    status = XGpio_Initialize(&GpioBTN,GPIO_BUTTON_DEVICE_ID);

    XGpio_SetDataDirection(&GpioLED,1, 0);
    XGpio_SetDataDirection(&GpioBTN,1,0xff);
    IntcInitFunction(INTC_DEVICE_ID,&GpioBTN);

    while(1)
    {

    }




    cleanup_platform();
    return 0;
}

void BTN_Intr_Handler(void* InstPtr)
{
	u32 temp_state;
	XGpio_InterruptDisable(&GpioBTN, BTN_INT);
	temp_state = XGpio_InterruptGetStatus(&GpioBTN);
	if (( temp_state& BTN_INT) !=BTN_INT) {
	 return;
	 }
	XGpio_DiscreteWrite(&GpioLED, 1, LED);
	XGpio_InterruptClear(&GpioBTN, BTN_INT);
	XGpio_InterruptEnable(&GpioBTN, BTN_INT);
}

void IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr)
{
	 XScuGic_Config *IntcConfig;
	 int status;
	 IntcConfig = XScuGic_LookupConfig(DeviceId);
	 status = XScuGic_CfgInitialize(&INTCInst,IntcConfig,IntcConfig->CpuBaseAddress);
	 IntrSystemSetup(&INTCInst);
	 status = XScuGic_Connect(&INTCInst,INTC_GPIO_INTERRUPT_ID,(Xil_ExceptionHandler)BTN_Intr_Handler,(void*)GpioInstancePtr);
	 XGpio_InterruptEnable(GpioInstancePtr, BTN_INT);
	 XGpio_InterruptGlobalEnable(GpioInstancePtr);
	 XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);

}



void IntrSystemSetup(XScuGic *XScuGicInstancePtr)
{
	//XGpio_InterruptEnable(&GpioBTN,BTN_INT);
	//XGpio_InterruptGlobalEnable(&GpioBTN);
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler) XScuGic_InterruptHandler,XScuGicInstancePtr);
	Xil_ExceptionEnable();
}