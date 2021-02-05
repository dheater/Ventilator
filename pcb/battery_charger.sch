EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 32 34
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4600 4700 5300 4700
Wire Wire Line
	5300 4900 4600 4900
Text HLabel 4600 4700 0    50   Input ~ 0
SCL
Text HLabel 4600 4900 0    50   BiDi ~ 0
SDA
Text Notes 4600 1550 0    50   ~ 0
Design notes:\n- 6.3A max current, 19V input\n- Inductor selection: Isat 9.1A, 3.3uH\n- Wurth 7443330330 or Bourns SRP1038A-3R3M (OPL alt: MWSA1004-3R3MT)\n- Voltage will range from 12V to 16.8V for 4s Li-Ion battery\n- 11.5 to 13.0V for SLA (lead acid)\n- N-CH FET: CSD17304Q3 (OPL) or BSZ050N03LSGATMA1 (OPL)\n- P-CH FET: CSD25402Q3A (OPL) or CSD25404Q3T (OPL)\n
$Comp
L RespiraWorks_Std:SRP1038A-3R3M L?
U 1 1 60580E76
P 6050 2000
AR Path="/601A64F8/60580E76" Ref="L?"  Part="1" 
AR Path="/601A64F8/60567144/60580E76" Ref="L?"  Part="1" 
F 0 "L?" H 6050 2190 50  0000 C CNN
F 1 "SRP1038A-3R3M" H 6050 2099 50  0000 C CNN
F 2 "" V 6050 2000 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/SRP1038A.pdf" V 6050 2000 50  0001 C CNN
	1    6050 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2000 5000 2800
Wire Wire Line
	5000 2800 5300 2800
$Comp
L RespiraWorks_Std:CSD17304Q3 Q?
U 1 1 60580E7E
P 4350 2100
AR Path="/601A64F8/60580E7E" Ref="Q?"  Part="1" 
AR Path="/601A64F8/60567144/60580E7E" Ref="Q?"  Part="1" 
F 0 "Q?" V 4750 2100 50  0000 C CNN
F 1 "CSD17304Q3" V 4650 2150 50  0000 C CNN
F 2 "Package_SON:VSON-8_3.3x3.3mm_P0.65mm_NexFET" H 4550 2025 50  0001 L CIN
F 3 "https://www.ti.com/lit/ds/symlink/csd17304q3.pdf?ts=1608773956037" V 4350 2100 50  0001 L CNN
	1    4350 2100
	0    -1   -1   0   
$EndComp
Connection ~ 5000 2000
Wire Wire Line
	4500 3000 5300 3000
Wire Wire Line
	5250 2300 5250 2600
Wire Wire Line
	4350 2300 4350 3200
Wire Wire Line
	4350 3200 5300 3200
$Comp
L power:GND #PWR?
U 1 1 60580E89
P 4800 2750
AR Path="/601A64F8/60580E89" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580E89" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4800 2500 50  0001 C CNN
F 1 "GND" H 4805 2577 50  0000 C CNN
F 2 "" H 4800 2750 50  0001 C CNN
F 3 "" H 4800 2750 50  0001 C CNN
	1    4800 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60580E8F
P 3650 2400
AR Path="/601A64F8/60580E8F" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580E8F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 2150 50  0001 C CNN
F 1 "GND" H 3655 2227 50  0000 C CNN
F 2 "" H 3650 2400 50  0001 C CNN
F 3 "" H 3650 2400 50  0001 C CNN
	1    3650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2000 5250 2000
$Comp
L Device:C C?
U 1 1 60580E96
P 5250 2150
AR Path="/601A64F8/60580E96" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580E96" Ref="C?"  Part="1" 
F 0 "C?" H 5365 2196 50  0000 L CNN
F 1 "0.047uF" H 5365 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5288 2000 50  0001 C CNN
F 3 "~" H 5250 2150 50  0001 C CNN
	1    5250 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60580E9C
P 3400 2800
AR Path="/601A64F8/60580E9C" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580E9C" Ref="C?"  Part="1" 
F 0 "C?" H 3515 2846 50  0000 L CNN
F 1 "0.033uF" H 3515 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3438 2650 50  0001 C CNN
F 3 "~" H 3400 2800 50  0001 C CNN
	1    3400 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60580EA2
P 3100 2800
AR Path="/601A64F8/60580EA2" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580EA2" Ref="C?"  Part="1" 
F 0 "C?" H 2800 2800 50  0000 L CNN
F 1 "0.033uF" H 2750 2700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3138 2650 50  0001 C CNN
F 3 "~" H 3100 2800 50  0001 C CNN
	1    3100 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60580EA8
P 3400 2950
AR Path="/601A64F8/60580EA8" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580EA8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3400 2700 50  0001 C CNN
F 1 "GND" H 3405 2777 50  0000 C CNN
F 2 "" H 3400 2950 50  0001 C CNN
F 3 "" H 3400 2950 50  0001 C CNN
	1    3400 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60580EAE
P 3100 2950
AR Path="/601A64F8/60580EAE" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580EAE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3100 2700 50  0001 C CNN
F 1 "GND" H 3105 2777 50  0000 C CNN
F 2 "" H 3100 2950 50  0001 C CNN
F 3 "" H 3100 2950 50  0001 C CNN
	1    3100 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60580EB4
P 3800 3600
AR Path="/601A64F8/60580EB4" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580EB4" Ref="R?"  Part="1" 
F 0 "R?" V 3750 3300 50  0000 L CNN
F 1 "0" V 3750 3800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3730 3600 50  0001 C CNN
F 3 "~" H 3800 3600 50  0001 C CNN
	1    3800 3600
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60580EBA
P 7150 5900
AR Path="/601A64F8/60580EBA" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580EBA" Ref="C?"  Part="1" 
F 0 "C?" H 7265 5946 50  0000 L CNN
F 1 "1uF" H 7265 5855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7188 5750 50  0001 C CNN
F 3 "~" H 7150 5900 50  0001 C CNN
	1    7150 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60580EC0
P 7150 6050
AR Path="/601A64F8/60580EC0" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580EC0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7150 5800 50  0001 C CNN
F 1 "GND" H 7155 5877 50  0000 C CNN
F 2 "" H 7150 6050 50  0001 C CNN
F 3 "" H 7150 6050 50  0001 C CNN
	1    7150 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60580EC6
P 7150 4250
AR Path="/601A64F8/60580EC6" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580EC6" Ref="R?"  Part="1" 
F 0 "R?" H 7220 4296 50  0000 L CNN
F 1 "10k" H 7220 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7080 4250 50  0001 C CNN
F 3 "~" H 7150 4250 50  0001 C CNN
	1    7150 4250
	1    0    0    -1  
$EndComp
Text HLabel 7500 4100 2    50   Input ~ 0
VLOGIC
Wire Wire Line
	7150 4400 7150 4500
Wire Wire Line
	4800 2400 4800 2600
Wire Wire Line
	4500 2200 4500 2600
Text Label 7150 4100 0    50   ~ 0
VLOGIC
Wire Wire Line
	5300 2600 5250 2600
Connection ~ 4800 2000
Wire Wire Line
	4550 2000 4800 2000
Wire Wire Line
	4800 2000 5000 2000
$Comp
L Device:C C?
U 1 1 60580ED6
P 4650 2600
AR Path="/601A64F8/60580ED6" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580ED6" Ref="C?"  Part="1" 
F 0 "C?" V 4500 2550 50  0000 C CNN
F 1 "150pF" V 4800 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 2450 50  0001 C CNN
F 3 "~" H 4650 2600 50  0001 C CNN
F 4 "50V" V 4900 2550 50  0000 C CNN "Voltage"
	1    4650 2600
	0    1    1    0   
$EndComp
$Comp
L RespiraWorks_Std:CSD17304Q3 Q?
U 1 1 60580EDC
P 4700 2200
AR Path="/601A64F8/60580EDC" Ref="Q?"  Part="1" 
AR Path="/601A64F8/60567144/60580EDC" Ref="Q?"  Part="1" 
F 0 "Q?" H 4750 2600 50  0000 L CNN
F 1 "CSD17304Q3" H 4600 2500 50  0000 L CNN
F 2 "Package_SON:VSON-8_3.3x3.3mm_P0.65mm_NexFET" H 4900 2125 50  0001 L CIN
F 3 "https://www.ti.com/lit/ds/symlink/csd17304q3.pdf?ts=1608773956037" V 4700 2200 50  0001 L CNN
	1    4700 2200
	1    0    0    -1  
$EndComp
Connection ~ 4500 2600
Wire Wire Line
	4500 2600 4500 3000
Connection ~ 4800 2600
Wire Wire Line
	4800 2600 4800 2750
Connection ~ 5250 2000
Wire Wire Line
	5250 2000 5900 2000
Connection ~ 3100 2000
Connection ~ 3400 2000
$Comp
L Device:R R?
U 1 1 60580EEA
P 3250 2000
AR Path="/601A64F8/60580EEA" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580EEA" Ref="R?"  Part="1" 
F 0 "R?" V 3043 2000 50  0000 C CNN
F 1 "0.01" V 3134 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" V 3180 2000 50  0001 C CNN
F 3 "~" H 3250 2000 50  0001 C CNN
	1    3250 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60580EF0
P 4900 5100
AR Path="/601A64F8/60580EF0" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580EF0" Ref="R?"  Part="1" 
F 0 "R?" V 4850 4850 50  0000 L CNN
F 1 "10k" V 4850 5250 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4830 5100 50  0001 C CNN
F 3 "~" H 4900 5100 50  0001 C CNN
	1    4900 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 4100 7150 4100
$Comp
L Device:R R?
U 1 1 60580EF7
P 1800 4050
AR Path="/601A64F8/60580EF7" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580EF7" Ref="R?"  Part="1" 
F 0 "R?" H 1870 4096 50  0000 L CNN
F 1 "68k" H 1870 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1730 4050 50  0001 C CNN
F 3 "~" H 1800 4050 50  0001 C CNN
	1    1800 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60580EFD
P 1800 4400
AR Path="/601A64F8/60580EFD" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580EFD" Ref="R?"  Part="1" 
F 0 "R?" H 1870 4446 50  0000 L CNN
F 1 "100k" H 1870 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1730 4400 50  0001 C CNN
F 3 "~" H 1800 4400 50  0001 C CNN
	1    1800 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4200 1800 4250
$Comp
L power:GND #PWR?
U 1 1 60580F04
P 1800 4550
AR Path="/601A64F8/60580F04" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580F04" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1800 4300 50  0001 C CNN
F 1 "GND" H 1805 4377 50  0000 C CNN
F 2 "" H 1800 4550 50  0001 C CNN
F 3 "" H 1800 4550 50  0001 C CNN
	1    1800 4550
	1    0    0    -1  
$EndComp
Connection ~ 1800 4200
Text Notes 3800 6600 0    50   ~ 0
V_ilim = 3.57V > ILIM = 6400mA\nShort ILIM_HIZ to GND to shut off all power
$Comp
L Device:R R?
U 1 1 60580F0C
P 9000 4850
AR Path="/601A64F8/60580F0C" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580F0C" Ref="R?"  Part="1" 
F 0 "R?" H 9070 4896 50  0000 L CNN
F 1 "169k" H 9070 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8930 4850 50  0001 C CNN
F 3 "~" H 9000 4850 50  0001 C CNN
	1    9000 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60580F12
P 9000 5650
AR Path="/601A64F8/60580F12" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580F12" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9000 5400 50  0001 C CNN
F 1 "GND" H 9005 5477 50  0000 C CNN
F 2 "" H 9000 5650 50  0001 C CNN
F 3 "" H 9000 5650 50  0001 C CNN
	1    9000 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 5000 9000 5650
$Comp
L Device:C C?
U 1 1 60580F19
P 9350 4850
AR Path="/601A64F8/60580F19" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580F19" Ref="C?"  Part="1" 
F 0 "C?" H 9465 4896 50  0000 L CNN
F 1 "100pF" H 9465 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9388 4700 50  0001 C CNN
F 3 "~" H 9350 4850 50  0001 C CNN
	1    9350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 5000 9350 5650
$Comp
L power:GND #PWR?
U 1 1 60580F20
P 9350 5650
AR Path="/601A64F8/60580F20" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580F20" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9350 5400 50  0001 C CNN
F 1 "GND" H 9355 5477 50  0000 C CNN
F 2 "" H 9350 5650 50  0001 C CNN
F 3 "" H 9350 5650 50  0001 C CNN
	1    9350 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60580F26
P 8500 5050
AR Path="/601A64F8/60580F26" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580F26" Ref="C?"  Part="1" 
F 0 "C?" H 8615 5096 50  0000 L CNN
F 1 "100pF" H 8615 5005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8538 4900 50  0001 C CNN
F 3 "~" H 8500 5050 50  0001 C CNN
	1    8500 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60580F2C
P 7600 5250
AR Path="/601A64F8/60580F2C" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580F2C" Ref="R?"  Part="1" 
F 0 "R?" H 7670 5296 50  0000 L CNN
F 1 "169k" H 7670 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7530 5250 50  0001 C CNN
F 3 "~" H 7600 5250 50  0001 C CNN
	1    7600 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 5400 7600 5650
$Comp
L power:GND #PWR?
U 1 1 60580F33
P 7600 5650
AR Path="/601A64F8/60580F33" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580F33" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7600 5400 50  0001 C CNN
F 1 "GND" H 7605 5477 50  0000 C CNN
F 2 "" H 7600 5650 50  0001 C CNN
F 3 "" H 7600 5650 50  0001 C CNN
	1    7600 5650
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60580F39
P 8000 5250
AR Path="/601A64F8/60580F39" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580F39" Ref="C?"  Part="1" 
F 0 "C?" H 8115 5296 50  0000 L CNN
F 1 "100pF" H 8115 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8038 5100 50  0001 C CNN
F 3 "~" H 8000 5250 50  0001 C CNN
	1    8000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 5100 7750 5100
Wire Wire Line
	8000 5400 8000 5650
$Comp
L power:GND #PWR?
U 1 1 60580F41
P 8500 5650
AR Path="/601A64F8/60580F41" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580F41" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8500 5400 50  0001 C CNN
F 1 "GND" H 8505 5477 50  0000 C CNN
F 2 "" H 8500 5650 50  0001 C CNN
F 3 "" H 8500 5650 50  0001 C CNN
	1    8500 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 5200 8500 5650
$Comp
L power:GND #PWR?
U 1 1 60580F48
P 8000 5650
AR Path="/601A64F8/60580F48" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580F48" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8000 5400 50  0001 C CNN
F 1 "GND" H 8005 5477 50  0000 C CNN
F 2 "" H 8000 5650 50  0001 C CNN
F 3 "" H 8000 5650 50  0001 C CNN
	1    8000 5650
	1    0    0    -1  
$EndComp
Text HLabel 7850 5000 2    50   Output ~ 0
PSYS
Text HLabel 8350 4800 2    50   Output ~ 0
IBAT
Text HLabel 9500 4700 2    50   Output ~ 0
IADPT
Wire Wire Line
	7850 5000 7750 5000
Wire Wire Line
	7750 5000 7750 5100
Connection ~ 7750 5100
Wire Wire Line
	7750 5100 8000 5100
Wire Wire Line
	8350 4800 8250 4800
Wire Wire Line
	8250 4800 8250 4900
Wire Wire Line
	8250 4900 8500 4900
Wire Wire Line
	9000 4700 9350 4700
Wire Wire Line
	9350 4700 9500 4700
Connection ~ 9350 4700
$Comp
L Device:C C?
U 1 1 60580F6C
P 3650 2150
AR Path="/601A64F8/60580F6C" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580F6C" Ref="C?"  Part="1" 
F 0 "C?" H 3700 2050 50  0000 L CNN
F 1 "10uF" H 3700 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3688 2000 50  0001 C CNN
F 3 "~" H 3650 2150 50  0001 C CNN
F 4 "35V" H 3700 1850 50  0000 L CNN "Voltage"
F 5 "X5R" H 3650 2150 50  0001 C CNN "Dielectric"
	1    3650 2150
	1    0    0    -1  
$EndComp
Text Label 1400 2000 0    50   ~ 0
VIN_ADP
$Comp
L Device:D_Schottky D?
U 1 1 60580F73
P 3200 4550
AR Path="/601A64F8/60580F73" Ref="D?"  Part="1" 
AR Path="/601A64F8/60567144/60580F73" Ref="D?"  Part="1" 
F 0 "D?" H 3200 4333 50  0000 C CNN
F 1 "D_Schottky" H 3200 4424 50  0000 C CNN
F 2 "" H 3200 4550 50  0001 C CNN
F 3 "~" H 3200 4550 50  0001 C CNN
	1    3200 4550
	-1   0    0    1   
$EndComp
$Comp
L RespiraWorks:BQ25773 U?
U 1 1 60580F88
P 6050 4000
AR Path="/601A64F8/60580F88" Ref="U?"  Part="1" 
AR Path="/601A64F8/60567144/60580F88" Ref="U?"  Part="1" 
F 0 "U?" H 6075 5847 50  0000 C CNN
F 1 "BQ25773" H 6075 5756 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-28-1EP_4x4mm_P0.4mm_EP2.6x2.6mm_ThermalVias" H 6100 1700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/bq24773.pdf" H 8750 5050 50  0001 C CNN
F 4 "Texas Instruments" H 6075 5665 50  0000 C CNN "Manufacturer"
F 5 "BQ24773RUYR" H 6075 5574 50  0000 C CNN "Manufacturer PN"
	1    6050 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60580F8E
P 3250 2500
AR Path="/601A64F8/60580F8E" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580F8E" Ref="C?"  Part="1" 
F 0 "C?" H 3365 2546 50  0000 L CNN
F 1 "0.033uF" H 3365 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3288 2350 50  0001 C CNN
F 3 "~" H 3250 2500 50  0001 C CNN
	1    3250 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 2000 3100 2500
Connection ~ 3100 2500
Wire Wire Line
	3100 2500 3100 2650
Wire Wire Line
	3400 2000 3400 2500
Connection ~ 3400 2500
Wire Wire Line
	3400 2500 3400 2650
Wire Wire Line
	3400 2650 3300 2650
Wire Wire Line
	3300 2650 3300 3400
Wire Wire Line
	3300 3400 3650 3400
Connection ~ 3400 2650
Wire Wire Line
	3950 3400 5300 3400
Wire Wire Line
	3950 3600 5300 3600
Wire Wire Line
	3200 3600 3200 2650
Wire Wire Line
	3200 2650 3100 2650
Wire Wire Line
	3200 3600 3650 3600
Wire Wire Line
	6850 5100 7600 5100
Connection ~ 7600 5100
Wire Wire Line
	8250 4900 6850 4900
Connection ~ 8250 4900
Wire Wire Line
	6850 4700 9000 4700
Connection ~ 9000 4700
Wire Wire Line
	6950 5700 6950 5900
$Comp
L power:GND #PWR?
U 1 1 60580FAA
P 6950 6050
AR Path="/601A64F8/60580FAA" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60580FAA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6950 5800 50  0001 C CNN
F 1 "GND" H 6955 5877 50  0000 C CNN
F 2 "" H 6950 6050 50  0001 C CNN
F 3 "" H 6950 6050 50  0001 C CNN
	1    6950 6050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6850 5900 6950 5900
Connection ~ 6950 5900
Wire Wire Line
	6950 5900 6950 6050
Wire Wire Line
	6850 5700 6950 5700
Wire Wire Line
	7150 5750 7150 5500
Wire Wire Line
	7150 5500 6850 5500
Text Label 6950 5500 0    50   ~ 0
REGN
Wire Wire Line
	6850 4500 7150 4500
Connection ~ 7150 4500
Wire Wire Line
	7150 4500 9000 4500
Text HLabel 9000 4500 2    50   Output ~ 0
ACOK
Wire Wire Line
	1800 4200 5300 4200
Wire Wire Line
	1800 2000 1900 2000
Connection ~ 3100 2650
$Comp
L RespiraWorks_Std:CSD17304Q3 Q?
U 1 1 60580FC0
P 2100 2100
AR Path="/601A64F8/60580FC0" Ref="Q?"  Part="1" 
AR Path="/601A64F8/60567144/60580FC0" Ref="Q?"  Part="1" 
F 0 "Q?" V 2500 2100 50  0000 C CNN
F 1 "CSD17304Q3" V 2400 2150 50  0000 C CNN
F 2 "Package_SON:VSON-8_3.3x3.3mm_P0.65mm_NexFET" H 2300 2025 50  0001 L CIN
F 3 "https://www.ti.com/lit/ds/symlink/csd17304q3.pdf?ts=1608773956037" V 2100 2100 50  0001 L CNN
	1    2100 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 2000 2350 2000
$Comp
L RespiraWorks_Std:CSD17304Q3 Q?
U 1 1 60580FC7
P 2700 2100
AR Path="/601A64F8/60580FC7" Ref="Q?"  Part="1" 
AR Path="/601A64F8/60567144/60580FC7" Ref="Q?"  Part="1" 
F 0 "Q?" V 3100 2100 50  0000 C CNN
F 1 "CSD17304Q3" V 3000 2150 50  0000 C CNN
F 2 "Package_SON:VSON-8_3.3x3.3mm_P0.65mm_NexFET" H 2900 2025 50  0001 L CIN
F 3 "https://www.ti.com/lit/ds/symlink/csd17304q3.pdf?ts=1608773956037" V 2700 2100 50  0001 L CNN
	1    2700 2100
	0    1    -1   0   
$EndComp
Wire Wire Line
	2900 2000 3100 2000
$Comp
L Device:R R?
U 1 1 60580FCE
P 3800 4000
AR Path="/601A64F8/60580FCE" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580FCE" Ref="R?"  Part="1" 
F 0 "R?" V 3750 3700 50  0000 L CNN
F 1 "4.02k" V 3750 4200 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3730 4000 50  0001 C CNN
F 3 "~" H 3800 4000 50  0001 C CNN
	1    3800 4000
	0    1    1    0   
$EndComp
Connection ~ 2500 2000
Wire Wire Line
	2100 2300 2100 2450
Wire Wire Line
	2100 2450 2350 2450
Wire Wire Line
	2700 2450 2700 2300
$Comp
L Device:C C?
U 1 1 60580FD8
P 2350 2150
AR Path="/601A64F8/60580FD8" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580FD8" Ref="C?"  Part="1" 
F 0 "C?" H 2200 2050 50  0000 L CNN
F 1 "47nF" H 2150 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2388 2000 50  0001 C CNN
F 3 "~" H 2350 2150 50  0001 C CNN
	1    2350 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60580FDE
P 1950 2450
AR Path="/601A64F8/60580FDE" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60580FDE" Ref="C?"  Part="1" 
F 0 "C?" V 1800 2450 50  0000 L CNN
F 1 "1nF" V 1700 2400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 2300 50  0001 C CNN
F 3 "~" H 1950 2450 50  0001 C CNN
	1    1950 2450
	0    -1   -1   0   
$EndComp
Connection ~ 2350 2000
Wire Wire Line
	2350 2000 2500 2000
Wire Wire Line
	2350 2300 2350 2450
Connection ~ 2350 2450
Wire Wire Line
	2350 2450 2700 2450
Connection ~ 1800 2450
Connection ~ 2100 2450
$Comp
L Device:R R?
U 1 1 60580FEC
P 3800 3800
AR Path="/601A64F8/60580FEC" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580FEC" Ref="R?"  Part="1" 
F 0 "R?" V 3750 3500 50  0000 L CNN
F 1 "4.02k" V 3750 4000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3730 3800 50  0001 C CNN
F 3 "~" H 3800 3800 50  0001 C CNN
	1    3800 3800
	0    1    1    0   
$EndComp
Connection ~ 2700 2450
Wire Wire Line
	2700 3800 3650 3800
Wire Wire Line
	3950 3800 5300 3800
$Comp
L Device:R R?
U 1 1 60580FF5
P 3800 3400
AR Path="/601A64F8/60580FF5" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/60580FF5" Ref="R?"  Part="1" 
F 0 "R?" V 3850 3600 50  0000 L CNN
F 1 "0" V 3850 3150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3730 3400 50  0001 C CNN
F 3 "~" H 3800 3400 50  0001 C CNN
	1    3800 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 4000 2500 4000
Wire Wire Line
	2700 2450 2700 3800
Wire Wire Line
	2500 2000 2500 4000
Wire Wire Line
	3400 2000 3650 2000
Connection ~ 3650 2000
Wire Wire Line
	3650 2000 3950 2000
Wire Wire Line
	3650 2300 3650 2400
$Comp
L power:GND #PWR?
U 1 1 60581003
P 3950 2400
AR Path="/601A64F8/60581003" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60581003" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3950 2150 50  0001 C CNN
F 1 "GND" H 3955 2227 50  0000 C CNN
F 2 "" H 3950 2400 50  0001 C CNN
F 3 "" H 3950 2400 50  0001 C CNN
	1    3950 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6058100B
P 3950 2150
AR Path="/601A64F8/6058100B" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/6058100B" Ref="C?"  Part="1" 
F 0 "C?" H 4000 2050 50  0000 L CNN
F 1 "10uF" H 4000 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3988 2000 50  0001 C CNN
F 3 "~" H 3950 2150 50  0001 C CNN
F 4 "35V" H 4000 1850 50  0000 L CNN "Voltage"
F 5 "X5R" H 3950 2150 50  0001 C CNN "Dielectric"
	1    3950 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2300 3950 2400
Connection ~ 3950 2000
Wire Wire Line
	3950 2000 4150 2000
Wire Wire Line
	3950 4000 5300 4000
Text HLabel 10500 2000 2    50   Output ~ 0
VLINK
Wire Wire Line
	10100 2000 10500 2000
Connection ~ 10100 2000
Wire Wire Line
	9800 2000 10100 2000
Connection ~ 9800 2000
Connection ~ 8300 2000
Wire Wire Line
	8300 1150 8600 1150
Wire Wire Line
	8300 1150 8300 2000
Wire Wire Line
	10100 2300 10100 2500
$Comp
L power:GND #PWR?
U 1 1 6058102B
P 10100 2500
AR Path="/601A64F8/6058102B" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/6058102B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10100 2250 50  0001 C CNN
F 1 "GND" H 10105 2327 50  0000 C CNN
F 2 "" H 10100 2500 50  0001 C CNN
F 3 "" H 10100 2500 50  0001 C CNN
	1    10100 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60581032
P 10100 2150
AR Path="/601A64F8/60581032" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60581032" Ref="C?"  Part="1" 
F 0 "C?" H 10150 2050 50  0000 L CNN
F 1 "33uF" H 10150 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10138 2000 50  0001 C CNN
F 3 "~" H 10100 2150 50  0001 C CNN
F 4 "25V" H 10150 1850 50  0000 L CNN "Voltage"
	1    10100 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60581038
P 9800 2500
AR Path="/601A64F8/60581038" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60581038" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9800 2250 50  0001 C CNN
F 1 "GND" H 9805 2327 50  0000 C CNN
F 2 "" H 9800 2500 50  0001 C CNN
F 3 "" H 9800 2500 50  0001 C CNN
	1    9800 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2300 9800 2500
$Comp
L Device:CP C?
U 1 1 60581040
P 9800 2150
AR Path="/601A64F8/60581040" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60581040" Ref="C?"  Part="1" 
F 0 "C?" H 9850 2050 50  0000 L CNN
F 1 "33uF" H 9850 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9838 2000 50  0001 C CNN
F 3 "~" H 9800 2150 50  0001 C CNN
F 4 "25V" H 9850 1850 50  0000 L CNN "Voltage"
	1    9800 2150
	1    0    0    -1  
$EndComp
Connection ~ 8600 1150
Wire Wire Line
	9500 1150 9200 1150
Connection ~ 9500 1150
Wire Wire Line
	9200 1150 8900 1150
Connection ~ 9200 1150
Wire Wire Line
	8900 1150 8600 1150
Connection ~ 8900 1150
Wire Wire Line
	9800 1150 9500 1150
$Comp
L power:GND #PWR?
U 1 1 6058104E
P 9800 1650
AR Path="/601A64F8/6058104E" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/6058104E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9800 1400 50  0001 C CNN
F 1 "GND" H 9805 1477 50  0000 C CNN
F 2 "" H 9800 1650 50  0001 C CNN
F 3 "" H 9800 1650 50  0001 C CNN
	1    9800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1450 9800 1650
$Comp
L Device:C C?
U 1 1 60581056
P 9800 1300
AR Path="/601A64F8/60581056" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60581056" Ref="C?"  Part="1" 
F 0 "C?" H 9850 1200 50  0000 L CNN
F 1 "10uF" H 9850 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9838 1150 50  0001 C CNN
F 3 "~" H 9800 1300 50  0001 C CNN
F 4 "25V" H 9850 1000 50  0000 L CNN "Voltage"
	1    9800 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6058105C
P 9500 1650
AR Path="/601A64F8/6058105C" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/6058105C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 1400 50  0001 C CNN
F 1 "GND" H 9505 1477 50  0000 C CNN
F 2 "" H 9500 1650 50  0001 C CNN
F 3 "" H 9500 1650 50  0001 C CNN
	1    9500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1450 9500 1650
$Comp
L Device:C C?
U 1 1 60581064
P 9500 1300
AR Path="/601A64F8/60581064" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60581064" Ref="C?"  Part="1" 
F 0 "C?" H 9550 1200 50  0000 L CNN
F 1 "10uF" H 9550 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9538 1150 50  0001 C CNN
F 3 "~" H 9500 1300 50  0001 C CNN
F 4 "25V" H 9550 1000 50  0000 L CNN "Voltage"
	1    9500 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6058106A
P 9200 1650
AR Path="/601A64F8/6058106A" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/6058106A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9200 1400 50  0001 C CNN
F 1 "GND" H 9205 1477 50  0000 C CNN
F 2 "" H 9200 1650 50  0001 C CNN
F 3 "" H 9200 1650 50  0001 C CNN
	1    9200 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1450 9200 1650
$Comp
L Device:C C?
U 1 1 60581072
P 9200 1300
AR Path="/601A64F8/60581072" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60581072" Ref="C?"  Part="1" 
F 0 "C?" H 9250 1200 50  0000 L CNN
F 1 "10uF" H 9250 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9238 1150 50  0001 C CNN
F 3 "~" H 9200 1300 50  0001 C CNN
F 4 "25V" H 9250 1000 50  0000 L CNN "Voltage"
	1    9200 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60581078
P 8900 1650
AR Path="/601A64F8/60581078" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60581078" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8900 1400 50  0001 C CNN
F 1 "GND" H 8905 1477 50  0000 C CNN
F 2 "" H 8900 1650 50  0001 C CNN
F 3 "" H 8900 1650 50  0001 C CNN
	1    8900 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1450 8900 1650
$Comp
L Device:C C?
U 1 1 60581080
P 8900 1300
AR Path="/601A64F8/60581080" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/60581080" Ref="C?"  Part="1" 
F 0 "C?" H 8950 1200 50  0000 L CNN
F 1 "10uF" H 8950 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8938 1150 50  0001 C CNN
F 3 "~" H 8900 1300 50  0001 C CNN
F 4 "25V" H 8950 1000 50  0000 L CNN "Voltage"
	1    8900 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60581086
P 8600 1650
AR Path="/601A64F8/60581086" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60581086" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8600 1400 50  0001 C CNN
F 1 "GND" H 8605 1477 50  0000 C CNN
F 2 "" H 8600 1650 50  0001 C CNN
F 3 "" H 8600 1650 50  0001 C CNN
	1    8600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1450 8600 1650
$Comp
L Device:C C?
U 1 1 6058108E
P 8600 1300
AR Path="/601A64F8/6058108E" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/6058108E" Ref="C?"  Part="1" 
F 0 "C?" H 8650 1200 50  0000 L CNN
F 1 "10uF" H 8650 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8638 1150 50  0001 C CNN
F 3 "~" H 8600 1300 50  0001 C CNN
F 4 "25V" H 8650 1000 50  0000 L CNN "Voltage"
	1    8600 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60581094
P 9500 2500
AR Path="/601A64F8/60581094" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60581094" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 2250 50  0001 C CNN
F 1 "GND" H 9505 2327 50  0000 C CNN
F 2 "" H 9500 2500 50  0001 C CNN
F 3 "" H 9500 2500 50  0001 C CNN
	1    9500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 2300 9500 2500
$Comp
L Device:C C?
U 1 1 6058109C
P 9500 2150
AR Path="/601A64F8/6058109C" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/6058109C" Ref="C?"  Part="1" 
F 0 "C?" H 9550 2050 50  0000 L CNN
F 1 "10uF" H 9550 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9538 2000 50  0001 C CNN
F 3 "~" H 9500 2150 50  0001 C CNN
F 4 "25V" H 9550 1850 50  0000 L CNN "Voltage"
	1    9500 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605810A2
P 9200 2500
AR Path="/601A64F8/605810A2" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/605810A2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9200 2250 50  0001 C CNN
F 1 "GND" H 9205 2327 50  0000 C CNN
F 2 "" H 9200 2500 50  0001 C CNN
F 3 "" H 9200 2500 50  0001 C CNN
	1    9200 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 2300 9200 2500
$Comp
L Device:C C?
U 1 1 605810AA
P 9200 2150
AR Path="/601A64F8/605810AA" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/605810AA" Ref="C?"  Part="1" 
F 0 "C?" H 9250 2050 50  0000 L CNN
F 1 "10uF" H 9250 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9238 2000 50  0001 C CNN
F 3 "~" H 9200 2150 50  0001 C CNN
F 4 "25V" H 9250 1850 50  0000 L CNN "Voltage"
	1    9200 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605810B0
P 8900 2500
AR Path="/601A64F8/605810B0" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/605810B0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8900 2250 50  0001 C CNN
F 1 "GND" H 8905 2327 50  0000 C CNN
F 2 "" H 8900 2500 50  0001 C CNN
F 3 "" H 8900 2500 50  0001 C CNN
	1    8900 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2300 8900 2500
$Comp
L Device:C C?
U 1 1 605810B8
P 8900 2150
AR Path="/601A64F8/605810B8" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/605810B8" Ref="C?"  Part="1" 
F 0 "C?" H 8950 2050 50  0000 L CNN
F 1 "10uF" H 8950 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8938 2000 50  0001 C CNN
F 3 "~" H 8900 2150 50  0001 C CNN
F 4 "25V" H 8950 1850 50  0000 L CNN "Voltage"
	1    8900 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605810BE
P 8600 2500
AR Path="/601A64F8/605810BE" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/605810BE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8600 2250 50  0001 C CNN
F 1 "GND" H 8605 2327 50  0000 C CNN
F 2 "" H 8600 2500 50  0001 C CNN
F 3 "" H 8600 2500 50  0001 C CNN
	1    8600 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 2300 8600 2500
$Comp
L Device:C C?
U 1 1 605810C6
P 8600 2150
AR Path="/601A64F8/605810C6" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/605810C6" Ref="C?"  Part="1" 
F 0 "C?" H 8650 2050 50  0000 L CNN
F 1 "0.01uF" H 8650 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8638 2000 50  0001 C CNN
F 3 "~" H 8600 2150 50  0001 C CNN
F 4 "25V" H 8650 1850 50  0000 L CNN "Voltage"
	1    8600 2150
	1    0    0    -1  
$EndComp
$Comp
L RespiraWorks_Std:CSD25402Q3A Q?
U 1 1 605810DE
P 7800 3000
AR Path="/601A64F8/605810DE" Ref="Q?"  Part="1" 
AR Path="/601A64F8/60567144/605810DE" Ref="Q?"  Part="1" 
F 0 "Q?" V 7850 2700 50  0000 L CNN
F 1 "CSD25402Q3A" V 7950 2650 50  0000 L CNN
F 2 "Package_SON:VSON-8_3.3x3.3mm_P0.65mm_NexFET" H 8300 2850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/csd25402q3a.pdf" H 7700 3000 50  0001 C CNN
	1    7800 3000
	1    0    0    1   
$EndComp
Wire Wire Line
	6200 2000 7800 2000
$Comp
L Device:R R?
U 1 1 605810E5
P 7800 2300
AR Path="/601A64F8/605810E5" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/605810E5" Ref="R?"  Part="1" 
F 0 "R?" H 7650 2250 50  0000 C CNN
F 1 "0.01" H 7600 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" V 7730 2300 50  0001 C CNN
F 3 "~" H 7800 2300 50  0001 C CNN
	1    7800 2300
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 605810EB
P 7600 2300
AR Path="/601A64F8/605810EB" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/605810EB" Ref="C?"  Part="1" 
F 0 "C?" H 7350 2300 50  0000 L CNN
F 1 "0.1uF" H 7350 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7638 2150 50  0001 C CNN
F 3 "~" H 7600 2300 50  0001 C CNN
	1    7600 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 605810F1
P 7200 3000
AR Path="/601A64F8/605810F1" Ref="R?"  Part="1" 
AR Path="/601A64F8/60567144/605810F1" Ref="R?"  Part="1" 
F 0 "R?" V 7250 3200 50  0000 L CNN
F 1 "0" V 7250 2750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7130 3000 50  0001 C CNN
F 3 "~" H 7200 3000 50  0001 C CNN
	1    7200 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 605810F7
P 7200 2300
AR Path="/601A64F8/605810F7" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/605810F7" Ref="C?"  Part="1" 
F 0 "C?" H 6950 2300 50  0000 L CNN
F 1 "0.1uF" H 6950 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7238 2150 50  0001 C CNN
F 3 "~" H 7200 2300 50  0001 C CNN
	1    7200 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 605810FD
P 7200 2650
AR Path="/601A64F8/605810FD" Ref="C?"  Part="1" 
AR Path="/601A64F8/60567144/605810FD" Ref="C?"  Part="1" 
F 0 "C?" H 6950 2650 50  0000 L CNN
F 1 "0.1uF" H 6950 2550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7238 2500 50  0001 C CNN
F 3 "~" H 7200 2650 50  0001 C CNN
	1    7200 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60581103
P 7400 2450
AR Path="/601A64F8/60581103" Ref="#PWR?"  Part="1" 
AR Path="/601A64F8/60567144/60581103" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7400 2200 50  0001 C CNN
F 1 "GND" H 7405 2277 50  0000 C CNN
F 2 "" H 7400 2450 50  0001 C CNN
F 3 "" H 7400 2450 50  0001 C CNN
	1    7400 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2600 6900 2600
Wire Wire Line
	7800 2150 7800 2000
Connection ~ 7800 2150
Connection ~ 7800 2000
Wire Wire Line
	7800 2450 7800 2800
Wire Wire Line
	7050 3000 6850 3000
Wire Wire Line
	7350 3000 7500 3000
Wire Wire Line
	7600 2800 7600 2450
Wire Wire Line
	6850 2800 7200 2800
Wire Wire Line
	7800 2450 7600 2450
Connection ~ 7800 2450
Connection ~ 7600 2450
Wire Wire Line
	7800 2150 7600 2150
Wire Wire Line
	7600 2150 7200 2150
Wire Wire Line
	6900 2150 6900 2600
Connection ~ 7600 2150
Connection ~ 7200 2150
Wire Wire Line
	7200 2150 6900 2150
Connection ~ 7200 2800
Wire Wire Line
	7200 2800 7600 2800
Wire Wire Line
	7200 2450 7200 2500
Wire Wire Line
	7200 2450 7400 2450
Connection ~ 7200 2450
Wire Wire Line
	6850 3200 7800 3200
Wire Wire Line
	8300 2000 8600 2000
Connection ~ 8600 2000
Wire Wire Line
	8600 2000 8900 2000
Connection ~ 8900 2000
Wire Wire Line
	8900 2000 9200 2000
Connection ~ 9200 2000
Wire Wire Line
	9200 2000 9500 2000
Connection ~ 9500 2000
Wire Wire Line
	9500 2000 9800 2000
Wire Wire Line
	7800 2000 8300 2000
Text Label 4150 5100 0    50   ~ 0
REGN
Wire Wire Line
	5050 5100 5300 5100
Wire Wire Line
	4150 5100 4750 5100
$Comp
L Device:D_Schottky D?
U 1 1 60581131
P 3200 4900
AR Path="/601A64F8/60581131" Ref="D?"  Part="1" 
AR Path="/601A64F8/60567144/60581131" Ref="D?"  Part="1" 
F 0 "D?" H 3200 4683 50  0000 C CNN
F 1 "D_Schottky" H 3200 4774 50  0000 C CNN
F 2 "" H 3200 4900 50  0001 C CNN
F 3 "~" H 3200 4900 50  0001 C CNN
	1    3200 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 4500 5300 4500
Wire Wire Line
	3500 4500 3500 4550
Wire Wire Line
	3500 4900 3350 4900
Wire Wire Line
	3500 4550 3350 4550
Connection ~ 3500 4550
Wire Wire Line
	3500 4550 3500 4900
Wire Wire Line
	2600 4550 3050 4550
Wire Wire Line
	3050 4900 2600 4900
Text Label 2600 4550 0    50   ~ 0
BAT_P
Text Label 2600 4900 0    50   ~ 0
VIN_ADP
Wire Wire Line
	1800 2450 1800 3900
Wire Wire Line
	1800 2000 1800 2450
Wire Wire Line
	7800 3200 8850 3200
Connection ~ 7800 3200
Text HLabel 8850 3200 2    50   BiDi ~ 0
BAT_P
Wire Wire Line
	1800 2000 1250 2000
Connection ~ 1800 2000
Text HLabel 1250 2000 0    50   Input ~ 0
VIN_ADP
$EndSCHEMATC
