-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Nov 26 16:50:04 2020
-- Host        : YOOOO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top fourbit_D_trigger_1_1 -prefix
--               fourbit_D_trigger_1_1_ fourbit_D_trigger_0_0_sim_netlist.vhdl
-- Design      : fourbit_D_trigger_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fourbit_D_trigger_1_1_D_trigger is
  port (
    q : out STD_LOGIC;
    d : in STD_LOGIC;
    clk : in STD_LOGIC;
    set_n : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
end fourbit_D_trigger_1_1_D_trigger;

architecture STRUCTURE of fourbit_D_trigger_1_1_D_trigger is
  signal qout_reg_C_n_0 : STD_LOGIC;
  signal qout_reg_LDC_i_1_n_0 : STD_LOGIC;
  signal qout_reg_LDC_i_2_n_0 : STD_LOGIC;
  signal qout_reg_LDC_n_0 : STD_LOGIC;
  signal qout_reg_P_n_0 : STD_LOGIC;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of qout_reg_LDC : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of qout_reg_LDC : label is "LDC";
  attribute OPT_MODIFIED of qout_reg_P : label is "MLO";
begin
q_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => qout_reg_P_n_0,
      I1 => qout_reg_LDC_n_0,
      I2 => qout_reg_C_n_0,
      O => q
    );
qout_reg_C: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => qout_reg_LDC_i_2_n_0,
      D => d,
      Q => qout_reg_C_n_0
    );
qout_reg_LDC: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => qout_reg_LDC_i_2_n_0,
      D => '1',
      G => set_n,
      GE => '1',
      Q => qout_reg_LDC_n_0
    );
qout_reg_LDC_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => set_n,
      O => qout_reg_LDC_i_1_n_0
    );
qout_reg_LDC_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => qout_reg_LDC_i_2_n_0
    );
qout_reg_P: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => d,
      PRE => qout_reg_LDC_i_1_n_0,
      Q => qout_reg_P_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fourbit_D_trigger_1_1 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    set_n : in STD_LOGIC;
    d : in STD_LOGIC;
    q : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fourbit_D_trigger_1_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of fourbit_D_trigger_1_1 : entity is "fourbit_D_trigger_0_0,D_trigger,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of fourbit_D_trigger_1_1 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of fourbit_D_trigger_1_1 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of fourbit_D_trigger_1_1 : entity is "D_trigger,Vivado 2020.1";
end fourbit_D_trigger_1_1;

architecture STRUCTURE of fourbit_D_trigger_1_1 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN fourbit_clk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.fourbit_D_trigger_1_1_D_trigger
     port map (
      clk => clk,
      d => d,
      q => q,
      rst_n => rst_n,
      set_n => set_n
    );
end STRUCTURE;
