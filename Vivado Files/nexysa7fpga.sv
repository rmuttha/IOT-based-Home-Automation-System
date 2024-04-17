////////////////////////////////////////////////////////////////////
//
// Top-level module for ECE 544 Final Project
// Authors:Raksha Mairpady, Rutuja Muttha and Thanuja Bala Baskaran
// Description: defines the input and output ports of the block design
//
///////////////////////////////////////////////////////////////////
`timescale 1 ps / 1 ps

module nexysa7fpga
   (
	input logic			clk,
	input logic [15:0]	sw,
	input logic		    btnU,
	input logic		    btnR,
	input logic			btnL,
	input logic			btnD,
	input logic			btnC,			
	input logic			btnCpuReset,
	output logic [15:0]	led,
    output logic RGB1_Blue, RGB1_Green, RGB1_Red,
	output logic RGB2_Blue,RGB2_Green, RGB2_Red,	
    output logic [7:0]	an,
	output logic [6:0]	seg,
    output logic		dp,
	input logic usb_uart_rxd,
	output logic usb_uart_txd,
	inout logic sclk_io,
        inout logic sda_io,
        inout logic[3:0] FAN_OUT_ONE,
       inout logic[3:0] FAN_OUT_SECOND,
       inout logic[3:0] FAN_OUT_THIRD,
       inout logic[3:0] FAN_OUT_FOURTH,
       inout logic[3:0] FAN_OUT_FIFTH,
        inout logic FAN_OUT_TEMP,
        inout logic STEPPER_ONE,
        inout logic STEPPER_THREE,
        inout logic STEPPER_FOUR,
        inout logic STEPPER_FIVE,
        inout logic STEPPER_SIX,
        inout logic STEPPER_SEVEN,
        inout logic STEPPER_EIGHT,
        inout logic STEPPER_NINE,
        inout logic STEPPER_TWO
);
    
  
  // instantiate the embedded system
  embsys_wrapper embedded
       (//.gpio_rtl_0_tri_o(gpio_rtl_tri_o),
        .RGB2_Blue_0(RGB2_Blue),
        .RGB2_Green_0(RGB2_Green),
        .RGB2_Red_0(RGB2_Red),
        .an_0(an),
        .btnC_0(btnC),
        .btnD_0(btnD),
        .btnL_0(btnL),
        .btnR_0(btnR),
        .btnU_0(btnU),
        //.clkPWM_0(),
        .sys_clock(clk),
        //.controlReg_0(control_reg),
        .dp_0(dp),
        .led_0(led),
        .resetn(btnCpuReset),
        .RGB1_Blue_0(RGB1_Blue),
        .RGB1_Green_0(RGB1_Green),
        .RGB1_Red_0(RGB1_Red),
        .seg_0(seg),
        .sw_0(sw),
        .sclk_io(sclk_io),
	.sda_io(sda_io),
	.usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd),
        .FAN_OUT_ONE_tri_io(FAN_OUT_ONE),
        .FAN_OUT_SECOND_tri_io(FAN_OUT_SECOND),
        .FAN_OUT_THIRD_tri_io(FAN_OUT_THIRD),
        .FAN_OUT_FOURTH_tri_io(FAN_OUT_FOURTH),
        .FAN_OUT_FIFTH_tri_io(FAN_OUT_FIFTH),
        .STEPPER_ONE_tri_io(STEPPER_ONE),
        .STEPPER_THREE_tri_io(STEPPER_THREE),
        .STEPPER_FOUR_tri_io(STEPPER_FOUR),
        .STEPPER_FIVE_tri_io(STEPPER_FIVE),
         .STEPPER_SIX_tri_io(STEPPER_SIX),
          .STEPPER_SEVEN_tri_io(STEPPER_SEVEN),
           .STEPPER_EIGHT_tri_io(STEPPER_EIGHT),
            .STEPPER_NINE_tri_io(STEPPER_NINE),
              .FAN_OUT_TEMP_tri_io(FAN_OUT_TEMP),
        .STEPPER_TWO_tri_io(STEPPER_TWO));
        
endmodule
