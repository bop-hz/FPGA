// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Apr 28 17:16:16 2018
// Host        : DESKTOP-55SCUS4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rom_read_ROM_0_0_stub.v
// Design      : rom_read_ROM_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ROM,Vivado 2018.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(BRAM_PORTA_addr, BRAM_PORTA_clk, 
  BRAM_PORTA_dout, BRAM_PORTA_en)
/* synthesis syn_black_box black_box_pad_pin="BRAM_PORTA_addr[12:0],BRAM_PORTA_clk,BRAM_PORTA_dout[31:0],BRAM_PORTA_en" */;
  input [12:0]BRAM_PORTA_addr;
  input BRAM_PORTA_clk;
  output [31:0]BRAM_PORTA_dout;
  input BRAM_PORTA_en;
endmodule
