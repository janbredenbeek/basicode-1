10 GOTO 1000:REM Basicode-2 subroutines
20 CLEAR:IN$=" ":SR=0:SR$="":CT=0:CN=0:OHT%=80:OVT%=24
22 KEY OFF:SCREEN 0:WIDTH OHT%:COLOR 7,0,0:CLS:RANDOMIZE TIMER*100
29 GOTO 1010
100 CLS:RETURN
110 GOSUB 111:LOCATE OVE%+1,OHO%+1:RETURN
111 OVE%=INT(VE):OHO%=INT(HO)
112 IF OVE%<0 THEN OVE%=0 ELSE IF OVE%>=OVT% THEN OVE%=OVT%-1
113 IF OHO%<0 THEN OHO%=0 ELSE IF OHO%>=OHT% THEN OHO%=OHT%-1
114 RETURN
120 HO=POS(0)-1:VE=CSRLIN-1:RETURN
200 IN$=INKEY$:RETURN
210 IN$=INPUT$(1):RETURN
250 BEEP:RETURN
260 RV=RND:RETURN
270 FR=FRE(""):RETURN
300 SR$=MID$(STR$(ABS(SR)),2):IF LEFT$(SR$,1)="." THEN SR$="0"+SR$
301 IF SR<0 THEN SR$="-"+SR$
302 RETURN
310 O#=ABS(SR)+.5*10^-CN:O!=INT(O#):O#=1+O#-O!:O$=""
311 IF CN THEN O$="."+STRING$(CN,48):IF O#>1 THEN MID$(O$,1)=MID$(STR$(O#),3)
312 O$=MID$(STR$(O!),2)+O$:IF VAL(O$)>0 AND SR<0 THEN O$="-"+O$
313 IF LEN(O$)<=CT THEN SR$=SPACE$(CT-LEN(O$))+O$:RETURN
314 SR$=STRING$(CT,42):RETURN
350 LPRINT SR$;:RETURN
360 LPRINT:RETURN
 1000 A=4000:GOTO 20:REM RADIO
 1010 REM++++ RADIO 52.BC ++++
 1020 GOSUB 2000:REM INIT
 1030 GOSUB 6000:REM HOOFD MENU
 1040 ON MH GOSUB 7000,8000,10000,11000,12000
 1050 IF E1=0 THEN 1030
 1060 END
 1070 REM 1. AM         
 1080 REM 2. FM - BAND
 1090 REM 3. PRINTEN
 1100 REM 4. UITLEG
 1110 REM 5. STOPPEN
 2000 REM++++ INIT ++++
 2010 GOSUB 2100:REM DIM
 2020 GOSUB 2200:REM INIT VARIABELEN
 2030 GOSUB 3000:REM INIT AM
 2040 GOSUB 4000:REM INIT FM
 2050 RETURN
 2100 REM++++ DIM ++++
 2110 DIM ME$(10),LA$(100),LF$(100)
 2120 DIM AM$(10),A1$(10),A3$(10),A5$(10)
 2130 DIM RR(10),MR(10)
 2140 DIM FM$(10),RR$(10,10),FL$(10),F2$(10),F3$(10),F4$(10)
 2150 RETURN
 2200 REM++++ INIT VARIABELEN ++++
 2210 E1=0:REM EINDE
 2220 MH=4:REM MENU HOOFD
 2230 MG=1:REM MENU AM
 2240 M1=1:M3=1:M5=1
 2250 MF=1:REM MENU FM
 2260 NR=1:NL=1:N2=1:N3=1:N4=1
 2270 FOR AA=1 TO 10
 2280 MR(AA)=1
 2290 NEXT AA
 2300 LA=0:REM LIJST AM
 2310 LF=0:REM LIJST FM
 2320 RG$="RADIO GOLFLENGTEN"
 2330 KL$="          ":REM KANTLIJN PRINTER
 2340 RETURN
 2400 REM++++ GOED J/N ++++
 2410 PRINT
 2420 PRINT"+++++++++++++++"
 2430 PRINT
 2440 PRINT"+++++++++++++++";
 2450 GOSUB 120
 2460 VE=VE-1:HO=0:GOSUB 110
 2470 JN$="===> :GOED"
 2480 GOSUB 2500:REM J/N
 2490 RETURN
 2500 REM++++ J/N ++++
 2510 PRINT JN$;" ? J/N ";
 2520 JN=0
 2530 GOSUB 210
 2540 IF(IN$="J") OR(IN$="j") THEN JN=1
 2550 IF(IN$="N") OR(IN$="n") THEN JN=2
 2560 IF JN=0 THEN GOSUB 250:GOTO 2530
 2570 JN$="":PRINT
 2580 RETURN
 2600 REM++++ BEDIENING ++++
 2610 VE=12:HO=0:GOSUB 110
 2620 PRINT"---------------"
 2630 PRINT"SPATIE = KIEZEN"
 2640 PRINT"RETURN = DOEN"
 2650 RETURN
 2700 REM++++ KOP ++++
 2710 GOSUB 100
 2720 K1$=""
 2730 FOR AA=1 TO LEN(KO$)
 2740 K1$=K1$+"="
 2750 NEXT AA
 2760 K3$="-----:-------:---------:--------:------"
 2770 PRINT KO$
 2780 PRINT K1$
 2790 PRINT
 2800 PRINT K2$
 2810 PRINT K3$
 2820 RETURN
 2900 REM++++ TOETS ++++
 2910 T1=0
 2920 GOSUB 200
 2930 IF IN$="" THEN 2920
 2940 IF IN$=" " THEN T1=1
 2950 IF IN$=CHR$(13) THEN T1=2
 2960 IF T1=0 THEN GOSUB 250:GOTO 2920
 2970 RETURN
 3000 REM++++ INIT AM ++++
 3010 AM=3:A1=2:A3=1:A5=2
 3020 AM$(0)="MIDDEN GOLF"
 3030 AM$(1)="RADIO 1"
 3040 AM$(2)="RADIO 3"
 3050 AM$(3)="RADIO 5"
 3060 A1$(1)="Flevoland: 747 kHz: 402m"
 3070 A1$(2)="Hulsberg :1251 kHz: 240m"
 3080 A3$(1)="Lopik    : 675 kHz: 444m"
 3090 A5$(1)="Flevoland:1008 kHz: 298m"
 3100 A5$(2)="Hulsberg : 891 kHz: 337m"
 3110 RETURN
 4000 REM++++ INIT FM ++++
 4010 GOSUB 4100:REM FM KEUZE
 4020 GOSUB 4200:REM FM RADIO 1 REGIO
 4030 GOSUB 4700:REM FM RADIO 1 LAND
 4040 GOSUB 4800:REM FM RADIO 2
 4050 GOSUB 4900:REM FM RADIO 3
 4060 GOSUB 5100:REM FM RADIO 4
 4070 RETURN
 4100 REM++++ FM KEUZE ++++
 4110 FM=5
 4120 FM$(0)="FM - BAND"
 4130 FM$(1)="RADIO 1 REGIO"
 4140 FM$(2)="RADIO 1 LAND"
 4150 FM$(3)="RADIO 2"
 4160 FM$(4)="RADIO 3"
 4170 FM$(5)="RADIO 4"
 4180 RETURN
 4200 REM++++ FM RADIO 1 REGIO ++++
 4210 RR(0)=9
 4220 RR(1)=1
 4230 RR$(1,0)="NOORD     "
 4240 RR$(1,1)="Hoogezand: 97.5MHz:kan35"
 4250 RR(2)=1
 4260 RR$(2,0)="FRIESLAND "
 4270 RR$(2,1)="Irnsum   : 88.6MHz:kan 5"
 4280 RR(3)=1
 4290 RR$(3,0)="DRENTHE   "
 4300 RR$(3,1)="Smilde   : 90.8MHz:kan13"
 4310 RR(4)=3
 4320 RR$(4,0)="OOST      "
 4330 RR$(4,1)="Losser   : 89.4MHz:kan 8"
 4340 RR$(4,2)="Markelo  : 95.6MHz:kan29"
 4350 RR$(4,3)="Zwollerke: 99.4MHz:kan41"
 4360 RR(5)=3
 4370 RR$(5,0)="GELDERLAND"
 4380 RR$(5,1)="Megen    : 89.1MHz:kan 7"
 4390 RR$(5,2)="Ruurlo   : 90.4MHz:kan11"
 4400 RR$(5,3)="Uchelen  :103.5MHz:kan55"
 4410 RR(6)=4
 4420 RR$(6,0)="N-HOLLAND "
 4430 RR$(6,1)="Wieringer: 93.9MHz:kan23"
 4440 RR$(6,2)="Amsterdam: 94.3MHz:kan24"
 4450 RR$(6,3)="Haarlem  : 97.6MHz:kan35"
 4460 RR$(6,4)="Hilversum: 93.1MHz:kan20"
 4470 RR(7)=1
 4480 RR$(7,0)="WEST      "
 4490 RR$(7,1)="Den Haag : 88.4MHz:kan 5"
 4500 RR(8)=4
 4510 RR$(8,0)="BRABANT   "
 4520 RR$(8,1)="Loon/zand: 98.2MHz:kan37"
 4530 RR$(8,2)="Megen    : 95.8MHz:kan29"
 4540 RR$(8,3)="Mierlo   : 91.9MHz:kan16"
 4550 RR$(8,4)="Roosendaa: 95.4MHz:kan28"
 4560 RR(9)=2
 4570 RR$(9,0)="LIMBURG   "
 4580 RR$(9,1)="Roermond :100.3MHz:kan44"
 4590 RR$(9,2)="Hulsberg : 95.3MHz:kan28"
 4600 RETURN
 4700 REM++++ FM RADIO 1 LAND ++++
 4710 FL=3
 4720 FL$(1)="Lelystad :102.1MHz:kan50"
 4730 FL$(2)="Lopik    :100.7MHz:kan46"
 4740 FL$(3)="Goes     :101.9MHz:kan50"
 4750 RETURN
 4800 REM++++ FM RADIO 2 ++++
 4810 F2=7
 4820 F2$(1)="Smilde   : 88.0MHz:kan 3"
 4830 F2$(2)="Markelo  : 91.4MHz:kan15"
 4840 F2$(3)="Lopik    : 92.6MHz:kan19"
 4850 F2$(4)="Wieringer: 87.7MHz:kan 2"
 4860 F2$(5)="Goes     : 87.9MHz:kan 3"
 4870 F2$(6)="Roermond : 88.2MHz:kan 4"
 4880 F2$(7)="Hulsberg : 92.1MHz:kan17"
 4890 RETURN
 4900 REM++++ FM RADIO 3 ++++
 4910 F3=8
 4920 F3$(1)="Smilde   : 91.8MHz:kan16"
 4930 F3$(2)="Markelo  : 96.2MHz:kan31"
 4940 F3$(3)="Lopik    : 96.8MHz:kan33"
 4950 F3$(4)="Wieringer: 89.8MHz:kan 9"
 4960 F3$(5)="Goes     : 95.0MHz:kan27"
 4970 F3$(6)="Roermond : 90.9MHz:kan13"
 4980 F3$(7)="Hulsberg :103.9MHz:kan56"
 4990 F3$(8)="  RYNMOND:Rotterdam: 93.4MHz:kan21"
 5000 RETURN
 5100 REM++++ FM RADIO 4 ++++
 5110 F4=7
 5120 F4$(1)="Smilde   : 94.8MHz:kan26"
 5130 F4$(2)="Markelo  : 98.4MHz:kan38"
 5140 F4$(3)="Lopik    : 98.9MHz:kan40"
 5150 F4$(4)="Wieringer: 92.2MHz:kan17"
 5160 F4$(5)="Goes     : 99.8MHz:kan43"
 5170 F4$(6)="Roermond : 94.5MHz:kan25"
 5180 F4$(7)="Hulsberg : 98.7MHz:kan39"
 5190 RETURN
 6000 REM++++ HOOFD MENU ++++
 6010 HA=1:REM HOOFD MENU ACTIEF
 6020 GOSUB 270
 6030 SR=FR:GOSUB 300
 6040 FR$=SR$
 6050 MM=5:MK=MH
 6060 ME$(0)=RG$+"    FR = "+FR$
 6070 ME$(1)=AM$(0)
 6080 ME$(2)=FM$(0)
 6090 ME$(3)="PRINTEN"
 6100 ME$(4)="UITLEG"
 6110 ME$(5)="STOPPEN"
 6120 GOSUB 6200:REM MENU
 6130 MH=MK
 6140 HA=0
 6150 RETURN
 6200 REM++++ MENU ++++
 6210 GOSUB 100
 6220 PRINT ME$(0)
 6230 GOSUB 2600:REM BEDIENING
 6240 VE=2:HO=0
 6250 IF HA=1 THEN VE=4
 6260 GOSUB 110
 6270 FOR AA=1 TO MM
 6280 IF AA=MK THEN PRINT" ===>";
 6290 IF AA<>MK THEN PRINT"     ";
 6300 PRINT ME$(AA)
 6310 IF MM>5 THEN 6350
 6320 IF HA=0 THEN 6340
 6330 IF AA<>3 THEN 6350
 6340 PRINT
 6350 NEXT AA
 6360 GOSUB 2900:REM TOETS
 6370 IF T1=2 THEN 6410
 6380 MK=MK+1
 6390 IF MK=MM+1 THEN MK=1
 6400 GOTO 6240
 6410 RETURN
 7000 REM++++ AM ++++
 7010 GOSUB 7100:REM AM MENU
 7020 GOSUB 7200:REM AM ZENDERS
 7030 GOSUB 7600:REM AM GOED
 7040 IF JN=2 THEN 7060
 7050 GOSUB 7700:REM VERHOOG LA
 7060 GOSUB 7800:REM AM LIJST
 7070 RETURN
 7100 REM++++ AM MENU ++++
 7110 MM=AM:MK=MG
 7120 FOR AA=0 TO AM
 7130 ME$(AA)=AM$(AA)
 7140 NEXT AA
 7150 GOSUB 6200:REM MENU
 7160 MG=MK
 7170 RETURN
 7200 REM++++ AM ZENDERS ++++
 7210 ME$(0)=AM$(MG)
 7220 LA$=AM$(MG)+":"
 7230 ON MG GOSUB 7300,7400,7500
 7240 RETURN
 7250 REM 1. RADIO 1 AM
 7260 REM 2. RADIO 3 AM
 7270 REM 3. RADIO 5 AM
 7300 REM++++ RADIO 1 AM ++++
 7310 MM=A1:MK=M1
 7320 FOR AA=1 TO A1
 7330 ME$(AA)=LEFT$(A1$(AA),9)
 7340 NEXT AA
 7350 GOSUB 6200:REM MENU
 7360 M1=MK
 7370 LA$=LA$+A1$(M1)
 7380 RETURN
 7400 REM++++ RADIO 3 AM ++++
 7410 MM=A3:MK=M3
 7420 FOR AA=1 TO A3
 7430 ME$(AA)=LEFT$(A3$(AA),9)
 7440 NEXT AA
 7450 GOSUB 6200:REM MENU
 7460 M3=MK
 7470 LA$=LA$+A3$(M3)
 7480 RETURN
 7500 REM++++ RADIO 5 AM ++++
 7510 MM=A5:MK=M5
 7520 FOR AA=1 TO A5
 7530 ME$(AA)=LEFT$(A5$(AA),9)
 7540 NEXT AA
 7550 GOSUB 6200:REM MENU
 7560 M5=MK
 7570 LA$=LA$+A5$(M5)
 7580 RETURN
 7600 REM++++ AM GOED ++++
 7610 GOSUB 7800:REM AM LIJST
 7620 PRINT"===> :";LA$
 7630 GOSUB 2400:REM GOED J/N
 7640 RETURN
 7700 REM++++ VERHOOG LA ++++
 7710 LA=LA+1
 7720 SR=LA:GOSUB 300
 7730 IF LA<10 THEN SR$=" "+SR$
 7740 SR$=" "+SR$+"  :"
 7750 LA$(LA)=SR$+LA$
 7760 RETURN
 7800 REM++++ AM LIJST ++++
 7810 KO$=RG$+" "+AM$(0)
 7820 K2$="toets:station:zender   :freq.   :band"
 7830 GOSUB 2700:REM KOP
 7840 IF LA=0 THEN 7880
 7850 FOR AA=1 TO LA
 7860 PRINT LA$(AA)
 7870 NEXT AA
 7880 RETURN
 8000 REM++++ FM - BAND ++++
 8010 GOSUB 8100:REM FM MENU
 8020 GOSUB 8200:REM FM ZENDERS
 8030 GOSUB 9100:REM FM GOED
 8040 IF JN=2 THEN 8060
 8050 GOSUB 9200:REM VERHOOG LF
 8060 GOSUB 9300:REM FM LIJST
 8070 RETURN
 8100 REM++++ FM MENU ++++
 8110 MM=FM:MK=MF
 8120 FOR AA=0 TO FM
 8130 ME$(AA)=FM$(AA)
 8140 NEXT AA
 8150 GOSUB 6200:REM MENU
 8160 MF=MK
 8170 RETURN
 8200 REM++++ FM ZENDERS ++++
 8210 ME$(0)=FM$(MF)
 8220 LF$=LEFT$(FM$(MF),7)+":"
 8230 ON MF GOSUB 8300,8600,8700,8800,9000
 8240 RETURN
 8250 REM 1. RADIO 1 FM REGIO
 8260 REM 2. RADIO 1 FM LAND
 8270 REM 3. RADIO 2 FM
 8280 REM 4. RADIO 3 FM
 8290 REM 5. RADIO 4 FM
 8300 REM++++ RADIO 1 FM REGIO ++++
 8310 MM=RR(0):MK=NR
 8320 FOR AA=1 TO MM
 8330 ME$(AA)=LEFT$(RR$(AA,0),10)
 8340 NEXT AA
 8350 GOSUB 6200:REM MENU
 8360 NR=MK
 8370 LF$=LEFT$(RR$(NR,0),7)+":"
 8380 GOSUB 8500:REM RADIO REGIO
 8390 LF$=LF$+RR$(NR,MK)
 8400 RETURN
 8500 REM++++ RADIO REGIO ++++
 8510 MM=RR(NR):MK=MR(NR)
 8520 ME$(0)=FM$(MF)+" :"+RR$(NR,0)
 8530 FOR AA=1 TO MM
 8540 ME$(AA)=LEFT$(RR$(NR,AA),9)
 8550 NEXT AA
 8560 GOSUB 6200:REM MENU
 8570 MR(NR)=MK
 8580 RETURN
 8600 REM++++ RADIO 1 FM LAND ++++
 8610 MM=FL:MK=NL
 8620 FOR AA=1 TO FL
 8630 ME$(AA)=LEFT$(FL$(AA),9)
 8640 NEXT AA
 8650 GOSUB 6200:REM MENU
 8660 NL=MK
 8670 LF$=LF$+FL$(NL)
 8680 RETURN
 8700 REM++++ RADIO 2 FM ++++
 8710 MM=F2:MK=N2
 8720 FOR AA=1 TO F2
 8730 ME$(AA)=LEFT$(F2$(AA),9)
 8740 NEXT AA
 8750 GOSUB 6200:REM MENU
 8760 N2=MK
 8770 LF$=LF$+F2$(N2)
 8780 RETURN
 8800 REM++++ RADIO 3 FM ++++
 8810 MM=F3:MK=N3
 8820 FOR AA=1 TO F3
 8830 ME$(AA)=LEFT$(F3$(AA),9)
 8840 NEXT AA
 8850 GOSUB 6200:REM MENU
 8860 N3=MK
 8870 LF$=LF$+F3$(N3)
 8880 IF LEFT$(F3$(N3),4)<>"  RY" THEN 8900
 8890 LF$=RIGHT$(F3$(N3),LEN(F3$(N3))-2)
 8900 RETURN
 9000 REM++++ RADIO 4 FM ++++
 9010 MM=F4:MK=N4
 9020 FOR AA=1 TO F4
 9030 ME$(AA)=LEFT$(F4$(AA),9)
 9040 NEXT AA
 9050 GOSUB 6200:REM MENU
 9060 N4=MK
 9070 LF$=LF$+F4$(N4)
 9080 RETURN
 9100 REM++++ FM GOED ++++
 9110 GOSUB 9300:REM FM LIJST
 9120 PRINT"===> :";LF$
 9130 GOSUB 2400:REM GOED J/N
 9140 RETURN
 9200 REM++++ VERHOOG LF ++++
 9210 LF=LF+1
 9220 SR=LF:GOSUB 300
 9230 IF LF<10 THEN SR$=" "+SR$
 9240 SR$=" "+SR$+"  :"
 9250 LF$(LF)=SR$+LF$
 9260 RETURN
 9300 REM++++ FM LIJST ++++
 9310 KO$=RG$+" "+FM$(0)
 9320 K2$="toets:station:zender   :freq.   :kan."
 9330 GOSUB 2700:REM KOP
 9340 IF LF=0 THEN 9380
 9350 FOR AA=1 TO LF
 9360 PRINT LF$(AA)
 9370 NEXT AA
 9380 RETURN
10000 REM++++ PRINTEN ++++
10010 GOSUB 10100:REM PRINTER AAN?
10020 IF JN=2 THEN 10060
10030 GOSUB 10200:REM AM PRINT
10040 GOSUB 10300:REM FM PRINT
10050 GOSUB 10500:REM PRINT EIND
10060 RETURN
10100 REM++++ PRINTER AAN? ++++
10110 GOSUB 100
10120 PRINT ME$(MH)
10130 PRINT
10140 JN$="STAAT PRINTER AAN"
10150 GOSUB 2500:REM J/N
10160 RETURN
10200 REM++++ AM PRINT ++++
10210 IF LA=0 THEN 10270
10220 GOSUB 7800:REM AM LIJST
10230 GOSUB 10400:REM PRINT KOP
10240 FOR AA=1 TO LA
10250 SR$=KL$+LA$(AA):GOSUB 350:GOSUB 360
10260 NEXT AA
10270 RETURN
10300 REM++++ FM PRINT ++++
10310 IF LF=0 THEN 10370
10320 GOSUB 9300:REM FM LIJST
10330 GOSUB 10400:REM PRINT KOP
10340 FOR AA=1 TO LF
10350 SR$=KL$+LF$(AA):GOSUB 350:GOSUB 360
10360 NEXT AA
10370 RETURN
10400 REM++++ PRINT KOP ++++
10410 SR$="":GOSUB 350:GOSUB 360
10420 SR$=KL$+KO$:GOSUB 350:GOSUB 360
10430 SR$=KL$+K1$:GOSUB 350:GOSUB 360
10440 SR$=KL$+K2$:GOSUB 350:GOSUB 360
10450 SR$=KL$+K3$:GOSUB 350:GOSUB 360
10460 RETURN
10500 REM++++ PRINT EIND ++++
10510 IF(LA=0) AND(LF=0) THEN 10590
10520 SR$="":GOSUB 350:GOSUB 360
10530 PU$=""
10540 FOR AA=1 TO 60
10550 PU$=PU$+"."
10560 NEXT AA
10570 SR$=PU$:GOSUB 350:GOSUB 360
10580 SR$="":GOSUB 350:GOSUB 360
10590 RETURN
11000 REM++++ UITLEG ++++
11010 GOSUB 11100:REM INTRO
11020 IF BP=3 THEN 11040
11030 GOSUB 11400:REM LEES AFDRUK
11040 RETURN
11100 REM++++ INTRO ++++
11110 GOSUB 100
11120 PRINT"UITLEG RADIO GOLFLENGTEN"
11130 PRINT"====== ===== ==========="
11140 VE=8:HO=0:GOSUB 110
11150 PRINT"  B = BEELDSCHERM"
11160 PRINT
11170 PRINT"  P = PRINTER       jouw keuze ";
11180 GOSUB 120
11190 PRINT:PRINT
11200 PRINT"  M = MENU"
11210 GOSUB 110
11220 BP=0:REM BEELD OF PRINTER
11230 GOSUB 210
11240 IF(IN$="B") OR(IN$="b") THEN BP=1
11250 IF(IN$="P") OR(IN$="p") THEN BP=2
11260 IF(IN$="M") OR(IN$="m") THEN BP=3
11270 IF BP=0 THEN GOSUB 250:GOTO 11230
11280 PRINT IN$
11290 IF BP<>2 THEN 11340
11300 VE=15:HO=10:GOSUB 110
11310 JN$="STAAT PRINTER AAN"
11320 GOSUB 2500:REM J/N
11330 IF JN=2 THEN 11110
11340 PRINT
11350 GOSUB 100
11360 RETURN
11400 REM++++ LEES AFDRUK ++++
11410 RT=16:REM REGELTELLER HELE BLZ.
11420 RESTORE
11430 READ SR$
11440 IF SR$="END" THEN 11470
11450 GOSUB 11500:REM AFDRUK
11460 GOTO 11430
11470 IF BP=2 THEN 11490
11480 GOSUB 210
11490 RETURN
11500 REM++++ AFDRUK ++++
11510 ON BP GOTO 11600,11700
11600 REM++++ AFDRUK BEELDSCHERM ++++
11610 PRINT SR$
11620 RT=RT-1:REM REGELTELLER - 1
11630 IF RT>0 THEN 11650
11640 GOSUB 11800:REM VERVOLG
11650 RETURN
11700 REM++++ AFDRUK PRINTER ++++
11710 SR$=KL$+SR$:REM voeg kantlijn toe
11720 GOSUB 350
11730 GOSUB 360
11740 RETURN
11800 REM++++ VERVOLG ++++
11810 RT=8:REM REGELTELLER HALVE BLZ.
11820 PRINT
11830 PRINT"            V = VERVOLG ";
11840 GOSUB 210
11850 IF(IN$="V") OR(IN$="v") THEN 11870
11860 GOSUB 250:GOTO 11840
11870 GOSUB 120
11880 HO=0:GOSUB 110
11890 PRINT"                       ";
11900 VE=VE-1:GOSUB 110
11910 RETURN
12000 REM++++ STOPPEN ++++
12010 GOSUB 100
12020 PRINT"STOPPEN"
12030 PRINT
12040 JN$="WIL JE STOPPEN"
12050 GOSUB 2500:REM J/N
12060 IF JN=2 THEN 12080
12070 E1=1
12080 RETURN
25000 REM++++ DATAREGELS ++++
25010 DATA"                 NIJMEGEN  1 jan 1989"
25020 DATA" "
25030 DATA"           UITLEG RADIO GOLFLENGTEN"
25040 DATA"           ====== ===== ==========="
25050 DATA" "
25060 DATA"Dit programma biedt de mogelijkheid"
25070 DATA" voor U om een zender lijstje te"
25080 DATA" maken voor Uw (auto) radio."
25090 DATA" "
25100 DATA"Met behulp van deze gegevens zou U de"
25110 DATA" voorkeuze toetsen in kunnen stellen"
25120 DATA" en deze gegevens altijd bij de hand"
25130 DATA" hebben als U de instelling per"
25140 DATA" ongeluk verandert."
25150 DATA" "
25160 DATA"Ook kunt U periodiek een lijstje samen"
25170 DATA" stellen als U regelmatig rondtoert en"
25180 DATA" een bepaalde zender in verschillende"
25190 DATA" delen van het land wilt 'volgen'."
25200 DATA"STEL DAN WEL VAN TE VOREN DE ZENDERS IN"
25210 DATA" dit komt de verkeers veiligheid ten"
25220 DATA" goede."
25230 DATA" "
25240 DATA"Ten overvloede vermeld ik dat het"
25250 DATA" lijstje ook voor Uw (huis) radio"
25260 DATA" geldt ALS u op een EIGEN antenne"
25270 DATA" ontvangt."
25280 DATA"De meeste kabel systemen zetten de"
25290 DATA" zenders om naar andere frequenties."
25300 DATA" "
25310 DATA"Uiteraard kunt U alleen afstemmen op"
25320 DATA" de zenders welke in Uw ontvangst"
25330 DATA" gebied liggen."
25340 DATA"Houd hiermee rekening."
25350 REM++++ DATAREGELS AFZENDER ++++
25360 DATA" "
25370 DATA" "
25380 DATA"met groetjes van Frans Verberkt"
25390 DATA"                 Hillekensacker 12 - 10"
25400 DATA"                 6546 KG NIJMEGEN"
25410 DATA" "
25420 DATA"                 tel: 080 - 779555"
25430 DATA" "
25440 DATA"      Tot ziens"
25450 DATA" "
25460 DATA" "
25470 REM++++ DATAREGEL END ++++
25480 DATA"END"
30000 REM RADIO NEDERLAND
30010 REM
30020 REM gemaakt op APPLE 27 dec 1988
30030 REM
30040 REM FRANS VERBERKT
30050 REM HILLEKENSACKER 12-10
30060 REM 6546 KG NIJMEGEN
30070 REM
30080 REM TEL 080 - 779555
30090 REM
30100 REM COPYRIGHT NOS HILVERSUM
