// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Nov 26 16:50:04 2020
// Host        : YOOOO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top fourbit_D_trigger_2_0 -prefix
//               fourbit_D_trigger_2_0_ fourbit_D_trigger_0_0_stub.v
// Design      : fourbit_D_trigger_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "D_trigger,Vivado 2020.1" *)
module fourbit_D_trigger_2_0(clk, rst_n, set_n, d, q)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,set_n,d,q" */;
  input clk;
  input rst_n;
  input set_n;
  input d;
  output q;
endmodule
