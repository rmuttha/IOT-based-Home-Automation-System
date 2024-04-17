/////////////////////////////////////////////////////////////////////////////////////////////////////
//
// 	@file			mpu6050_with_temp.h
//	@Author			Rutuja Muttha & Raksha Mairpady
//
//	@Date			21st March 2024
//	@Email 			rmuttha@pdx.edu & raksham@pdx.edu
//
//	@Brief			Contains the MPU6050 sensor's constant definition.
//
//	@rev	1.0		- Initial version with definitions and function prototypes for MPU6050 sensor.
//
/////////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef MPUPARA_H					/* prevent circluar	inclusions	*/
#define MPUPARA_H					/* by using protection macros */

#include  "xiic.h"
#define MPU6050_DEVICE_ID   0x68
#define TEMP_OUT_H			0x41

// used to verify the identity of the device.
#define WHO_AM_I				0x75

// In mpu6050_with_temp.c
void mpu6050_init(XIic* IICInst);

#endif

