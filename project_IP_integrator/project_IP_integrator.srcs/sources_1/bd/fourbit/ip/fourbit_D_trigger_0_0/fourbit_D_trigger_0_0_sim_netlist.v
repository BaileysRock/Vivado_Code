// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Nov 26 16:50:04 2020
// Host        : YOOOO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top fourbit_D_trigger_0_0 -prefix
//               fourbit_D_trigger_0_0_ fourbit_D_trigger_0_0_sim_netlist.v
// Design      : fourbit_D_trigger_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module fourbit_D_trigger_0_0_D_trigger
   (q,
    d,
    clk,
    set_n,
    rst_n);
  output q;
  input d;
  input clk;
  input set_n;
  input rst_n;

  wire clk;
  wire d;
  wire q;
  wire qout_reg_C_n_0;
  wire qout_reg_LDC_i_1_n_0;
  wire qout_reg_LDC_i_2_n_0;
  wire qout_reg_LDC_n_0;
  wire qout_reg_P_n_0;
  wire rst_n;
  wire set_n;

  LUT3 #(
    .INIT(8'hB8)) 
    q_INST_0
       (.I0(qout_reg_P_n_0),
        .I1(qout_reg_LDC_n_0),
        .I2(qout_reg_C_n_0),
        .O(q));
  FDCE qout_reg_C
       (.C(clk),
        .CE(1'b1),
        .CLR(qout_reg_LDC_i_2_n_0),
        .D(d),
        .Q(qout_reg_C_n_0));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    qout_reg_LDC
       (.CLR(qout_reg_LDC_i_2_n_0),
        .D(1'b1),
        .G(set_n),
        .GE(1'b1),
        .Q(qout_reg_LDC_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    qout_reg_LDC_i_1
       (.I0(set_n),
        .O(qout_reg_LDC_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    qout_reg_LDC_i_2
       (.I0(rst_n),
        .O(qout_reg_LDC_i_2_n_0));
  (* OPT_MODIFIED = "MLO" *) 
  FDPE qout_reg_P
       (.C(clk),
        .CE(1'b1),
        .D(d),
        .PRE(qout_reg_LDC_i_1_n_0),
        .Q(qout_reg_P_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "fourbit_D_trigger_0_0,D_trigger,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "D_trigger,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module fourbit_D_trigger_0_0
   (clk,
    rst_n,
    set_n,
    d,
    q);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN fourbit_clk_0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input set_n;
  input d;
  output q;

  wire clk;
  wire d;
  wire q;
  wire rst_n;
  wire set_n;

  fourbit_D_trigger_0_0_D_trigger inst
       (.clk(clk),
        .d(d),
        .q(q),
        .rst_n(rst_n),
        .set_n(set_n));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
