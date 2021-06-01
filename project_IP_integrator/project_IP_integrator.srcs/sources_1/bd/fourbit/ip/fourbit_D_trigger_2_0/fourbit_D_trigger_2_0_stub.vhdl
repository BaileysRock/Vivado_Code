-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Nov 26 16:50:04 2020
-- Host        : YOOOO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top fourbit_D_trigger_2_0 -prefix
--               fourbit_D_trigger_2_0_ fourbit_D_trigger_0_0_stub.vhdl
-- Design      : fourbit_D_trigger_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbit_D_trigger_2_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    set_n : in STD_LOGIC;
    d : in STD_LOGIC;
    q : out STD_LOGIC
  );

end fourbit_D_trigger_2_0;

architecture stub of fourbit_D_trigger_2_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,set_n,d,q";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "D_trigger,Vivado 2020.1";
begin
end;
