/*
 * GENERATED FILE - DO NOT EDIT
 * Copyright (c) 2008-2013 Code Red Technologies Ltd,
 * Copyright 2015, 2018-2019 NXP
 * (c) NXP Semiconductors 2013-2021
 * Generated linker script file for LPC54S018J4M
 * Created from memory.ldt by FMCreateLinkMemory
 * Using Freemarker v2.3.30
 * MCUXpresso IDE v11.4.1 [Build 6260] [2021-09-15] on Sep 30, 2021, 3:02:35 PM
 */

MEMORY
{
  /* Define each memory region */
  PROGRAM_FLASH (rx) : ORIGIN = 0x10000000, LENGTH = 0x400000 /* 4M bytes (alias Flash) */  
  SRAMX (rwx) : ORIGIN = 0x0, LENGTH = 0x30000 /* 192K bytes (alias RAM) */  
  SRAM_0_1_2_3 (rwx) : ORIGIN = 0x20000000, LENGTH = 0x28000 /* 160K bytes (alias RAM2) */  
  USB_RAM (rwx) : ORIGIN = 0x40100000, LENGTH = 0x2000 /* 8K bytes (alias RAM3) */  
  BOARD_SDRAM (rwx) : ORIGIN = 0xa0000000, LENGTH = 0x2000000 /* 32M bytes (alias RAM4) */  
}

  /* Define a symbol for the top of each memory region */
  __base_PROGRAM_FLASH = 0x10000000  ; /* PROGRAM_FLASH */  
  __base_Flash = 0x10000000 ; /* Flash */  
  __top_PROGRAM_FLASH = 0x10000000 + 0x400000 ; /* 4M bytes */  
  __top_Flash = 0x10000000 + 0x400000 ; /* 4M bytes */  
  __base_SRAMX = 0x0  ; /* SRAMX */  
  __base_RAM = 0x0 ; /* RAM */  
  __top_SRAMX = 0x0 + 0x30000 ; /* 192K bytes */  
  __top_RAM = 0x0 + 0x30000 ; /* 192K bytes */  
  __base_SRAM_0_1_2_3 = 0x20000000  ; /* SRAM_0_1_2_3 */  
  __base_RAM2 = 0x20000000 ; /* RAM2 */  
  __top_SRAM_0_1_2_3 = 0x20000000 + 0x28000 ; /* 160K bytes */  
  __top_RAM2 = 0x20000000 + 0x28000 ; /* 160K bytes */  
  __base_USB_RAM = 0x40100000  ; /* USB_RAM */  
  __base_RAM3 = 0x40100000 ; /* RAM3 */  
  __top_USB_RAM = 0x40100000 + 0x2000 ; /* 8K bytes */  
  __top_RAM3 = 0x40100000 + 0x2000 ; /* 8K bytes */  
  __base_BOARD_SDRAM = 0xa0000000  ; /* BOARD_SDRAM */  
  __base_RAM4 = 0xa0000000 ; /* RAM4 */  
  __top_BOARD_SDRAM = 0xa0000000 + 0x2000000 ; /* 32M bytes */  
  __top_RAM4 = 0xa0000000 + 0x2000000 ; /* 32M bytes */  
