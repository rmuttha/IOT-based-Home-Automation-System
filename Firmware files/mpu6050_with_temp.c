//////////////////////////////////////////////////////////////////////////////////////////
//
// 	@file			mpu6050.c
//	@Author			Rutuja Muttha & Raksha Mairpady
//
//	@Date			21st March 2024
//	@Email 			rmuttha@pdx.edu & raksham@pdx.edu
//
//	@Brief			Contains the MPU6050 sensor's functions definition.
//
//	@rev	1.0		- Added definitions and created a file for initialization
//					- Included a temperature sensor
//
/////////////////////////////////////////////////////////////////////////////////////////

#include "mpu6050.h"
#include  "xiic.h"
#include "xgpio.h"

/**
 * @brief Initializes the MPU6050 sensor.
 *
 * @param IICInst Pointer to the I2C instance used for communication.
 */
 void mpu6050_init(XIic* IICInst)
 {
 	u8 oBuf[2];
 	u8 iBuf = 0x00;

	// Read WHO_AM_I register to verify communication with the sensor
 	oBuf[0] = 0x75;
 	oBuf[1] = 0x00;
 	XIic_Send(IIC_BADDR, 0x68, oBuf, 1, XIIC_REPEATED_START);
 	XIic_Recv(IIC_BADDR, 0x68, &iBuf, 1, XIIC_STOP);
 	xil_printf("WHO_AM_I is 0x%x\n\r", iBuf);

 	 // Read Power Management 1 register to check current settings
 	oBuf[0] = PWR_MGMT_1;
 	XIic_Send(IIC_BADDR, 0x68, oBuf, 1, XIIC_REPEATED_START);
 	XIic_Recv(IIC_BADDR, 0x68, &iBuf, 1, XIIC_STOP);
 	xil_printf("Power Management 1 is 0x%x\n\r", iBuf);

 	// Configure Power Management 1 register to wake up sensor
 	oBuf[0] = PWR_MGMT_1;
 	oBuf[1] = 0x00;
 	XIic_Send(IIC_BADDR, 0x68, oBuf, 2, XIIC_STOP);

 	// Read back Power Management 1 register to verify configuration
 	oBuf[0] = PWR_MGMT_1;
 	oBuf[1] = 0x00;
 	XIic_Send(IIC_BADDR, 0x68, oBuf, 1, XIIC_REPEATED_START);
 	XIic_Recv(IIC_BADDR, 0x68, &iBuf, 1, XIIC_STOP);
 	xil_printf("Power value is 0x%x\n\r", iBuf);


 }

