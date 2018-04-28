//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Sat Apr 28 16:04:55 2018
//Host        : DESKTOP-55SCUS4 running 64-bit major release  (build 9200)
//Command     : generate_target ROM_wrapper.bd
//Design      : ROM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ROM_wrapper
   (BRAM_PORTA_addr,
    BRAM_PORTA_clk,
    BRAM_PORTA_dout,
    BRAM_PORTA_en);
  input [12:0]BRAM_PORTA_addr;
  input BRAM_PORTA_clk;
  output [31:0]BRAM_PORTA_dout;
  input BRAM_PORTA_en;

  wire [12:0]BRAM_PORTA_addr;
  wire BRAM_PORTA_clk;
  wire [31:0]BRAM_PORTA_dout;
  wire BRAM_PORTA_en;

  ROM ROM_i
       (.BRAM_PORTA_addr(BRAM_PORTA_addr),
        .BRAM_PORTA_clk(BRAM_PORTA_clk),
        .BRAM_PORTA_dout(BRAM_PORTA_dout),
        .BRAM_PORTA_en(BRAM_PORTA_en));
endmodule
