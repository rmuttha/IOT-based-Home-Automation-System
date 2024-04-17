-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Wed Feb 21 17:23:30 2024
-- Host        : LAPTOP-I10N6P43 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top embsys_clk_wiz_1_3 -prefix
--               embsys_clk_wiz_1_3_ embsys_clk_wiz_1_3_stub.vhdl
-- Design      : embsys_clk_wiz_1_3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity embsys_clk_wiz_1_3 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end embsys_clk_wiz_1_3;

architecture stub of embsys_clk_wiz_1_3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,resetn,locked,clk_in1";
begin
end;
