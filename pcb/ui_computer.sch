EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "UI Computer"
Date ""
Rev "2.0"
Comp "RespiraWorks"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RespiraWorks:ESQ-120-44-L-D J?
U 1 1 5FDAF122
P 5700 3350
F 0 "J?" H 5725 4625 50  0000 C CNN
F 1 "ESQ-120-44-L-D" H 5725 4534 50  0000 C CNN
F 2 "RespiraWorks_Std:PinHeader_2x20_P2.54mm_Vertical" H 5100 4450 50  0001 C CNN
F 3 "" H 5100 4450 50  0001 C CNN
	1    5700 3350
	1    0    0    -1  
$EndComp
$Comp
L RespiraWorks:+3V3_RPi #PWR?
U 1 1 5FDB01F4
P 4750 2250
F 0 "#PWR?" H 4750 2300 50  0001 C CNN
F 1 "+3V3_RPi" H 4735 2423 50  0000 C CNN
F 2 "" H 4750 2250 50  0001 C CNN
F 3 "" H 4750 2250 50  0001 C CNN
	1    4750 2250
	1    0    0    -1  
$EndComp
Text HLabel 4550 2600 0    50   BiDi ~ 0
GPIO4(GPCLK0)
NoConn ~ 5000 2400
NoConn ~ 5000 2500
Wire Wire Line
	4550 2600 5000 2600
$Comp
L power:GND #PWR?
U 1 1 5FDB0314
P 4850 4300
F 0 "#PWR?" H 4850 4050 50  0001 C CNN
F 1 "GND" H 4855 4127 50  0000 C CNN
F 2 "" H 4850 4300 50  0001 C CNN
F 3 "" H 4850 4300 50  0001 C CNN
	1    4850 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2700 4850 2700
Wire Wire Line
	4850 2700 4850 3500
Wire Wire Line
	5000 3500 4850 3500
Connection ~ 4850 3500
Wire Wire Line
	4850 3500 4850 4200
Wire Wire Line
	5000 4200 4850 4200
Connection ~ 4850 4200
Wire Wire Line
	4850 4200 4850 4300
Wire Wire Line
	5000 2300 4750 2300
Wire Wire Line
	4750 2300 4750 2250
Text HLabel 4550 2900 0    50   BiDi ~ 0
GPIO27
Wire Wire Line
	4550 2900 5000 2900
Text HLabel 4550 3700 0    50   Output ~ 0
UI_LED_Y
Wire Wire Line
	4550 3700 5000 3700
Text HLabel 4550 3800 0    50   Output ~ 0
UI_LED_G
Wire Wire Line
	4550 3800 5000 3800
Text Notes 5400 1850 0    50   ~ 0
RPI powered by 5V\n
Text HLabel 4550 3900 0    50   Output ~ 0
USART_RTS
Wire Wire Line
	5000 3900 4550 3900
$Comp
L Device:R R?
U 1 1 5FDB08DB
P 3950 4350
F 0 "R?" H 3800 4400 50  0000 L CNN
F 1 "10K" H 3750 4300 50  0000 L CNN
F 2 "RespiraWorks_std:R_0603_1608Metric" V 3880 4350 50  0001 C CNN
F 3 "~" H 3950 4350 50  0001 C CNN
	1    3950 4350
	1    0    0    -1  
$EndComp
$Comp
L RespiraWorks:+3V3_RPi #PWR?
U 1 1 5FDB0BF2
P 3950 3700
F 0 "#PWR?" H 3950 3750 50  0001 C CNN
F 1 "+3V3_RPi" H 3935 3873 50  0000 C CNN
F 2 "" H 3950 3700 50  0001 C CNN
F 3 "" H 3950 3700 50  0001 C CNN
	1    3950 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4100 3950 4000
Wire Wire Line
	3950 4100 5000 4100
Wire Wire Line
	3950 4200 3950 4100
Connection ~ 3950 4100
$Comp
L power:GND #PWR?
U 1 1 5FDB0EEF
P 3950 4500
F 0 "#PWR?" H 3950 4250 50  0001 C CNN
F 1 "GND" H 3955 4327 50  0000 C CNN
F 2 "" H 3950 4500 50  0001 C CNN
F 3 "" H 3950 4500 50  0001 C CNN
	1    3950 4500
	1    0    0    -1  
$EndComp
Text Label 4200 4100 0    50   ~ 0
UI_ID1
NoConn ~ 5000 2800
$Comp
L Device:R R?
U 1 1 5FE66293
P 3950 3850
F 0 "R?" H 3800 3900 50  0000 L CNN
F 1 "1K" H 3750 3800 50  0000 L CNN
F 2 "RespiraWorks_std:R_0603_1608Metric" V 3880 3850 50  0001 C CNN
F 3 "~" H 3950 3850 50  0001 C CNN
F 4 "DNP" H 3700 3850 50  0000 C CNN "DNP"
	1    3950 3850
	1    0    0    -1  
$EndComp
NoConn ~ 5000 3000
Wire Wire Line
	4750 2300 4750 3100
Wire Wire Line
	4750 3100 5000 3100
Connection ~ 4750 2300
NoConn ~ 5000 3200
NoConn ~ 5000 3300
NoConn ~ 5000 3400
NoConn ~ 5000 3600
NoConn ~ 5000 4000
Wire Wire Line
	6450 2300 6750 2300
Wire Wire Line
	6450 2400 6750 2400
Wire Wire Line
	6750 2400 6750 2300
Wire Wire Line
	6650 4300 6650 3900
Wire Wire Line
	6650 2500 6450 2500
$Comp
L power:GND #PWR?
U 1 1 5FE67C8B
P 6650 4300
F 0 "#PWR?" H 6650 4050 50  0001 C CNN
F 1 "GND" H 6655 4127 50  0000 C CNN
F 2 "" H 6650 4300 50  0001 C CNN
F 3 "" H 6650 4300 50  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2900 6650 2900
Connection ~ 6650 2900
Wire Wire Line
	6650 2900 6650 2500
Wire Wire Line
	6450 3200 6650 3200
Connection ~ 6650 3200
Wire Wire Line
	6650 3200 6650 2900
Wire Wire Line
	6450 3700 6650 3700
Connection ~ 6650 3700
Wire Wire Line
	6650 3700 6650 3200
Wire Wire Line
	6450 3900 6650 3900
Connection ~ 6650 3900
Wire Wire Line
	6650 3900 6650 3700
Wire Wire Line
	6450 2600 7000 2600
Text HLabel 7000 2600 2    50   Output ~ 0
USART-TX
Wire Wire Line
	6450 2700 7000 2700
Text HLabel 7000 2700 2    50   Input ~ 0
USART-RX
NoConn ~ 6450 2800
NoConn ~ 6450 3000
NoConn ~ 6450 3100
NoConn ~ 6450 3400
NoConn ~ 6450 3500
NoConn ~ 6450 3600
NoConn ~ 6450 4000
NoConn ~ 6450 4100
NoConn ~ 6450 4200
Wire Wire Line
	6450 3300 7750 3300
Text Label 7350 3300 2    50   ~ 0
UI_ID0
$Comp
L Device:R R?
U 1 1 5FE6BCEC
P 7750 3000
F 0 "R?" H 7850 3050 50  0000 L CNN
F 1 "1K" H 7850 2950 50  0000 L CNN
F 2 "RespiraWorks_std:R_0603_1608Metric" V 7680 3000 50  0001 C CNN
F 3 "~" H 7750 3000 50  0001 C CNN
F 4 "DNP" H 7600 3000 50  0000 C CNN "DNP"
	1    7750 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FE6BE04
P 7750 3600
F 0 "R?" H 7600 3650 50  0000 L CNN
F 1 "10K" H 7550 3550 50  0000 L CNN
F 2 "RespiraWorks_std:R_0603_1608Metric" V 7680 3600 50  0001 C CNN
F 3 "~" H 7750 3600 50  0001 C CNN
	1    7750 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FE6BE44
P 7750 3750
F 0 "#PWR?" H 7750 3500 50  0001 C CNN
F 1 "GND" H 7755 3577 50  0000 C CNN
F 2 "" H 7750 3750 50  0001 C CNN
F 3 "" H 7750 3750 50  0001 C CNN
	1    7750 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3150 7750 3300
Wire Wire Line
	7750 3450 7750 3300
Connection ~ 7750 3300
$Comp
L RespiraWorks:+3V3_RPi #PWR?
U 1 1 5FE6C7D6
P 7750 2850
F 0 "#PWR?" H 7750 2900 50  0001 C CNN
F 1 "+3V3_RPi" H 7735 3023 50  0000 C CNN
F 2 "" H 7750 2850 50  0001 C CNN
F 3 "" H 7750 2850 50  0001 C CNN
	1    7750 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3800 7000 3800
Text HLabel 7000 3800 2    50   Input ~ 0
USART-CTS
$Comp
L RespiraWorks:+5V_GUI #PWR?
U 1 1 5FEBC42B
P 6750 2300
F 0 "#PWR?" H 6750 2300 50  0001 C CNN
F 1 "+5V_GUI" H 6735 2473 50  0000 C CNN
F 2 "" H 6750 2300 50  0001 C CNN
F 3 "" H 6750 2300 50  0001 C CNN
	1    6750 2300
	1    0    0    -1  
$EndComp
Connection ~ 6750 2300
Text Notes 1200 1450 0    50   ~ 0
USB TO UART adapter: https://www.ftdichip.com/Support/Documents/DataSheets/Modules/DS_DB9-USB-RS232.pdf
$Comp
L RespiraWorks:RaspberryPi H?
U 1 1 600E005B
P 5700 5600
F 0 "H?" H 5700 6300 50  0001 C CNN
F 1 "RaspberryPi" H 5800 6250 50  0001 C CNN
F 2 "RespiraWorks:RaspberryPi" H 5700 5600 50  0001 C CNN
F 3 "~" H 5700 5600 50  0001 C CNN
	1    5700 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 600E0077
P 5800 5700
F 0 "#PWR?" H 5800 5450 50  0001 C CNN
F 1 "GND" H 5805 5527 50  0000 C CNN
F 2 "" H 5800 5700 50  0001 C CNN
F 3 "" H 5800 5700 50  0001 C CNN
	1    5800 5700
	1    0    0    -1  
$EndComp
Text Notes 1300 2450 0    50   ~ 0
caps and ports for I/O and power
Text HLabel 4550 2400 0    50   BiDi ~ 0
GPIO2(SDA)
Text HLabel 4550 2500 0    50   BiDi ~ 0
GPIO3(SCL)
Wire Wire Line
	4550 2400 5000 2400
Wire Wire Line
	4550 2500 5000 2500
Text HLabel 4550 2800 0    50   BiDi ~ 0
GPIO17
Wire Wire Line
	5000 2800 4550 2800
Text HLabel 4550 3000 0    50   BiDi ~ 0
GPIO22
Wire Wire Line
	4550 3000 5000 3000
Text HLabel 4550 3200 0    50   BiDi ~ 0
GPIO10(MOSI)
Text HLabel 4550 3300 0    50   BiDi ~ 0
GPIO9(MISO)
Wire Wire Line
	4550 3200 5000 3200
Wire Wire Line
	4550 3300 5000 3300
$EndSCHEMATC
