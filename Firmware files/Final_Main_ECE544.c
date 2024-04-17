/******************************************************************************
* @file 	Final_Main_ECE544.c
*
* @author 	Raksha Mairpady, Rutuja Muttha and Thanuja Bala Baskaran
*
* @brief  	Control and Monitor Stepper Motors and Temperature Using ESP32 and MPU6050
*
* This project is designed to control multiple stepper motors and monitor temperature
* using an ESP32 module and MPU6050 sensor, respectively. The system is capable of receiving 
* commands from an Android app through the ESP32 for dynamic control of stepper motors. 
* It involves initializations of IIC for communication with the MPU6050 sensor, AXI GPIOs 
* for motor control, and setting up the necessary configurations for motor movements. 
* The main loop continuously checks for data from the ESP32 module to control each motor's 
* operation (start/stop and direction) and reads the temperature data from the MPU6050 sensor. 
*
******************************************************************************/

/*********** Include Files **********/
#include <stdbool.h>
#include  "platform.h"
#include  "xil_printf.h"
#include  "xparameters.h"
#include  "xstatus.h"
#include  "xiic.h"
#include  "nexys4IO.h"
#include  "xuartlite_l.h"
#include  "xuartlite.h"
#include "mpu6050.h"
#include "microblaze_sleep.h"
#include "xgpio.h"

// Constants related to clock frequencies and peripheral addresses
#define CPU_CLOCK_FREQ_HZ		XPAR_CPU_CORE_CLOCK_FREQ_HZ
#define AXI_CLOCK_FREQ_HZ		XPAR_CPU_M_AXI_DP_FREQ_HZ

// Definitions for peripherals NEXYS4IO
#define N4IO_DEVICE_ID		    XPAR_NEXYS4IO_0_DEVICE_ID
#define N4IO_BASEADDR		    XPAR_NEXYS4IO_0_S00_AXI_BASEADDR
#define N4IO_HIGHADDR		    XPAR_NEXYS4IO_0_S00_AXI_HIGHADDR

// Definitions for peripherals AXI_IIC
#define IIC_ID 					XPAR_IIC_0_DEVICE_ID
#define IIC_BADDR				XPAR_IIC_0_BASEADDR

// Defines a delay duration for use in loops
#define DELAY 					50000										
#define CW 						1							// Clockwise
#define CCW						0 							// Counter-Clockwise

/********** IIC and GPIO Instances **********/
XIic 		IICInst;		
XGpio FAN_OUT_ONE,FAN_OUT_SECOND,FAN_OUT_THIRD,FAN_OUT_FOURTH,FAN_OUT_FIFTH,FAN_OUT_TEMP,
	  STEPPER_ONE,STEPPER_TWO,STEPPER_THREE,STEPPER_FOUR,STEPPER_FIVE,STEPPER_SIX,STEPPER_SEVEN,STEPPER_EIGHT,STEPPER_NINE;

// Flags to track the running status of respective motor, initially set to not running
static bool motor_running1 = false;
static bool motor_running2 = false;
static bool motor_running3 = false;
static bool motor_running4 = false;
static bool motor_running5 = false;
static bool motor_running6 = false;
static bool motor_running7 = false;
static bool motor_running8 = false;
static bool motor_running9 = false;
static bool motor_running10 = false;
// Number of steps per revolution for the stepper motor
int stepsPerRevolution = 6200;
// Current step number in the stepping sequence
int step = 0;
// Initial direction for the motor movement, set to clockwise (CW)
int direction = CW; 

// Function prototypes for initialization and motor control
int	 do_init(void);
int InitializeIIC(XIic *IicInstancePtr, u16 iicid);
void delay(int n);
void stepMotorOne(int step, int direction);
void stepMotorTwo(int step, int direction);
void stepMotorThree(int step, int direction);
void stepMotorFour(int step, int direction);
void stepMotorFive(int step, int direction);
int gpioinit(XGpio *FAN_OUT_ONE, XGpio *FAN_OUT_SECOND, XGpio *FAN_OUT_THIRD, XGpio *FAN_OUT_FOURTH, XGpio *FAN_OUT_FIFTH, XGpio *FAN_OUT_TEMP, 
			 XGpio *STEPPER_ONE, XGpio *STEPPER_TWO, XGpio *STEPPER_THREE, XGpio *STEPPER_FOUR, XGpio *STEPPER_FIVE,XGpio *STEPPER_SIX,XGpio *STEPPER_SEVEN,XGpio *STEPPER_EIGHT,XGpio *STEPPER_NINE);
			 
void setting_direction(XGpio* FAN_OUT_ONE,XGpio* FAN_OUT_SECOND,XGpio* FAN_OUT_THIRD,XGpio* FAN_OUT_FOURTH,XGpio* FAN_OUT_FIFTH,XGpio* FAN_OUT_TEMP,
					   XGpio* STEPPER_ONE,XGpio* STEPPER_TWO,XGpio* STEPPER_THREE,XGpio* STEPPER_FOUR,XGpio* STEPPER_FIVE, XGpio *STEPPER_SIX,XGpio *STEPPER_SEVEN,XGpio *STEPPER_EIGHT,XGpio *STEPPER_NINE);

/**
 * @brief	Main Program Execution Entry Point
 *
 * - Initializes the platform and necessary peripherals for communication and motor control.
 * - Confirms successful initialization of the IIC interface and GPIOs.
 * - Enters an infinite loop to handle incoming data from an ESP32 module, which receives commands from an Android app.
 * - Initiates the MPU6050 sensor and sets GPIO directions for stepper motor controls.
 * - Parses the ESP32 data to determine which motor to control and the desired action (start/stop and direction).
 * - Executes motor control commands based on the received data, adjusting each motor's state as required.
 * - The continuous loop enables real-time responsiveness to app commands for dynamic motor control.
 * - Utilizes dedicated functions for motor control operations and ensures platform cleanup before shutdown.
 * - Enters an infinite loop where it continuously reads temperature data from the MPU6050 sensor.
 * 
 * @brief    Assumes predefined setup and control functions are in place. The main focus is on interpreting 
 *           commands received from the ESP32 (linked to an Android app) for precise control over multiple motors and sense the temperature.
 */

int main()
{
	int Status;
	// Initialize the platform
	init_platform();
	// Initialize the system
	uint32_t sts = do_init();
	// Check if system initialization is successful
	if (XST_SUCCESS != sts){
		xil_printf("FATAL(main): System initialization failed\r\n");
		return 1;
	}
	// Initialize IIC instance and check status
	Status = InitializeIIC(&IICInst, IIC_ID);
	    if (Status != XST_SUCCESS) {
	        xil_printf("IIC initialization failed!\r\n");
	        return XST_FAILURE;
	    }

	// Initialize MPU6050 sensor and configure gyro
	mpu6050_init(&IICInst);
	// Initialize AXI_GPIOs i.e., pmod ports
	gpioinit(&FAN_OUT_ONE,&FAN_OUT_SECOND,&FAN_OUT_THIRD,&FAN_OUT_FOURTH,&FAN_OUT_FIFTH,&FAN_OUT_TEMP,&STEPPER_ONE,&STEPPER_TWO,&STEPPER_THREE,&STEPPER_FOUR,&STEPPER_FIVE, &STEPPER_SIX,&STEPPER_SEVEN,&STEPPER_EIGHT,&STEPPER_NINE);
	// Setting the direction of the AXI_GPIOs (input or output)
	setting_direction(&FAN_OUT_ONE,&FAN_OUT_SECOND,&FAN_OUT_THIRD,&FAN_OUT_FOURTH,&FAN_OUT_FIFTH,&FAN_OUT_TEMP,&STEPPER_ONE,&STEPPER_TWO,&STEPPER_THREE,&STEPPER_FOUR,&STEPPER_FIVE, &STEPPER_SIX,&STEPPER_SEVEN,&STEPPER_EIGHT,&STEPPER_NINE);

	while (1) {
					// Buffer for receiving data from the mpu6050
		            u8 buffer[2];
					// Variable to store the temperature value
			 	    int16_t temperature;
					// Outgoing buffer for IIC communication, set to read the temperature high register
			 	    u8 oBuf = TEMP_OUT_H;
					// Read discrete values from GPIO pins connected to the ESP32 for motor control signals
	    	       	u32 data_one   = 	XGpio_DiscreteRead(&STEPPER_ONE  , 1);    	       	   
	    	        u32 data_two   = 	XGpio_DiscreteRead(&STEPPER_TWO  , 1);	    	       		 
	    	       	u32 data_three = 	XGpio_DiscreteRead(&STEPPER_THREE, 1);
	    	        u32 data_four  = 	XGpio_DiscreteRead(&STEPPER_FOUR , 1);
	    	       	u32 data_five  = 	XGpio_DiscreteRead(&STEPPER_FIVE , 1);
	    	       	u32 data_six   = 	XGpio_DiscreteRead(&STEPPER_SIX  , 1);
	    	       	u32 data_seven = 	XGpio_DiscreteRead(&STEPPER_SEVEN, 1);
	    	       	u32 data_eight = 	XGpio_DiscreteRead(&STEPPER_EIGHT, 1);
	    	       	u32 data_nine  = 	XGpio_DiscreteRead(&STEPPER_NINE , 1);
	    	       	u32 data_ten   = 	XGpio_DiscreteRead(&FAN_OUT_TEMP , 1);

	    	       	// Read temperature data from the mpu6050 sensor
	    	       	XIic_Send(IIC_BADDR, 0x68, &oBuf, 1, XIIC_REPEATED_START);
	    	       	XIic_Recv(IIC_BADDR, 0x68, buffer, 2, XIIC_STOP);

	    	       // Combine high and low bytes to form 16-bit signed integer
	    	       	temperature = ((buffer[0] << 8) | buffer[1]);
					
				   // Converting the raw temperature data to degrees Celcius
	    	       	int16_t final_data_out = temperature / 340.0 + 36.53;
	    	       	int16_t int_part = (int16_t)final_data_out;
					
				   // Extract three decimal digits for error correction
	    	       	int16_t decimal_part = (int16_t)((final_data_out - int_part) * 1000);
					
				   // Printing the temperature data from mpu6050 to 'putty'
	    	       	xil_printf("final data of temp is: %d.%2d\n\r", int_part, decimal_part);
					
	    	       // Motor control logic based on the ESP32's discrete signals	
				   // Motor 1: OPEN
	    	       	if(data_one == 1){	    	     	
						motor_running1= true;
	    	       	    direction = CW;	    	      
	    	       	}else{
	    	       	    motor_running1= false;
	    	       	    XGpio_DiscreteWrite(&FAN_OUT_ONE,1,0);	    	       	    
	    	       	}
				   // Motor 1: CLOSE
	    	       	if(data_two == 1){
	    	       	    motor_running2= true;
	    	       	    direction = CCW;	    	       	     
	    	       	}else {
						motor_running2= false;
						XGpio_DiscreteWrite(&FAN_OUT_ONE,1,0);
	    	      	}
				   // Motor 2: OPEN
	    	       	if(data_three == 1){
	    	       		motor_running3= true;
	    	       		direction = CW;
	    	        }else{
	    	       		motor_running3= false;
	    	       		XGpio_DiscreteWrite(&FAN_OUT_SECOND,1,0);
	    	        }
				   // Motor 2: CLOSE
	    	       	if(data_four == 1){
	    	       		motor_running4= true;
	    	       		direction = CCW;
	    	       	}else{
	    	       		motor_running4= false;
	    	       		XGpio_DiscreteWrite(&FAN_OUT_SECOND,1,0);
	    	        }
				   // Motor 3: OPEN
					if(data_five == 1){
    	       		    motor_running5= true;
    	       		    direction = CW;
    	       		}else{
    	       		    motor_running5= false;
    	       		    XGpio_DiscreteWrite(&FAN_OUT_THIRD,1,0);
    	       		}
				   // Motor 3: CLOSE
					if(data_six == 1){
    	       		    motor_running6= true;
    	       		    direction = CCW;
    	       		}else{
    	       		    motor_running6= false;
    	       		    XGpio_DiscreteWrite(&FAN_OUT_THIRD,1,0);
    	       		}
					// Motor 4: OPEN
    	    		if(data_seven == 1){
    	    	    	motor_running7= true;
    	    	    	direction = CW;
    	    	    }else{
    	    	    	motor_running7= false;
    	    	    	XGpio_DiscreteWrite(&FAN_OUT_FOURTH,1,0);
    	    	    }
				   // Motor 4: CLOSE
    	    	    if(data_eight == 1){
    	    	    	motor_running8= true;
    	    	    	direction = CCW;
    	    	    }else{
    	    	    	motor_running8= false;
    	    	    	XGpio_DiscreteWrite(&FAN_OUT_FOURTH,1,0);
    	    	    }
				   // Motor 5: OPEN
    	    	    if(data_nine == 1){
    	    	    	motor_running9= true;
    	    	    	direction = CW;
    	    	    }else{
    	    	    	motor_running9= false;
    	    	    	XGpio_DiscreteWrite(&FAN_OUT_FIFTH,1,0);
    	    	    }
				   // Motor 5: CLOSE
    	    	    if(data_ten == 1){
    	    	    	motor_running10= true;
    	    	    	direction = CCW;
    	    	    }else{
    	    	    	motor_running10= false;
    	    	    	XGpio_DiscreteWrite(&FAN_OUT_FIFTH,1,0);
    	    	    }
/*  @brief: Each block checks the signal for a specific motor and sets its running state and direction accordingly
*		    Adjusting for each specific motor's control signals and actions
*		    Motor stepping logic based on the running state and direction
*	        This part controls the actual stepping of the motors that have been marked as running
*/				   
	    	       	if(motor_running1){
	    	       	    int i;		
						stepMotorOne(step % 4, direction);						// Calls the function to step motor 2 with the current step index
	    	       	    delay(DELAY);											// Introduces a delay between steps to control the speed of the motor
	    	       	    step++;													// Increments the step index for the next cycle
	    	       	    if(step >= 4) step = 0;									// Resets the step index if it reaches the end of the step sequence
							if(i % (stepsPerRevolution / 4) == 0 && i != 0) {   // Checks if a complete revolution is made (based on steps per revolution) and toggles the direction
								direction = !direction;							// Toggle the direction of the motor
							}						
	    	       	}
					else if(motor_running2) {
	    	       	 	int i;
	    	       	   	stepMotorOne(step % 4, direction);
						delay(DELAY);
	    	       	   	step++;
	    	       	   	if(step >= 4) step = 0;
	    	       	   		if(i % (stepsPerRevolution / 4) == 0 && i != 0) { 
								direction = !direction;
							}
					}
	    	       	else if (motor_running3) {
	    	       	   	int i;
	    	       	   	stepMotorTwo(step % 4, direction);
	    	       	   	delay(DELAY);
	    	       	   	step++;
	    	       	   	if(step >= 4) step = 0;
	    	       	   		if(i % (stepsPerRevolution / 4) == 0 && i != 0) { 
								direction = !direction;
							}
					}
					else if (motor_running4) {
	    	       	    int i;
	    	       	    stepMotorTwo(step % 4, direction);
	    	       	    delay(DELAY);
	    	        	step++;
	    	       	    if(step >= 4) step = 0;
	    	       	    	if(i % (stepsPerRevolution / 4) == 0 && i != 0) { 
	    	       	    	    direction = !direction;
							}
	    	        }
	    	       	else if (motor_running5) {
	    	     	  	int i;
	    	     	   	stepMotorThree(step % 4, direction);
	    	     	   	delay(DELAY);
	    	     	   	step++;
	    	     	   	if(step >= 4) step = 0;
	    	     	   	    if(i % (stepsPerRevolution / 4) == 0 && i != 0) { // Adjust as necessary
	    	     	   	       	direction = !direction;
	    	     	   	    }
	    	     	}
	    	     	else if (motor_running6) {
	    	     	   	int i;
	    	     	   	stepMotorThree(step % 4, direction);
	    	     	   	delay(DELAY);
						step++;
	    	     	   	if(step >= 4) step = 0;
	    	     	   	    if(i % (stepsPerRevolution / 4) == 0 && i != 0) { // Adjust as necessary
	    	     	   	       	direction = !direction;
	    	     	   	    }
	    	     	}
					else if (motor_running7) {
						int i;
	    	     		stepMotorFour(step % 4, direction);
	    	     		delay(DELAY);
	    	     		step++;
	    	     		if(step >= 4) step = 0;
	    	     			if(i % (stepsPerRevolution / 4) == 0 && i != 0) { // Adjust as necessary
	    	     				direction = !direction;
	    	     			}
	    	     	}
	    	     	else if (motor_running8) {
	    	     		int i;
	    	     		stepMotorFour(step % 4, direction);
	    	     		delay(DELAY);
    	    	       	step++;
	    	     		if(step >= 4) step = 0;
	    	     		    if(i % (stepsPerRevolution / 4) == 0 && i != 0) { // Adjust as necessary
	    	     		   		direction = !direction;
	    	     		    }
	    	     	}					
	    	     	else if (motor_running9) {
						int i;
	    	     		stepMotorFive(step % 4, direction);
	    	     		delay(DELAY);
	    	     		step++;
	    	     		if(step >= 4) step = 0;
	    	     			if(i % (stepsPerRevolution / 4) == 0 && i != 0) { // Adjust as necessary
	    	     				direction = !direction;
	    	     			}
	    	     	}
	    	     	else if (motor_running10) {
	    	     		int i;
	    	     		stepMotorFive(step % 4, direction);
	    	     		delay(DELAY);
	    	     		step++;
	    	     		if(step >= 4) step = 0;
	    	     			if(i % (stepsPerRevolution / 4) == 0 && i != 0) { // Adjust as necessary
	    	     				direction = !direction;
	    	     			}
	    	     	}
	    	}
	    cleanup_platform();
	    return 0;
}

/**
 *
 * @brief   Initializes the system.
 * @details This function initializes the Nexys4 driver and checks the status.
 * @return  XST_SUCCESS if initialization is successful, XST_FAILURE otherwise.
 *
 **/
int	 do_init(void) {
	uint32_t status;
	// initialize the Nexys4 driver
	status = NX4IO_initialize(N4IO_BASEADDR);
	// Check if initialization is successful
	if (status != XST_SUCCESS){
		return XST_FAILURE;
	}
	// Return success status
      return XST_SUCCESS;
}

 /**
 * @brief   Initializes the I2C peripheral.
 * @details This function initializes the I2C peripheral instance and prints a success message.
 * @param   IicInstancePtr Pointer to the I2C instance.
 * @param   iicid          ID of the I2C device.
 * @return  XST_SUCCESS if initialization is successful.
 */
int InitializeIIC(XIic *IicInstancePtr, u16 iicid) {
    // Print initialization success message
    xil_printf("I2C Initialized Successfully\r\n");
    // Return success status
    return XST_SUCCESS;
}

/**
 * @brief   Initializes GPIO instances for Stepper outputs (FAN_OUT_...) to motors, 
 *          and GPIO inputs from ESP32 to control Stepper motors.
 *          This function takes pointers to XGpio objects representing each stepper output, 
 *          and stepper motors as parameters. It attempts to 
 *          initialize these GPIOs using their respective device IDs. If any initialization 
 *          fails, the function reports the error through `xil_printf` and returns a failure status.
 *
 * @parameters
 * - XGpio *FAN_OUT_ONE through XGpio *FAN_OUT_FIFTH: Pointers to XGpio objects for Stepper outputs to Stepper motor.
 * - XGpio *STEPPER_ONE through XGpio *STEPPER_NINE: Pointers to XGpio objects for stepper motors from ESP32.
 * - XGpio *FAN_OUT_TEMP: Pointers to XGpio objects for stepper motors from ESP32.
 *
 * @returns
 * - XST_SUCCESS if all GPIOs are successfully initialized.
 * - XST_FAILURE if any GPIO initialization fails, with an error message printed to the console.
 *
 * @note   The function assumes that the XGpio objects have been declared in xgpio.h and 
 *         that the XPAR_GPIO_*_DEVICE_ID macros are defined in "xparameters.h", typically 
 *         generated by the Xilinx tools based on the design.
 */
 int gpioinit(XGpio *FAN_OUT_ONE, XGpio *FAN_OUT_SECOND, XGpio *FAN_OUT_THIRD, XGpio *FAN_OUT_FOURTH, XGpio *FAN_OUT_FIFTH, XGpio *FAN_OUT_TEMP, XGpio *STEPPER_ONE, XGpio *STEPPER_TWO, XGpio *STEPPER_THREE, XGpio *STEPPER_FOUR, XGpio *STEPPER_FIVE,XGpio *STEPPER_SIX,XGpio *STEPPER_SEVEN,XGpio *STEPPER_EIGHT,XGpio *STEPPER_NINE)
 		{
 			int Status;

 		// Initialize FAN_OUT_ONE GPIO instance and check status
 			Status = XGpio_Initialize(FAN_OUT_ONE, XPAR_GPIO_1_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: FAN_OUT_ONE GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize FAN_OUT_SECOND GPIO instance and check status
 			Status = XGpio_Initialize(FAN_OUT_SECOND, XPAR_GPIO_0_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: FAN_OUT_SECOND GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize FAN_OUT_THIRD GPIO instance and check status
 			Status = XGpio_Initialize(FAN_OUT_THIRD, XPAR_GPIO_7_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: FAN_OUT_THIRD GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize FAN_OUT_FOURTH GPIO instance and check status
 			Status = XGpio_Initialize(FAN_OUT_FOURTH, XPAR_GPIO_8_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: FAN_OUT_FOURTH GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }
			
 		// Initialize FAN_OUT_FIFTH GPIO instance and check status
 			Status = XGpio_Initialize(FAN_OUT_FIFTH, XPAR_GPIO_9_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: FAN_OUT_FIFTH GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize FAN_OUT_TEMP GPIO instance and check status
 			Status = XGpio_Initialize(FAN_OUT_TEMP, XPAR_GPIO_10_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: FAN_OUT_TEMP GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize STEPPER_ONE GPIO instance and check status
 			Status = XGpio_Initialize(STEPPER_ONE, XPAR_GPIO_2_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: STEPPER_ONE GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize STEPPER_TWO GPIO instance and check status
 			Status = XGpio_Initialize(STEPPER_TWO, XPAR_GPIO_3_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: STEPPER_TWO GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize STEPPER_THREE GPIO instance and check status
 			Status = XGpio_Initialize(STEPPER_THREE, XPAR_GPIO_4_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: STEPPER_THREE GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize STEPPER_FOUR GPIO instance and check status
 			Status = XGpio_Initialize(STEPPER_FOUR, XPAR_GPIO_5_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: STEPPER_FOUR GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize STEPPER_FIVE GPIO instance and check status
 			Status = XGpio_Initialize(STEPPER_FIVE, XPAR_GPIO_6_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: STEPPER_FIVE GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 	        }

 		// Initialize STEPPER_SIX GPIO instance and check status
 		 	Status = XGpio_Initialize(STEPPER_SIX, XPAR_GPIO_11_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
			xil_printf("ERROR: STEPPER_SIX GPIO Initialization failed with status %d\r\n", Status);
 		 	return XST_FAILURE;
 		 	}
			
 		// Initialize STEPPER_SEVEN GPIO instance and check status
			Status = XGpio_Initialize(STEPPER_SEVEN, XPAR_GPIO_12_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: STEPPER_SEVEN GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 		    }

 		// Initialize STEPPER_EIGHT GPIO instance and check status
 		 	Status = XGpio_Initialize(STEPPER_EIGHT, XPAR_GPIO_13_DEVICE_ID);
 		if (Status != XST_SUCCESS) {
 			xil_printf("ERROR: STEPPER_EIGHT GPIO Initialization failed with status %d\r\n", Status);
 			return XST_FAILURE;
 		    }
			
  		// Initialize STEPPER_NINE GPIO instance and check status
  			Status = XGpio_Initialize(STEPPER_NINE, XPAR_GPIO_14_DEVICE_ID);
  		if (Status != XST_SUCCESS) {
  			xil_printf("ERROR: STEPPER_NINE GPIO Initialization failed with status %d\r\n", Status);
  			return XST_FAILURE;
  	        }

		}

/**
 * @brief   Configures the Data Direction of GPIO Instances for Stepper Outputs(FAN_OUT) and Stepper Motors(STEPPER_).
 * 			This function is designed to set the data direction for GPIO instances associated with
 * 			Stepper outputs and stepper motors. 
 *			For Stepper outputs, the data direction is set to output 
 * 			For stepper motors, the direction is set to input
 *
 * @operations 
 *        - The function sets the data direction for FAN_OUTs to 0 (output mode),
 *          allowing the system to control these devices directly.
 *        - It sets the data direction for STEPPER_s to 1 (input mode), 
 *          allowing the system to read external control signals intended for these motors.
 *
 * @note    This setup assumes that fan control and temperature monitoring require output configuration,
 *          while stepper motor control is based on reading external inputs. The actual control logic
 *          for these devices, including the interpretation of input signals for stepper motors, is 
 *          managed elsewhere in the program.
 */
 void setting_direction(XGpio* FAN_OUT_ONE,XGpio* FAN_OUT_SECOND,XGpio* FAN_OUT_THIRD,XGpio* FAN_OUT_FOURTH,XGpio* FAN_OUT_FIFTH,XGpio* FAN_OUT_TEMP,
 							   XGpio* STEPPER_ONE,XGpio* STEPPER_TWO,XGpio* STEPPER_THREE,XGpio* STEPPER_FOUR,XGpio* STEPPER_FIVE,XGpio* STEPPER_SIX, XGpio *STEPPER_SEVEN,XGpio *STEPPER_EIGHT,XGpio *STEPPER_NINE)
 		{
 			// Setting the direction GPIO to output
 			XGpio_SetDataDirection(FAN_OUT_ONE, 1, 0x00);
 	        XGpio_SetDataDirection(FAN_OUT_SECOND, 1, 0x00);
 			XGpio_SetDataDirection(FAN_OUT_THIRD, 1, 0x00);
 	        XGpio_SetDataDirection(FAN_OUT_FOURTH, 1, 0x00);
 			XGpio_SetDataDirection(FAN_OUT_FIFTH, 1, 0x00);

 			// Setting the direction GPIO to input
 			XGpio_SetDataDirection(STEPPER_ONE, 1, 0xFFFFFFFF);
 	        XGpio_SetDataDirection(STEPPER_TWO, 1, 0xFFFFFFFF);
 			XGpio_SetDataDirection(STEPPER_THREE, 1, 0xFFFFFFFF);
 	        XGpio_SetDataDirection(STEPPER_FOUR, 1, 0xFFFFFFFF);
 			XGpio_SetDataDirection(STEPPER_FIVE, 1, 0xFFFFFFFF);
 			XGpio_SetDataDirection(STEPPER_SIX, 1, 0xFFFFFFFF);
 			XGpio_SetDataDirection(STEPPER_SEVEN, 1, 0xFFFFFFFF);
 		 	XGpio_SetDataDirection(STEPPER_EIGHT, 1, 0xFFFFFFFF);
 		 	XGpio_SetDataDirection(STEPPER_NINE, 1, 0xFFFFFFFF);
			XGpio_SetDataDirection(FAN_OUT_TEMP, 1, 0xFFFFFFFF);		// This is used as 10th Stepper input from ESP32

 	}

/**
 * Creates a simple delay loop.
 *
 * This function implements a basic delay mechanism by executing a for-loop that iterates
 * 'n' times. Each iteration represents a minimal delay, with the total delay time depending
 * on the loop count and the execution time of a single loop iteration. This function is
 * typically used to introduce a delay in operations, such as waiting for hardware actions
 * to complete or throttling the speed of execution in a control loop.
 *
 * Parameters:
 * - int n: The number of iterations for the loop, directly influencing the delay length.
 *
 */
 void delay(int n) {
     int i;
     for(i = 0; i < n; i++) {
     }
 }

/**
 * @brief 		Controls the rotation of the first stepper motor.
 * 				Executes a step in the motor's rotation sequence based on the given step index and direction. 
 * 				The function selects the correct sequence for either clockwise or counterclockwise rotation 
 * 				and triggers the corresponding coil activation pattern via GPIO.
 *
 * @parameters
 * 			  - int step: The index of the current step in the rotation sequence (0-3).
 * 			  - int direction: The rotation direction, CW (clockwise) or CCW (counterclockwise).
 *
 * @note		'FAN_OUT_ONE' is the designated GPIO for motor control. Same for other functions.
 */
 void stepMotorOne(int step, int direction) {
     static const int sequence[][4] = {
         {0b0001, 0b0010, 0b0100, 0b1000}, 								// CW sequence
         {0b1000, 0b0100, 0b0010, 0b0001}  								// CCW sequence
     };
     int index = direction == CW ? 0 : 1; 								// Select sequence based on direction
     XGpio_DiscreteWrite(&FAN_OUT_ONE, 1, sequence[index][step]);		// Write the step to GPIO
 }

 void stepMotorTwo(int step, int direction) {
      static const int sequence[][4] = {
          {0b0001, 0b0010, 0b0100, 0b1000}, 							// CW sequence
          {0b1000, 0b0100, 0b0010, 0b0001}  							// CCW sequence
      };
      int index = direction == CW ? 0 : 1; 								// Select sequence based on direction   
      XGpio_DiscreteWrite(&FAN_OUT_SECOND, 1, sequence[index][step]);   // Write the step to GPIO
   }

 void stepMotorThree(int step, int direction) {
       static const int sequence[][4] = {
           {0b0001, 0b0010, 0b0100, 0b1000}, 							// CW sequence
           {0b1000, 0b0100, 0b0010, 0b0001}  							// CCW sequence
       };
       int index = direction == CW ? 0 : 1; 							// Select sequence based on direction
       XGpio_DiscreteWrite(&FAN_OUT_THIRD, 1, sequence[index][step]);   // Write the step to GPIO
   }


 void stepMotorFour(int step, int direction) {
        static const int sequence[][4] = {
            {0b0001, 0b0010, 0b0100, 0b1000}, 							// CW sequence
            {0b1000, 0b0100, 0b0010, 0b0001}  							// CCW sequence
        };
        int index = direction == CW ? 0 : 1; 							// Select sequence based on direction
        XGpio_DiscreteWrite(&FAN_OUT_FOURTH, 1, sequence[index][step]); // Write the step to GPIO
    }

 void stepMotorFive(int step, int direction) {
        static const int sequence[][4] = {
            {0b0001, 0b0010, 0b0100, 0b1000}, 							// CW sequence
            {0b1000, 0b0100, 0b0010, 0b0001}  							// CCW sequence
        };
        int index = direction == CW ? 0 : 1; 							// Select sequence based on direction
        XGpio_DiscreteWrite(&FAN_OUT_FIFTH, 1, sequence[index][step]);  // Write the step to GPIO
    }
