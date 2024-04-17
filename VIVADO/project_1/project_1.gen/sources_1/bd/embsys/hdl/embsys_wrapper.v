//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Tue Mar 19 15:18:46 2024
//Host        : LAPTOP-I10N6P43 running 64-bit major release  (build 9200)
//Command     : generate_target embsys_wrapper.bd
//Design      : embsys_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module embsys_wrapper
   (FAN_OUT_FIFTH_tri_io,
    FAN_OUT_FOURTH_tri_io,
    FAN_OUT_ONE_tri_io,
    FAN_OUT_SECOND_tri_io,
    FAN_OUT_TEMP_tri_io,
    FAN_OUT_THIRD_tri_io,
    RGB1_Blue_0,
    RGB1_Green_0,
    RGB1_Red_0,
    RGB2_Blue_0,
    RGB2_Green_0,
    RGB2_Red_0,
    STEPPER_EIGHT_tri_io,
    STEPPER_FIVE_tri_io,
    STEPPER_FOUR_tri_io,
    STEPPER_NINE_tri_io,
    STEPPER_ONE_tri_io,
    STEPPER_SEVEN_tri_io,
    STEPPER_SIX_tri_io,
    STEPPER_THREE_tri_io,
    STEPPER_TWO_tri_io,
    an_0,
    btnC_0,
    btnD_0,
    btnL_0,
    btnR_0,
    btnU_0,
    dp_0,
    led_0,
    resetn,
    sclk_io,
    sda_io,
    seg_0,
    sw_0,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  inout [3:0]FAN_OUT_FIFTH_tri_io;
  inout [3:0]FAN_OUT_FOURTH_tri_io;
  inout [3:0]FAN_OUT_ONE_tri_io;
  inout [3:0]FAN_OUT_SECOND_tri_io;
  inout [0:0]FAN_OUT_TEMP_tri_io;
  inout [3:0]FAN_OUT_THIRD_tri_io;
  output RGB1_Blue_0;
  output RGB1_Green_0;
  output RGB1_Red_0;
  output RGB2_Blue_0;
  output RGB2_Green_0;
  output RGB2_Red_0;
  inout [0:0]STEPPER_EIGHT_tri_io;
  inout [0:0]STEPPER_FIVE_tri_io;
  inout [0:0]STEPPER_FOUR_tri_io;
  inout [0:0]STEPPER_NINE_tri_io;
  inout [0:0]STEPPER_ONE_tri_io;
  inout [0:0]STEPPER_SEVEN_tri_io;
  inout [0:0]STEPPER_SIX_tri_io;
  inout [0:0]STEPPER_THREE_tri_io;
  inout [0:0]STEPPER_TWO_tri_io;
  output [7:0]an_0;
  input btnC_0;
  input btnD_0;
  input btnL_0;
  input btnR_0;
  input btnU_0;
  output dp_0;
  output [15:0]led_0;
  input resetn;
  inout sclk_io;
  inout sda_io;
  output [6:0]seg_0;
  input [15:0]sw_0;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [0:0]FAN_OUT_FIFTH_tri_i_0;
  wire [1:1]FAN_OUT_FIFTH_tri_i_1;
  wire [2:2]FAN_OUT_FIFTH_tri_i_2;
  wire [3:3]FAN_OUT_FIFTH_tri_i_3;
  wire [0:0]FAN_OUT_FIFTH_tri_io_0;
  wire [1:1]FAN_OUT_FIFTH_tri_io_1;
  wire [2:2]FAN_OUT_FIFTH_tri_io_2;
  wire [3:3]FAN_OUT_FIFTH_tri_io_3;
  wire [0:0]FAN_OUT_FIFTH_tri_o_0;
  wire [1:1]FAN_OUT_FIFTH_tri_o_1;
  wire [2:2]FAN_OUT_FIFTH_tri_o_2;
  wire [3:3]FAN_OUT_FIFTH_tri_o_3;
  wire [0:0]FAN_OUT_FIFTH_tri_t_0;
  wire [1:1]FAN_OUT_FIFTH_tri_t_1;
  wire [2:2]FAN_OUT_FIFTH_tri_t_2;
  wire [3:3]FAN_OUT_FIFTH_tri_t_3;
  wire [0:0]FAN_OUT_FOURTH_tri_i_0;
  wire [1:1]FAN_OUT_FOURTH_tri_i_1;
  wire [2:2]FAN_OUT_FOURTH_tri_i_2;
  wire [3:3]FAN_OUT_FOURTH_tri_i_3;
  wire [0:0]FAN_OUT_FOURTH_tri_io_0;
  wire [1:1]FAN_OUT_FOURTH_tri_io_1;
  wire [2:2]FAN_OUT_FOURTH_tri_io_2;
  wire [3:3]FAN_OUT_FOURTH_tri_io_3;
  wire [0:0]FAN_OUT_FOURTH_tri_o_0;
  wire [1:1]FAN_OUT_FOURTH_tri_o_1;
  wire [2:2]FAN_OUT_FOURTH_tri_o_2;
  wire [3:3]FAN_OUT_FOURTH_tri_o_3;
  wire [0:0]FAN_OUT_FOURTH_tri_t_0;
  wire [1:1]FAN_OUT_FOURTH_tri_t_1;
  wire [2:2]FAN_OUT_FOURTH_tri_t_2;
  wire [3:3]FAN_OUT_FOURTH_tri_t_3;
  wire [0:0]FAN_OUT_ONE_tri_i_0;
  wire [1:1]FAN_OUT_ONE_tri_i_1;
  wire [2:2]FAN_OUT_ONE_tri_i_2;
  wire [3:3]FAN_OUT_ONE_tri_i_3;
  wire [0:0]FAN_OUT_ONE_tri_io_0;
  wire [1:1]FAN_OUT_ONE_tri_io_1;
  wire [2:2]FAN_OUT_ONE_tri_io_2;
  wire [3:3]FAN_OUT_ONE_tri_io_3;
  wire [0:0]FAN_OUT_ONE_tri_o_0;
  wire [1:1]FAN_OUT_ONE_tri_o_1;
  wire [2:2]FAN_OUT_ONE_tri_o_2;
  wire [3:3]FAN_OUT_ONE_tri_o_3;
  wire [0:0]FAN_OUT_ONE_tri_t_0;
  wire [1:1]FAN_OUT_ONE_tri_t_1;
  wire [2:2]FAN_OUT_ONE_tri_t_2;
  wire [3:3]FAN_OUT_ONE_tri_t_3;
  wire [0:0]FAN_OUT_SECOND_tri_i_0;
  wire [1:1]FAN_OUT_SECOND_tri_i_1;
  wire [2:2]FAN_OUT_SECOND_tri_i_2;
  wire [3:3]FAN_OUT_SECOND_tri_i_3;
  wire [0:0]FAN_OUT_SECOND_tri_io_0;
  wire [1:1]FAN_OUT_SECOND_tri_io_1;
  wire [2:2]FAN_OUT_SECOND_tri_io_2;
  wire [3:3]FAN_OUT_SECOND_tri_io_3;
  wire [0:0]FAN_OUT_SECOND_tri_o_0;
  wire [1:1]FAN_OUT_SECOND_tri_o_1;
  wire [2:2]FAN_OUT_SECOND_tri_o_2;
  wire [3:3]FAN_OUT_SECOND_tri_o_3;
  wire [0:0]FAN_OUT_SECOND_tri_t_0;
  wire [1:1]FAN_OUT_SECOND_tri_t_1;
  wire [2:2]FAN_OUT_SECOND_tri_t_2;
  wire [3:3]FAN_OUT_SECOND_tri_t_3;
  wire [0:0]FAN_OUT_TEMP_tri_i_0;
  wire [0:0]FAN_OUT_TEMP_tri_io_0;
  wire [0:0]FAN_OUT_TEMP_tri_o_0;
  wire [0:0]FAN_OUT_TEMP_tri_t_0;
  wire [0:0]FAN_OUT_THIRD_tri_i_0;
  wire [1:1]FAN_OUT_THIRD_tri_i_1;
  wire [2:2]FAN_OUT_THIRD_tri_i_2;
  wire [3:3]FAN_OUT_THIRD_tri_i_3;
  wire [0:0]FAN_OUT_THIRD_tri_io_0;
  wire [1:1]FAN_OUT_THIRD_tri_io_1;
  wire [2:2]FAN_OUT_THIRD_tri_io_2;
  wire [3:3]FAN_OUT_THIRD_tri_io_3;
  wire [0:0]FAN_OUT_THIRD_tri_o_0;
  wire [1:1]FAN_OUT_THIRD_tri_o_1;
  wire [2:2]FAN_OUT_THIRD_tri_o_2;
  wire [3:3]FAN_OUT_THIRD_tri_o_3;
  wire [0:0]FAN_OUT_THIRD_tri_t_0;
  wire [1:1]FAN_OUT_THIRD_tri_t_1;
  wire [2:2]FAN_OUT_THIRD_tri_t_2;
  wire [3:3]FAN_OUT_THIRD_tri_t_3;
  wire RGB1_Blue_0;
  wire RGB1_Green_0;
  wire RGB1_Red_0;
  wire RGB2_Blue_0;
  wire RGB2_Green_0;
  wire RGB2_Red_0;
  wire [0:0]STEPPER_EIGHT_tri_i_0;
  wire [0:0]STEPPER_EIGHT_tri_io_0;
  wire [0:0]STEPPER_EIGHT_tri_o_0;
  wire [0:0]STEPPER_EIGHT_tri_t_0;
  wire [0:0]STEPPER_FIVE_tri_i_0;
  wire [0:0]STEPPER_FIVE_tri_io_0;
  wire [0:0]STEPPER_FIVE_tri_o_0;
  wire [0:0]STEPPER_FIVE_tri_t_0;
  wire [0:0]STEPPER_FOUR_tri_i_0;
  wire [0:0]STEPPER_FOUR_tri_io_0;
  wire [0:0]STEPPER_FOUR_tri_o_0;
  wire [0:0]STEPPER_FOUR_tri_t_0;
  wire [0:0]STEPPER_NINE_tri_i_0;
  wire [0:0]STEPPER_NINE_tri_io_0;
  wire [0:0]STEPPER_NINE_tri_o_0;
  wire [0:0]STEPPER_NINE_tri_t_0;
  wire [0:0]STEPPER_ONE_tri_i_0;
  wire [0:0]STEPPER_ONE_tri_io_0;
  wire [0:0]STEPPER_ONE_tri_o_0;
  wire [0:0]STEPPER_ONE_tri_t_0;
  wire [0:0]STEPPER_SEVEN_tri_i_0;
  wire [0:0]STEPPER_SEVEN_tri_io_0;
  wire [0:0]STEPPER_SEVEN_tri_o_0;
  wire [0:0]STEPPER_SEVEN_tri_t_0;
  wire [0:0]STEPPER_SIX_tri_i_0;
  wire [0:0]STEPPER_SIX_tri_io_0;
  wire [0:0]STEPPER_SIX_tri_o_0;
  wire [0:0]STEPPER_SIX_tri_t_0;
  wire [0:0]STEPPER_THREE_tri_i_0;
  wire [0:0]STEPPER_THREE_tri_io_0;
  wire [0:0]STEPPER_THREE_tri_o_0;
  wire [0:0]STEPPER_THREE_tri_t_0;
  wire [0:0]STEPPER_TWO_tri_i_0;
  wire [0:0]STEPPER_TWO_tri_io_0;
  wire [0:0]STEPPER_TWO_tri_o_0;
  wire [0:0]STEPPER_TWO_tri_t_0;
  wire [7:0]an_0;
  wire btnC_0;
  wire btnD_0;
  wire btnL_0;
  wire btnR_0;
  wire btnU_0;
  wire dp_0;
  wire [15:0]led_0;
  wire resetn;
  wire sclk_io;
  wire sda_io;
  wire [6:0]seg_0;
  wire [15:0]sw_0;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  IOBUF FAN_OUT_FIFTH_tri_iobuf_0
       (.I(FAN_OUT_FIFTH_tri_o_0),
        .IO(FAN_OUT_FIFTH_tri_io[0]),
        .O(FAN_OUT_FIFTH_tri_i_0),
        .T(FAN_OUT_FIFTH_tri_t_0));
  IOBUF FAN_OUT_FIFTH_tri_iobuf_1
       (.I(FAN_OUT_FIFTH_tri_o_1),
        .IO(FAN_OUT_FIFTH_tri_io[1]),
        .O(FAN_OUT_FIFTH_tri_i_1),
        .T(FAN_OUT_FIFTH_tri_t_1));
  IOBUF FAN_OUT_FIFTH_tri_iobuf_2
       (.I(FAN_OUT_FIFTH_tri_o_2),
        .IO(FAN_OUT_FIFTH_tri_io[2]),
        .O(FAN_OUT_FIFTH_tri_i_2),
        .T(FAN_OUT_FIFTH_tri_t_2));
  IOBUF FAN_OUT_FIFTH_tri_iobuf_3
       (.I(FAN_OUT_FIFTH_tri_o_3),
        .IO(FAN_OUT_FIFTH_tri_io[3]),
        .O(FAN_OUT_FIFTH_tri_i_3),
        .T(FAN_OUT_FIFTH_tri_t_3));
  IOBUF FAN_OUT_FOURTH_tri_iobuf_0
       (.I(FAN_OUT_FOURTH_tri_o_0),
        .IO(FAN_OUT_FOURTH_tri_io[0]),
        .O(FAN_OUT_FOURTH_tri_i_0),
        .T(FAN_OUT_FOURTH_tri_t_0));
  IOBUF FAN_OUT_FOURTH_tri_iobuf_1
       (.I(FAN_OUT_FOURTH_tri_o_1),
        .IO(FAN_OUT_FOURTH_tri_io[1]),
        .O(FAN_OUT_FOURTH_tri_i_1),
        .T(FAN_OUT_FOURTH_tri_t_1));
  IOBUF FAN_OUT_FOURTH_tri_iobuf_2
       (.I(FAN_OUT_FOURTH_tri_o_2),
        .IO(FAN_OUT_FOURTH_tri_io[2]),
        .O(FAN_OUT_FOURTH_tri_i_2),
        .T(FAN_OUT_FOURTH_tri_t_2));
  IOBUF FAN_OUT_FOURTH_tri_iobuf_3
       (.I(FAN_OUT_FOURTH_tri_o_3),
        .IO(FAN_OUT_FOURTH_tri_io[3]),
        .O(FAN_OUT_FOURTH_tri_i_3),
        .T(FAN_OUT_FOURTH_tri_t_3));
  IOBUF FAN_OUT_ONE_tri_iobuf_0
       (.I(FAN_OUT_ONE_tri_o_0),
        .IO(FAN_OUT_ONE_tri_io[0]),
        .O(FAN_OUT_ONE_tri_i_0),
        .T(FAN_OUT_ONE_tri_t_0));
  IOBUF FAN_OUT_ONE_tri_iobuf_1
       (.I(FAN_OUT_ONE_tri_o_1),
        .IO(FAN_OUT_ONE_tri_io[1]),
        .O(FAN_OUT_ONE_tri_i_1),
        .T(FAN_OUT_ONE_tri_t_1));
  IOBUF FAN_OUT_ONE_tri_iobuf_2
       (.I(FAN_OUT_ONE_tri_o_2),
        .IO(FAN_OUT_ONE_tri_io[2]),
        .O(FAN_OUT_ONE_tri_i_2),
        .T(FAN_OUT_ONE_tri_t_2));
  IOBUF FAN_OUT_ONE_tri_iobuf_3
       (.I(FAN_OUT_ONE_tri_o_3),
        .IO(FAN_OUT_ONE_tri_io[3]),
        .O(FAN_OUT_ONE_tri_i_3),
        .T(FAN_OUT_ONE_tri_t_3));
  IOBUF FAN_OUT_SECOND_tri_iobuf_0
       (.I(FAN_OUT_SECOND_tri_o_0),
        .IO(FAN_OUT_SECOND_tri_io[0]),
        .O(FAN_OUT_SECOND_tri_i_0),
        .T(FAN_OUT_SECOND_tri_t_0));
  IOBUF FAN_OUT_SECOND_tri_iobuf_1
       (.I(FAN_OUT_SECOND_tri_o_1),
        .IO(FAN_OUT_SECOND_tri_io[1]),
        .O(FAN_OUT_SECOND_tri_i_1),
        .T(FAN_OUT_SECOND_tri_t_1));
  IOBUF FAN_OUT_SECOND_tri_iobuf_2
       (.I(FAN_OUT_SECOND_tri_o_2),
        .IO(FAN_OUT_SECOND_tri_io[2]),
        .O(FAN_OUT_SECOND_tri_i_2),
        .T(FAN_OUT_SECOND_tri_t_2));
  IOBUF FAN_OUT_SECOND_tri_iobuf_3
       (.I(FAN_OUT_SECOND_tri_o_3),
        .IO(FAN_OUT_SECOND_tri_io[3]),
        .O(FAN_OUT_SECOND_tri_i_3),
        .T(FAN_OUT_SECOND_tri_t_3));
  IOBUF FAN_OUT_TEMP_tri_iobuf_0
       (.I(FAN_OUT_TEMP_tri_o_0),
        .IO(FAN_OUT_TEMP_tri_io[0]),
        .O(FAN_OUT_TEMP_tri_i_0),
        .T(FAN_OUT_TEMP_tri_t_0));
  IOBUF FAN_OUT_THIRD_tri_iobuf_0
       (.I(FAN_OUT_THIRD_tri_o_0),
        .IO(FAN_OUT_THIRD_tri_io[0]),
        .O(FAN_OUT_THIRD_tri_i_0),
        .T(FAN_OUT_THIRD_tri_t_0));
  IOBUF FAN_OUT_THIRD_tri_iobuf_1
       (.I(FAN_OUT_THIRD_tri_o_1),
        .IO(FAN_OUT_THIRD_tri_io[1]),
        .O(FAN_OUT_THIRD_tri_i_1),
        .T(FAN_OUT_THIRD_tri_t_1));
  IOBUF FAN_OUT_THIRD_tri_iobuf_2
       (.I(FAN_OUT_THIRD_tri_o_2),
        .IO(FAN_OUT_THIRD_tri_io[2]),
        .O(FAN_OUT_THIRD_tri_i_2),
        .T(FAN_OUT_THIRD_tri_t_2));
  IOBUF FAN_OUT_THIRD_tri_iobuf_3
       (.I(FAN_OUT_THIRD_tri_o_3),
        .IO(FAN_OUT_THIRD_tri_io[3]),
        .O(FAN_OUT_THIRD_tri_i_3),
        .T(FAN_OUT_THIRD_tri_t_3));
  IOBUF STEPPER_EIGHT_tri_iobuf_0
       (.I(STEPPER_EIGHT_tri_o_0),
        .IO(STEPPER_EIGHT_tri_io[0]),
        .O(STEPPER_EIGHT_tri_i_0),
        .T(STEPPER_EIGHT_tri_t_0));
  IOBUF STEPPER_FIVE_tri_iobuf_0
       (.I(STEPPER_FIVE_tri_o_0),
        .IO(STEPPER_FIVE_tri_io[0]),
        .O(STEPPER_FIVE_tri_i_0),
        .T(STEPPER_FIVE_tri_t_0));
  IOBUF STEPPER_FOUR_tri_iobuf_0
       (.I(STEPPER_FOUR_tri_o_0),
        .IO(STEPPER_FOUR_tri_io[0]),
        .O(STEPPER_FOUR_tri_i_0),
        .T(STEPPER_FOUR_tri_t_0));
  IOBUF STEPPER_NINE_tri_iobuf_0
       (.I(STEPPER_NINE_tri_o_0),
        .IO(STEPPER_NINE_tri_io[0]),
        .O(STEPPER_NINE_tri_i_0),
        .T(STEPPER_NINE_tri_t_0));
  IOBUF STEPPER_ONE_tri_iobuf_0
       (.I(STEPPER_ONE_tri_o_0),
        .IO(STEPPER_ONE_tri_io[0]),
        .O(STEPPER_ONE_tri_i_0),
        .T(STEPPER_ONE_tri_t_0));
  IOBUF STEPPER_SEVEN_tri_iobuf_0
       (.I(STEPPER_SEVEN_tri_o_0),
        .IO(STEPPER_SEVEN_tri_io[0]),
        .O(STEPPER_SEVEN_tri_i_0),
        .T(STEPPER_SEVEN_tri_t_0));
  IOBUF STEPPER_SIX_tri_iobuf_0
       (.I(STEPPER_SIX_tri_o_0),
        .IO(STEPPER_SIX_tri_io[0]),
        .O(STEPPER_SIX_tri_i_0),
        .T(STEPPER_SIX_tri_t_0));
  IOBUF STEPPER_THREE_tri_iobuf_0
       (.I(STEPPER_THREE_tri_o_0),
        .IO(STEPPER_THREE_tri_io[0]),
        .O(STEPPER_THREE_tri_i_0),
        .T(STEPPER_THREE_tri_t_0));
  IOBUF STEPPER_TWO_tri_iobuf_0
       (.I(STEPPER_TWO_tri_o_0),
        .IO(STEPPER_TWO_tri_io[0]),
        .O(STEPPER_TWO_tri_i_0),
        .T(STEPPER_TWO_tri_t_0));
  embsys embsys_i
       (.FAN_OUT_FIFTH_tri_i({FAN_OUT_FIFTH_tri_i_3,FAN_OUT_FIFTH_tri_i_2,FAN_OUT_FIFTH_tri_i_1,FAN_OUT_FIFTH_tri_i_0}),
        .FAN_OUT_FIFTH_tri_o({FAN_OUT_FIFTH_tri_o_3,FAN_OUT_FIFTH_tri_o_2,FAN_OUT_FIFTH_tri_o_1,FAN_OUT_FIFTH_tri_o_0}),
        .FAN_OUT_FIFTH_tri_t({FAN_OUT_FIFTH_tri_t_3,FAN_OUT_FIFTH_tri_t_2,FAN_OUT_FIFTH_tri_t_1,FAN_OUT_FIFTH_tri_t_0}),
        .FAN_OUT_FOURTH_tri_i({FAN_OUT_FOURTH_tri_i_3,FAN_OUT_FOURTH_tri_i_2,FAN_OUT_FOURTH_tri_i_1,FAN_OUT_FOURTH_tri_i_0}),
        .FAN_OUT_FOURTH_tri_o({FAN_OUT_FOURTH_tri_o_3,FAN_OUT_FOURTH_tri_o_2,FAN_OUT_FOURTH_tri_o_1,FAN_OUT_FOURTH_tri_o_0}),
        .FAN_OUT_FOURTH_tri_t({FAN_OUT_FOURTH_tri_t_3,FAN_OUT_FOURTH_tri_t_2,FAN_OUT_FOURTH_tri_t_1,FAN_OUT_FOURTH_tri_t_0}),
        .FAN_OUT_ONE_tri_i({FAN_OUT_ONE_tri_i_3,FAN_OUT_ONE_tri_i_2,FAN_OUT_ONE_tri_i_1,FAN_OUT_ONE_tri_i_0}),
        .FAN_OUT_ONE_tri_o({FAN_OUT_ONE_tri_o_3,FAN_OUT_ONE_tri_o_2,FAN_OUT_ONE_tri_o_1,FAN_OUT_ONE_tri_o_0}),
        .FAN_OUT_ONE_tri_t({FAN_OUT_ONE_tri_t_3,FAN_OUT_ONE_tri_t_2,FAN_OUT_ONE_tri_t_1,FAN_OUT_ONE_tri_t_0}),
        .FAN_OUT_SECOND_tri_i({FAN_OUT_SECOND_tri_i_3,FAN_OUT_SECOND_tri_i_2,FAN_OUT_SECOND_tri_i_1,FAN_OUT_SECOND_tri_i_0}),
        .FAN_OUT_SECOND_tri_o({FAN_OUT_SECOND_tri_o_3,FAN_OUT_SECOND_tri_o_2,FAN_OUT_SECOND_tri_o_1,FAN_OUT_SECOND_tri_o_0}),
        .FAN_OUT_SECOND_tri_t({FAN_OUT_SECOND_tri_t_3,FAN_OUT_SECOND_tri_t_2,FAN_OUT_SECOND_tri_t_1,FAN_OUT_SECOND_tri_t_0}),
        .FAN_OUT_TEMP_tri_i(FAN_OUT_TEMP_tri_i_0),
        .FAN_OUT_TEMP_tri_o(FAN_OUT_TEMP_tri_o_0),
        .FAN_OUT_TEMP_tri_t(FAN_OUT_TEMP_tri_t_0),
        .FAN_OUT_THIRD_tri_i({FAN_OUT_THIRD_tri_i_3,FAN_OUT_THIRD_tri_i_2,FAN_OUT_THIRD_tri_i_1,FAN_OUT_THIRD_tri_i_0}),
        .FAN_OUT_THIRD_tri_o({FAN_OUT_THIRD_tri_o_3,FAN_OUT_THIRD_tri_o_2,FAN_OUT_THIRD_tri_o_1,FAN_OUT_THIRD_tri_o_0}),
        .FAN_OUT_THIRD_tri_t({FAN_OUT_THIRD_tri_t_3,FAN_OUT_THIRD_tri_t_2,FAN_OUT_THIRD_tri_t_1,FAN_OUT_THIRD_tri_t_0}),
        .RGB1_Blue_0(RGB1_Blue_0),
        .RGB1_Green_0(RGB1_Green_0),
        .RGB1_Red_0(RGB1_Red_0),
        .RGB2_Blue_0(RGB2_Blue_0),
        .RGB2_Green_0(RGB2_Green_0),
        .RGB2_Red_0(RGB2_Red_0),
        .STEPPER_EIGHT_tri_i(STEPPER_EIGHT_tri_i_0),
        .STEPPER_EIGHT_tri_o(STEPPER_EIGHT_tri_o_0),
        .STEPPER_EIGHT_tri_t(STEPPER_EIGHT_tri_t_0),
        .STEPPER_FIVE_tri_i(STEPPER_FIVE_tri_i_0),
        .STEPPER_FIVE_tri_o(STEPPER_FIVE_tri_o_0),
        .STEPPER_FIVE_tri_t(STEPPER_FIVE_tri_t_0),
        .STEPPER_FOUR_tri_i(STEPPER_FOUR_tri_i_0),
        .STEPPER_FOUR_tri_o(STEPPER_FOUR_tri_o_0),
        .STEPPER_FOUR_tri_t(STEPPER_FOUR_tri_t_0),
        .STEPPER_NINE_tri_i(STEPPER_NINE_tri_i_0),
        .STEPPER_NINE_tri_o(STEPPER_NINE_tri_o_0),
        .STEPPER_NINE_tri_t(STEPPER_NINE_tri_t_0),
        .STEPPER_ONE_tri_i(STEPPER_ONE_tri_i_0),
        .STEPPER_ONE_tri_o(STEPPER_ONE_tri_o_0),
        .STEPPER_ONE_tri_t(STEPPER_ONE_tri_t_0),
        .STEPPER_SEVEN_tri_i(STEPPER_SEVEN_tri_i_0),
        .STEPPER_SEVEN_tri_o(STEPPER_SEVEN_tri_o_0),
        .STEPPER_SEVEN_tri_t(STEPPER_SEVEN_tri_t_0),
        .STEPPER_SIX_tri_i(STEPPER_SIX_tri_i_0),
        .STEPPER_SIX_tri_o(STEPPER_SIX_tri_o_0),
        .STEPPER_SIX_tri_t(STEPPER_SIX_tri_t_0),
        .STEPPER_THREE_tri_i(STEPPER_THREE_tri_i_0),
        .STEPPER_THREE_tri_o(STEPPER_THREE_tri_o_0),
        .STEPPER_THREE_tri_t(STEPPER_THREE_tri_t_0),
        .STEPPER_TWO_tri_i(STEPPER_TWO_tri_i_0),
        .STEPPER_TWO_tri_o(STEPPER_TWO_tri_o_0),
        .STEPPER_TWO_tri_t(STEPPER_TWO_tri_t_0),
        .an_0(an_0),
        .btnC_0(btnC_0),
        .btnD_0(btnD_0),
        .btnL_0(btnL_0),
        .btnR_0(btnR_0),
        .btnU_0(btnU_0),
        .dp_0(dp_0),
        .led_0(led_0),
        .resetn(resetn),
        .sclk_io(sclk_io),
        .sda_io(sda_io),
        .seg_0(seg_0),
        .sw_0(sw_0),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
