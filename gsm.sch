EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:rfcom
LIBS:dc-dc
LIBS:stm32
LIBS:diy_diodes
LIBS:relays
LIBS:sensors
LIBS:tracker-cache
EELAYER 27 0
EELAYER END
$Descr User 7087 7087
encoding utf-8
Sheet 3 5
Title ""
Date "5 apr 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SIM900 IC2
U 1 1 550D589B
P 2850 3600
F 0 "IC2" H 2050 5550 50  0000 L CNN
F 1 "SIM900" H 2050 5450 50  0000 L CNN
F 2 "" H 800 4750 60  0000 C CNN
F 3 "" H 800 4750 60  0000 C CNN
	1    2850 3600
	1    0    0    -1  
$EndComp
$Comp
L SIM_HOLDER U6
U 1 1 550D65D0
P 5550 3500
F 0 "U6" H 5600 3150 60  0000 C CNN
F 1 "SIM_HOLDER" H 5550 3700 60  0000 C CNN
F 2 "" H 5400 3150 60  0000 C CNN
F 3 "" H 5400 3150 60  0000 C CNN
	1    5550 3500
	1    0    0    -1  
$EndComp
$Comp
L ANTENNA ANT1
U 1 1 550D6745
P 4000 1850
F 0 "ANT1" H 4000 1500 60  0000 C CNN
F 1 "ANTENNA" H 3750 1750 60  0000 C CNN
F 2 "" H 4000 1850 60  0000 C CNN
F 3 "" H 4000 1850 60  0000 C CNN
	1    4000 1850
	1    0    0    -1  
$EndComp
$Comp
L DIODE_SCHOTTKY D6
U 1 1 550D70D1
P 4500 3650
F 0 "D6" H 4500 3750 50  0000 C CNN
F 1 " " H 4500 3550 50  0000 C CNN
F 2 "" H 4500 3650 60  0000 C CNN
F 3 "" H 4500 3650 60  0000 C CNN
	1    4500 3650
	0    -1   -1   0   
$EndComp
$Comp
L DIODE_SCHOTTKY D7
U 1 1 550D7312
P 4650 3750
F 0 "D7" H 4650 3850 50  0000 C CNN
F 1 " " H 4650 3650 50  0000 C CNN
F 2 "" H 4650 3750 60  0000 C CNN
F 3 "" H 4650 3750 60  0000 C CNN
	1    4650 3750
	0    -1   -1   0   
$EndComp
$Comp
L DIODE_SCHOTTKY D8
U 1 1 550D7318
P 4800 3850
F 0 "D8" H 4800 3950 50  0000 C CNN
F 1 " " H 4800 3750 50  0000 C CNN
F 2 "" H 4800 3850 60  0000 C CNN
F 3 "" H 4800 3850 60  0000 C CNN
	1    4800 3850
	0    -1   -1   0   
$EndComp
$Comp
L DIODE_SCHOTTKY D9
U 1 1 550D7332
P 4950 3950
F 0 "D9" H 4950 4050 50  0000 C CNN
F 1 " " H 4950 3850 50  0000 C CNN
F 2 "" H 4950 3950 60  0000 C CNN
F 3 "" H 4950 3950 60  0000 C CNN
	1    4950 3950
	0    -1   -1   0   
$EndComp
$Comp
L R R16
U 1 1 550D7618
P 4150 3500
F 0 "R16" V 4230 3500 40  0000 C CNN
F 1 "120" V 4157 3501 40  0000 C CNN
F 2 "" V 4080 3500 30  0000 C CNN
F 3 "" H 4150 3500 30  0000 C CNN
	1    4150 3500
	0    -1   -1   0   
$EndComp
$Comp
L R R17
U 1 1 550D761E
P 4150 3600
F 0 "R17" V 4230 3600 40  0000 C CNN
F 1 "120" V 4157 3601 40  0000 C CNN
F 2 "" V 4080 3600 30  0000 C CNN
F 3 "" H 4150 3600 30  0000 C CNN
	1    4150 3600
	0    -1   -1   0   
$EndComp
$Comp
L R R18
U 1 1 550D7624
P 4150 3700
F 0 "R18" V 4230 3700 40  0000 C CNN
F 1 "120" V 4157 3701 40  0000 C CNN
F 2 "" V 4080 3700 30  0000 C CNN
F 3 "" H 4150 3700 30  0000 C CNN
	1    4150 3700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR52
U 1 1 550D77DE
P 4650 4300
F 0 "#PWR52" H 4650 4050 60  0001 C CNN
F 1 "GND" H 4650 4150 60  0000 C CNN
F 2 "" H 4650 4300 60  0000 C CNN
F 3 "" H 4650 4300 60  0000 C CNN
	1    4650 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR56
U 1 1 550D7A1D
P 6250 3500
F 0 "#PWR56" H 6250 3250 60  0001 C CNN
F 1 "GND" H 6250 3350 60  0000 C CNN
F 2 "" H 6250 3500 60  0000 C CNN
F 3 "" H 6250 3500 60  0000 C CNN
	1    6250 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 3400 5050 3400
Wire Wire Line
	3850 3500 3900 3500
Wire Wire Line
	3850 3600 3900 3600
Wire Wire Line
	3850 3700 3900 3700
Wire Wire Line
	4400 3500 5050 3500
Wire Wire Line
	4400 3600 5050 3600
Wire Wire Line
	4400 3700 5050 3700
Wire Wire Line
	4950 3750 4950 3700
Connection ~ 4950 3700
Wire Wire Line
	4800 3650 4800 3600
Connection ~ 4800 3600
Wire Wire Line
	4650 3550 4650 3500
Connection ~ 4650 3500
Wire Wire Line
	4500 3450 4500 3400
Connection ~ 4500 3400
Wire Wire Line
	4400 4200 4950 4200
Wire Wire Line
	4950 4200 4950 4150
Wire Wire Line
	4800 4050 4800 4200
Connection ~ 4800 4200
Wire Wire Line
	4650 3950 4650 4300
Connection ~ 4650 4200
Wire Wire Line
	4500 3850 4500 4200
Connection ~ 4500 4200
Wire Wire Line
	6250 3500 6100 3500
NoConn ~ 6100 3600
Wire Wire Line
	2350 5500 2350 5550
Wire Wire Line
	2350 5550 3350 5550
Wire Wire Line
	3350 5550 3350 5500
Wire Wire Line
	3250 5500 3250 5550
Connection ~ 3250 5550
Wire Wire Line
	3150 5500 3150 5550
Connection ~ 3150 5550
Wire Wire Line
	3050 5500 3050 5550
Connection ~ 3050 5550
Wire Wire Line
	2950 5500 2950 5550
Connection ~ 2950 5550
Wire Wire Line
	2850 5500 2850 5650
Connection ~ 2850 5550
Wire Wire Line
	2750 5500 2750 5550
Connection ~ 2750 5550
Wire Wire Line
	2650 5500 2650 5550
Connection ~ 2650 5550
Wire Wire Line
	2550 5500 2550 5550
Connection ~ 2550 5550
Wire Wire Line
	2450 5500 2450 5550
Connection ~ 2450 5550
$Comp
L GND #PWR49
U 1 1 550D800B
P 2850 5650
F 0 "#PWR49" H 2850 5400 60  0001 C CNN
F 1 "GND" H 2850 5500 60  0000 C CNN
F 2 "" H 2850 5650 60  0000 C CNN
F 3 "" H 2850 5650 60  0000 C CNN
	1    2850 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2400 3850 2400
Wire Wire Line
	3900 2000 3900 2400
Wire Wire Line
	3900 2000 3850 2000
Wire Wire Line
	3850 2100 3900 2100
Connection ~ 3900 2100
Wire Wire Line
	3850 2300 4000 2300
Connection ~ 3900 2300
$Comp
L GND #PWR51
U 1 1 550D81F0
P 4000 2300
F 0 "#PWR51" H 4000 2050 60  0001 C CNN
F 1 "GND" H 4000 2150 60  0000 C CNN
F 2 "" H 4000 2300 60  0000 C CNN
F 3 "" H 4000 2300 60  0000 C CNN
	1    4000 2300
	0    -1   -1   0   
$EndComp
$Comp
L LED D5
U 1 1 550D8766
P 1600 4000
F 0 "D5" H 1600 4100 50  0000 C CNN
F 1 "LED" H 1600 3900 50  0000 C CNN
F 2 "" H 1600 4000 60  0000 C CNN
F 3 "" H 1600 4000 60  0000 C CNN
	1    1600 4000
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 550D876C
P 1100 4000
F 0 "R12" V 1180 4000 40  0000 C CNN
F 1 "1k" V 1107 4001 40  0000 C CNN
F 2 "" V 1030 4000 30  0000 C CNN
F 3 "" H 1100 4000 30  0000 C CNN
	1    1100 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 2200 4000 2200
Wire Wire Line
	4000 2200 4000 2100
NoConn ~ 1850 5100
NoConn ~ 1850 5000
NoConn ~ 1850 2600
NoConn ~ 1850 2500
NoConn ~ 1850 2400
NoConn ~ 3850 2600
NoConn ~ 3850 2700
NoConn ~ 3850 2850
NoConn ~ 3850 2950
NoConn ~ 3850 3100
NoConn ~ 3850 3200
Text GLabel 1850 2200 0    60   Input ~ 0
SIMTX
Text GLabel 1150 1750 1    60   Input ~ 0
SIMRX
Text GLabel 1850 2000 0    60   Input ~ 0
SIMRST
Text GLabel 1850 2900 0    60   Input ~ 0
SIMRI
$Comp
L CP C26
U 1 1 550D9351
P 2750 1300
F 0 "C26" H 2800 1400 40  0000 L CNN
F 1 "3.3F" H 2800 1200 40  0000 L CNN
F 2 "" H 2850 1150 30  0000 C CNN
F 3 "" H 2750 1300 300 0000 C CNN
	1    2750 1300
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR48
U 1 1 550D9357
P 2750 1000
F 0 "#PWR48" H 2750 750 60  0001 C CNN
F 1 "GND" H 2750 850 60  0000 C CNN
F 2 "" H 2750 1000 60  0000 C CNN
F 3 "" H 2750 1000 60  0000 C CNN
	1    2750 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2750 1600 2750 1500
Wire Wire Line
	2750 1100 2750 1000
Text GLabel 1400 3200 3    60   Input ~ 0
SIMPWR
Wire Wire Line
	3050 1600 3050 1550
Wire Wire Line
	3050 1550 3250 1550
Wire Wire Line
	3250 1550 3250 1600
Wire Wire Line
	3150 1500 3150 1600
Connection ~ 3150 1550
$Comp
L CP C27
U 1 1 550D9C9B
P 4750 2100
F 0 "C27" H 4800 2200 40  0000 L CNN
F 1 "47u" H 4800 2000 40  0000 L CNN
F 2 "" H 4850 1950 30  0000 C CNN
F 3 "" H 4750 2100 300 0000 C CNN
	1    4750 2100
	1    0    0    -1  
$EndComp
$Comp
L C C29
U 1 1 550D9CA1
P 4950 2100
F 0 "C29" H 4950 2200 40  0000 L CNN
F 1 "0.1u" H 4956 2015 40  0000 L CNN
F 2 "" H 4988 1950 30  0000 C CNN
F 3 "" H 4950 2100 60  0000 C CNN
	1    4950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1900 4750 1850
Wire Wire Line
	4750 1850 4950 1850
Wire Wire Line
	4950 1850 4950 1900
Wire Wire Line
	4750 2300 4750 2350
Wire Wire Line
	4750 2350 4950 2350
Wire Wire Line
	4950 2350 4950 2300
Wire Wire Line
	4850 1800 4850 1850
Connection ~ 4850 1850
$Comp
L GND #PWR55
U 1 1 550D9D9B
P 4850 2400
F 0 "#PWR55" H 4850 2150 60  0001 C CNN
F 1 "GND" H 4850 2250 60  0000 C CNN
F 2 "" H 4850 2400 60  0000 C CNN
F 3 "" H 4850 2400 60  0000 C CNN
	1    4850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2400 4850 2350
Connection ~ 4850 2350
$Comp
L C C28
U 1 1 550DA16F
P 4800 3150
F 0 "C28" H 4800 3250 40  0000 L CNN
F 1 "C" H 4806 3065 40  0000 L CNN
F 2 "" H 4838 3000 30  0000 C CNN
F 3 "" H 4800 3150 60  0000 C CNN
	1    4800 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR53
U 1 1 550DA175
P 4800 2900
F 0 "#PWR53" H 4800 2650 60  0001 C CNN
F 1 "GND" H 4800 2750 60  0000 C CNN
F 2 "" H 4800 2900 60  0000 C CNN
F 3 "" H 4800 2900 60  0000 C CNN
	1    4800 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4800 2900 4800 2950
Wire Wire Line
	4800 3350 4800 3400
Connection ~ 4800 3400
NoConn ~ 1850 3100
NoConn ~ 1850 3400
NoConn ~ 1850 3500
NoConn ~ 1850 3600
NoConn ~ 1850 3700
NoConn ~ 1850 3900
NoConn ~ 1850 4500
NoConn ~ 1850 4600
NoConn ~ 1850 4700
NoConn ~ 1850 4800
NoConn ~ 1850 4900
NoConn ~ 1850 4200
NoConn ~ 1850 4300
NoConn ~ 2550 1600
$Comp
L R R15
U 1 1 550F0805
P 1400 2850
F 0 "R15" V 1480 2850 40  0000 C CNN
F 1 "47k" V 1407 2851 40  0000 C CNN
F 2 "" V 1330 2850 30  0000 C CNN
F 3 "" H 1400 2850 30  0000 C CNN
	1    1400 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 3200 1400 3200
Wire Wire Line
	1400 3200 1400 3100
Wire Wire Line
	1400 2600 1400 2550
Text GLabel 1850 2700 0    60   Input ~ 0
SIMSLP
Text GLabel 1850 2800 0    60   Input ~ 0
GPRS
$Comp
L R R13
U 1 1 55105420
P 1150 2000
F 0 "R13" V 1230 2000 40  0000 C CNN
F 1 "3.3k" V 1157 2001 40  0000 C CNN
F 2 "" V 1080 2000 30  0000 C CNN
F 3 "" H 1150 2000 30  0000 C CNN
	1    1150 2000
	-1   0    0    1   
$EndComp
$Comp
L R R14
U 1 1 55105426
P 1150 2600
F 0 "R14" V 1230 2600 40  0000 C CNN
F 1 "10k" V 1157 2601 40  0000 C CNN
F 2 "" V 1080 2600 30  0000 C CNN
F 3 "" H 1150 2600 30  0000 C CNN
	1    1150 2600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR46
U 1 1 5510542C
P 1150 2950
F 0 "#PWR46" H 1150 2700 60  0001 C CNN
F 1 "GND" H 1150 2800 60  0000 C CNN
F 2 "" H 1150 2950 60  0000 C CNN
F 3 "" H 1150 2950 60  0000 C CNN
	1    1150 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2250 1150 2350
Wire Wire Line
	1150 2950 1150 2850
Wire Wire Line
	1150 2300 1850 2300
Connection ~ 1150 2300
$Comp
L CONN_01X10 P3
U 1 1 55105CAB
P 4150 4550
F 0 "P3" H 4150 5100 50  0000 C CNN
F 1 "CONN_01X10" V 4250 4550 50  0000 C CNN
F 2 "" H 4150 4550 60  0000 C CNN
F 3 "" H 4150 4550 60  0000 C CNN
	1    4150 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3800 4400 3800
Wire Wire Line
	4400 3800 4400 4200
Wire Wire Line
	3850 4100 3950 4100
Wire Wire Line
	3950 4200 3850 4200
Wire Wire Line
	3850 4300 3950 4300
Wire Wire Line
	3950 4400 3850 4400
Wire Wire Line
	3850 4500 3950 4500
Wire Wire Line
	3950 4600 3850 4600
Wire Wire Line
	3850 4700 3950 4700
Wire Wire Line
	3950 4800 3850 4800
Wire Wire Line
	3850 4900 3950 4900
Wire Wire Line
	3950 5000 3850 5000
Wire Wire Line
	1350 4000 1400 4000
Wire Wire Line
	1800 4000 1850 4000
$Comp
L +3V3 #PWR45
U 1 1 55210453
P 800 4000
F 0 "#PWR45" H 800 3850 60  0001 C CNN
F 1 "+3V3" H 800 4140 60  0000 C CNN
F 2 "" H 800 4000 60  0000 C CNN
F 3 "" H 800 4000 60  0000 C CNN
	1    800  4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	800  4000 850  4000
$Comp
L +3V3 #PWR47
U 1 1 552104CB
P 1400 2550
F 0 "#PWR47" H 1400 2400 60  0001 C CNN
F 1 "+3V3" H 1400 2690 60  0000 C CNN
F 2 "" H 1400 2550 60  0000 C CNN
F 3 "" H 1400 2550 60  0000 C CNN
	1    1400 2550
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR50
U 1 1 552104D7
P 3150 1500
F 0 "#PWR50" H 3150 1350 60  0001 C CNN
F 1 "+3V3" H 3150 1640 60  0000 C CNN
F 2 "" H 3150 1500 60  0000 C CNN
F 3 "" H 3150 1500 60  0000 C CNN
	1    3150 1500
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR54
U 1 1 552104DD
P 4850 1800
F 0 "#PWR54" H 4850 1650 60  0001 C CNN
F 1 "+3V3" H 4850 1940 60  0000 C CNN
F 2 "" H 4850 1800 60  0000 C CNN
F 3 "" H 4850 1800 60  0000 C CNN
	1    4850 1800
	1    0    0    -1  
$EndComp
$EndSCHEMATC