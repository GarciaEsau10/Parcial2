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

-- DATE "04/11/2025 17:27:58"

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

ENTITY 	Sistema_seguridad IS
    PORT (
	interruptores : IN std_logic_vector(3 DOWNTO 0);
	boton_confirm : IN std_logic;
	reloj : IN std_logic;
	puerta_abierta : OUT std_logic;
	alarma : OUT std_logic
	);
END Sistema_seguridad;

-- Design Ports Information


ARCHITECTURE structure OF Sistema_seguridad IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_interruptores : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_boton_confirm : std_logic;
SIGNAL ww_reloj : std_logic;
SIGNAL ww_puerta_abierta : std_logic;
SIGNAL ww_alarma : std_logic;
SIGNAL \reloj~combout\ : std_logic;
SIGNAL \boton_confirm~combout\ : std_logic;
SIGNAL \estado_actual~14_combout\ : std_logic;
SIGNAL \estado_actual.GUARDA_DIGITO~regout\ : std_logic;
SIGNAL \codigo_ingresado[12]~3_combout\ : std_logic;
SIGNAL \Selector31~0\ : std_logic;
SIGNAL \codigo_ingresado[4]~1_combout\ : std_logic;
SIGNAL \Selector34~0\ : std_logic;
SIGNAL \codigo_ingresado[0]~0\ : std_logic;
SIGNAL \Equal12~0\ : std_logic;
SIGNAL \Selector33~0\ : std_logic;
SIGNAL \Selector32~0\ : std_logic;
SIGNAL \Equal12~1\ : std_logic;
SIGNAL \codigo_ingresado[8]~2_combout\ : std_logic;
SIGNAL \Equal11~1\ : std_logic;
SIGNAL \Equal11~3\ : std_logic;
SIGNAL \Equal11~2\ : std_logic;
SIGNAL \Equal11~4_combout\ : std_logic;
SIGNAL \estado_actual~15_combout\ : std_logic;
SIGNAL \estado_actual.ESPERA_DIGITO~regout\ : std_logic;
SIGNAL \contador_digitos[2]~1_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \estado_actual.ACTIVA_ALARMA~regout\ : std_logic;
SIGNAL \contador_digitos[2]~0\ : std_logic;
SIGNAL \Equal11~0\ : std_logic;
SIGNAL \Equal13~1\ : std_logic;
SIGNAL \Equal13~0\ : std_logic;
SIGNAL \Equal13~2_combout\ : std_logic;
SIGNAL \estado_actual.AMBAS_ACCIONES~regout\ : std_logic;
SIGNAL \estado_actual.VERIFICA_CODIGO~regout\ : std_logic;
SIGNAL \estado_actual.ABRE_PUERTA~regout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \puerta_abierta~reg0_regout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \alarma~reg0_regout\ : std_logic;
SIGNAL codigo_ingresado : std_logic_vector(15 DOWNTO 0);
SIGNAL contador_digitos : std_logic_vector(2 DOWNTO 0);
SIGNAL \interruptores~combout\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_interruptores <= interruptores;
ww_boton_confirm <= boton_confirm;
ww_reloj <= reloj;
puerta_abierta <= ww_puerta_abierta;
alarma <= ww_alarma;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reloj~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reloj,
	combout => \reloj~combout\);

-- Location: PIN_82,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\interruptores[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_interruptores(2),
	combout => \interruptores~combout\(2));

-- Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\interruptores[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_interruptores(3),
	combout => \interruptores~combout\(3));

-- Location: LC_X7_Y4_N2
\contador_digitos[1]\ : maxii_lcell
-- Equation(s):
-- contador_digitos(1) = DFFEAS((!\contador_digitos[2]~0\ & (contador_digitos(0) $ (((contador_digitos(1)))))), GLOBAL(\reloj~combout\), VCC, , \contador_digitos[2]~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1122",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador_digitos(0),
	datab => \contador_digitos[2]~0\,
	datad => contador_digitos(1),
	aclr => GND,
	ena => \contador_digitos[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador_digitos(1));

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\boton_confirm~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_boton_confirm,
	combout => \boton_confirm~combout\);

-- Location: LC_X5_Y3_N6
\estado_actual~14\ : maxii_lcell
-- Equation(s):
-- \estado_actual~14_combout\ = (((\boton_confirm~combout\ & !\estado_actual.ESPERA_DIGITO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \boton_confirm~combout\,
	datad => \estado_actual.ESPERA_DIGITO~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \estado_actual~14_combout\);

-- Location: LC_X5_Y4_N6
\estado_actual.GUARDA_DIGITO\ : maxii_lcell
-- Equation(s):
-- \codigo_ingresado[0]~0\ = (\contador_digitos[2]~1_combout\ & (((!contador_digitos(1) & !contador_digitos(0))) # (!estado_actual.GUARDA_DIGITO)))
-- \estado_actual.GUARDA_DIGITO~regout\ = DFFEAS(\codigo_ingresado[0]~0\, GLOBAL(\reloj~combout\), VCC, , , \estado_actual~14_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1f00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador_digitos(1),
	datab => contador_digitos(0),
	datac => \estado_actual~14_combout\,
	datad => \contador_digitos[2]~1_combout\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \codigo_ingresado[0]~0\,
	regout => \estado_actual.GUARDA_DIGITO~regout\);

-- Location: LC_X4_Y4_N2
\codigo_ingresado[12]~3\ : maxii_lcell
-- Equation(s):
-- \codigo_ingresado[12]~3_combout\ = (\contador_digitos[2]~1_combout\ & (((contador_digitos(1) & contador_digitos(0))) # (!\estado_actual.GUARDA_DIGITO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b300",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador_digitos(1),
	datab => \estado_actual.GUARDA_DIGITO~regout\,
	datac => contador_digitos(0),
	datad => \contador_digitos[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \codigo_ingresado[12]~3_combout\);

-- Location: LC_X4_Y4_N4
\codigo_ingresado[15]\ : maxii_lcell
-- Equation(s):
-- \Selector31~0\ = (((\interruptores~combout\(3) & !\contador_digitos[2]~0\)))
-- codigo_ingresado(15) = DFFEAS(\Selector31~0\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[12]~3_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \interruptores~combout\(3),
	datad => \contador_digitos[2]~0\,
	aclr => GND,
	ena => \codigo_ingresado[12]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector31~0\,
	regout => codigo_ingresado(15));

-- Location: LC_X6_Y4_N9
\codigo_ingresado[4]~1\ : maxii_lcell
-- Equation(s):
-- \codigo_ingresado[4]~1_combout\ = (\contador_digitos[2]~1_combout\ & (((contador_digitos(0) & !contador_digitos(1))) # (!\estado_actual.GUARDA_DIGITO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3b00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador_digitos(0),
	datab => \estado_actual.GUARDA_DIGITO~regout\,
	datac => contador_digitos(1),
	datad => \contador_digitos[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \codigo_ingresado[4]~1_combout\);

-- Location: LC_X6_Y4_N1
\codigo_ingresado[7]\ : maxii_lcell
-- Equation(s):
-- codigo_ingresado(7) = DFFEAS(GND, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[4]~1_combout\, \Selector31~0\, , , VCC)

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
	clk => \reloj~combout\,
	datac => \Selector31~0\,
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => codigo_ingresado(7));

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\interruptores[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_interruptores(0),
	combout => \interruptores~combout\(0));

-- Location: LC_X4_Y4_N1
\codigo_ingresado[12]\ : maxii_lcell
-- Equation(s):
-- \Selector34~0\ = (((\interruptores~combout\(0) & !\contador_digitos[2]~0\)))
-- codigo_ingresado(12) = DFFEAS(\Selector34~0\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[12]~3_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \interruptores~combout\(0),
	datad => \contador_digitos[2]~0\,
	aclr => GND,
	ena => \codigo_ingresado[12]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector34~0\,
	regout => codigo_ingresado(12));

-- Location: LC_X5_Y4_N3
\codigo_ingresado[3]\ : maxii_lcell
-- Equation(s):
-- \Equal12~0\ = (!codigo_ingresado(7) & (!codigo_ingresado(0) & (!codigo_ingresado[3] & codigo_ingresado(4))))
-- codigo_ingresado(3) = DFFEAS(\Equal12~0\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[0]~0\, \Selector31~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(7),
	datab => codigo_ingresado(0),
	datac => \Selector31~0\,
	datad => codigo_ingresado(4),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[0]~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal12~0\,
	regout => codigo_ingresado(3));

-- Location: LC_X6_Y4_N4
\codigo_ingresado[4]\ : maxii_lcell
-- Equation(s):
-- \Equal11~2\ = (!codigo_ingresado(0) & (codigo_ingresado(7) & (codigo_ingresado[4] & codigo_ingresado(3))))
-- codigo_ingresado(4) = DFFEAS(\Equal11~2\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[4]~1_combout\, \Selector34~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4000",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(0),
	datab => codigo_ingresado(7),
	datac => \Selector34~0\,
	datad => codigo_ingresado(3),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal11~2\,
	regout => codigo_ingresado(4));

-- Location: LC_X6_Y4_N8
\codigo_ingresado[0]\ : maxii_lcell
-- Equation(s):
-- \Equal13~0\ = (!codigo_ingresado(4) & (!codigo_ingresado(7) & (codigo_ingresado[0] & !codigo_ingresado(3))))
-- codigo_ingresado(0) = DFFEAS(\Equal13~0\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[0]~0\, \Selector34~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(4),
	datab => codigo_ingresado(7),
	datac => \Selector34~0\,
	datad => codigo_ingresado(3),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[0]~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal13~0\,
	regout => codigo_ingresado(0));

-- Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\interruptores[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_interruptores(1),
	combout => \interruptores~combout\(1));

-- Location: LC_X6_Y4_N5
\codigo_ingresado[5]\ : maxii_lcell
-- Equation(s):
-- \Selector33~0\ = (\interruptores~combout\(1) & (((!\contador_digitos[2]~0\))))
-- codigo_ingresado(5) = DFFEAS(\Selector33~0\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[4]~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => \interruptores~combout\(1),
	datad => \contador_digitos[2]~0\,
	aclr => GND,
	ena => \codigo_ingresado[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector33~0\,
	regout => codigo_ingresado(5));

-- Location: LC_X5_Y4_N8
\codigo_ingresado[1]\ : maxii_lcell
-- Equation(s):
-- \Equal11~0\ = (!codigo_ingresado(2) & (!codigo_ingresado(6) & (!codigo_ingresado[1] & !codigo_ingresado(5))))
-- codigo_ingresado(1) = DFFEAS(\Equal11~0\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[0]~0\, \Selector33~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(2),
	datab => codigo_ingresado(6),
	datac => \Selector33~0\,
	datad => codigo_ingresado(5),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[0]~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal11~0\,
	regout => codigo_ingresado(1));

-- Location: LC_X6_Y4_N7
\codigo_ingresado[6]\ : maxii_lcell
-- Equation(s):
-- \Selector32~0\ = (\interruptores~combout\(2) & (((!\contador_digitos[2]~0\))))
-- codigo_ingresado(6) = DFFEAS(\Selector32~0\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[4]~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => \interruptores~combout\(2),
	datad => \contador_digitos[2]~0\,
	aclr => GND,
	ena => \codigo_ingresado[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector32~0\,
	regout => codigo_ingresado(6));

-- Location: LC_X5_Y4_N2
\codigo_ingresado[2]\ : maxii_lcell
-- Equation(s):
-- \Equal12~1\ = (codigo_ingresado(6) & (codigo_ingresado(1) & (codigo_ingresado[2] & codigo_ingresado(5))))
-- codigo_ingresado(2) = DFFEAS(\Equal12~1\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[0]~0\, \Selector32~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(6),
	datab => codigo_ingresado(1),
	datac => \Selector32~0\,
	datad => codigo_ingresado(5),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[0]~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal12~1\,
	regout => codigo_ingresado(2));

-- Location: LC_X4_Y4_N6
\codigo_ingresado[8]~2\ : maxii_lcell
-- Equation(s):
-- \codigo_ingresado[8]~2_combout\ = (\contador_digitos[2]~1_combout\ & (((contador_digitos(1) & !contador_digitos(0))) # (!\estado_actual.GUARDA_DIGITO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3b00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador_digitos(1),
	datab => \estado_actual.GUARDA_DIGITO~regout\,
	datac => contador_digitos(0),
	datad => \contador_digitos[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \codigo_ingresado[8]~2_combout\);

-- Location: LC_X4_Y4_N7
\codigo_ingresado[10]\ : maxii_lcell
-- Equation(s):
-- codigo_ingresado(10) = DFFEAS(GND, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[8]~2_combout\, \Selector32~0\, , , VCC)

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
	clk => \reloj~combout\,
	datac => \Selector32~0\,
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => codigo_ingresado(10));

-- Location: LC_X4_Y4_N9
\codigo_ingresado[14]\ : maxii_lcell
-- Equation(s):
-- codigo_ingresado(14) = DFFEAS(GND, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[12]~3_combout\, \Selector32~0\, , , VCC)

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
	clk => \reloj~combout\,
	datac => \Selector32~0\,
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[12]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => codigo_ingresado(14));

-- Location: LC_X4_Y4_N3
\codigo_ingresado[9]\ : maxii_lcell
-- Equation(s):
-- \Equal11~1\ = (!codigo_ingresado(15) & (!codigo_ingresado(10) & (!codigo_ingresado[9] & !codigo_ingresado(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(15),
	datab => codigo_ingresado(10),
	datac => \Selector33~0\,
	datad => codigo_ingresado(14),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal11~1\,
	regout => codigo_ingresado(9));

-- Location: LC_X4_Y4_N5
\codigo_ingresado[11]\ : maxii_lcell
-- Equation(s):
-- codigo_ingresado(11) = DFFEAS((((\Selector31~0\))), GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[8]~2_combout\, , , , )

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
	clk => \reloj~combout\,
	datad => \Selector31~0\,
	aclr => GND,
	ena => \codigo_ingresado[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => codigo_ingresado(11));

-- Location: LC_X4_Y4_N0
\codigo_ingresado[8]\ : maxii_lcell
-- Equation(s):
-- \Equal11~3\ = (codigo_ingresado(11) & (codigo_ingresado(12) & (codigo_ingresado[8] & !codigo_ingresado(13))))
-- codigo_ingresado(8) = DFFEAS(\Equal11~3\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[8]~2_combout\, \Selector34~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(11),
	datab => codigo_ingresado(12),
	datac => \Selector34~0\,
	datad => codigo_ingresado(13),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal11~3\,
	regout => codigo_ingresado(8));

-- Location: LC_X4_Y4_N8
\codigo_ingresado[13]\ : maxii_lcell
-- Equation(s):
-- \Equal13~1\ = (!codigo_ingresado(11) & (!codigo_ingresado(8) & (codigo_ingresado[13] & !codigo_ingresado(12))))
-- codigo_ingresado(13) = DFFEAS(\Equal13~1\, GLOBAL(\reloj~combout\), VCC, , \codigo_ingresado[12]~3_combout\, \Selector33~0\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => codigo_ingresado(11),
	datab => codigo_ingresado(8),
	datac => \Selector33~0\,
	datad => codigo_ingresado(12),
	aclr => GND,
	sload => VCC,
	ena => \codigo_ingresado[12]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal13~1\,
	regout => codigo_ingresado(13));

-- Location: LC_X5_Y4_N9
\Equal11~4\ : maxii_lcell
-- Equation(s):
-- \Equal11~4_combout\ = (\Equal11~0\ & (\Equal11~1\ & (\Equal11~3\ & \Equal11~2\)))

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
	dataa => \Equal11~0\,
	datab => \Equal11~1\,
	datac => \Equal11~3\,
	datad => \Equal11~2\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal11~4_combout\);

-- Location: LC_X5_Y4_N4
\estado_actual~15\ : maxii_lcell
-- Equation(s):
-- \estado_actual~15_combout\ = (!\Equal13~2_combout\ & (!\Equal11~4_combout\ & ((!\Equal12~1\) # (!\Equal12~0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0007",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Equal12~0\,
	datab => \Equal12~1\,
	datac => \Equal13~2_combout\,
	datad => \Equal11~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \estado_actual~15_combout\);

-- Location: LC_X5_Y4_N1
\estado_actual.ESPERA_DIGITO\ : maxii_lcell
-- Equation(s):
-- \estado_actual.ESPERA_DIGITO~regout\ = DFFEAS((\Selector15~0_combout\) # ((\estado_actual~14_combout\) # ((!\estado_actual~15_combout\ & \estado_actual.VERIFICA_CODIGO~regout\))), GLOBAL(\reloj~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fdfc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => \estado_actual~15_combout\,
	datab => \Selector15~0_combout\,
	datac => \estado_actual~14_combout\,
	datad => \estado_actual.VERIFICA_CODIGO~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_actual.ESPERA_DIGITO~regout\);

-- Location: LC_X5_Y4_N5
\contador_digitos[2]~1\ : maxii_lcell
-- Equation(s):
-- \contador_digitos[2]~1_combout\ = ((\estado_actual.ESPERA_DIGITO~regout\ & ((\estado_actual~15_combout\) # (!\estado_actual.VERIFICA_CODIGO~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \estado_actual.ESPERA_DIGITO~regout\,
	datac => \estado_actual.VERIFICA_CODIGO~regout\,
	datad => \estado_actual~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \contador_digitos[2]~1_combout\);

-- Location: LC_X7_Y4_N5
\contador_digitos[0]\ : maxii_lcell
-- Equation(s):
-- contador_digitos(0) = DFFEAS((!contador_digitos(0) & (((!\contador_digitos[2]~0\)))), GLOBAL(\reloj~combout\), VCC, , \contador_digitos[2]~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0055",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador_digitos(0),
	datad => \contador_digitos[2]~0\,
	aclr => GND,
	ena => \contador_digitos[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador_digitos(0));

-- Location: LC_X7_Y4_N4
\contador_digitos[2]\ : maxii_lcell
-- Equation(s):
-- contador_digitos(2) = DFFEAS((!\contador_digitos[2]~0\ & (contador_digitos(2) $ (((contador_digitos(0) & contador_digitos(1)))))), GLOBAL(\reloj~combout\), VCC, , \contador_digitos[2]~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1222",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => contador_digitos(2),
	datab => \contador_digitos[2]~0\,
	datac => contador_digitos(0),
	datad => contador_digitos(1),
	aclr => GND,
	ena => \contador_digitos[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contador_digitos(2));

-- Location: LC_X5_Y4_N0
\Selector15~0\ : maxii_lcell
-- Equation(s):
-- \Selector15~0_combout\ = (contador_digitos(0) & (!contador_digitos(2) & (contador_digitos(1) & \estado_actual.GUARDA_DIGITO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => contador_digitos(0),
	datab => contador_digitos(2),
	datac => contador_digitos(1),
	datad => \estado_actual.GUARDA_DIGITO~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector15~0_combout\);

-- Location: LC_X5_Y3_N1
\estado_actual.ACTIVA_ALARMA\ : maxii_lcell
-- Equation(s):
-- \estado_actual.ACTIVA_ALARMA~regout\ = DFFEAS(((\estado_actual.VERIFICA_CODIGO~regout\ & (\Equal12~1\ & \Equal12~0\))), GLOBAL(\reloj~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datab => \estado_actual.VERIFICA_CODIGO~regout\,
	datac => \Equal12~1\,
	datad => \Equal12~0\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_actual.ACTIVA_ALARMA~regout\);

-- Location: LC_X5_Y3_N0
\estado_actual.VERIFICA_CODIGO\ : maxii_lcell
-- Equation(s):
-- \contador_digitos[2]~0\ = (\estado_actual.AMBAS_ACCIONES~regout\) # ((\estado_actual.ABRE_PUERTA~regout\) # ((estado_actual.VERIFICA_CODIGO) # (\estado_actual.ACTIVA_ALARMA~regout\)))
-- \estado_actual.VERIFICA_CODIGO~regout\ = DFFEAS(\contador_digitos[2]~0\, GLOBAL(\reloj~combout\), VCC, , , \Selector15~0_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffe",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => \estado_actual.AMBAS_ACCIONES~regout\,
	datab => \estado_actual.ABRE_PUERTA~regout\,
	datac => \Selector15~0_combout\,
	datad => \estado_actual.ACTIVA_ALARMA~regout\,
	aclr => GND,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \contador_digitos[2]~0\,
	regout => \estado_actual.VERIFICA_CODIGO~regout\);

-- Location: LC_X5_Y4_N7
\Equal13~2\ : maxii_lcell
-- Equation(s):
-- \Equal13~2_combout\ = (\Equal11~0\ & (\Equal11~1\ & (\Equal13~1\ & \Equal13~0\)))

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
	dataa => \Equal11~0\,
	datab => \Equal11~1\,
	datac => \Equal13~1\,
	datad => \Equal13~0\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal13~2_combout\);

-- Location: LC_X5_Y3_N5
\estado_actual.AMBAS_ACCIONES\ : maxii_lcell
-- Equation(s):
-- \estado_actual.AMBAS_ACCIONES~regout\ = DFFEAS((((\estado_actual.VERIFICA_CODIGO~regout\ & \Equal13~2_combout\))), GLOBAL(\reloj~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \estado_actual.VERIFICA_CODIGO~regout\,
	datad => \Equal13~2_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_actual.AMBAS_ACCIONES~regout\);

-- Location: LC_X5_Y3_N9
\estado_actual.ABRE_PUERTA\ : maxii_lcell
-- Equation(s):
-- \estado_actual.ABRE_PUERTA~regout\ = DFFEAS((((\estado_actual.VERIFICA_CODIGO~regout\ & \Equal11~4_combout\))), GLOBAL(\reloj~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	datac => \estado_actual.VERIFICA_CODIGO~regout\,
	datad => \Equal11~4_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado_actual.ABRE_PUERTA~regout\);

-- Location: LC_X5_Y3_N2
\Selector12~0\ : maxii_lcell
-- Equation(s):
-- \Selector12~0_combout\ = ((\estado_actual.ACTIVA_ALARMA~regout\) # ((\estado_actual.VERIFICA_CODIGO~regout\) # (\estado_actual.GUARDA_DIGITO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \estado_actual.ACTIVA_ALARMA~regout\,
	datac => \estado_actual.VERIFICA_CODIGO~regout\,
	datad => \estado_actual.GUARDA_DIGITO~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector12~0_combout\);

-- Location: LC_X5_Y3_N3
\puerta_abierta~reg0\ : maxii_lcell
-- Equation(s):
-- \puerta_abierta~reg0_regout\ = DFFEAS((\estado_actual.ABRE_PUERTA~regout\) # ((\estado_actual.AMBAS_ACCIONES~regout\) # ((\puerta_abierta~reg0_regout\ & \Selector12~0_combout\))), GLOBAL(\reloj~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fefc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => \puerta_abierta~reg0_regout\,
	datab => \estado_actual.ABRE_PUERTA~regout\,
	datac => \estado_actual.AMBAS_ACCIONES~regout\,
	datad => \Selector12~0_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \puerta_abierta~reg0_regout\);

-- Location: LC_X5_Y3_N4
\Selector13~0\ : maxii_lcell
-- Equation(s):
-- \Selector13~0_combout\ = (\alarma~reg0_regout\ & ((\estado_actual.VERIFICA_CODIGO~regout\) # ((\estado_actual.ABRE_PUERTA~regout\) # (\estado_actual.GUARDA_DIGITO~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0e0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \estado_actual.VERIFICA_CODIGO~regout\,
	datab => \estado_actual.ABRE_PUERTA~regout\,
	datac => \alarma~reg0_regout\,
	datad => \estado_actual.GUARDA_DIGITO~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Selector13~0_combout\);

-- Location: LC_X5_Y3_N7
\alarma~reg0\ : maxii_lcell
-- Equation(s):
-- \alarma~reg0_regout\ = DFFEAS((\estado_actual.AMBAS_ACCIONES~regout\) # (((\Selector13~0_combout\) # (\estado_actual.ACTIVA_ALARMA~regout\))), GLOBAL(\reloj~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \reloj~combout\,
	dataa => \estado_actual.AMBAS_ACCIONES~regout\,
	datac => \Selector13~0_combout\,
	datad => \estado_actual.ACTIVA_ALARMA~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \alarma~reg0_regout\);

-- Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\puerta_abierta~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \puerta_abierta~reg0_regout\,
	oe => VCC,
	padio => ww_puerta_abierta);

-- Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\alarma~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \alarma~reg0_regout\,
	oe => VCC,
	padio => ww_alarma);
END structure;


