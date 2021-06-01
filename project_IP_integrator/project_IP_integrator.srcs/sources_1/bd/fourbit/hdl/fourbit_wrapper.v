//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Thu Nov 26 17:02:57 2020
//Host        : YOOOO running 64-bit major release  (build 9200)
//Command     : generate_target fourbit_wrapper.bd
//Design      : fourbit_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module fourbit_wrapper
   (clk_0,
    q0,
    q1,
    q2,
    q3,
    rst_n_0,
    set_n_0);
  input clk_0;
  output q0;
  output q1;
  output q2;
  output q3;
  input rst_n_0;
  input set_n_0;

  wire clk_0;
  wire q0;
  wire q1;
  wire q2;
  wire q3;
  wire rst_n_0;
  wire set_n_0;

  fourbit fourbit_i
       (.clk_0(clk_0),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3),
        .rst_n_0(rst_n_0),
        .set_n_0(set_n_0));
endmodule
