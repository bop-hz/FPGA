-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Apr 28 17:16:17 2018
-- Host        : DESKTOP-55SCUS4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/bop/Documents/GitHub/FPGA/ROM_test/ROM_test.srcs/sources_1/bd/rom_read/ip/rom_read_ROM_0_0/rom_read_ROM_0_0_stub.vhdl
-- Design      : rom_read_ROM_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_read_ROM_0_0 is
  Port ( 
    BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    BRAM_PORTA_clk : in STD_LOGIC;
    BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTA_en : in STD_LOGIC
  );

end rom_read_ROM_0_0;

architecture stub of rom_read_ROM_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "BRAM_PORTA_addr[12:0],BRAM_PORTA_clk,BRAM_PORTA_dout[31:0],BRAM_PORTA_en";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ROM,Vivado 2018.1";
begin
end;
