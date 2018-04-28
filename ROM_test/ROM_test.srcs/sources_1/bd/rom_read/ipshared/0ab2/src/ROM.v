//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Sat Apr 28 16:04:55 2018
//Host        : DESKTOP-55SCUS4 running 64-bit major release  (build 9200)
//Command     : generate_target ROM.bd
//Design      : ROM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ROM,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ROM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_bram_cntlr_cnt=1,da_ps7_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "ROM.hwdef" *) 
module ROM
   (BRAM_PORTA_addr,
    BRAM_PORTA_clk,
    BRAM_PORTA_dout,
    BRAM_PORTA_en);
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORTA, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_WRITE_MODE READ_ONLY" *) input [12:0]BRAM_PORTA_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input BRAM_PORTA_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]BRAM_PORTA_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input BRAM_PORTA_en;

  wire [12:0]BRAM_PORTA_1_ADDR;
  wire BRAM_PORTA_1_CLK;
  wire [31:0]BRAM_PORTA_1_DOUT;
  wire BRAM_PORTA_1_EN;

  assign BRAM_PORTA_1_ADDR = BRAM_PORTA_addr[12:0];
  assign BRAM_PORTA_1_CLK = BRAM_PORTA_clk;
  assign BRAM_PORTA_1_EN = BRAM_PORTA_en;
  assign BRAM_PORTA_dout[31:0] = BRAM_PORTA_1_DOUT;
  ROM_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(BRAM_PORTA_1_ADDR),
        .clka(BRAM_PORTA_1_CLK),
        .douta(BRAM_PORTA_1_DOUT),
        .ena(BRAM_PORTA_1_EN));
endmodule
