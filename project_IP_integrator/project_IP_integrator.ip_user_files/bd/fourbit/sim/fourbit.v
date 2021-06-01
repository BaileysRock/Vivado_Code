//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Thu Nov 26 17:02:57 2020
//Host        : YOOOO running 64-bit major release  (build 9200)
//Command     : generate_target fourbit.bd
//Design      : fourbit
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "fourbit,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fourbit,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "fourbit.hwdef" *) 
module fourbit
   (clk_0,
    q0,
    q1,
    q2,
    q3,
    rst_n_0,
    set_n_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN fourbit_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  output q0;
  output q1;
  output q2;
  output q3;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_n_0;
  input set_n_0;

  wire D_trigger_0_q;
  wire D_trigger_1_q;
  wire D_trigger_2_q;
  wire D_trigger_3_q;
  wire clk_0_1;
  wire rst_n_0_1;
  wire set_n_0_1;

  assign clk_0_1 = clk_0;
  assign q0 = D_trigger_0_q;
  assign q1 = D_trigger_1_q;
  assign q2 = D_trigger_2_q;
  assign q3 = D_trigger_3_q;
  assign rst_n_0_1 = rst_n_0;
  assign set_n_0_1 = set_n_0;
  fourbit_D_trigger_0_0 D_trigger_0
       (.clk(clk_0_1),
        .d(D_trigger_3_q),
        .q(D_trigger_0_q),
        .rst_n(rst_n_0_1),
        .set_n(set_n_0_1));
  fourbit_D_trigger_1_1 D_trigger_1
       (.clk(clk_0_1),
        .d(D_trigger_0_q),
        .q(D_trigger_1_q),
        .rst_n(set_n_0_1),
        .set_n(rst_n_0_1));
  fourbit_D_trigger_2_0 D_trigger_2
       (.clk(clk_0_1),
        .d(D_trigger_1_q),
        .q(D_trigger_2_q),
        .rst_n(set_n_0_1),
        .set_n(rst_n_0_1));
  fourbit_D_trigger_3_0 D_trigger_3
       (.clk(clk_0_1),
        .d(D_trigger_2_q),
        .q(D_trigger_3_q),
        .rst_n(set_n_0_1),
        .set_n(rst_n_0_1));
endmodule
