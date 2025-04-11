-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "04/10/2025 23:19:39"

-- 
-- Device: Altera EPM240T100C5 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	sistema_seguridad IS
    PORT (
	CLK : IN std_logic;
	RESET : IN std_logic;
	SW : IN std_logic_vector(3 DOWNTO 0);
	BTN : IN std_logic;
	OPEN_DOOR : OUT std_logic;
	ALARM : OUT std_logic
	);
END sistema_seguridad;

-- Design Ports Information


ARCHITECTURE structure OF sistema_seguridad IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_SW : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_BTN : std_logic;
SIGNAL ww_OPEN_DOOR : std_logic;
SIGNAL ww_ALARM : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \BTN~combout\ : std_logic;
SIGNAL \RESET~combout\ : std_logic;
SIGNAL \btn_last~regout\ : std_logic;
SIGNAL \count[2]~0_combout\ : std_logic;
SIGNAL \count[2]~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Decoder0~2_combout\ : std_logic;
SIGNAL \input_digits[3][1]~regout\ : std_logic;
SIGNAL \input_digits[3][2]~regout\ : std_logic;
SIGNAL \input_digits[3][3]~regout\ : std_logic;
SIGNAL \input_digits[3][0]~regout\ : std_logic;
SIGNAL \bin_digits[3][0]~0_combout\ : std_logic;
SIGNAL \bin_digits[3][1]~regout\ : std_logic;
SIGNAL \Decoder0~3_combout\ : std_logic;
SIGNAL \input_digits[1][2]~regout\ : std_logic;
SIGNAL \input_digits[1][3]~regout\ : std_logic;
SIGNAL \input_digits[1][1]~regout\ : std_logic;
SIGNAL \bin_digits[1][2]~regout\ : std_logic;
SIGNAL \bin_digits[3][2]~regout\ : std_logic;
SIGNAL \input_digits[1][0]~regout\ : std_logic;
SIGNAL \bin_digits[1][1]~regout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \input_digits[0][2]~regout\ : std_logic;
SIGNAL \input_digits[0][3]~regout\ : std_logic;
SIGNAL \input_digits[0][1]~regout\ : std_logic;
SIGNAL \input_digits[0][0]~regout\ : std_logic;
SIGNAL \bin_digits[0][1]~regout\ : std_logic;
SIGNAL \bin_digits[3][0]~regout\ : std_logic;
SIGNAL \bin_digits[1][0]~regout\ : std_logic;
SIGNAL \bin_digits[1][3]~regout\ : std_logic;
SIGNAL \process_0~6_combout\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \input_digits[2][0]~regout\ : std_logic;
SIGNAL \input_digits[2][1]~regout\ : std_logic;
SIGNAL \input_digits[2][3]~regout\ : std_logic;
SIGNAL \input_digits[2][2]~regout\ : std_logic;
SIGNAL \bin_digits[2][3]~regout\ : std_logic;
SIGNAL \bin_digits[0][0]~regout\ : std_logic;
SIGNAL \bin_digits[3][3]~regout\ : std_logic;
SIGNAL \bin_digits[2][0]~regout\ : std_logic;
SIGNAL \match_alarm~0_combout\ : std_logic;
SIGNAL \bin_digits[0][2]~regout\ : std_logic;
SIGNAL \bin_digits[2][2]~regout\ : std_logic;
SIGNAL \bin_digits[2][1]~regout\ : std_logic;
SIGNAL \bin_digits[0][3]~regout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \process_0~7_combout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \match_door~regout\ : std_logic;
SIGNAL \OPEN_DOOR~reg0_regout\ : std_logic;
SIGNAL \match_alarm~1_combout\ : std_logic;
SIGNAL \match_alarm~2_combout\ : std_logic;
SIGNAL \match_alarm~regout\ : std_logic;
SIGNAL \ALARM~reg0_regout\ : std_logic;
SIGNAL count : std_logic_vector(2 DOWNTO 0);
SIGNAL \SW~combout\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_CLK <= CLK;
ww_RESET <= RESET;
ww_SW <= SW;
ww_BTN <= BTN;
OPEN_DOOR <= ww_OPEN_DOOR;
ALARM <= ww_ALARM;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\BTN~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_BTN,
	combout => \BTN~combout\);

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESET~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_RESET,
	combout => \RESET~combout\);

-- Location: LC_X2_Y3_N3
btn_last : maxii_lcell
-- Equation(s):
-- \btn_last~regout\ = DFFEAS(((\RESET~combout\ & (\btn_last~regout\)) # (!\RESET~combout\ & ((\BTN~combout\)))), GLOBAL(\CLK~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aacc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \btn_last~regout\,
	datab => \BTN~combout\,
	datad => \RESET~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_last~regout\);

-- Location: LC_X3_Y3_N1
\count[0]\ : maxii_lcell
-- Equation(s):
-- count(0) = DFFEAS(count(0) $ (((\BTN~combout\ & (!count(2) & !\btn_last~regout\)))), GLOBAL(\CLK~combout\), !GLOBAL(\RESET~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0d2",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \BTN~combout\,
	datab => count(2),
	datac => count(0),
	datad => \btn_last~regout\,
	aclr => \RESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count(0));

-- Location: LC_X3_Y3_N4
\count[2]~0\ : maxii_lcell
-- Equation(s):
-- \count[2]~0_combout\ = ((\BTN~combout\ & ((!\btn_last~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \BTN~combout\,
	datad => \btn_last~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \count[2]~0_combout\);

-- Location: LC_X2_Y3_N6
\count[2]\ : maxii_lcell
-- Equation(s):
-- count(2) = DFFEAS((count(2)) # ((count(0) & (count(1) & \count[2]~0_combout\))), GLOBAL(\CLK~combout\), !GLOBAL(\RESET~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f8f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => count(0),
	datab => count(1),
	datac => count(2),
	datad => \count[2]~0_combout\,
	aclr => \RESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count(2));

-- Location: LC_X2_Y3_N7
\count[2]~2\ : maxii_lcell
-- Equation(s):
-- \count[2]~2_combout\ = ((\BTN~combout\ & (!count(2) & !\btn_last~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \BTN~combout\,
	datac => count(2),
	datad => \btn_last~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \count[2]~2_combout\);

-- Location: LC_X2_Y3_N0
\count[1]\ : maxii_lcell
-- Equation(s):
-- count(1) = DFFEAS((count(1) $ (((\count[2]~2_combout\ & count(0))))), GLOBAL(\CLK~combout\), !GLOBAL(\RESET~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3ccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => count(1),
	datac => \count[2]~2_combout\,
	datad => count(0),
	aclr => \RESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count(1));

-- Location: LC_X3_Y3_N8
\Equal0~0\ : maxii_lcell
-- Equation(s):
-- \Equal0~0_combout\ = (!count(1) & (!count(0) & (count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datab => count(0),
	datac => count(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~0_combout\);

-- Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SW(1),
	combout => \SW~combout\(1));

-- Location: LC_X3_Y3_N2
\Decoder0~2\ : maxii_lcell
-- Equation(s):
-- \Decoder0~2_combout\ = (count(1) & (count(0) & (!\RESET~combout\ & \count[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0800",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datab => count(0),
	datac => \RESET~combout\,
	datad => \count[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Decoder0~2_combout\);

-- Location: LC_X4_Y3_N6
\input_digits[3][1]\ : maxii_lcell
-- Equation(s):
-- \input_digits[3][1]~regout\ = DFFEAS((((\SW~combout\(1)))), GLOBAL(\CLK~combout\), VCC, , \Decoder0~2_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datad => \SW~combout\(1),
	aclr => GND,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[3][1]~regout\);

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SW(2),
	combout => \SW~combout\(2));

-- Location: LC_X4_Y3_N7
\input_digits[3][2]\ : maxii_lcell
-- Equation(s):
-- \input_digits[3][2]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~2_combout\, \SW~combout\(2), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(2),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[3][2]~regout\);

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SW(3),
	combout => \SW~combout\(3));

-- Location: LC_X4_Y3_N5
\input_digits[3][3]\ : maxii_lcell
-- Equation(s):
-- \input_digits[3][3]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~2_combout\, \SW~combout\(3), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(3),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[3][3]~regout\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_SW(0),
	combout => \SW~combout\(0));

-- Location: LC_X4_Y3_N0
\input_digits[3][0]\ : maxii_lcell
-- Equation(s):
-- \input_digits[3][0]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~2_combout\, \SW~combout\(0), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(0),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[3][0]~regout\);

-- Location: LC_X2_Y3_N5
\bin_digits[3][0]~0\ : maxii_lcell
-- Equation(s):
-- \bin_digits[3][0]~0_combout\ = (count(2) & (!\RESET~combout\ & (!count(1) & !count(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datab => \RESET~combout\,
	datac => count(1),
	datad => count(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \bin_digits[3][0]~0_combout\);

-- Location: LC_X5_Y2_N1
\bin_digits[3][1]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[3][1]~regout\ = DFFEAS((\input_digits[3][1]~regout\ & (((!\input_digits[3][2]~regout\ & !\input_digits[3][0]~regout\)) # (!\input_digits[3][3]~regout\))) # (!\input_digits[3][1]~regout\ & ((\input_digits[3][3]~regout\) # 
-- ((\input_digits[3][2]~regout\ & \input_digits[3][0]~regout\)))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5e7a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[3][1]~regout\,
	datab => \input_digits[3][2]~regout\,
	datac => \input_digits[3][3]~regout\,
	datad => \input_digits[3][0]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[3][1]~regout\);

-- Location: LC_X3_Y3_N3
\Decoder0~3\ : maxii_lcell
-- Equation(s):
-- \Decoder0~3_combout\ = (!count(1) & (count(0) & (!\RESET~combout\ & \count[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0400",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datab => count(0),
	datac => \RESET~combout\,
	datad => \count[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Decoder0~3_combout\);

-- Location: LC_X2_Y3_N4
\input_digits[1][2]\ : maxii_lcell
-- Equation(s):
-- \input_digits[1][2]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~3_combout\, \SW~combout\(2), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(2),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[1][2]~regout\);

-- Location: LC_X2_Y3_N1
\input_digits[1][3]\ : maxii_lcell
-- Equation(s):
-- \input_digits[1][3]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~3_combout\, \SW~combout\(3), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(3),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[1][3]~regout\);

-- Location: LC_X2_Y3_N2
\input_digits[1][1]\ : maxii_lcell
-- Equation(s):
-- \input_digits[1][1]~regout\ = DFFEAS((((\SW~combout\(1)))), GLOBAL(\CLK~combout\), VCC, , \Decoder0~3_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datad => \SW~combout\(1),
	aclr => GND,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[1][1]~regout\);

-- Location: LC_X4_Y2_N9
\bin_digits[1][2]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[1][2]~regout\ = DFFEAS((\input_digits[1][2]~regout\ & (((!\input_digits[1][1]~regout\) # (!\input_digits[1][3]~regout\)))) # (!\input_digits[1][2]~regout\ & (((\input_digits[1][3]~regout\)))), GLOBAL(\CLK~combout\), VCC, , 
-- \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5afa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[1][2]~regout\,
	datac => \input_digits[1][3]~regout\,
	datad => \input_digits[1][1]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[1][2]~regout\);

-- Location: LC_X5_Y2_N3
\bin_digits[3][2]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[3][2]~regout\ = DFFEAS(((\input_digits[3][2]~regout\ & ((!\input_digits[3][1]~regout\) # (!\input_digits[3][3]~regout\))) # (!\input_digits[3][2]~regout\ & (\input_digits[3][3]~regout\))), GLOBAL(\CLK~combout\), VCC, , 
-- \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3cfc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => \input_digits[3][2]~regout\,
	datac => \input_digits[3][3]~regout\,
	datad => \input_digits[3][1]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[3][2]~regout\);

-- Location: LC_X2_Y3_N9
\input_digits[1][0]\ : maxii_lcell
-- Equation(s):
-- \input_digits[1][0]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~3_combout\, \SW~combout\(0), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(0),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[1][0]~regout\);

-- Location: LC_X5_Y2_N7
\bin_digits[1][1]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[1][1]~regout\ = DFFEAS((\input_digits[1][3]~regout\ & (((!\input_digits[1][2]~regout\ & !\input_digits[1][0]~regout\)) # (!\input_digits[1][1]~regout\))) # (!\input_digits[1][3]~regout\ & ((\input_digits[1][1]~regout\) # 
-- ((\input_digits[1][2]~regout\ & \input_digits[1][0]~regout\)))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "57ea",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[1][3]~regout\,
	datab => \input_digits[1][2]~regout\,
	datac => \input_digits[1][0]~regout\,
	datad => \input_digits[1][1]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[1][1]~regout\);

-- Location: LC_X4_Y2_N7
\process_0~3\ : maxii_lcell
-- Equation(s):
-- \process_0~3_combout\ = (!\bin_digits[3][1]~regout\ & (!\bin_digits[1][2]~regout\ & (!\bin_digits[3][2]~regout\ & !\bin_digits[1][1]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bin_digits[3][1]~regout\,
	datab => \bin_digits[1][2]~regout\,
	datac => \bin_digits[3][2]~regout\,
	datad => \bin_digits[1][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~3_combout\);

-- Location: LC_X3_Y3_N9
\Decoder0~0\ : maxii_lcell
-- Equation(s):
-- \Decoder0~0_combout\ = (!count(1) & (!count(0) & (!\RESET~combout\ & \count[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datab => count(0),
	datac => \RESET~combout\,
	datad => \count[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Decoder0~0_combout\);

-- Location: LC_X3_Y3_N5
\input_digits[0][2]\ : maxii_lcell
-- Equation(s):
-- \input_digits[0][2]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~0_combout\, \SW~combout\(2), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(2),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[0][2]~regout\);

-- Location: LC_X4_Y3_N2
\input_digits[0][3]\ : maxii_lcell
-- Equation(s):
-- \input_digits[0][3]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~0_combout\, \SW~combout\(3), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(3),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[0][3]~regout\);

-- Location: LC_X3_Y3_N7
\input_digits[0][1]\ : maxii_lcell
-- Equation(s):
-- \input_digits[0][1]~regout\ = DFFEAS((((\SW~combout\(1)))), GLOBAL(\CLK~combout\), VCC, , \Decoder0~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datad => \SW~combout\(1),
	aclr => GND,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[0][1]~regout\);

-- Location: LC_X3_Y3_N0
\input_digits[0][0]\ : maxii_lcell
-- Equation(s):
-- \input_digits[0][0]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~0_combout\, \SW~combout\(0), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(0),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[0][0]~regout\);

-- Location: LC_X4_Y2_N0
\bin_digits[0][1]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[0][1]~regout\ = DFFEAS((\input_digits[0][3]~regout\ & (((!\input_digits[0][2]~regout\ & !\input_digits[0][0]~regout\)) # (!\input_digits[0][1]~regout\))) # (!\input_digits[0][3]~regout\ & ((\input_digits[0][1]~regout\) # 
-- ((\input_digits[0][2]~regout\ & \input_digits[0][0]~regout\)))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3e7c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[0][2]~regout\,
	datab => \input_digits[0][3]~regout\,
	datac => \input_digits[0][1]~regout\,
	datad => \input_digits[0][0]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[0][1]~regout\);

-- Location: LC_X4_Y2_N8
\bin_digits[3][0]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[3][0]~regout\ = DFFEAS((\input_digits[3][0]~regout\) # ((\input_digits[3][2]~regout\ & (\input_digits[3][1]~regout\ & !\input_digits[3][3]~regout\)) # (!\input_digits[3][2]~regout\ & ((\input_digits[3][3]~regout\)))), GLOBAL(\CLK~combout\), 
-- VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "afea",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[3][0]~regout\,
	datab => \input_digits[3][1]~regout\,
	datac => \input_digits[3][2]~regout\,
	datad => \input_digits[3][3]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[3][0]~regout\);

-- Location: LC_X2_Y2_N9
\bin_digits[1][0]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[1][0]~regout\ = DFFEAS((\input_digits[1][0]~regout\) # ((\input_digits[1][2]~regout\ & (!\input_digits[1][3]~regout\ & \input_digits[1][1]~regout\)) # (!\input_digits[1][2]~regout\ & (\input_digits[1][3]~regout\))), GLOBAL(\CLK~combout\), VCC, 
-- , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f6f4",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[1][2]~regout\,
	datab => \input_digits[1][3]~regout\,
	datac => \input_digits[1][0]~regout\,
	datad => \input_digits[1][1]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[1][0]~regout\);

-- Location: LC_X2_Y2_N0
\bin_digits[1][3]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[1][3]~regout\ = DFFEAS((\input_digits[1][2]~regout\ & ((\input_digits[1][1]~regout\) # ((!\input_digits[1][3]~regout\ & \input_digits[1][0]~regout\)))) # (!\input_digits[1][2]~regout\ & (\input_digits[1][3]~regout\ & 
-- ((!\input_digits[1][1]~regout\) # (!\input_digits[1][0]~regout\)))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ae64",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[1][2]~regout\,
	datab => \input_digits[1][3]~regout\,
	datac => \input_digits[1][0]~regout\,
	datad => \input_digits[1][1]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[1][3]~regout\);

-- Location: LC_X3_Y2_N9
\process_0~6\ : maxii_lcell
-- Equation(s):
-- \process_0~6_combout\ = (\bin_digits[0][1]~regout\ & (\bin_digits[3][0]~regout\ & (!\bin_digits[1][0]~regout\ & !\bin_digits[1][3]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0008",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bin_digits[0][1]~regout\,
	datab => \bin_digits[3][0]~regout\,
	datac => \bin_digits[1][0]~regout\,
	datad => \bin_digits[1][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~6_combout\);

-- Location: LC_X2_Y3_N8
\Decoder0~1\ : maxii_lcell
-- Equation(s):
-- \Decoder0~1_combout\ = (!count(0) & (count(1) & (!\RESET~combout\ & \count[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0400",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datab => count(1),
	datac => \RESET~combout\,
	datad => \count[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Decoder0~1_combout\);

-- Location: LC_X2_Y2_N8
\input_digits[2][0]\ : maxii_lcell
-- Equation(s):
-- \input_digits[2][0]~regout\ = DFFEAS((((\SW~combout\(0)))), GLOBAL(\CLK~combout\), VCC, , \Decoder0~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datad => \SW~combout\(0),
	aclr => GND,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[2][0]~regout\);

-- Location: LC_X2_Y2_N2
\input_digits[2][1]\ : maxii_lcell
-- Equation(s):
-- \input_digits[2][1]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~1_combout\, \SW~combout\(1), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(1),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[2][1]~regout\);

-- Location: LC_X2_Y2_N6
\input_digits[2][3]\ : maxii_lcell
-- Equation(s):
-- \input_digits[2][3]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~1_combout\, \SW~combout\(3), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(3),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[2][3]~regout\);

-- Location: LC_X2_Y2_N3
\input_digits[2][2]\ : maxii_lcell
-- Equation(s):
-- \input_digits[2][2]~regout\ = DFFEAS(GND, GLOBAL(\CLK~combout\), VCC, , \Decoder0~1_combout\, \SW~combout\(2), , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datac => \SW~combout\(2),
	aclr => GND,
	sload => VCC,
	ena => \Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \input_digits[2][2]~regout\);

-- Location: LC_X2_Y2_N5
\bin_digits[2][3]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[2][3]~regout\ = DFFEAS((\input_digits[2][0]~regout\ & (\input_digits[2][2]~regout\ $ (((!\input_digits[2][1]~regout\ & \input_digits[2][3]~regout\))))) # (!\input_digits[2][0]~regout\ & ((\input_digits[2][2]~regout\ & 
-- (\input_digits[2][1]~regout\)) # (!\input_digits[2][2]~regout\ & ((\input_digits[2][3]~regout\))))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ce70",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[2][0]~regout\,
	datab => \input_digits[2][1]~regout\,
	datac => \input_digits[2][3]~regout\,
	datad => \input_digits[2][2]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[2][3]~regout\);

-- Location: LC_X4_Y2_N4
\bin_digits[0][0]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[0][0]~regout\ = DFFEAS((\input_digits[0][0]~regout\) # ((\input_digits[0][2]~regout\ & (!\input_digits[0][3]~regout\ & \input_digits[0][1]~regout\)) # (!\input_digits[0][2]~regout\ & (\input_digits[0][3]~regout\))), GLOBAL(\CLK~combout\), VCC, 
-- , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff64",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[0][2]~regout\,
	datab => \input_digits[0][3]~regout\,
	datac => \input_digits[0][1]~regout\,
	datad => \input_digits[0][0]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[0][0]~regout\);

-- Location: LC_X4_Y2_N3
\bin_digits[3][3]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[3][3]~regout\ = DFFEAS((\input_digits[3][0]~regout\ & (\input_digits[3][2]~regout\ $ (((!\input_digits[3][1]~regout\ & \input_digits[3][3]~regout\))))) # (!\input_digits[3][0]~regout\ & ((\input_digits[3][2]~regout\ & 
-- (\input_digits[3][1]~regout\)) # (!\input_digits[3][2]~regout\ & ((\input_digits[3][3]~regout\))))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c7e0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[3][0]~regout\,
	datab => \input_digits[3][1]~regout\,
	datac => \input_digits[3][2]~regout\,
	datad => \input_digits[3][3]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[3][3]~regout\);

-- Location: LC_X2_Y2_N7
\bin_digits[2][0]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[2][0]~regout\ = DFFEAS((\input_digits[2][0]~regout\) # ((\input_digits[2][3]~regout\ & ((!\input_digits[2][2]~regout\))) # (!\input_digits[2][3]~regout\ & (\input_digits[2][1]~regout\ & \input_digits[2][2]~regout\))), GLOBAL(\CLK~combout\), 
-- VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aefa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[2][0]~regout\,
	datab => \input_digits[2][1]~regout\,
	datac => \input_digits[2][3]~regout\,
	datad => \input_digits[2][2]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[2][0]~regout\);

-- Location: LC_X3_Y2_N0
\match_alarm~0\ : maxii_lcell
-- Equation(s):
-- \match_alarm~0_combout\ = (!\bin_digits[2][3]~regout\ & (!\bin_digits[0][0]~regout\ & (!\bin_digits[3][3]~regout\ & !\bin_digits[2][0]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bin_digits[2][3]~regout\,
	datab => \bin_digits[0][0]~regout\,
	datac => \bin_digits[3][3]~regout\,
	datad => \bin_digits[2][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \match_alarm~0_combout\);

-- Location: LC_X4_Y2_N6
\bin_digits[0][2]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[0][2]~regout\ = DFFEAS(((\input_digits[0][2]~regout\ & ((!\input_digits[0][3]~regout\) # (!\input_digits[0][1]~regout\))) # (!\input_digits[0][2]~regout\ & ((\input_digits[0][3]~regout\)))), GLOBAL(\CLK~combout\), VCC, , 
-- \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => \input_digits[0][1]~regout\,
	datac => \input_digits[0][2]~regout\,
	datad => \input_digits[0][3]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[0][2]~regout\);

-- Location: LC_X2_Y2_N4
\bin_digits[2][2]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[2][2]~regout\ = DFFEAS(((\input_digits[2][3]~regout\ & ((!\input_digits[2][2]~regout\) # (!\input_digits[2][1]~regout\))) # (!\input_digits[2][3]~regout\ & ((\input_digits[2][2]~regout\)))), GLOBAL(\CLK~combout\), VCC, , 
-- \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => \input_digits[2][1]~regout\,
	datac => \input_digits[2][3]~regout\,
	datad => \input_digits[2][2]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[2][2]~regout\);

-- Location: LC_X2_Y2_N1
\bin_digits[2][1]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[2][1]~regout\ = DFFEAS((\input_digits[2][1]~regout\ & (((!\input_digits[2][0]~regout\ & !\input_digits[2][2]~regout\)) # (!\input_digits[2][3]~regout\))) # (!\input_digits[2][1]~regout\ & ((\input_digits[2][3]~regout\) # 
-- ((\input_digits[2][0]~regout\ & \input_digits[2][2]~regout\)))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3e7c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[2][0]~regout\,
	datab => \input_digits[2][1]~regout\,
	datac => \input_digits[2][3]~regout\,
	datad => \input_digits[2][2]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[2][1]~regout\);

-- Location: LC_X4_Y2_N1
\bin_digits[0][3]\ : maxii_lcell
-- Equation(s):
-- \bin_digits[0][3]~regout\ = DFFEAS((\input_digits[0][2]~regout\ & ((\input_digits[0][1]~regout\) # ((!\input_digits[0][3]~regout\ & \input_digits[0][0]~regout\)))) # (!\input_digits[0][2]~regout\ & (\input_digits[0][3]~regout\ & 
-- ((!\input_digits[0][0]~regout\) # (!\input_digits[0][1]~regout\)))), GLOBAL(\CLK~combout\), VCC, , \bin_digits[3][0]~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a6e4",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \input_digits[0][2]~regout\,
	datab => \input_digits[0][3]~regout\,
	datac => \input_digits[0][1]~regout\,
	datad => \input_digits[0][0]~regout\,
	aclr => GND,
	ena => \bin_digits[3][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bin_digits[0][3]~regout\);

-- Location: LC_X3_Y2_N1
\process_0~0\ : maxii_lcell
-- Equation(s):
-- \process_0~0_combout\ = (!\bin_digits[0][2]~regout\ & (!\bin_digits[2][2]~regout\ & (!\bin_digits[2][1]~regout\ & !\bin_digits[0][3]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bin_digits[0][2]~regout\,
	datab => \bin_digits[2][2]~regout\,
	datac => \bin_digits[2][1]~regout\,
	datad => \bin_digits[0][3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~0_combout\);

-- Location: LC_X3_Y2_N7
\process_0~7\ : maxii_lcell
-- Equation(s):
-- \process_0~7_combout\ = (\process_0~3_combout\ & (\process_0~6_combout\ & (\match_alarm~0_combout\ & \process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~3_combout\,
	datab => \process_0~6_combout\,
	datac => \match_alarm~0_combout\,
	datad => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~7_combout\);

-- Location: LC_X3_Y2_N3
\process_0~4\ : maxii_lcell
-- Equation(s):
-- \process_0~4_combout\ = (\bin_digits[2][3]~regout\ & (\bin_digits[2][0]~regout\ & (\bin_digits[3][3]~regout\ & \bin_digits[0][0]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bin_digits[2][3]~regout\,
	datab => \bin_digits[2][0]~regout\,
	datac => \bin_digits[3][3]~regout\,
	datad => \bin_digits[0][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~4_combout\);

-- Location: LC_X4_Y2_N2
\process_0~1\ : maxii_lcell
-- Equation(s):
-- \process_0~1_combout\ = (((!\bin_digits[0][1]~regout\ & !\bin_digits[3][0]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \bin_digits[0][1]~regout\,
	datad => \bin_digits[3][0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~1_combout\);

-- Location: LC_X3_Y2_N5
\process_0~2\ : maxii_lcell
-- Equation(s):
-- \process_0~2_combout\ = (\bin_digits[1][3]~regout\ & (\bin_digits[1][0]~regout\ & (\process_0~1_combout\ & \process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bin_digits[1][3]~regout\,
	datab => \bin_digits[1][0]~regout\,
	datac => \process_0~1_combout\,
	datad => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~2_combout\);

-- Location: LC_X3_Y2_N6
\process_0~5\ : maxii_lcell
-- Equation(s):
-- \process_0~5_combout\ = (\process_0~3_combout\ & (((\process_0~4_combout\ & \process_0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~3_combout\,
	datac => \process_0~4_combout\,
	datad => \process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \process_0~5_combout\);

-- Location: LC_X3_Y2_N2
match_door : maxii_lcell
-- Equation(s):
-- \match_door~regout\ = DFFEAS((\match_door~regout\) # ((\Equal0~0_combout\ & ((\process_0~7_combout\) # (\process_0~5_combout\)))), GLOBAL(\CLK~combout\), !GLOBAL(\RESET~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eeea",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \match_door~regout\,
	datab => \Equal0~0_combout\,
	datac => \process_0~7_combout\,
	datad => \process_0~5_combout\,
	aclr => \RESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \match_door~regout\);

-- Location: LC_X3_Y3_N6
\OPEN_DOOR~reg0\ : maxii_lcell
-- Equation(s):
-- \OPEN_DOOR~reg0_regout\ = DFFEAS(((\OPEN_DOOR~reg0_regout\) # ((\Equal0~0_combout\ & \match_door~regout\))), GLOBAL(\CLK~combout\), !GLOBAL(\RESET~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffa0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \Equal0~0_combout\,
	datac => \match_door~regout\,
	datad => \OPEN_DOOR~reg0_regout\,
	aclr => \RESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \OPEN_DOOR~reg0_regout\);

-- Location: LC_X4_Y2_N5
\match_alarm~1\ : maxii_lcell
-- Equation(s):
-- \match_alarm~1_combout\ = (\bin_digits[3][1]~regout\ & (\bin_digits[1][2]~regout\ & (\bin_digits[3][2]~regout\ & \bin_digits[1][1]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bin_digits[3][1]~regout\,
	datab => \bin_digits[1][2]~regout\,
	datac => \bin_digits[3][2]~regout\,
	datad => \bin_digits[1][1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \match_alarm~1_combout\);

-- Location: LC_X3_Y2_N8
\match_alarm~2\ : maxii_lcell
-- Equation(s):
-- \match_alarm~2_combout\ = (\process_0~7_combout\) # ((\process_0~2_combout\ & (\match_alarm~1_combout\ & \match_alarm~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff80",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datab => \match_alarm~1_combout\,
	datac => \match_alarm~0_combout\,
	datad => \process_0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \match_alarm~2_combout\);

-- Location: LC_X3_Y2_N4
match_alarm : maxii_lcell
-- Equation(s):
-- \match_alarm~regout\ = DFFEAS((\match_alarm~regout\) # ((\Equal0~0_combout\ & (!\process_0~5_combout\ & \match_alarm~2_combout\))), GLOBAL(\CLK~combout\), !GLOBAL(\RESET~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aeaa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	dataa => \match_alarm~regout\,
	datab => \Equal0~0_combout\,
	datac => \process_0~5_combout\,
	datad => \match_alarm~2_combout\,
	aclr => \RESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \match_alarm~regout\);

-- Location: LC_X5_Y3_N2
\ALARM~reg0\ : maxii_lcell
-- Equation(s):
-- \ALARM~reg0_regout\ = DFFEAS(((\ALARM~reg0_regout\) # ((\Equal0~0_combout\ & \match_alarm~regout\))), GLOBAL(\CLK~combout\), !GLOBAL(\RESET~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \CLK~combout\,
	datab => \ALARM~reg0_regout\,
	datac => \Equal0~0_combout\,
	datad => \match_alarm~regout\,
	aclr => \RESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ALARM~reg0_regout\);

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\OPEN_DOOR~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \OPEN_DOOR~reg0_regout\,
	oe => VCC,
	padio => ww_OPEN_DOOR);

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALARM~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALARM~reg0_regout\,
	oe => VCC,
	padio => ww_ALARM);
END structure;


