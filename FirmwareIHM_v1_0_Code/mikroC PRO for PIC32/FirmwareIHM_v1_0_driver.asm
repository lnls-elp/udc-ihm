_PMPWaitBusy:
;FirmwareIHM_v1_0_driver.c,72 :: 		void PMPWaitBusy() {
;FirmwareIHM_v1_0_driver.c,73 :: 		while(PMMODEbits.BUSY);
L_PMPWaitBusy0:
LBU	R2, Offset(PMMODEbits+1)(GP)
EXT	R2, R2, 7, 1
BNE	R2, R0, L__PMPWaitBusy386
NOP	
J	L_PMPWaitBusy1
NOP	
L__PMPWaitBusy386:
J	L_PMPWaitBusy0
NOP	
L_PMPWaitBusy1:
;FirmwareIHM_v1_0_driver.c,74 :: 		}
L_end_PMPWaitBusy:
JR	RA
NOP	
; end of _PMPWaitBusy
_Set_Index:
;FirmwareIHM_v1_0_driver.c,76 :: 		void Set_Index(unsigned short index) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,77 :: 		TFT_RS = 0;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;FirmwareIHM_v1_0_driver.c,78 :: 		PMDIN = index;
ANDI	R2, R25, 255
SW	R2, Offset(PMDIN+0)(GP)
;FirmwareIHM_v1_0_driver.c,79 :: 		PMPWaitBusy();
JAL	_PMPWaitBusy+0
NOP	
;FirmwareIHM_v1_0_driver.c,80 :: 		}
L_end_Set_Index:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Set_Index
_Write_Command:
;FirmwareIHM_v1_0_driver.c,82 :: 		void Write_Command( unsigned short cmd ) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,83 :: 		TFT_RS = 1;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;FirmwareIHM_v1_0_driver.c,84 :: 		PMDIN = cmd;
ANDI	R2, R25, 255
SW	R2, Offset(PMDIN+0)(GP)
;FirmwareIHM_v1_0_driver.c,85 :: 		PMPWaitBusy();
JAL	_PMPWaitBusy+0
NOP	
;FirmwareIHM_v1_0_driver.c,86 :: 		}
L_end_Write_Command:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Write_Command
_Write_Data:
;FirmwareIHM_v1_0_driver.c,88 :: 		void Write_Data(unsigned int _data) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,89 :: 		TFT_RS = 1;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;FirmwareIHM_v1_0_driver.c,90 :: 		PMDIN = _data;
ANDI	R2, R25, 65535
SW	R2, Offset(PMDIN+0)(GP)
;FirmwareIHM_v1_0_driver.c,91 :: 		PMPWaitBusy();
JAL	_PMPWaitBusy+0
NOP	
;FirmwareIHM_v1_0_driver.c,92 :: 		}
L_end_Write_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Write_Data
_Init_ADC:
;FirmwareIHM_v1_0_driver.c,95 :: 		void Init_ADC() {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,96 :: 		AD1PCFG = 0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;FirmwareIHM_v1_0_driver.c,97 :: 		PCFG12_bit = 0;
LUI	R2, BitMask(PCFG12_bit+0)
ORI	R2, R2, BitMask(PCFG12_bit+0)
_SX	
;FirmwareIHM_v1_0_driver.c,98 :: 		PCFG13_bit = 0;
LUI	R2, BitMask(PCFG13_bit+0)
ORI	R2, R2, BitMask(PCFG13_bit+0)
_SX	
;FirmwareIHM_v1_0_driver.c,99 :: 		ADC1_Init();
JAL	_ADC1_Init+0
NOP	
;FirmwareIHM_v1_0_driver.c,100 :: 		}
L_end_Init_ADC:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Init_ADC
FirmwareIHM_v1_0_driver_InitializeTouchPanel:
;FirmwareIHM_v1_0_driver.c,101 :: 		static void InitializeTouchPanel() {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,102 :: 		Init_ADC();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Init_ADC+0
NOP	
;FirmwareIHM_v1_0_driver.c,103 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
LUI	R27, hi_addr(_Write_Data+0)
ORI	R27, R27, lo_addr(_Write_Data+0)
LUI	R26, hi_addr(_Write_Command+0)
ORI	R26, R26, lo_addr(_Write_Command+0)
LUI	R25, hi_addr(_Set_Index+0)
ORI	R25, R25, lo_addr(_Set_Index+0)
JAL	_TFT_Set_Active+0
NOP	
;FirmwareIHM_v1_0_driver.c,104 :: 		TFT_Init_ILI9341_8bit(240, 320);
ORI	R26, R0, 320
ORI	R25, R0, 240
JAL	_TFT_Init_ILI9341_8bit+0
NOP	
;FirmwareIHM_v1_0_driver.c,106 :: 		TP_TFT_Init(240, 320, 13, 12);                                  // Initialize touch panel
ORI	R28, R0, 12
ORI	R27, R0, 13
ORI	R26, R0, 320
ORI	R25, R0, 240
JAL	_TP_TFT_Init+0
NOP	
;FirmwareIHM_v1_0_driver.c,107 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
ORI	R25, R0, 900
JAL	_TP_TFT_Set_ADC_Threshold+0
NOP	
;FirmwareIHM_v1_0_driver.c,109 :: 		PenDown = 0;
SB	R0, Offset(_PenDown+0)(GP)
;FirmwareIHM_v1_0_driver.c,110 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,111 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,112 :: 		}
L_end_InitializeTouchPanel:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of FirmwareIHM_v1_0_driver_InitializeTouchPanel
_Calibrate:
;FirmwareIHM_v1_0_driver.c,114 :: 		void Calibrate() {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,115 :: 		TFT_Set_Pen(CL_WHITE, 3);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R26, R0, 3
ORI	R25, R0, 65535
JAL	_TFT_Set_Pen+0
NOP	
;FirmwareIHM_v1_0_driver.c,116 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;FirmwareIHM_v1_0_driver.c,117 :: 		TFT_Write_Text("Touch selected corners for calibration", 1, 160);
ORI	R27, R0, 160
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr1_FirmwareIHM_v1_0_driver+0)
ORI	R25, R25, lo_addr(?lstr1_FirmwareIHM_v1_0_driver+0)
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,118 :: 		TFT_Line(229, 309, 239, 319);
ORI	R28, R0, 319
ORI	R27, R0, 239
ORI	R26, R0, 309
ORI	R25, R0, 229
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,119 :: 		TFT_Line(233, 319, 239, 319);
ORI	R28, R0, 319
ORI	R27, R0, 239
ORI	R26, R0, 319
ORI	R25, R0, 233
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,120 :: 		TFT_Line(239, 313, 239, 319);
ORI	R28, R0, 319
ORI	R27, R0, 239
ORI	R26, R0, 313
ORI	R25, R0, 239
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,121 :: 		TFT_Write_Text("first here", 160, 290);
ORI	R27, R0, 290
ORI	R26, R0, 160
LUI	R25, hi_addr(?lstr2_FirmwareIHM_v1_0_driver+0)
ORI	R25, R25, lo_addr(?lstr2_FirmwareIHM_v1_0_driver+0)
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,123 :: 		TP_TFT_Calibrate_Min();                      // Calibration of TP minimum
JAL	_TP_TFT_Calibrate_Min+0
NOP	
;FirmwareIHM_v1_0_driver.c,124 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_Calibrate2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Calibrate2
NOP	
NOP	
NOP	
;FirmwareIHM_v1_0_driver.c,126 :: 		TFT_Set_Pen(CL_BLACK, 3);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_TFT_Set_Pen+0
NOP	
;FirmwareIHM_v1_0_driver.c,127 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;FirmwareIHM_v1_0_driver.c,128 :: 		TFT_Line(229, 309, 239, 319);
ORI	R28, R0, 319
ORI	R27, R0, 239
ORI	R26, R0, 309
ORI	R25, R0, 229
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,129 :: 		TFT_Line(233, 319, 239, 319);
ORI	R28, R0, 319
ORI	R27, R0, 239
ORI	R26, R0, 319
ORI	R25, R0, 233
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,130 :: 		TFT_Line(239, 313, 239, 319);
ORI	R28, R0, 319
ORI	R27, R0, 239
ORI	R26, R0, 313
ORI	R25, R0, 239
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,131 :: 		TFT_Write_Text("first here", 160, 290);
ORI	R27, R0, 290
ORI	R26, R0, 160
LUI	R25, hi_addr(?lstr3_FirmwareIHM_v1_0_driver+0)
ORI	R25, R25, lo_addr(?lstr3_FirmwareIHM_v1_0_driver+0)
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,133 :: 		TFT_Set_Pen(CL_WHITE, 3);
ORI	R26, R0, 3
ORI	R25, R0, 65535
JAL	_TFT_Set_Pen+0
NOP	
;FirmwareIHM_v1_0_driver.c,134 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;FirmwareIHM_v1_0_driver.c,135 :: 		TFT_Line(0, 0, 10, 10);
ORI	R28, R0, 10
ORI	R27, R0, 10
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,136 :: 		TFT_Line(0, 0, 6, 0);
MOVZ	R28, R0, R0
ORI	R27, R0, 6
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,137 :: 		TFT_Line(0, 0, 0, 6);
ORI	R28, R0, 6
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,138 :: 		TFT_Write_Text("now here", 20, 5);
ORI	R27, R0, 5
ORI	R26, R0, 20
LUI	R25, hi_addr(?lstr4_FirmwareIHM_v1_0_driver+0)
ORI	R25, R25, lo_addr(?lstr4_FirmwareIHM_v1_0_driver+0)
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,140 :: 		TP_TFT_Calibrate_Max();                       // Calibration of TP maximum
JAL	_TP_TFT_Calibrate_Max+0
NOP	
;FirmwareIHM_v1_0_driver.c,141 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_Calibrate4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Calibrate4
NOP	
NOP	
NOP	
;FirmwareIHM_v1_0_driver.c,142 :: 		}
L_end_Calibrate:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Calibrate
FirmwareIHM_v1_0_driver_InitializeObjects:
;FirmwareIHM_v1_0_driver.c,3023 :: 		static void InitializeObjects() {
;FirmwareIHM_v1_0_driver.c,3024 :: 		ScreenInicializacao.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenInicializacao+0)(GP)
;FirmwareIHM_v1_0_driver.c,3025 :: 		ScreenInicializacao.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenInicializacao+2)(GP)
;FirmwareIHM_v1_0_driver.c,3026 :: 		ScreenInicializacao.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenInicializacao+4)(GP)
;FirmwareIHM_v1_0_driver.c,3027 :: 		ScreenInicializacao.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenInicializacao+8)(GP)
;FirmwareIHM_v1_0_driver.c,3028 :: 		ScreenInicializacao.CButtons_RoundCount       = 0;
SH	R0, Offset(_ScreenInicializacao+16)(GP)
;FirmwareIHM_v1_0_driver.c,3029 :: 		ScreenInicializacao.LabelsCount               = 6;
ORI	R2, R0, 6
SH	R2, Offset(_ScreenInicializacao+24)(GP)
;FirmwareIHM_v1_0_driver.c,3030 :: 		ScreenInicializacao.Labels                    = Screen1_Labels;
LUI	R2, hi_addr(_Screen1_Labels+0)
ORI	R2, R2, lo_addr(_Screen1_Labels+0)
SW	R2, Offset(_ScreenInicializacao+28)(GP)
;FirmwareIHM_v1_0_driver.c,3031 :: 		ScreenInicializacao.CLabelsCount              = 0;
SH	R0, Offset(_ScreenInicializacao+32)(GP)
;FirmwareIHM_v1_0_driver.c,3032 :: 		ScreenInicializacao.CBoxesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenInicializacao+40)(GP)
;FirmwareIHM_v1_0_driver.c,3033 :: 		ScreenInicializacao.CBoxes                    = Screen1_CBoxes;
LUI	R2, hi_addr(_Screen1_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen1_CBoxes+0)
SW	R2, Offset(_ScreenInicializacao+44)(GP)
;FirmwareIHM_v1_0_driver.c,3034 :: 		ScreenInicializacao.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenInicializacao+48)(GP)
;FirmwareIHM_v1_0_driver.c,3035 :: 		ScreenInicializacao.LinesCount                = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenInicializacao+56)(GP)
;FirmwareIHM_v1_0_driver.c,3036 :: 		ScreenInicializacao.Lines                     = Screen1_Lines;
LUI	R2, hi_addr(_Screen1_Lines+0)
ORI	R2, R2, lo_addr(_Screen1_Lines+0)
SW	R2, Offset(_ScreenInicializacao+60)(GP)
;FirmwareIHM_v1_0_driver.c,3037 :: 		ScreenInicializacao.CLinesCount               = 0;
SH	R0, Offset(_ScreenInicializacao+64)(GP)
;FirmwareIHM_v1_0_driver.c,3038 :: 		ScreenInicializacao.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenInicializacao+72)(GP)
;FirmwareIHM_v1_0_driver.c,3039 :: 		ScreenInicializacao.ProgressBarsCount         = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenInicializacao+80)(GP)
;FirmwareIHM_v1_0_driver.c,3040 :: 		ScreenInicializacao.ProgressBars              = Screen1_ProgressBars;
LUI	R2, hi_addr(_Screen1_ProgressBars+0)
ORI	R2, R2, lo_addr(_Screen1_ProgressBars+0)
SW	R2, Offset(_ScreenInicializacao+84)(GP)
;FirmwareIHM_v1_0_driver.c,3041 :: 		ScreenInicializacao.ObjectsCount              = 9;
ORI	R2, R0, 9
SH	R2, Offset(_ScreenInicializacao+6)(GP)
;FirmwareIHM_v1_0_driver.c,3043 :: 		ScreenPrincipal.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenPrincipal+0)(GP)
;FirmwareIHM_v1_0_driver.c,3044 :: 		ScreenPrincipal.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenPrincipal+2)(GP)
;FirmwareIHM_v1_0_driver.c,3045 :: 		ScreenPrincipal.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenPrincipal+4)(GP)
;FirmwareIHM_v1_0_driver.c,3046 :: 		ScreenPrincipal.Buttons_RoundCount        = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenPrincipal+8)(GP)
;FirmwareIHM_v1_0_driver.c,3047 :: 		ScreenPrincipal.Buttons_Round             = Screen2_Buttons_Round;
LUI	R2, hi_addr(_Screen2_Buttons_Round+0)
ORI	R2, R2, lo_addr(_Screen2_Buttons_Round+0)
SW	R2, Offset(_ScreenPrincipal+12)(GP)
;FirmwareIHM_v1_0_driver.c,3048 :: 		ScreenPrincipal.CButtons_RoundCount       = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenPrincipal+16)(GP)
;FirmwareIHM_v1_0_driver.c,3049 :: 		ScreenPrincipal.CButtons_Round            = Screen2_CButtons_Round;
LUI	R2, hi_addr(_Screen2_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen2_CButtons_Round+0)
SW	R2, Offset(_ScreenPrincipal+20)(GP)
;FirmwareIHM_v1_0_driver.c,3050 :: 		ScreenPrincipal.LabelsCount               = 9;
ORI	R2, R0, 9
SH	R2, Offset(_ScreenPrincipal+24)(GP)
;FirmwareIHM_v1_0_driver.c,3051 :: 		ScreenPrincipal.Labels                    = Screen2_Labels;
LUI	R2, hi_addr(_Screen2_Labels+0)
ORI	R2, R2, lo_addr(_Screen2_Labels+0)
SW	R2, Offset(_ScreenPrincipal+28)(GP)
;FirmwareIHM_v1_0_driver.c,3052 :: 		ScreenPrincipal.CLabelsCount              = 9;
ORI	R2, R0, 9
SH	R2, Offset(_ScreenPrincipal+32)(GP)
;FirmwareIHM_v1_0_driver.c,3053 :: 		ScreenPrincipal.CLabels                   = Screen2_CLabels;
LUI	R2, hi_addr(_Screen2_CLabels+0)
ORI	R2, R2, lo_addr(_Screen2_CLabels+0)
SW	R2, Offset(_ScreenPrincipal+36)(GP)
;FirmwareIHM_v1_0_driver.c,3054 :: 		ScreenPrincipal.CBoxesCount               = 2;
ORI	R2, R0, 2
SH	R2, Offset(_ScreenPrincipal+40)(GP)
;FirmwareIHM_v1_0_driver.c,3055 :: 		ScreenPrincipal.CBoxes                    = Screen2_CBoxes;
LUI	R2, hi_addr(_Screen2_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen2_CBoxes+0)
SW	R2, Offset(_ScreenPrincipal+44)(GP)
;FirmwareIHM_v1_0_driver.c,3056 :: 		ScreenPrincipal.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenPrincipal+48)(GP)
;FirmwareIHM_v1_0_driver.c,3057 :: 		ScreenPrincipal.LinesCount                = 0;
SH	R0, Offset(_ScreenPrincipal+56)(GP)
;FirmwareIHM_v1_0_driver.c,3058 :: 		ScreenPrincipal.CLinesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenPrincipal+64)(GP)
;FirmwareIHM_v1_0_driver.c,3059 :: 		ScreenPrincipal.CLines                    = Screen2_CLines;
LUI	R2, hi_addr(_Screen2_CLines+0)
ORI	R2, R2, lo_addr(_Screen2_CLines+0)
SW	R2, Offset(_ScreenPrincipal+68)(GP)
;FirmwareIHM_v1_0_driver.c,3060 :: 		ScreenPrincipal.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenPrincipal+72)(GP)
;FirmwareIHM_v1_0_driver.c,3061 :: 		ScreenPrincipal.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenPrincipal+80)(GP)
;FirmwareIHM_v1_0_driver.c,3062 :: 		ScreenPrincipal.ObjectsCount              = 23;
ORI	R2, R0, 23
SH	R2, Offset(_ScreenPrincipal+6)(GP)
;FirmwareIHM_v1_0_driver.c,3064 :: 		ScreenSenha.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenSenha+0)(GP)
;FirmwareIHM_v1_0_driver.c,3065 :: 		ScreenSenha.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenSenha+2)(GP)
;FirmwareIHM_v1_0_driver.c,3066 :: 		ScreenSenha.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenSenha+4)(GP)
;FirmwareIHM_v1_0_driver.c,3067 :: 		ScreenSenha.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenSenha+8)(GP)
;FirmwareIHM_v1_0_driver.c,3068 :: 		ScreenSenha.CButtons_RoundCount       = 13;
ORI	R2, R0, 13
SH	R2, Offset(_ScreenSenha+16)(GP)
;FirmwareIHM_v1_0_driver.c,3069 :: 		ScreenSenha.CButtons_Round            = Screen3_CButtons_Round;
LUI	R2, hi_addr(_Screen3_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen3_CButtons_Round+0)
SW	R2, Offset(_ScreenSenha+20)(GP)
;FirmwareIHM_v1_0_driver.c,3070 :: 		ScreenSenha.LabelsCount               = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenSenha+24)(GP)
;FirmwareIHM_v1_0_driver.c,3071 :: 		ScreenSenha.Labels                    = Screen3_Labels;
LUI	R2, hi_addr(_Screen3_Labels+0)
ORI	R2, R2, lo_addr(_Screen3_Labels+0)
SW	R2, Offset(_ScreenSenha+28)(GP)
;FirmwareIHM_v1_0_driver.c,3072 :: 		ScreenSenha.CLabelsCount              = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenSenha+32)(GP)
;FirmwareIHM_v1_0_driver.c,3073 :: 		ScreenSenha.CLabels                   = Screen3_CLabels;
LUI	R2, hi_addr(_Screen3_CLabels+0)
ORI	R2, R2, lo_addr(_Screen3_CLabels+0)
SW	R2, Offset(_ScreenSenha+36)(GP)
;FirmwareIHM_v1_0_driver.c,3074 :: 		ScreenSenha.CBoxesCount               = 2;
ORI	R2, R0, 2
SH	R2, Offset(_ScreenSenha+40)(GP)
;FirmwareIHM_v1_0_driver.c,3075 :: 		ScreenSenha.CBoxes                    = Screen3_CBoxes;
LUI	R2, hi_addr(_Screen3_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen3_CBoxes+0)
SW	R2, Offset(_ScreenSenha+44)(GP)
;FirmwareIHM_v1_0_driver.c,3076 :: 		ScreenSenha.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenSenha+48)(GP)
;FirmwareIHM_v1_0_driver.c,3077 :: 		ScreenSenha.LinesCount                = 0;
SH	R0, Offset(_ScreenSenha+56)(GP)
;FirmwareIHM_v1_0_driver.c,3078 :: 		ScreenSenha.CLinesCount               = 0;
SH	R0, Offset(_ScreenSenha+64)(GP)
;FirmwareIHM_v1_0_driver.c,3079 :: 		ScreenSenha.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenSenha+72)(GP)
;FirmwareIHM_v1_0_driver.c,3080 :: 		ScreenSenha.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenSenha+80)(GP)
;FirmwareIHM_v1_0_driver.c,3081 :: 		ScreenSenha.ObjectsCount              = 25;
ORI	R2, R0, 25
SH	R2, Offset(_ScreenSenha+6)(GP)
;FirmwareIHM_v1_0_driver.c,3083 :: 		ScreenMalhaDeControle.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenMalhaDeControle+0)(GP)
;FirmwareIHM_v1_0_driver.c,3084 :: 		ScreenMalhaDeControle.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenMalhaDeControle+2)(GP)
;FirmwareIHM_v1_0_driver.c,3085 :: 		ScreenMalhaDeControle.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenMalhaDeControle+4)(GP)
;FirmwareIHM_v1_0_driver.c,3086 :: 		ScreenMalhaDeControle.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenMalhaDeControle+8)(GP)
;FirmwareIHM_v1_0_driver.c,3087 :: 		ScreenMalhaDeControle.CButtons_RoundCount       = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenMalhaDeControle+16)(GP)
;FirmwareIHM_v1_0_driver.c,3088 :: 		ScreenMalhaDeControle.CButtons_Round            = Screen4_CButtons_Round;
LUI	R2, hi_addr(_Screen4_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen4_CButtons_Round+0)
SW	R2, Offset(_ScreenMalhaDeControle+20)(GP)
;FirmwareIHM_v1_0_driver.c,3089 :: 		ScreenMalhaDeControle.LabelsCount               = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenMalhaDeControle+24)(GP)
;FirmwareIHM_v1_0_driver.c,3090 :: 		ScreenMalhaDeControle.Labels                    = Screen4_Labels;
LUI	R2, hi_addr(_Screen4_Labels+0)
ORI	R2, R2, lo_addr(_Screen4_Labels+0)
SW	R2, Offset(_ScreenMalhaDeControle+28)(GP)
;FirmwareIHM_v1_0_driver.c,3091 :: 		ScreenMalhaDeControle.CLabelsCount              = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenMalhaDeControle+32)(GP)
;FirmwareIHM_v1_0_driver.c,3092 :: 		ScreenMalhaDeControle.CLabels                   = Screen4_CLabels;
LUI	R2, hi_addr(_Screen4_CLabels+0)
ORI	R2, R2, lo_addr(_Screen4_CLabels+0)
SW	R2, Offset(_ScreenMalhaDeControle+36)(GP)
;FirmwareIHM_v1_0_driver.c,3093 :: 		ScreenMalhaDeControle.CBoxesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenMalhaDeControle+40)(GP)
;FirmwareIHM_v1_0_driver.c,3094 :: 		ScreenMalhaDeControle.CBoxes                    = Screen4_CBoxes;
LUI	R2, hi_addr(_Screen4_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen4_CBoxes+0)
SW	R2, Offset(_ScreenMalhaDeControle+44)(GP)
;FirmwareIHM_v1_0_driver.c,3095 :: 		ScreenMalhaDeControle.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenMalhaDeControle+48)(GP)
;FirmwareIHM_v1_0_driver.c,3096 :: 		ScreenMalhaDeControle.LinesCount                = 0;
SH	R0, Offset(_ScreenMalhaDeControle+56)(GP)
;FirmwareIHM_v1_0_driver.c,3097 :: 		ScreenMalhaDeControle.CLinesCount               = 0;
SH	R0, Offset(_ScreenMalhaDeControle+64)(GP)
;FirmwareIHM_v1_0_driver.c,3098 :: 		ScreenMalhaDeControle.CheckBoxesCount           = 2;
ORI	R2, R0, 2
SH	R2, Offset(_ScreenMalhaDeControle+72)(GP)
;FirmwareIHM_v1_0_driver.c,3099 :: 		ScreenMalhaDeControle.CheckBoxes                = Screen4_CheckBoxes;
LUI	R2, hi_addr(_Screen4_CheckBoxes+0)
ORI	R2, R2, lo_addr(_Screen4_CheckBoxes+0)
SW	R2, Offset(_ScreenMalhaDeControle+76)(GP)
;FirmwareIHM_v1_0_driver.c,3100 :: 		ScreenMalhaDeControle.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenMalhaDeControle+80)(GP)
;FirmwareIHM_v1_0_driver.c,3101 :: 		ScreenMalhaDeControle.ObjectsCount              = 14;
ORI	R2, R0, 14
SH	R2, Offset(_ScreenMalhaDeControle+6)(GP)
;FirmwareIHM_v1_0_driver.c,3103 :: 		ScreenResetInterlock.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenResetInterlock+0)(GP)
;FirmwareIHM_v1_0_driver.c,3104 :: 		ScreenResetInterlock.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenResetInterlock+2)(GP)
;FirmwareIHM_v1_0_driver.c,3105 :: 		ScreenResetInterlock.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenResetInterlock+4)(GP)
;FirmwareIHM_v1_0_driver.c,3106 :: 		ScreenResetInterlock.Buttons_RoundCount        = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenResetInterlock+8)(GP)
;FirmwareIHM_v1_0_driver.c,3107 :: 		ScreenResetInterlock.Buttons_Round             = Screen5_Buttons_Round;
LUI	R2, hi_addr(_Screen5_Buttons_Round+0)
ORI	R2, R2, lo_addr(_Screen5_Buttons_Round+0)
SW	R2, Offset(_ScreenResetInterlock+12)(GP)
;FirmwareIHM_v1_0_driver.c,3108 :: 		ScreenResetInterlock.CButtons_RoundCount       = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenResetInterlock+16)(GP)
;FirmwareIHM_v1_0_driver.c,3109 :: 		ScreenResetInterlock.CButtons_Round            = Screen5_CButtons_Round;
LUI	R2, hi_addr(_Screen5_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen5_CButtons_Round+0)
SW	R2, Offset(_ScreenResetInterlock+20)(GP)
;FirmwareIHM_v1_0_driver.c,3110 :: 		ScreenResetInterlock.LabelsCount               = 4;
ORI	R2, R0, 4
SH	R2, Offset(_ScreenResetInterlock+24)(GP)
;FirmwareIHM_v1_0_driver.c,3111 :: 		ScreenResetInterlock.Labels                    = Screen5_Labels;
LUI	R2, hi_addr(_Screen5_Labels+0)
ORI	R2, R2, lo_addr(_Screen5_Labels+0)
SW	R2, Offset(_ScreenResetInterlock+28)(GP)
;FirmwareIHM_v1_0_driver.c,3112 :: 		ScreenResetInterlock.CLabelsCount              = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenResetInterlock+32)(GP)
;FirmwareIHM_v1_0_driver.c,3113 :: 		ScreenResetInterlock.CLabels                   = Screen5_CLabels;
LUI	R2, hi_addr(_Screen5_CLabels+0)
ORI	R2, R2, lo_addr(_Screen5_CLabels+0)
SW	R2, Offset(_ScreenResetInterlock+36)(GP)
;FirmwareIHM_v1_0_driver.c,3114 :: 		ScreenResetInterlock.CBoxesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenResetInterlock+40)(GP)
;FirmwareIHM_v1_0_driver.c,3115 :: 		ScreenResetInterlock.CBoxes                    = Screen5_CBoxes;
LUI	R2, hi_addr(_Screen5_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen5_CBoxes+0)
SW	R2, Offset(_ScreenResetInterlock+44)(GP)
;FirmwareIHM_v1_0_driver.c,3116 :: 		ScreenResetInterlock.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenResetInterlock+48)(GP)
;FirmwareIHM_v1_0_driver.c,3117 :: 		ScreenResetInterlock.LinesCount                = 0;
SH	R0, Offset(_ScreenResetInterlock+56)(GP)
;FirmwareIHM_v1_0_driver.c,3118 :: 		ScreenResetInterlock.CLinesCount               = 0;
SH	R0, Offset(_ScreenResetInterlock+64)(GP)
;FirmwareIHM_v1_0_driver.c,3119 :: 		ScreenResetInterlock.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenResetInterlock+72)(GP)
;FirmwareIHM_v1_0_driver.c,3120 :: 		ScreenResetInterlock.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenResetInterlock+80)(GP)
;FirmwareIHM_v1_0_driver.c,3121 :: 		ScreenResetInterlock.ObjectsCount              = 12;
ORI	R2, R0, 12
SH	R2, Offset(_ScreenResetInterlock+6)(GP)
;FirmwareIHM_v1_0_driver.c,3123 :: 		ScreenOperando.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenOperando+0)(GP)
;FirmwareIHM_v1_0_driver.c,3124 :: 		ScreenOperando.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenOperando+2)(GP)
;FirmwareIHM_v1_0_driver.c,3125 :: 		ScreenOperando.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenOperando+4)(GP)
;FirmwareIHM_v1_0_driver.c,3126 :: 		ScreenOperando.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenOperando+8)(GP)
;FirmwareIHM_v1_0_driver.c,3127 :: 		ScreenOperando.CButtons_RoundCount       = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenOperando+16)(GP)
;FirmwareIHM_v1_0_driver.c,3128 :: 		ScreenOperando.CButtons_Round            = Screen6_CButtons_Round;
LUI	R2, hi_addr(_Screen6_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen6_CButtons_Round+0)
SW	R2, Offset(_ScreenOperando+20)(GP)
;FirmwareIHM_v1_0_driver.c,3129 :: 		ScreenOperando.LabelsCount               = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenOperando+24)(GP)
;FirmwareIHM_v1_0_driver.c,3130 :: 		ScreenOperando.Labels                    = Screen6_Labels;
LUI	R2, hi_addr(_Screen6_Labels+0)
ORI	R2, R2, lo_addr(_Screen6_Labels+0)
SW	R2, Offset(_ScreenOperando+28)(GP)
;FirmwareIHM_v1_0_driver.c,3131 :: 		ScreenOperando.CLabelsCount              = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenOperando+32)(GP)
;FirmwareIHM_v1_0_driver.c,3132 :: 		ScreenOperando.CLabels                   = Screen6_CLabels;
LUI	R2, hi_addr(_Screen6_CLabels+0)
ORI	R2, R2, lo_addr(_Screen6_CLabels+0)
SW	R2, Offset(_ScreenOperando+36)(GP)
;FirmwareIHM_v1_0_driver.c,3133 :: 		ScreenOperando.CBoxesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenOperando+40)(GP)
;FirmwareIHM_v1_0_driver.c,3134 :: 		ScreenOperando.CBoxes                    = Screen6_CBoxes;
LUI	R2, hi_addr(_Screen6_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen6_CBoxes+0)
SW	R2, Offset(_ScreenOperando+44)(GP)
;FirmwareIHM_v1_0_driver.c,3135 :: 		ScreenOperando.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenOperando+48)(GP)
;FirmwareIHM_v1_0_driver.c,3136 :: 		ScreenOperando.LinesCount                = 0;
SH	R0, Offset(_ScreenOperando+56)(GP)
;FirmwareIHM_v1_0_driver.c,3137 :: 		ScreenOperando.CLinesCount               = 0;
SH	R0, Offset(_ScreenOperando+64)(GP)
;FirmwareIHM_v1_0_driver.c,3138 :: 		ScreenOperando.CheckBoxesCount           = 3;
ORI	R2, R0, 3
SH	R2, Offset(_ScreenOperando+72)(GP)
;FirmwareIHM_v1_0_driver.c,3139 :: 		ScreenOperando.CheckBoxes                = Screen6_CheckBoxes;
LUI	R2, hi_addr(_Screen6_CheckBoxes+0)
ORI	R2, R2, lo_addr(_Screen6_CheckBoxes+0)
SW	R2, Offset(_ScreenOperando+76)(GP)
;FirmwareIHM_v1_0_driver.c,3140 :: 		ScreenOperando.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenOperando+80)(GP)
;FirmwareIHM_v1_0_driver.c,3141 :: 		ScreenOperando.ObjectsCount              = 15;
ORI	R2, R0, 15
SH	R2, Offset(_ScreenOperando+6)(GP)
;FirmwareIHM_v1_0_driver.c,3143 :: 		ScreenTecladoNumerico.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenTecladoNumerico+0)(GP)
;FirmwareIHM_v1_0_driver.c,3144 :: 		ScreenTecladoNumerico.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenTecladoNumerico+2)(GP)
;FirmwareIHM_v1_0_driver.c,3145 :: 		ScreenTecladoNumerico.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenTecladoNumerico+4)(GP)
;FirmwareIHM_v1_0_driver.c,3146 :: 		ScreenTecladoNumerico.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenTecladoNumerico+8)(GP)
;FirmwareIHM_v1_0_driver.c,3147 :: 		ScreenTecladoNumerico.CButtons_RoundCount       = 14;
ORI	R2, R0, 14
SH	R2, Offset(_ScreenTecladoNumerico+16)(GP)
;FirmwareIHM_v1_0_driver.c,3148 :: 		ScreenTecladoNumerico.CButtons_Round            = Screen7_CButtons_Round;
LUI	R2, hi_addr(_Screen7_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen7_CButtons_Round+0)
SW	R2, Offset(_ScreenTecladoNumerico+20)(GP)
;FirmwareIHM_v1_0_driver.c,3149 :: 		ScreenTecladoNumerico.LabelsCount               = 4;
ORI	R2, R0, 4
SH	R2, Offset(_ScreenTecladoNumerico+24)(GP)
;FirmwareIHM_v1_0_driver.c,3150 :: 		ScreenTecladoNumerico.Labels                    = Screen7_Labels;
LUI	R2, hi_addr(_Screen7_Labels+0)
ORI	R2, R2, lo_addr(_Screen7_Labels+0)
SW	R2, Offset(_ScreenTecladoNumerico+28)(GP)
;FirmwareIHM_v1_0_driver.c,3151 :: 		ScreenTecladoNumerico.CLabelsCount              = 2;
ORI	R2, R0, 2
SH	R2, Offset(_ScreenTecladoNumerico+32)(GP)
;FirmwareIHM_v1_0_driver.c,3152 :: 		ScreenTecladoNumerico.CLabels                   = Screen7_CLabels;
LUI	R2, hi_addr(_Screen7_CLabels+0)
ORI	R2, R2, lo_addr(_Screen7_CLabels+0)
SW	R2, Offset(_ScreenTecladoNumerico+36)(GP)
;FirmwareIHM_v1_0_driver.c,3153 :: 		ScreenTecladoNumerico.CBoxesCount               = 2;
ORI	R2, R0, 2
SH	R2, Offset(_ScreenTecladoNumerico+40)(GP)
;FirmwareIHM_v1_0_driver.c,3154 :: 		ScreenTecladoNumerico.CBoxes                    = Screen7_CBoxes;
LUI	R2, hi_addr(_Screen7_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen7_CBoxes+0)
SW	R2, Offset(_ScreenTecladoNumerico+44)(GP)
;FirmwareIHM_v1_0_driver.c,3155 :: 		ScreenTecladoNumerico.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenTecladoNumerico+48)(GP)
;FirmwareIHM_v1_0_driver.c,3156 :: 		ScreenTecladoNumerico.LinesCount                = 0;
SH	R0, Offset(_ScreenTecladoNumerico+56)(GP)
;FirmwareIHM_v1_0_driver.c,3157 :: 		ScreenTecladoNumerico.CLinesCount               = 0;
SH	R0, Offset(_ScreenTecladoNumerico+64)(GP)
;FirmwareIHM_v1_0_driver.c,3158 :: 		ScreenTecladoNumerico.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenTecladoNumerico+72)(GP)
;FirmwareIHM_v1_0_driver.c,3159 :: 		ScreenTecladoNumerico.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenTecladoNumerico+80)(GP)
;FirmwareIHM_v1_0_driver.c,3160 :: 		ScreenTecladoNumerico.ObjectsCount              = 22;
ORI	R2, R0, 22
SH	R2, Offset(_ScreenTecladoNumerico+6)(GP)
;FirmwareIHM_v1_0_driver.c,3162 :: 		ScreenAcessoNegado.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenAcessoNegado+0)(GP)
;FirmwareIHM_v1_0_driver.c,3163 :: 		ScreenAcessoNegado.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenAcessoNegado+2)(GP)
;FirmwareIHM_v1_0_driver.c,3164 :: 		ScreenAcessoNegado.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenAcessoNegado+4)(GP)
;FirmwareIHM_v1_0_driver.c,3165 :: 		ScreenAcessoNegado.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenAcessoNegado+8)(GP)
;FirmwareIHM_v1_0_driver.c,3166 :: 		ScreenAcessoNegado.CButtons_RoundCount       = 0;
SH	R0, Offset(_ScreenAcessoNegado+16)(GP)
;FirmwareIHM_v1_0_driver.c,3167 :: 		ScreenAcessoNegado.LabelsCount               = 6;
ORI	R2, R0, 6
SH	R2, Offset(_ScreenAcessoNegado+24)(GP)
;FirmwareIHM_v1_0_driver.c,3168 :: 		ScreenAcessoNegado.Labels                    = Screen8_Labels;
LUI	R2, hi_addr(_Screen8_Labels+0)
ORI	R2, R2, lo_addr(_Screen8_Labels+0)
SW	R2, Offset(_ScreenAcessoNegado+28)(GP)
;FirmwareIHM_v1_0_driver.c,3169 :: 		ScreenAcessoNegado.CLabelsCount              = 4;
ORI	R2, R0, 4
SH	R2, Offset(_ScreenAcessoNegado+32)(GP)
;FirmwareIHM_v1_0_driver.c,3170 :: 		ScreenAcessoNegado.CLabels                   = Screen8_CLabels;
LUI	R2, hi_addr(_Screen8_CLabels+0)
ORI	R2, R2, lo_addr(_Screen8_CLabels+0)
SW	R2, Offset(_ScreenAcessoNegado+36)(GP)
;FirmwareIHM_v1_0_driver.c,3171 :: 		ScreenAcessoNegado.CBoxesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenAcessoNegado+40)(GP)
;FirmwareIHM_v1_0_driver.c,3172 :: 		ScreenAcessoNegado.CBoxes                    = Screen8_CBoxes;
LUI	R2, hi_addr(_Screen8_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen8_CBoxes+0)
SW	R2, Offset(_ScreenAcessoNegado+44)(GP)
;FirmwareIHM_v1_0_driver.c,3173 :: 		ScreenAcessoNegado.Boxes_RoundCount          = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenAcessoNegado+48)(GP)
;FirmwareIHM_v1_0_driver.c,3174 :: 		ScreenAcessoNegado.Boxes_Round               = Screen8_Boxes_Round;
LUI	R2, hi_addr(_Screen8_Boxes_Round+0)
ORI	R2, R2, lo_addr(_Screen8_Boxes_Round+0)
SW	R2, Offset(_ScreenAcessoNegado+52)(GP)
;FirmwareIHM_v1_0_driver.c,3175 :: 		ScreenAcessoNegado.LinesCount                = 0;
SH	R0, Offset(_ScreenAcessoNegado+56)(GP)
;FirmwareIHM_v1_0_driver.c,3176 :: 		ScreenAcessoNegado.CLinesCount               = 0;
SH	R0, Offset(_ScreenAcessoNegado+64)(GP)
;FirmwareIHM_v1_0_driver.c,3177 :: 		ScreenAcessoNegado.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenAcessoNegado+72)(GP)
;FirmwareIHM_v1_0_driver.c,3178 :: 		ScreenAcessoNegado.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenAcessoNegado+80)(GP)
;FirmwareIHM_v1_0_driver.c,3179 :: 		ScreenAcessoNegado.ObjectsCount              = 12;
ORI	R2, R0, 12
SH	R2, Offset(_ScreenAcessoNegado+6)(GP)
;FirmwareIHM_v1_0_driver.c,3181 :: 		ScreenMENU.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenMENU+0)(GP)
;FirmwareIHM_v1_0_driver.c,3182 :: 		ScreenMENU.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenMENU+2)(GP)
;FirmwareIHM_v1_0_driver.c,3183 :: 		ScreenMENU.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenMENU+4)(GP)
;FirmwareIHM_v1_0_driver.c,3184 :: 		ScreenMENU.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenMENU+8)(GP)
;FirmwareIHM_v1_0_driver.c,3185 :: 		ScreenMENU.CButtons_RoundCount       = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenMENU+16)(GP)
;FirmwareIHM_v1_0_driver.c,3186 :: 		ScreenMENU.CButtons_Round            = Screen9_CButtons_Round;
LUI	R2, hi_addr(_Screen9_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen9_CButtons_Round+0)
SW	R2, Offset(_ScreenMENU+20)(GP)
;FirmwareIHM_v1_0_driver.c,3187 :: 		ScreenMENU.LabelsCount               = 4;
ORI	R2, R0, 4
SH	R2, Offset(_ScreenMENU+24)(GP)
;FirmwareIHM_v1_0_driver.c,3188 :: 		ScreenMENU.Labels                    = Screen9_Labels;
LUI	R2, hi_addr(_Screen9_Labels+0)
ORI	R2, R2, lo_addr(_Screen9_Labels+0)
SW	R2, Offset(_ScreenMENU+28)(GP)
;FirmwareIHM_v1_0_driver.c,3189 :: 		ScreenMENU.CLabelsCount              = 4;
ORI	R2, R0, 4
SH	R2, Offset(_ScreenMENU+32)(GP)
;FirmwareIHM_v1_0_driver.c,3190 :: 		ScreenMENU.CLabels                   = Screen9_CLabels;
LUI	R2, hi_addr(_Screen9_CLabels+0)
ORI	R2, R2, lo_addr(_Screen9_CLabels+0)
SW	R2, Offset(_ScreenMENU+36)(GP)
;FirmwareIHM_v1_0_driver.c,3191 :: 		ScreenMENU.CBoxesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenMENU+40)(GP)
;FirmwareIHM_v1_0_driver.c,3192 :: 		ScreenMENU.CBoxes                    = Screen9_CBoxes;
LUI	R2, hi_addr(_Screen9_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen9_CBoxes+0)
SW	R2, Offset(_ScreenMENU+44)(GP)
;FirmwareIHM_v1_0_driver.c,3193 :: 		ScreenMENU.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenMENU+48)(GP)
;FirmwareIHM_v1_0_driver.c,3194 :: 		ScreenMENU.LinesCount                = 0;
SH	R0, Offset(_ScreenMENU+56)(GP)
;FirmwareIHM_v1_0_driver.c,3195 :: 		ScreenMENU.CLinesCount               = 0;
SH	R0, Offset(_ScreenMENU+64)(GP)
;FirmwareIHM_v1_0_driver.c,3196 :: 		ScreenMENU.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenMENU+72)(GP)
;FirmwareIHM_v1_0_driver.c,3197 :: 		ScreenMENU.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenMENU+80)(GP)
;FirmwareIHM_v1_0_driver.c,3198 :: 		ScreenMENU.ObjectsCount              = 10;
ORI	R2, R0, 10
SH	R2, Offset(_ScreenMENU+6)(GP)
;FirmwareIHM_v1_0_driver.c,3200 :: 		ScreenEndSerial.Color                     = 0xCE53;
ORI	R2, R0, 52819
SH	R2, Offset(_ScreenEndSerial+0)(GP)
;FirmwareIHM_v1_0_driver.c,3201 :: 		ScreenEndSerial.Width                     = 240;
ORI	R2, R0, 240
SH	R2, Offset(_ScreenEndSerial+2)(GP)
;FirmwareIHM_v1_0_driver.c,3202 :: 		ScreenEndSerial.Height                    = 320;
ORI	R2, R0, 320
SH	R2, Offset(_ScreenEndSerial+4)(GP)
;FirmwareIHM_v1_0_driver.c,3203 :: 		ScreenEndSerial.Buttons_RoundCount        = 0;
SH	R0, Offset(_ScreenEndSerial+8)(GP)
;FirmwareIHM_v1_0_driver.c,3204 :: 		ScreenEndSerial.CButtons_RoundCount       = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenEndSerial+16)(GP)
;FirmwareIHM_v1_0_driver.c,3205 :: 		ScreenEndSerial.CButtons_Round            = Screen10_CButtons_Round;
LUI	R2, hi_addr(_Screen10_CButtons_Round+0)
ORI	R2, R2, lo_addr(_Screen10_CButtons_Round+0)
SW	R2, Offset(_ScreenEndSerial+20)(GP)
;FirmwareIHM_v1_0_driver.c,3206 :: 		ScreenEndSerial.LabelsCount               = 4;
ORI	R2, R0, 4
SH	R2, Offset(_ScreenEndSerial+24)(GP)
;FirmwareIHM_v1_0_driver.c,3207 :: 		ScreenEndSerial.Labels                    = Screen10_Labels;
LUI	R2, hi_addr(_Screen10_Labels+0)
ORI	R2, R2, lo_addr(_Screen10_Labels+0)
SW	R2, Offset(_ScreenEndSerial+28)(GP)
;FirmwareIHM_v1_0_driver.c,3208 :: 		ScreenEndSerial.CLabelsCount              = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ScreenEndSerial+32)(GP)
;FirmwareIHM_v1_0_driver.c,3209 :: 		ScreenEndSerial.CLabels                   = Screen10_CLabels;
LUI	R2, hi_addr(_Screen10_CLabels+0)
ORI	R2, R2, lo_addr(_Screen10_CLabels+0)
SW	R2, Offset(_ScreenEndSerial+36)(GP)
;FirmwareIHM_v1_0_driver.c,3210 :: 		ScreenEndSerial.CBoxesCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_ScreenEndSerial+40)(GP)
;FirmwareIHM_v1_0_driver.c,3211 :: 		ScreenEndSerial.CBoxes                    = Screen10_CBoxes;
LUI	R2, hi_addr(_Screen10_CBoxes+0)
ORI	R2, R2, lo_addr(_Screen10_CBoxes+0)
SW	R2, Offset(_ScreenEndSerial+44)(GP)
;FirmwareIHM_v1_0_driver.c,3212 :: 		ScreenEndSerial.Boxes_RoundCount          = 0;
SH	R0, Offset(_ScreenEndSerial+48)(GP)
;FirmwareIHM_v1_0_driver.c,3213 :: 		ScreenEndSerial.LinesCount                = 0;
SH	R0, Offset(_ScreenEndSerial+56)(GP)
;FirmwareIHM_v1_0_driver.c,3214 :: 		ScreenEndSerial.CLinesCount               = 0;
SH	R0, Offset(_ScreenEndSerial+64)(GP)
;FirmwareIHM_v1_0_driver.c,3215 :: 		ScreenEndSerial.CheckBoxesCount           = 0;
SH	R0, Offset(_ScreenEndSerial+72)(GP)
;FirmwareIHM_v1_0_driver.c,3216 :: 		ScreenEndSerial.ProgressBarsCount         = 0;
SH	R0, Offset(_ScreenEndSerial+80)(GP)
;FirmwareIHM_v1_0_driver.c,3217 :: 		ScreenEndSerial.ObjectsCount              = 11;
ORI	R2, R0, 11
SH	R2, Offset(_ScreenEndSerial+6)(GP)
;FirmwareIHM_v1_0_driver.c,3220 :: 		ProgressBar1.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_ProgressBar1+0)(GP)
;FirmwareIHM_v1_0_driver.c,3221 :: 		ProgressBar1.Order           = 0;
SB	R0, Offset(_ProgressBar1+4)(GP)
;FirmwareIHM_v1_0_driver.c,3222 :: 		ProgressBar1.Left            = 5;
ORI	R2, R0, 5
SH	R2, Offset(_ProgressBar1+6)(GP)
;FirmwareIHM_v1_0_driver.c,3223 :: 		ProgressBar1.Top             = 228;
ORI	R2, R0, 228
SH	R2, Offset(_ProgressBar1+8)(GP)
;FirmwareIHM_v1_0_driver.c,3224 :: 		ProgressBar1.Width           = 230;
ORI	R2, R0, 230
SH	R2, Offset(_ProgressBar1+10)(GP)
;FirmwareIHM_v1_0_driver.c,3225 :: 		ProgressBar1.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_ProgressBar1+12)(GP)
;FirmwareIHM_v1_0_driver.c,3226 :: 		ProgressBar1.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+14)(GP)
;FirmwareIHM_v1_0_driver.c,3227 :: 		ProgressBar1.Pen_Color       = 0x0000;
SH	R0, Offset(_ProgressBar1+16)(GP)
;FirmwareIHM_v1_0_driver.c,3228 :: 		ProgressBar1.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+18)(GP)
;FirmwareIHM_v1_0_driver.c,3229 :: 		ProgressBar1.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+19)(GP)
;FirmwareIHM_v1_0_driver.c,3230 :: 		ProgressBar1.Caption         = ProgressBar1_Caption;
LUI	R2, hi_addr(_ProgressBar1_Caption+0)
ORI	R2, R2, lo_addr(_ProgressBar1_Caption+0)
SW	R2, Offset(_ProgressBar1+20)(GP)
;FirmwareIHM_v1_0_driver.c,3231 :: 		ProgressBar1.FontName        = Tahoma11x13_Regular;
LUI	R6, hi_addr(_Tahoma11x13_Regular+0)
ORI	R6, R6, lo_addr(_Tahoma11x13_Regular+0)
SW	R6, Offset(_ProgressBar1+24)(GP)
;FirmwareIHM_v1_0_driver.c,3232 :: 		ProgressBar1.Font_Color      = 0x0000;
SH	R0, Offset(_ProgressBar1+28)(GP)
;FirmwareIHM_v1_0_driver.c,3233 :: 		ProgressBar1.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+30)(GP)
;FirmwareIHM_v1_0_driver.c,3234 :: 		ProgressBar1.Gradient_Orientation = 0;
SB	R0, Offset(_ProgressBar1+31)(GP)
;FirmwareIHM_v1_0_driver.c,3235 :: 		ProgressBar1.Gradient_Start_Color = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_ProgressBar1+32)(GP)
;FirmwareIHM_v1_0_driver.c,3236 :: 		ProgressBar1.Gradient_End_Color = 0x07E0;
ORI	R2, R0, 2016
SH	R2, Offset(_ProgressBar1+34)(GP)
;FirmwareIHM_v1_0_driver.c,3237 :: 		ProgressBar1.Color           = 0xA65E;
ORI	R2, R0, 42590
SH	R2, Offset(_ProgressBar1+36)(GP)
;FirmwareIHM_v1_0_driver.c,3238 :: 		ProgressBar1.Background_Color = 0x8410;
ORI	R2, R0, 33808
SH	R2, Offset(_ProgressBar1+38)(GP)
;FirmwareIHM_v1_0_driver.c,3239 :: 		ProgressBar1.Min             = 0;
SH	R0, Offset(_ProgressBar1+40)(GP)
;FirmwareIHM_v1_0_driver.c,3240 :: 		ProgressBar1.Max             = 100;
ORI	R2, R0, 100
SH	R2, Offset(_ProgressBar1+42)(GP)
;FirmwareIHM_v1_0_driver.c,3241 :: 		ProgressBar1.Position        = 50;
ORI	R2, R0, 50
SH	R2, Offset(_ProgressBar1+44)(GP)
;FirmwareIHM_v1_0_driver.c,3242 :: 		ProgressBar1.Prev_Position   = 50;
ORI	R2, R0, 50
SH	R2, Offset(_ProgressBar1+46)(GP)
;FirmwareIHM_v1_0_driver.c,3243 :: 		ProgressBar1.Show_Position   = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+48)(GP)
;FirmwareIHM_v1_0_driver.c,3244 :: 		ProgressBar1.Show_Percentage = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+49)(GP)
;FirmwareIHM_v1_0_driver.c,3245 :: 		ProgressBar1.Smooth          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+50)(GP)
;FirmwareIHM_v1_0_driver.c,3246 :: 		ProgressBar1.Rounded         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+51)(GP)
;FirmwareIHM_v1_0_driver.c,3247 :: 		ProgressBar1.Corner_Radius   = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+52)(GP)
;FirmwareIHM_v1_0_driver.c,3249 :: 		Label32.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_Label32+0)(GP)
;FirmwareIHM_v1_0_driver.c,3250 :: 		Label32.Order           = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label32+4)(GP)
;FirmwareIHM_v1_0_driver.c,3251 :: 		Label32.Left            = 5;
ORI	R2, R0, 5
SH	R2, Offset(_Label32+6)(GP)
;FirmwareIHM_v1_0_driver.c,3252 :: 		Label32.Top             = 262;
ORI	R2, R0, 262
SH	R2, Offset(_Label32+8)(GP)
;FirmwareIHM_v1_0_driver.c,3253 :: 		Label32.Width           = 230;
ORI	R2, R0, 230
SH	R2, Offset(_Label32+10)(GP)
;FirmwareIHM_v1_0_driver.c,3254 :: 		Label32.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label32+12)(GP)
;FirmwareIHM_v1_0_driver.c,3255 :: 		Label32.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label32+27)(GP)
;FirmwareIHM_v1_0_driver.c,3256 :: 		Label32.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label32+28)(GP)
;FirmwareIHM_v1_0_driver.c,3257 :: 		Label32.Caption         = Label32_Caption;
LUI	R2, hi_addr(_Label32_Caption+0)
ORI	R2, R2, lo_addr(_Label32_Caption+0)
SW	R2, Offset(_Label32+16)(GP)
;FirmwareIHM_v1_0_driver.c,3258 :: 		Label32.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label32+20)(GP)
;FirmwareIHM_v1_0_driver.c,3259 :: 		Label32.Font_Color      = 0x0000;
SH	R0, Offset(_Label32+24)(GP)
;FirmwareIHM_v1_0_driver.c,3260 :: 		Label32.VerticalText    = 0;
SB	R0, Offset(_Label32+26)(GP)
;FirmwareIHM_v1_0_driver.c,3261 :: 		Label32.OnUpPtr         = 0;
SW	R0, Offset(_Label32+32)(GP)
;FirmwareIHM_v1_0_driver.c,3262 :: 		Label32.OnDownPtr       = 0;
SW	R0, Offset(_Label32+36)(GP)
;FirmwareIHM_v1_0_driver.c,3263 :: 		Label32.OnClickPtr      = 0;
SW	R0, Offset(_Label32+40)(GP)
;FirmwareIHM_v1_0_driver.c,3264 :: 		Label32.OnPressPtr      = 0;
SW	R0, Offset(_Label32+44)(GP)
;FirmwareIHM_v1_0_driver.c,3266 :: 		Label33.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_Label33+0)(GP)
;FirmwareIHM_v1_0_driver.c,3267 :: 		Label33.Order           = 2;
ORI	R2, R0, 2
SB	R2, Offset(_Label33+4)(GP)
;FirmwareIHM_v1_0_driver.c,3268 :: 		Label33.Left            = 86;
ORI	R2, R0, 86
SH	R2, Offset(_Label33+6)(GP)
;FirmwareIHM_v1_0_driver.c,3269 :: 		Label33.Top             = 214;
ORI	R2, R0, 214
SH	R2, Offset(_Label33+8)(GP)
;FirmwareIHM_v1_0_driver.c,3270 :: 		Label33.Width           = 68;
ORI	R2, R0, 68
SH	R2, Offset(_Label33+10)(GP)
;FirmwareIHM_v1_0_driver.c,3271 :: 		Label33.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label33+12)(GP)
;FirmwareIHM_v1_0_driver.c,3272 :: 		Label33.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label33+27)(GP)
;FirmwareIHM_v1_0_driver.c,3273 :: 		Label33.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label33+28)(GP)
;FirmwareIHM_v1_0_driver.c,3274 :: 		Label33.Caption         = Label33_Caption;
LUI	R2, hi_addr(_Label33_Caption+0)
ORI	R2, R2, lo_addr(_Label33_Caption+0)
SW	R2, Offset(_Label33+16)(GP)
;FirmwareIHM_v1_0_driver.c,3275 :: 		Label33.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label33+20)(GP)
;FirmwareIHM_v1_0_driver.c,3276 :: 		Label33.Font_Color      = 0x0000;
SH	R0, Offset(_Label33+24)(GP)
;FirmwareIHM_v1_0_driver.c,3277 :: 		Label33.VerticalText    = 0;
SB	R0, Offset(_Label33+26)(GP)
;FirmwareIHM_v1_0_driver.c,3278 :: 		Label33.OnUpPtr         = 0;
SW	R0, Offset(_Label33+32)(GP)
;FirmwareIHM_v1_0_driver.c,3279 :: 		Label33.OnDownPtr       = 0;
SW	R0, Offset(_Label33+36)(GP)
;FirmwareIHM_v1_0_driver.c,3280 :: 		Label33.OnClickPtr      = 0;
SW	R0, Offset(_Label33+40)(GP)
;FirmwareIHM_v1_0_driver.c,3281 :: 		Label33.OnPressPtr      = 0;
SW	R0, Offset(_Label33+44)(GP)
;FirmwareIHM_v1_0_driver.c,3283 :: 		Label34.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_Label34+0)(GP)
;FirmwareIHM_v1_0_driver.c,3284 :: 		Label34.Order           = 3;
ORI	R2, R0, 3
SB	R2, Offset(_Label34+4)(GP)
;FirmwareIHM_v1_0_driver.c,3285 :: 		Label34.Left            = 5;
ORI	R2, R0, 5
SH	R2, Offset(_Label34+6)(GP)
;FirmwareIHM_v1_0_driver.c,3286 :: 		Label34.Top             = 294;
ORI	R2, R0, 294
SH	R2, Offset(_Label34+8)(GP)
;FirmwareIHM_v1_0_driver.c,3287 :: 		Label34.Width           = 112;
ORI	R2, R0, 112
SH	R2, Offset(_Label34+10)(GP)
;FirmwareIHM_v1_0_driver.c,3288 :: 		Label34.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label34+12)(GP)
;FirmwareIHM_v1_0_driver.c,3289 :: 		Label34.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label34+27)(GP)
;FirmwareIHM_v1_0_driver.c,3290 :: 		Label34.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label34+28)(GP)
;FirmwareIHM_v1_0_driver.c,3291 :: 		Label34.Caption         = Label34_Caption;
LUI	R2, hi_addr(_Label34_Caption+0)
ORI	R2, R2, lo_addr(_Label34_Caption+0)
SW	R2, Offset(_Label34+16)(GP)
;FirmwareIHM_v1_0_driver.c,3292 :: 		Label34.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label34+20)(GP)
;FirmwareIHM_v1_0_driver.c,3293 :: 		Label34.Font_Color      = 0x0000;
SH	R0, Offset(_Label34+24)(GP)
;FirmwareIHM_v1_0_driver.c,3294 :: 		Label34.VerticalText    = 0;
SB	R0, Offset(_Label34+26)(GP)
;FirmwareIHM_v1_0_driver.c,3295 :: 		Label34.OnUpPtr         = 0;
SW	R0, Offset(_Label34+32)(GP)
;FirmwareIHM_v1_0_driver.c,3296 :: 		Label34.OnDownPtr       = 0;
SW	R0, Offset(_Label34+36)(GP)
;FirmwareIHM_v1_0_driver.c,3297 :: 		Label34.OnClickPtr      = 0;
SW	R0, Offset(_Label34+40)(GP)
;FirmwareIHM_v1_0_driver.c,3298 :: 		Label34.OnPressPtr      = 0;
SW	R0, Offset(_Label34+44)(GP)
;FirmwareIHM_v1_0_driver.c,3300 :: 		Label35.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_Label35+0)(GP)
;FirmwareIHM_v1_0_driver.c,3301 :: 		Label35.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_Label35+4)(GP)
;FirmwareIHM_v1_0_driver.c,3302 :: 		Label35.Left            = 5;
ORI	R2, R0, 5
SH	R2, Offset(_Label35+6)(GP)
;FirmwareIHM_v1_0_driver.c,3303 :: 		Label35.Top             = 278;
ORI	R2, R0, 278
SH	R2, Offset(_Label35+8)(GP)
;FirmwareIHM_v1_0_driver.c,3304 :: 		Label35.Width           = 86;
ORI	R2, R0, 86
SH	R2, Offset(_Label35+10)(GP)
;FirmwareIHM_v1_0_driver.c,3305 :: 		Label35.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label35+12)(GP)
;FirmwareIHM_v1_0_driver.c,3306 :: 		Label35.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label35+27)(GP)
;FirmwareIHM_v1_0_driver.c,3307 :: 		Label35.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label35+28)(GP)
;FirmwareIHM_v1_0_driver.c,3308 :: 		Label35.Caption         = Label35_Caption;
LUI	R2, hi_addr(_Label35_Caption+0)
ORI	R2, R2, lo_addr(_Label35_Caption+0)
SW	R2, Offset(_Label35+16)(GP)
;FirmwareIHM_v1_0_driver.c,3309 :: 		Label35.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label35+20)(GP)
;FirmwareIHM_v1_0_driver.c,3310 :: 		Label35.Font_Color      = 0x0000;
SH	R0, Offset(_Label35+24)(GP)
;FirmwareIHM_v1_0_driver.c,3311 :: 		Label35.VerticalText    = 0;
SB	R0, Offset(_Label35+26)(GP)
;FirmwareIHM_v1_0_driver.c,3312 :: 		Label35.OnUpPtr         = 0;
SW	R0, Offset(_Label35+32)(GP)
;FirmwareIHM_v1_0_driver.c,3313 :: 		Label35.OnDownPtr       = 0;
SW	R0, Offset(_Label35+36)(GP)
;FirmwareIHM_v1_0_driver.c,3314 :: 		Label35.OnClickPtr      = 0;
SW	R0, Offset(_Label35+40)(GP)
;FirmwareIHM_v1_0_driver.c,3315 :: 		Label35.OnPressPtr      = 0;
SW	R0, Offset(_Label35+44)(GP)
;FirmwareIHM_v1_0_driver.c,3317 :: 		Line2.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_Line2+0)(GP)
;FirmwareIHM_v1_0_driver.c,3318 :: 		Line2.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_Line2+4)(GP)
;FirmwareIHM_v1_0_driver.c,3319 :: 		Line2.First_Point_X   = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Line2+6)(GP)
;FirmwareIHM_v1_0_driver.c,3320 :: 		Line2.First_Point_Y   = 30;
ORI	R2, R0, 30
SH	R2, Offset(_Line2+8)(GP)
;FirmwareIHM_v1_0_driver.c,3321 :: 		Line2.Second_Point_X  = 237;
ORI	R2, R0, 237
SH	R2, Offset(_Line2+10)(GP)
;FirmwareIHM_v1_0_driver.c,3322 :: 		Line2.Second_Point_Y  = 30;
ORI	R2, R0, 30
SH	R2, Offset(_Line2+12)(GP)
;FirmwareIHM_v1_0_driver.c,3323 :: 		Line2.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Line2+15)(GP)
;FirmwareIHM_v1_0_driver.c,3324 :: 		Line2.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Line2+14)(GP)
;FirmwareIHM_v1_0_driver.c,3325 :: 		Line2.Color           = 0x0000;
SH	R0, Offset(_Line2+16)(GP)
;FirmwareIHM_v1_0_driver.c,3327 :: 		Label36.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_Label36+0)(GP)
;FirmwareIHM_v1_0_driver.c,3328 :: 		Label36.Order           = 6;
ORI	R2, R0, 6
SB	R2, Offset(_Label36+4)(GP)
;FirmwareIHM_v1_0_driver.c,3329 :: 		Label36.Left            = 7;
ORI	R2, R0, 7
SH	R2, Offset(_Label36+6)(GP)
;FirmwareIHM_v1_0_driver.c,3330 :: 		Label36.Top             = 16;
ORI	R2, R0, 16
SH	R2, Offset(_Label36+8)(GP)
;FirmwareIHM_v1_0_driver.c,3331 :: 		Label36.Width           = 88;
ORI	R2, R0, 88
SH	R2, Offset(_Label36+10)(GP)
;FirmwareIHM_v1_0_driver.c,3332 :: 		Label36.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label36+12)(GP)
;FirmwareIHM_v1_0_driver.c,3333 :: 		Label36.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label36+27)(GP)
;FirmwareIHM_v1_0_driver.c,3334 :: 		Label36.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label36+28)(GP)
;FirmwareIHM_v1_0_driver.c,3335 :: 		Label36.Caption         = Label36_Caption;
LUI	R2, hi_addr(_Label36_Caption+0)
ORI	R2, R2, lo_addr(_Label36_Caption+0)
SW	R2, Offset(_Label36+16)(GP)
;FirmwareIHM_v1_0_driver.c,3336 :: 		Label36.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label36+20)(GP)
;FirmwareIHM_v1_0_driver.c,3337 :: 		Label36.Font_Color      = 0x0000;
SH	R0, Offset(_Label36+24)(GP)
;FirmwareIHM_v1_0_driver.c,3338 :: 		Label36.VerticalText    = 0;
SB	R0, Offset(_Label36+26)(GP)
;FirmwareIHM_v1_0_driver.c,3339 :: 		Label36.OnUpPtr         = 0;
SW	R0, Offset(_Label36+32)(GP)
;FirmwareIHM_v1_0_driver.c,3340 :: 		Label36.OnDownPtr       = 0;
SW	R0, Offset(_Label36+36)(GP)
;FirmwareIHM_v1_0_driver.c,3341 :: 		Label36.OnClickPtr      = 0;
SW	R0, Offset(_Label36+40)(GP)
;FirmwareIHM_v1_0_driver.c,3342 :: 		Label36.OnPressPtr      = 0;
SW	R0, Offset(_Label36+44)(GP)
;FirmwareIHM_v1_0_driver.c,3344 :: 		Label37.OwnerScreen     = &ScreenInicializacao;
LUI	R2, hi_addr(_ScreenInicializacao+0)
ORI	R2, R2, lo_addr(_ScreenInicializacao+0)
SW	R2, Offset(_Label37+0)(GP)
;FirmwareIHM_v1_0_driver.c,3345 :: 		Label37.Order           = 7;
ORI	R2, R0, 7
SB	R2, Offset(_Label37+4)(GP)
;FirmwareIHM_v1_0_driver.c,3346 :: 		Label37.Left            = 118;
ORI	R2, R0, 118
SH	R2, Offset(_Label37+6)(GP)
;FirmwareIHM_v1_0_driver.c,3347 :: 		Label37.Top             = 294;
ORI	R2, R0, 294
SH	R2, Offset(_Label37+8)(GP)
;FirmwareIHM_v1_0_driver.c,3348 :: 		Label37.Width           = 41;
ORI	R2, R0, 41
SH	R2, Offset(_Label37+10)(GP)
;FirmwareIHM_v1_0_driver.c,3349 :: 		Label37.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label37+12)(GP)
;FirmwareIHM_v1_0_driver.c,3350 :: 		Label37.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label37+27)(GP)
;FirmwareIHM_v1_0_driver.c,3351 :: 		Label37.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label37+28)(GP)
;FirmwareIHM_v1_0_driver.c,3352 :: 		Label37.Caption         = Label37_Caption;
LUI	R2, hi_addr(_Label37_Caption+0)
ORI	R2, R2, lo_addr(_Label37_Caption+0)
SW	R2, Offset(_Label37+16)(GP)
;FirmwareIHM_v1_0_driver.c,3353 :: 		Label37.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label37+20)(GP)
;FirmwareIHM_v1_0_driver.c,3354 :: 		Label37.Font_Color      = 0x0000;
SH	R0, Offset(_Label37+24)(GP)
;FirmwareIHM_v1_0_driver.c,3355 :: 		Label37.VerticalText    = 0;
SB	R0, Offset(_Label37+26)(GP)
;FirmwareIHM_v1_0_driver.c,3356 :: 		Label37.OnUpPtr         = 0;
SW	R0, Offset(_Label37+32)(GP)
;FirmwareIHM_v1_0_driver.c,3357 :: 		Label37.OnDownPtr       = 0;
SW	R0, Offset(_Label37+36)(GP)
;FirmwareIHM_v1_0_driver.c,3358 :: 		Label37.OnClickPtr      = 0;
SW	R0, Offset(_Label37+40)(GP)
;FirmwareIHM_v1_0_driver.c,3359 :: 		Label37.OnPressPtr      = 0;
SW	R0, Offset(_Label37+44)(GP)
;FirmwareIHM_v1_0_driver.c,3361 :: 		ButtonRound2.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_ButtonRound2+0)(GP)
;FirmwareIHM_v1_0_driver.c,3362 :: 		ButtonRound2.Order           = 11;
ORI	R2, R0, 11
SB	R2, Offset(_ButtonRound2+4)(GP)
;FirmwareIHM_v1_0_driver.c,3363 :: 		ButtonRound2.Left            = 160;
ORI	R2, R0, 160
SH	R2, Offset(_ButtonRound2+6)(GP)
;FirmwareIHM_v1_0_driver.c,3364 :: 		ButtonRound2.Top             = 276;
ORI	R2, R0, 276
SH	R2, Offset(_ButtonRound2+8)(GP)
;FirmwareIHM_v1_0_driver.c,3365 :: 		ButtonRound2.Width           = 70;
ORI	R2, R0, 70
SH	R2, Offset(_ButtonRound2+10)(GP)
;FirmwareIHM_v1_0_driver.c,3366 :: 		ButtonRound2.Height          = 35;
ORI	R2, R0, 35
SH	R2, Offset(_ButtonRound2+12)(GP)
;FirmwareIHM_v1_0_driver.c,3367 :: 		ButtonRound2.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+14)(GP)
;FirmwareIHM_v1_0_driver.c,3368 :: 		ButtonRound2.Pen_Color       = 0x0000;
SH	R0, Offset(_ButtonRound2+16)(GP)
;FirmwareIHM_v1_0_driver.c,3369 :: 		ButtonRound2.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+18)(GP)
;FirmwareIHM_v1_0_driver.c,3370 :: 		ButtonRound2.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+19)(GP)
;FirmwareIHM_v1_0_driver.c,3371 :: 		ButtonRound2.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+20)(GP)
;FirmwareIHM_v1_0_driver.c,3372 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
LUI	R2, hi_addr(_ButtonRound2_Caption+0)
ORI	R2, R2, lo_addr(_ButtonRound2_Caption+0)
SW	R2, Offset(_ButtonRound2+24)(GP)
;FirmwareIHM_v1_0_driver.c,3373 :: 		ButtonRound2.TextAlign       = _taCenter;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+28)(GP)
;FirmwareIHM_v1_0_driver.c,3374 :: 		ButtonRound2.TextAlignVertical= _tavMiddle;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+29)(GP)
;FirmwareIHM_v1_0_driver.c,3375 :: 		ButtonRound2.FontName        = Tahoma14x16_Bold;
LUI	R5, hi_addr(_Tahoma14x16_Bold+0)
ORI	R5, R5, lo_addr(_Tahoma14x16_Bold+0)
SW	R5, Offset(_ButtonRound2+32)(GP)
;FirmwareIHM_v1_0_driver.c,3376 :: 		ButtonRound2.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+49)(GP)
;FirmwareIHM_v1_0_driver.c,3377 :: 		ButtonRound2.Font_Color      = 0x0000;
SH	R0, Offset(_ButtonRound2+36)(GP)
;FirmwareIHM_v1_0_driver.c,3378 :: 		ButtonRound2.VerticalText    = 0;
SB	R0, Offset(_ButtonRound2+38)(GP)
;FirmwareIHM_v1_0_driver.c,3379 :: 		ButtonRound2.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound2+39)(GP)
;FirmwareIHM_v1_0_driver.c,3380 :: 		ButtonRound2.Gradient_Orientation = 0;
SB	R0, Offset(_ButtonRound2+40)(GP)
;FirmwareIHM_v1_0_driver.c,3381 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_ButtonRound2+42)(GP)
;FirmwareIHM_v1_0_driver.c,3382 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_ButtonRound2+44)(GP)
;FirmwareIHM_v1_0_driver.c,3383 :: 		ButtonRound2.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_ButtonRound2+46)(GP)
;FirmwareIHM_v1_0_driver.c,3384 :: 		ButtonRound2.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_ButtonRound2+50)(GP)
;FirmwareIHM_v1_0_driver.c,3385 :: 		ButtonRound2.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_ButtonRound2+48)(GP)
;FirmwareIHM_v1_0_driver.c,3386 :: 		ButtonRound2.OnUpPtr         = 0;
SW	R0, Offset(_ButtonRound2+52)(GP)
;FirmwareIHM_v1_0_driver.c,3387 :: 		ButtonRound2.OnDownPtr       = 0;
SW	R0, Offset(_ButtonRound2+56)(GP)
;FirmwareIHM_v1_0_driver.c,3388 :: 		ButtonRound2.OnClickPtr      = buttonMENU;
LUI	R2, hi_addr(_buttonMENU+0)
ORI	R2, R2, lo_addr(_buttonMENU+0)
SW	R2, Offset(_ButtonRound2+60)(GP)
;FirmwareIHM_v1_0_driver.c,3389 :: 		ButtonRound2.OnPressPtr      = 0;
SW	R0, Offset(_ButtonRound2+64)(GP)
;FirmwareIHM_v1_0_driver.c,3391 :: 		Label26.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label26+0)(GP)
;FirmwareIHM_v1_0_driver.c,3392 :: 		Label26.Order           = 14;
ORI	R2, R0, 14
SB	R2, Offset(_Label26+4)(GP)
;FirmwareIHM_v1_0_driver.c,3393 :: 		Label26.Left            = 158;
ORI	R2, R0, 158
SH	R2, Offset(_Label26+6)(GP)
;FirmwareIHM_v1_0_driver.c,3394 :: 		Label26.Top             = 147;
ORI	R2, R0, 147
SH	R2, Offset(_Label26+8)(GP)
;FirmwareIHM_v1_0_driver.c,3395 :: 		Label26.Width           = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label26+10)(GP)
;FirmwareIHM_v1_0_driver.c,3396 :: 		Label26.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label26+12)(GP)
;FirmwareIHM_v1_0_driver.c,3397 :: 		Label26.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label26+27)(GP)
;FirmwareIHM_v1_0_driver.c,3398 :: 		Label26.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label26+28)(GP)
;FirmwareIHM_v1_0_driver.c,3399 :: 		Label26.Caption         = Label26_Caption;
LUI	R2, hi_addr(_Label26_Caption+0)
ORI	R2, R2, lo_addr(_Label26_Caption+0)
SW	R2, Offset(_Label26+16)(GP)
;FirmwareIHM_v1_0_driver.c,3400 :: 		Label26.FontName        = Tahoma20x21_Bold;
LUI	R4, hi_addr(_Tahoma20x21_Bold+0)
ORI	R4, R4, lo_addr(_Tahoma20x21_Bold+0)
SW	R4, Offset(_Label26+20)(GP)
;FirmwareIHM_v1_0_driver.c,3401 :: 		Label26.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label26+24)(GP)
;FirmwareIHM_v1_0_driver.c,3402 :: 		Label26.VerticalText    = 0;
SB	R0, Offset(_Label26+26)(GP)
;FirmwareIHM_v1_0_driver.c,3403 :: 		Label26.OnUpPtr         = 0;
SW	R0, Offset(_Label26+32)(GP)
;FirmwareIHM_v1_0_driver.c,3404 :: 		Label26.OnDownPtr       = 0;
SW	R0, Offset(_Label26+36)(GP)
;FirmwareIHM_v1_0_driver.c,3405 :: 		Label26.OnClickPtr      = 0;
SW	R0, Offset(_Label26+40)(GP)
;FirmwareIHM_v1_0_driver.c,3406 :: 		Label26.OnPressPtr      = 0;
SW	R0, Offset(_Label26+44)(GP)
;FirmwareIHM_v1_0_driver.c,3408 :: 		Label28.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label28+0)(GP)
;FirmwareIHM_v1_0_driver.c,3409 :: 		Label28.Order           = 15;
ORI	R2, R0, 15
SB	R2, Offset(_Label28+4)(GP)
;FirmwareIHM_v1_0_driver.c,3410 :: 		Label28.Left            = 158;
ORI	R2, R0, 158
SH	R2, Offset(_Label28+6)(GP)
;FirmwareIHM_v1_0_driver.c,3411 :: 		Label28.Top             = 56;
ORI	R2, R0, 56
SH	R2, Offset(_Label28+8)(GP)
;FirmwareIHM_v1_0_driver.c,3412 :: 		Label28.Width           = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label28+10)(GP)
;FirmwareIHM_v1_0_driver.c,3413 :: 		Label28.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label28+12)(GP)
;FirmwareIHM_v1_0_driver.c,3414 :: 		Label28.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label28+27)(GP)
;FirmwareIHM_v1_0_driver.c,3415 :: 		Label28.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label28+28)(GP)
;FirmwareIHM_v1_0_driver.c,3416 :: 		Label28.Caption         = Label28_Caption;
LUI	R2, hi_addr(_Label28_Caption+0)
ORI	R2, R2, lo_addr(_Label28_Caption+0)
SW	R2, Offset(_Label28+16)(GP)
;FirmwareIHM_v1_0_driver.c,3417 :: 		Label28.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label28+20)(GP)
;FirmwareIHM_v1_0_driver.c,3418 :: 		Label28.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label28+24)(GP)
;FirmwareIHM_v1_0_driver.c,3419 :: 		Label28.VerticalText    = 0;
SB	R0, Offset(_Label28+26)(GP)
;FirmwareIHM_v1_0_driver.c,3420 :: 		Label28.OnUpPtr         = 0;
SW	R0, Offset(_Label28+32)(GP)
;FirmwareIHM_v1_0_driver.c,3421 :: 		Label28.OnDownPtr       = 0;
SW	R0, Offset(_Label28+36)(GP)
;FirmwareIHM_v1_0_driver.c,3422 :: 		Label28.OnClickPtr      = 0;
SW	R0, Offset(_Label28+40)(GP)
;FirmwareIHM_v1_0_driver.c,3423 :: 		Label28.OnPressPtr      = 0;
SW	R0, Offset(_Label28+44)(GP)
;FirmwareIHM_v1_0_driver.c,3425 :: 		Label29.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label29+0)(GP)
;FirmwareIHM_v1_0_driver.c,3426 :: 		Label29.Order           = 16;
ORI	R2, R0, 16
SB	R2, Offset(_Label29+4)(GP)
;FirmwareIHM_v1_0_driver.c,3427 :: 		Label29.Left            = 98;
ORI	R2, R0, 98
SH	R2, Offset(_Label29+6)(GP)
;FirmwareIHM_v1_0_driver.c,3428 :: 		Label29.Top             = 193;
ORI	R2, R0, 193
SH	R2, Offset(_Label29+8)(GP)
;FirmwareIHM_v1_0_driver.c,3429 :: 		Label29.Width           = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label29+10)(GP)
;FirmwareIHM_v1_0_driver.c,3430 :: 		Label29.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label29+12)(GP)
;FirmwareIHM_v1_0_driver.c,3431 :: 		Label29.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label29+27)(GP)
;FirmwareIHM_v1_0_driver.c,3432 :: 		Label29.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label29+28)(GP)
;FirmwareIHM_v1_0_driver.c,3433 :: 		Label29.Caption         = Label29_Caption;
LUI	R2, hi_addr(_Label29_Caption+0)
ORI	R2, R2, lo_addr(_Label29_Caption+0)
SW	R2, Offset(_Label29+16)(GP)
;FirmwareIHM_v1_0_driver.c,3434 :: 		Label29.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label29+20)(GP)
;FirmwareIHM_v1_0_driver.c,3435 :: 		Label29.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label29+24)(GP)
;FirmwareIHM_v1_0_driver.c,3436 :: 		Label29.VerticalText    = 0;
SB	R0, Offset(_Label29+26)(GP)
;FirmwareIHM_v1_0_driver.c,3437 :: 		Label29.OnUpPtr         = 0;
SW	R0, Offset(_Label29+32)(GP)
;FirmwareIHM_v1_0_driver.c,3438 :: 		Label29.OnDownPtr       = 0;
SW	R0, Offset(_Label29+36)(GP)
;FirmwareIHM_v1_0_driver.c,3439 :: 		Label29.OnClickPtr      = 0;
SW	R0, Offset(_Label29+40)(GP)
;FirmwareIHM_v1_0_driver.c,3440 :: 		Label29.OnPressPtr      = 0;
SW	R0, Offset(_Label29+44)(GP)
;FirmwareIHM_v1_0_driver.c,3442 :: 		Label30.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label30+0)(GP)
;FirmwareIHM_v1_0_driver.c,3443 :: 		Label30.Order           = 17;
ORI	R2, R0, 17
SB	R2, Offset(_Label30+4)(GP)
;FirmwareIHM_v1_0_driver.c,3444 :: 		Label30.Left            = 158;
ORI	R2, R0, 158
SH	R2, Offset(_Label30+6)(GP)
;FirmwareIHM_v1_0_driver.c,3445 :: 		Label30.Top             = 102;
ORI	R2, R0, 102
SH	R2, Offset(_Label30+8)(GP)
;FirmwareIHM_v1_0_driver.c,3446 :: 		Label30.Width           = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label30+10)(GP)
;FirmwareIHM_v1_0_driver.c,3447 :: 		Label30.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label30+12)(GP)
;FirmwareIHM_v1_0_driver.c,3448 :: 		Label30.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label30+27)(GP)
;FirmwareIHM_v1_0_driver.c,3449 :: 		Label30.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label30+28)(GP)
;FirmwareIHM_v1_0_driver.c,3450 :: 		Label30.Caption         = Label30_Caption;
LUI	R2, hi_addr(_Label30_Caption+0)
ORI	R2, R2, lo_addr(_Label30_Caption+0)
SW	R2, Offset(_Label30+16)(GP)
;FirmwareIHM_v1_0_driver.c,3451 :: 		Label30.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label30+20)(GP)
;FirmwareIHM_v1_0_driver.c,3452 :: 		Label30.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label30+24)(GP)
;FirmwareIHM_v1_0_driver.c,3453 :: 		Label30.VerticalText    = 0;
SB	R0, Offset(_Label30+26)(GP)
;FirmwareIHM_v1_0_driver.c,3454 :: 		Label30.OnUpPtr         = 0;
SW	R0, Offset(_Label30+32)(GP)
;FirmwareIHM_v1_0_driver.c,3455 :: 		Label30.OnDownPtr       = 0;
SW	R0, Offset(_Label30+36)(GP)
;FirmwareIHM_v1_0_driver.c,3456 :: 		Label30.OnClickPtr      = 0;
SW	R0, Offset(_Label30+40)(GP)
;FirmwareIHM_v1_0_driver.c,3457 :: 		Label30.OnPressPtr      = 0;
SW	R0, Offset(_Label30+44)(GP)
;FirmwareIHM_v1_0_driver.c,3459 :: 		Label31.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label31+0)(GP)
;FirmwareIHM_v1_0_driver.c,3460 :: 		Label31.Order           = 18;
ORI	R2, R0, 18
SB	R2, Offset(_Label31+4)(GP)
;FirmwareIHM_v1_0_driver.c,3461 :: 		Label31.Left            = 158;
ORI	R2, R0, 158
SH	R2, Offset(_Label31+6)(GP)
;FirmwareIHM_v1_0_driver.c,3462 :: 		Label31.Top             = 238;
ORI	R2, R0, 238
SH	R2, Offset(_Label31+8)(GP)
;FirmwareIHM_v1_0_driver.c,3463 :: 		Label31.Width           = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label31+10)(GP)
;FirmwareIHM_v1_0_driver.c,3464 :: 		Label31.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label31+12)(GP)
;FirmwareIHM_v1_0_driver.c,3465 :: 		Label31.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label31+27)(GP)
;FirmwareIHM_v1_0_driver.c,3466 :: 		Label31.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label31+28)(GP)
;FirmwareIHM_v1_0_driver.c,3467 :: 		Label31.Caption         = Label31_Caption;
LUI	R2, hi_addr(_Label31_Caption+0)
ORI	R2, R2, lo_addr(_Label31_Caption+0)
SW	R2, Offset(_Label31+16)(GP)
;FirmwareIHM_v1_0_driver.c,3468 :: 		Label31.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label31+20)(GP)
;FirmwareIHM_v1_0_driver.c,3469 :: 		Label31.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label31+24)(GP)
;FirmwareIHM_v1_0_driver.c,3470 :: 		Label31.VerticalText    = 0;
SB	R0, Offset(_Label31+26)(GP)
;FirmwareIHM_v1_0_driver.c,3471 :: 		Label31.OnUpPtr         = 0;
SW	R0, Offset(_Label31+32)(GP)
;FirmwareIHM_v1_0_driver.c,3472 :: 		Label31.OnDownPtr       = 0;
SW	R0, Offset(_Label31+36)(GP)
;FirmwareIHM_v1_0_driver.c,3473 :: 		Label31.OnClickPtr      = 0;
SW	R0, Offset(_Label31+40)(GP)
;FirmwareIHM_v1_0_driver.c,3474 :: 		Label31.OnPressPtr      = 0;
SW	R0, Offset(_Label31+44)(GP)
;FirmwareIHM_v1_0_driver.c,3476 :: 		Label44.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label44+0)(GP)
;FirmwareIHM_v1_0_driver.c,3477 :: 		Label44.Order           = 19;
ORI	R2, R0, 19
SB	R2, Offset(_Label44+4)(GP)
;FirmwareIHM_v1_0_driver.c,3478 :: 		Label44.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label44+6)(GP)
;FirmwareIHM_v1_0_driver.c,3479 :: 		Label44.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label44+8)(GP)
;FirmwareIHM_v1_0_driver.c,3480 :: 		Label44.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label44+10)(GP)
;FirmwareIHM_v1_0_driver.c,3481 :: 		Label44.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label44+12)(GP)
;FirmwareIHM_v1_0_driver.c,3482 :: 		Label44.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label44+27)(GP)
;FirmwareIHM_v1_0_driver.c,3483 :: 		Label44.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label44+28)(GP)
;FirmwareIHM_v1_0_driver.c,3484 :: 		Label44.Caption         = Label44_Caption;
LUI	R2, hi_addr(_Label44_Caption+0)
ORI	R2, R2, lo_addr(_Label44_Caption+0)
SW	R2, Offset(_Label44+16)(GP)
;FirmwareIHM_v1_0_driver.c,3485 :: 		Label44.FontName        = Tahoma12x16_Regular;
LUI	R3, hi_addr(_Tahoma12x16_Regular+0)
ORI	R3, R3, lo_addr(_Tahoma12x16_Regular+0)
SW	R3, Offset(_Label44+20)(GP)
;FirmwareIHM_v1_0_driver.c,3486 :: 		Label44.Font_Color      = 0x0000;
SH	R0, Offset(_Label44+24)(GP)
;FirmwareIHM_v1_0_driver.c,3487 :: 		Label44.VerticalText    = 0;
SB	R0, Offset(_Label44+26)(GP)
;FirmwareIHM_v1_0_driver.c,3488 :: 		Label44.OnUpPtr         = 0;
SW	R0, Offset(_Label44+32)(GP)
;FirmwareIHM_v1_0_driver.c,3489 :: 		Label44.OnDownPtr       = 0;
SW	R0, Offset(_Label44+36)(GP)
;FirmwareIHM_v1_0_driver.c,3490 :: 		Label44.OnClickPtr      = 0;
SW	R0, Offset(_Label44+40)(GP)
;FirmwareIHM_v1_0_driver.c,3491 :: 		Label44.OnPressPtr      = 0;
SW	R0, Offset(_Label44+44)(GP)
;FirmwareIHM_v1_0_driver.c,3493 :: 		Label45.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label45+0)(GP)
;FirmwareIHM_v1_0_driver.c,3494 :: 		Label45.Order           = 20;
ORI	R2, R0, 20
SB	R2, Offset(_Label45+4)(GP)
;FirmwareIHM_v1_0_driver.c,3495 :: 		Label45.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label45+6)(GP)
;FirmwareIHM_v1_0_driver.c,3496 :: 		Label45.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label45+8)(GP)
;FirmwareIHM_v1_0_driver.c,3497 :: 		Label45.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label45+10)(GP)
;FirmwareIHM_v1_0_driver.c,3498 :: 		Label45.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label45+12)(GP)
;FirmwareIHM_v1_0_driver.c,3499 :: 		Label45.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label45+27)(GP)
;FirmwareIHM_v1_0_driver.c,3500 :: 		Label45.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label45+28)(GP)
;FirmwareIHM_v1_0_driver.c,3501 :: 		Label45.Caption         = Label45_Caption;
LUI	R2, hi_addr(_Label45_Caption+0)
ORI	R2, R2, lo_addr(_Label45_Caption+0)
SW	R2, Offset(_Label45+16)(GP)
;FirmwareIHM_v1_0_driver.c,3502 :: 		Label45.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label45+20)(GP)
;FirmwareIHM_v1_0_driver.c,3503 :: 		Label45.Font_Color      = 0x0000;
SH	R0, Offset(_Label45+24)(GP)
;FirmwareIHM_v1_0_driver.c,3504 :: 		Label45.VerticalText    = 0;
SB	R0, Offset(_Label45+26)(GP)
;FirmwareIHM_v1_0_driver.c,3505 :: 		Label45.OnUpPtr         = 0;
SW	R0, Offset(_Label45+32)(GP)
;FirmwareIHM_v1_0_driver.c,3506 :: 		Label45.OnDownPtr       = 0;
SW	R0, Offset(_Label45+36)(GP)
;FirmwareIHM_v1_0_driver.c,3507 :: 		Label45.OnClickPtr      = 0;
SW	R0, Offset(_Label45+40)(GP)
;FirmwareIHM_v1_0_driver.c,3508 :: 		Label45.OnPressPtr      = 0;
SW	R0, Offset(_Label45+44)(GP)
;FirmwareIHM_v1_0_driver.c,3510 :: 		Label46.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label46+0)(GP)
;FirmwareIHM_v1_0_driver.c,3511 :: 		Label46.Order           = 21;
ORI	R2, R0, 21
SB	R2, Offset(_Label46+4)(GP)
;FirmwareIHM_v1_0_driver.c,3512 :: 		Label46.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label46+6)(GP)
;FirmwareIHM_v1_0_driver.c,3513 :: 		Label46.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label46+8)(GP)
;FirmwareIHM_v1_0_driver.c,3514 :: 		Label46.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label46+10)(GP)
;FirmwareIHM_v1_0_driver.c,3515 :: 		Label46.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label46+12)(GP)
;FirmwareIHM_v1_0_driver.c,3516 :: 		Label46.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label46+27)(GP)
;FirmwareIHM_v1_0_driver.c,3517 :: 		Label46.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label46+28)(GP)
;FirmwareIHM_v1_0_driver.c,3518 :: 		Label46.Caption         = Label46_Caption;
LUI	R2, hi_addr(_Label46_Caption+0)
ORI	R2, R2, lo_addr(_Label46_Caption+0)
SW	R2, Offset(_Label46+16)(GP)
;FirmwareIHM_v1_0_driver.c,3519 :: 		Label46.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label46+20)(GP)
;FirmwareIHM_v1_0_driver.c,3520 :: 		Label46.Font_Color      = 0x0000;
SH	R0, Offset(_Label46+24)(GP)
;FirmwareIHM_v1_0_driver.c,3521 :: 		Label46.VerticalText    = 0;
SB	R0, Offset(_Label46+26)(GP)
;FirmwareIHM_v1_0_driver.c,3522 :: 		Label46.OnUpPtr         = 0;
SW	R0, Offset(_Label46+32)(GP)
;FirmwareIHM_v1_0_driver.c,3523 :: 		Label46.OnDownPtr       = 0;
SW	R0, Offset(_Label46+36)(GP)
;FirmwareIHM_v1_0_driver.c,3524 :: 		Label46.OnClickPtr      = 0;
SW	R0, Offset(_Label46+40)(GP)
;FirmwareIHM_v1_0_driver.c,3525 :: 		Label46.OnPressPtr      = 0;
SW	R0, Offset(_Label46+44)(GP)
;FirmwareIHM_v1_0_driver.c,3527 :: 		Label47.OwnerScreen     = &ScreenPrincipal;
LUI	R2, hi_addr(_ScreenPrincipal+0)
ORI	R2, R2, lo_addr(_ScreenPrincipal+0)
SW	R2, Offset(_Label47+0)(GP)
;FirmwareIHM_v1_0_driver.c,3528 :: 		Label47.Order           = 22;
ORI	R2, R0, 22
SB	R2, Offset(_Label47+4)(GP)
;FirmwareIHM_v1_0_driver.c,3529 :: 		Label47.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label47+6)(GP)
;FirmwareIHM_v1_0_driver.c,3530 :: 		Label47.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label47+8)(GP)
;FirmwareIHM_v1_0_driver.c,3531 :: 		Label47.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label47+10)(GP)
;FirmwareIHM_v1_0_driver.c,3532 :: 		Label47.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label47+12)(GP)
;FirmwareIHM_v1_0_driver.c,3533 :: 		Label47.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label47+27)(GP)
;FirmwareIHM_v1_0_driver.c,3534 :: 		Label47.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label47+28)(GP)
;FirmwareIHM_v1_0_driver.c,3535 :: 		Label47.Caption         = Label47_Caption;
LUI	R2, hi_addr(_Label47_Caption+0)
ORI	R2, R2, lo_addr(_Label47_Caption+0)
SW	R2, Offset(_Label47+16)(GP)
;FirmwareIHM_v1_0_driver.c,3536 :: 		Label47.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label47+20)(GP)
;FirmwareIHM_v1_0_driver.c,3537 :: 		Label47.Font_Color      = 0x0000;
SH	R0, Offset(_Label47+24)(GP)
;FirmwareIHM_v1_0_driver.c,3538 :: 		Label47.VerticalText    = 0;
SB	R0, Offset(_Label47+26)(GP)
;FirmwareIHM_v1_0_driver.c,3539 :: 		Label47.OnUpPtr         = 0;
SW	R0, Offset(_Label47+32)(GP)
;FirmwareIHM_v1_0_driver.c,3540 :: 		Label47.OnDownPtr       = 0;
SW	R0, Offset(_Label47+36)(GP)
;FirmwareIHM_v1_0_driver.c,3541 :: 		Label47.OnClickPtr      = 0;
SW	R0, Offset(_Label47+40)(GP)
;FirmwareIHM_v1_0_driver.c,3542 :: 		Label47.OnPressPtr      = 0;
SW	R0, Offset(_Label47+44)(GP)
;FirmwareIHM_v1_0_driver.c,3544 :: 		Label15.OwnerScreen     = &ScreenSenha;
LUI	R2, hi_addr(_ScreenSenha+0)
ORI	R2, R2, lo_addr(_ScreenSenha+0)
SW	R2, Offset(_Label15+0)(GP)
;FirmwareIHM_v1_0_driver.c,3545 :: 		Label15.Order           = 15;
ORI	R2, R0, 15
SB	R2, Offset(_Label15+4)(GP)
;FirmwareIHM_v1_0_driver.c,3546 :: 		Label15.Left            = 62;
ORI	R2, R0, 62
SH	R2, Offset(_Label15+6)(GP)
;FirmwareIHM_v1_0_driver.c,3547 :: 		Label15.Top             = 58;
ORI	R2, R0, 58
SH	R2, Offset(_Label15+8)(GP)
;FirmwareIHM_v1_0_driver.c,3548 :: 		Label15.Width           = 0;
SH	R0, Offset(_Label15+10)(GP)
;FirmwareIHM_v1_0_driver.c,3549 :: 		Label15.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label15+12)(GP)
;FirmwareIHM_v1_0_driver.c,3550 :: 		Label15.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label15+27)(GP)
;FirmwareIHM_v1_0_driver.c,3551 :: 		Label15.Active          = 0;
SB	R0, Offset(_Label15+28)(GP)
;FirmwareIHM_v1_0_driver.c,3552 :: 		Label15.Caption         = Label15_Caption;
LUI	R2, hi_addr(_Label15_Caption+0)
ORI	R2, R2, lo_addr(_Label15_Caption+0)
SW	R2, Offset(_Label15+16)(GP)
;FirmwareIHM_v1_0_driver.c,3553 :: 		Label15.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label15+20)(GP)
;FirmwareIHM_v1_0_driver.c,3554 :: 		Label15.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label15+24)(GP)
;FirmwareIHM_v1_0_driver.c,3555 :: 		Label15.VerticalText    = 0;
SB	R0, Offset(_Label15+26)(GP)
;FirmwareIHM_v1_0_driver.c,3556 :: 		Label15.OnUpPtr         = 0;
SW	R0, Offset(_Label15+32)(GP)
;FirmwareIHM_v1_0_driver.c,3557 :: 		Label15.OnDownPtr       = 0;
SW	R0, Offset(_Label15+36)(GP)
;FirmwareIHM_v1_0_driver.c,3558 :: 		Label15.OnClickPtr      = 0;
SW	R0, Offset(_Label15+40)(GP)
;FirmwareIHM_v1_0_driver.c,3559 :: 		Label15.OnPressPtr      = 0;
SW	R0, Offset(_Label15+44)(GP)
;FirmwareIHM_v1_0_driver.c,3561 :: 		Label48.OwnerScreen     = &ScreenSenha;
LUI	R2, hi_addr(_ScreenSenha+0)
ORI	R2, R2, lo_addr(_ScreenSenha+0)
SW	R2, Offset(_Label48+0)(GP)
;FirmwareIHM_v1_0_driver.c,3562 :: 		Label48.Order           = 17;
ORI	R2, R0, 17
SB	R2, Offset(_Label48+4)(GP)
;FirmwareIHM_v1_0_driver.c,3563 :: 		Label48.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label48+6)(GP)
;FirmwareIHM_v1_0_driver.c,3564 :: 		Label48.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label48+8)(GP)
;FirmwareIHM_v1_0_driver.c,3565 :: 		Label48.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label48+10)(GP)
;FirmwareIHM_v1_0_driver.c,3566 :: 		Label48.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label48+12)(GP)
;FirmwareIHM_v1_0_driver.c,3567 :: 		Label48.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label48+27)(GP)
;FirmwareIHM_v1_0_driver.c,3568 :: 		Label48.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label48+28)(GP)
;FirmwareIHM_v1_0_driver.c,3569 :: 		Label48.Caption         = Label48_Caption;
LUI	R2, hi_addr(_Label48_Caption+0)
ORI	R2, R2, lo_addr(_Label48_Caption+0)
SW	R2, Offset(_Label48+16)(GP)
;FirmwareIHM_v1_0_driver.c,3570 :: 		Label48.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label48+20)(GP)
;FirmwareIHM_v1_0_driver.c,3571 :: 		Label48.Font_Color      = 0x0000;
SH	R0, Offset(_Label48+24)(GP)
;FirmwareIHM_v1_0_driver.c,3572 :: 		Label48.VerticalText    = 0;
SB	R0, Offset(_Label48+26)(GP)
;FirmwareIHM_v1_0_driver.c,3573 :: 		Label48.OnUpPtr         = 0;
SW	R0, Offset(_Label48+32)(GP)
;FirmwareIHM_v1_0_driver.c,3574 :: 		Label48.OnDownPtr       = 0;
SW	R0, Offset(_Label48+36)(GP)
;FirmwareIHM_v1_0_driver.c,3575 :: 		Label48.OnClickPtr      = 0;
SW	R0, Offset(_Label48+40)(GP)
;FirmwareIHM_v1_0_driver.c,3576 :: 		Label48.OnPressPtr      = 0;
SW	R0, Offset(_Label48+44)(GP)
;FirmwareIHM_v1_0_driver.c,3578 :: 		Label49.OwnerScreen     = &ScreenSenha;
LUI	R2, hi_addr(_ScreenSenha+0)
ORI	R2, R2, lo_addr(_ScreenSenha+0)
SW	R2, Offset(_Label49+0)(GP)
;FirmwareIHM_v1_0_driver.c,3579 :: 		Label49.Order           = 18;
ORI	R2, R0, 18
SB	R2, Offset(_Label49+4)(GP)
;FirmwareIHM_v1_0_driver.c,3580 :: 		Label49.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label49+6)(GP)
;FirmwareIHM_v1_0_driver.c,3581 :: 		Label49.Top             = 3;
ORI	R2, R0, 3
SH	R2, Offset(_Label49+8)(GP)
;FirmwareIHM_v1_0_driver.c,3582 :: 		Label49.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label49+10)(GP)
;FirmwareIHM_v1_0_driver.c,3583 :: 		Label49.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label49+12)(GP)
;FirmwareIHM_v1_0_driver.c,3584 :: 		Label49.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label49+27)(GP)
;FirmwareIHM_v1_0_driver.c,3585 :: 		Label49.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label49+28)(GP)
;FirmwareIHM_v1_0_driver.c,3586 :: 		Label49.Caption         = Label49_Caption;
LUI	R2, hi_addr(_Label49_Caption+0)
ORI	R2, R2, lo_addr(_Label49_Caption+0)
SW	R2, Offset(_Label49+16)(GP)
;FirmwareIHM_v1_0_driver.c,3587 :: 		Label49.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label49+20)(GP)
;FirmwareIHM_v1_0_driver.c,3588 :: 		Label49.Font_Color      = 0x0000;
SH	R0, Offset(_Label49+24)(GP)
;FirmwareIHM_v1_0_driver.c,3589 :: 		Label49.VerticalText    = 0;
SB	R0, Offset(_Label49+26)(GP)
;FirmwareIHM_v1_0_driver.c,3590 :: 		Label49.OnUpPtr         = 0;
SW	R0, Offset(_Label49+32)(GP)
;FirmwareIHM_v1_0_driver.c,3591 :: 		Label49.OnDownPtr       = 0;
SW	R0, Offset(_Label49+36)(GP)
;FirmwareIHM_v1_0_driver.c,3592 :: 		Label49.OnClickPtr      = 0;
SW	R0, Offset(_Label49+40)(GP)
;FirmwareIHM_v1_0_driver.c,3593 :: 		Label49.OnPressPtr      = 0;
SW	R0, Offset(_Label49+44)(GP)
;FirmwareIHM_v1_0_driver.c,3595 :: 		Label50.OwnerScreen     = &ScreenSenha;
LUI	R2, hi_addr(_ScreenSenha+0)
ORI	R2, R2, lo_addr(_ScreenSenha+0)
SW	R2, Offset(_Label50+0)(GP)
;FirmwareIHM_v1_0_driver.c,3596 :: 		Label50.Order           = 19;
ORI	R2, R0, 19
SB	R2, Offset(_Label50+4)(GP)
;FirmwareIHM_v1_0_driver.c,3597 :: 		Label50.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label50+6)(GP)
;FirmwareIHM_v1_0_driver.c,3598 :: 		Label50.Top             = 3;
ORI	R2, R0, 3
SH	R2, Offset(_Label50+8)(GP)
;FirmwareIHM_v1_0_driver.c,3599 :: 		Label50.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label50+10)(GP)
;FirmwareIHM_v1_0_driver.c,3600 :: 		Label50.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label50+12)(GP)
;FirmwareIHM_v1_0_driver.c,3601 :: 		Label50.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label50+27)(GP)
;FirmwareIHM_v1_0_driver.c,3602 :: 		Label50.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label50+28)(GP)
;FirmwareIHM_v1_0_driver.c,3603 :: 		Label50.Caption         = Label50_Caption;
LUI	R2, hi_addr(_Label50_Caption+0)
ORI	R2, R2, lo_addr(_Label50_Caption+0)
SW	R2, Offset(_Label50+16)(GP)
;FirmwareIHM_v1_0_driver.c,3604 :: 		Label50.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label50+20)(GP)
;FirmwareIHM_v1_0_driver.c,3605 :: 		Label50.Font_Color      = 0x0000;
SH	R0, Offset(_Label50+24)(GP)
;FirmwareIHM_v1_0_driver.c,3606 :: 		Label50.VerticalText    = 0;
SB	R0, Offset(_Label50+26)(GP)
;FirmwareIHM_v1_0_driver.c,3607 :: 		Label50.OnUpPtr         = 0;
SW	R0, Offset(_Label50+32)(GP)
;FirmwareIHM_v1_0_driver.c,3608 :: 		Label50.OnDownPtr       = 0;
SW	R0, Offset(_Label50+36)(GP)
;FirmwareIHM_v1_0_driver.c,3609 :: 		Label50.OnClickPtr      = 0;
SW	R0, Offset(_Label50+40)(GP)
;FirmwareIHM_v1_0_driver.c,3610 :: 		Label50.OnPressPtr      = 0;
SW	R0, Offset(_Label50+44)(GP)
;FirmwareIHM_v1_0_driver.c,3612 :: 		Label51.OwnerScreen     = &ScreenSenha;
LUI	R2, hi_addr(_ScreenSenha+0)
ORI	R2, R2, lo_addr(_ScreenSenha+0)
SW	R2, Offset(_Label51+0)(GP)
;FirmwareIHM_v1_0_driver.c,3613 :: 		Label51.Order           = 20;
ORI	R2, R0, 20
SB	R2, Offset(_Label51+4)(GP)
;FirmwareIHM_v1_0_driver.c,3614 :: 		Label51.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label51+6)(GP)
;FirmwareIHM_v1_0_driver.c,3615 :: 		Label51.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label51+8)(GP)
;FirmwareIHM_v1_0_driver.c,3616 :: 		Label51.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label51+10)(GP)
;FirmwareIHM_v1_0_driver.c,3617 :: 		Label51.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label51+12)(GP)
;FirmwareIHM_v1_0_driver.c,3618 :: 		Label51.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label51+27)(GP)
;FirmwareIHM_v1_0_driver.c,3619 :: 		Label51.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label51+28)(GP)
;FirmwareIHM_v1_0_driver.c,3620 :: 		Label51.Caption         = Label51_Caption;
LUI	R2, hi_addr(_Label51_Caption+0)
ORI	R2, R2, lo_addr(_Label51_Caption+0)
SW	R2, Offset(_Label51+16)(GP)
;FirmwareIHM_v1_0_driver.c,3621 :: 		Label51.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label51+20)(GP)
;FirmwareIHM_v1_0_driver.c,3622 :: 		Label51.Font_Color      = 0x0000;
SH	R0, Offset(_Label51+24)(GP)
;FirmwareIHM_v1_0_driver.c,3623 :: 		Label51.VerticalText    = 0;
SB	R0, Offset(_Label51+26)(GP)
;FirmwareIHM_v1_0_driver.c,3624 :: 		Label51.OnUpPtr         = 0;
SW	R0, Offset(_Label51+32)(GP)
;FirmwareIHM_v1_0_driver.c,3625 :: 		Label51.OnDownPtr       = 0;
SW	R0, Offset(_Label51+36)(GP)
;FirmwareIHM_v1_0_driver.c,3626 :: 		Label51.OnClickPtr      = 0;
SW	R0, Offset(_Label51+40)(GP)
;FirmwareIHM_v1_0_driver.c,3627 :: 		Label51.OnPressPtr      = 0;
SW	R0, Offset(_Label51+44)(GP)
;FirmwareIHM_v1_0_driver.c,3629 :: 		Label27.OwnerScreen     = &ScreenMalhaDeControle;
LUI	R2, hi_addr(_ScreenMalhaDeControle+0)
ORI	R2, R2, lo_addr(_ScreenMalhaDeControle+0)
SW	R2, Offset(_Label27+0)(GP)
;FirmwareIHM_v1_0_driver.c,3630 :: 		Label27.Order           = 2;
ORI	R2, R0, 2
SB	R2, Offset(_Label27+4)(GP)
;FirmwareIHM_v1_0_driver.c,3631 :: 		Label27.Left            = 153;
ORI	R2, R0, 153
SH	R2, Offset(_Label27+6)(GP)
;FirmwareIHM_v1_0_driver.c,3632 :: 		Label27.Top             = 59;
ORI	R2, R0, 59
SH	R2, Offset(_Label27+8)(GP)
;FirmwareIHM_v1_0_driver.c,3633 :: 		Label27.Width           = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label27+10)(GP)
;FirmwareIHM_v1_0_driver.c,3634 :: 		Label27.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label27+12)(GP)
;FirmwareIHM_v1_0_driver.c,3635 :: 		Label27.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label27+27)(GP)
;FirmwareIHM_v1_0_driver.c,3636 :: 		Label27.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label27+28)(GP)
;FirmwareIHM_v1_0_driver.c,3637 :: 		Label27.Caption         = Label27_Caption;
LUI	R2, hi_addr(_Label27_Caption+0)
ORI	R2, R2, lo_addr(_Label27_Caption+0)
SW	R2, Offset(_Label27+16)(GP)
;FirmwareIHM_v1_0_driver.c,3638 :: 		Label27.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label27+20)(GP)
;FirmwareIHM_v1_0_driver.c,3639 :: 		Label27.Font_Color      = 0x0000;
SH	R0, Offset(_Label27+24)(GP)
;FirmwareIHM_v1_0_driver.c,3640 :: 		Label27.VerticalText    = 0;
SB	R0, Offset(_Label27+26)(GP)
;FirmwareIHM_v1_0_driver.c,3641 :: 		Label27.OnUpPtr         = 0;
SW	R0, Offset(_Label27+32)(GP)
;FirmwareIHM_v1_0_driver.c,3642 :: 		Label27.OnDownPtr       = 0;
SW	R0, Offset(_Label27+36)(GP)
;FirmwareIHM_v1_0_driver.c,3643 :: 		Label27.OnClickPtr      = 0;
SW	R0, Offset(_Label27+40)(GP)
;FirmwareIHM_v1_0_driver.c,3644 :: 		Label27.OnPressPtr      = 0;
SW	R0, Offset(_Label27+44)(GP)
;FirmwareIHM_v1_0_driver.c,3646 :: 		CheckBox1.OwnerScreen     = &ScreenMalhaDeControle;
LUI	R2, hi_addr(_ScreenMalhaDeControle+0)
ORI	R2, R2, lo_addr(_ScreenMalhaDeControle+0)
SW	R2, Offset(_CheckBox1+0)(GP)
;FirmwareIHM_v1_0_driver.c,3647 :: 		CheckBox1.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_CheckBox1+4)(GP)
;FirmwareIHM_v1_0_driver.c,3648 :: 		CheckBox1.Left            = 38;
ORI	R2, R0, 38
SH	R2, Offset(_CheckBox1+6)(GP)
;FirmwareIHM_v1_0_driver.c,3649 :: 		CheckBox1.Top             = 127;
ORI	R2, R0, 127
SH	R2, Offset(_CheckBox1+8)(GP)
;FirmwareIHM_v1_0_driver.c,3650 :: 		CheckBox1.Width           = 91;
ORI	R2, R0, 91
SH	R2, Offset(_CheckBox1+10)(GP)
;FirmwareIHM_v1_0_driver.c,3651 :: 		CheckBox1.Height          = 28;
ORI	R2, R0, 28
SH	R2, Offset(_CheckBox1+12)(GP)
;FirmwareIHM_v1_0_driver.c,3652 :: 		CheckBox1.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox1+14)(GP)
;FirmwareIHM_v1_0_driver.c,3653 :: 		CheckBox1.Pen_Color       = 0x0000;
SH	R0, Offset(_CheckBox1+16)(GP)
;FirmwareIHM_v1_0_driver.c,3654 :: 		CheckBox1.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox1+18)(GP)
;FirmwareIHM_v1_0_driver.c,3655 :: 		CheckBox1.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox1+19)(GP)
;FirmwareIHM_v1_0_driver.c,3656 :: 		CheckBox1.Checked         = 0;
SB	R0, Offset(_CheckBox1+20)(GP)
;FirmwareIHM_v1_0_driver.c,3657 :: 		CheckBox1.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox1+21)(GP)
;FirmwareIHM_v1_0_driver.c,3658 :: 		CheckBox1.Caption         = CheckBox1_Caption;
LUI	R2, hi_addr(_CheckBox1_Caption+0)
ORI	R2, R2, lo_addr(_CheckBox1_Caption+0)
SW	R2, Offset(_CheckBox1+24)(GP)
;FirmwareIHM_v1_0_driver.c,3659 :: 		CheckBox1.TextAlign       = _taLeft;
SB	R0, Offset(_CheckBox1+28)(GP)
;FirmwareIHM_v1_0_driver.c,3660 :: 		CheckBox1.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_CheckBox1+32)(GP)
;FirmwareIHM_v1_0_driver.c,3661 :: 		CheckBox1.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox1+48)(GP)
;FirmwareIHM_v1_0_driver.c,3662 :: 		CheckBox1.Font_Color      = 0x0000;
SH	R0, Offset(_CheckBox1+36)(GP)
;FirmwareIHM_v1_0_driver.c,3663 :: 		CheckBox1.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox1+38)(GP)
;FirmwareIHM_v1_0_driver.c,3664 :: 		CheckBox1.Gradient_Orientation = 0;
SB	R0, Offset(_CheckBox1+39)(GP)
;FirmwareIHM_v1_0_driver.c,3665 :: 		CheckBox1.Gradient_Start_Color = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_CheckBox1+40)(GP)
;FirmwareIHM_v1_0_driver.c,3666 :: 		CheckBox1.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox1+42)(GP)
;FirmwareIHM_v1_0_driver.c,3667 :: 		CheckBox1.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox1+44)(GP)
;FirmwareIHM_v1_0_driver.c,3668 :: 		CheckBox1.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_CheckBox1+50)(GP)
;FirmwareIHM_v1_0_driver.c,3669 :: 		CheckBox1.Rounded         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox1+46)(GP)
;FirmwareIHM_v1_0_driver.c,3670 :: 		CheckBox1.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_CheckBox1+47)(GP)
;FirmwareIHM_v1_0_driver.c,3671 :: 		CheckBox1.OnUpPtr         = 0;
SW	R0, Offset(_CheckBox1+52)(GP)
;FirmwareIHM_v1_0_driver.c,3672 :: 		CheckBox1.OnDownPtr       = 0;
SW	R0, Offset(_CheckBox1+56)(GP)
;FirmwareIHM_v1_0_driver.c,3673 :: 		CheckBox1.OnClickPtr      = malhaAberta;
LUI	R2, hi_addr(_malhaAberta+0)
ORI	R2, R2, lo_addr(_malhaAberta+0)
SW	R2, Offset(_CheckBox1+60)(GP)
;FirmwareIHM_v1_0_driver.c,3674 :: 		CheckBox1.OnPressPtr      = 0;
SW	R0, Offset(_CheckBox1+64)(GP)
;FirmwareIHM_v1_0_driver.c,3676 :: 		CheckBox2.OwnerScreen     = &ScreenMalhaDeControle;
LUI	R2, hi_addr(_ScreenMalhaDeControle+0)
ORI	R2, R2, lo_addr(_ScreenMalhaDeControle+0)
SW	R2, Offset(_CheckBox2+0)(GP)
;FirmwareIHM_v1_0_driver.c,3677 :: 		CheckBox2.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_CheckBox2+4)(GP)
;FirmwareIHM_v1_0_driver.c,3678 :: 		CheckBox2.Left            = 38;
ORI	R2, R0, 38
SH	R2, Offset(_CheckBox2+6)(GP)
;FirmwareIHM_v1_0_driver.c,3679 :: 		CheckBox2.Top             = 201;
ORI	R2, R0, 201
SH	R2, Offset(_CheckBox2+8)(GP)
;FirmwareIHM_v1_0_driver.c,3680 :: 		CheckBox2.Width           = 105;
ORI	R2, R0, 105
SH	R2, Offset(_CheckBox2+10)(GP)
;FirmwareIHM_v1_0_driver.c,3681 :: 		CheckBox2.Height          = 28;
ORI	R2, R0, 28
SH	R2, Offset(_CheckBox2+12)(GP)
;FirmwareIHM_v1_0_driver.c,3682 :: 		CheckBox2.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox2+14)(GP)
;FirmwareIHM_v1_0_driver.c,3683 :: 		CheckBox2.Pen_Color       = 0x0000;
SH	R0, Offset(_CheckBox2+16)(GP)
;FirmwareIHM_v1_0_driver.c,3684 :: 		CheckBox2.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox2+18)(GP)
;FirmwareIHM_v1_0_driver.c,3685 :: 		CheckBox2.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox2+19)(GP)
;FirmwareIHM_v1_0_driver.c,3686 :: 		CheckBox2.Checked         = 0;
SB	R0, Offset(_CheckBox2+20)(GP)
;FirmwareIHM_v1_0_driver.c,3687 :: 		CheckBox2.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox2+21)(GP)
;FirmwareIHM_v1_0_driver.c,3688 :: 		CheckBox2.Caption         = CheckBox2_Caption;
LUI	R2, hi_addr(_CheckBox2_Caption+0)
ORI	R2, R2, lo_addr(_CheckBox2_Caption+0)
SW	R2, Offset(_CheckBox2+24)(GP)
;FirmwareIHM_v1_0_driver.c,3689 :: 		CheckBox2.TextAlign       = _taLeft;
SB	R0, Offset(_CheckBox2+28)(GP)
;FirmwareIHM_v1_0_driver.c,3690 :: 		CheckBox2.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_CheckBox2+32)(GP)
;FirmwareIHM_v1_0_driver.c,3691 :: 		CheckBox2.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox2+48)(GP)
;FirmwareIHM_v1_0_driver.c,3692 :: 		CheckBox2.Font_Color      = 0x0000;
SH	R0, Offset(_CheckBox2+36)(GP)
;FirmwareIHM_v1_0_driver.c,3693 :: 		CheckBox2.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox2+38)(GP)
;FirmwareIHM_v1_0_driver.c,3694 :: 		CheckBox2.Gradient_Orientation = 0;
SB	R0, Offset(_CheckBox2+39)(GP)
;FirmwareIHM_v1_0_driver.c,3695 :: 		CheckBox2.Gradient_Start_Color = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_CheckBox2+40)(GP)
;FirmwareIHM_v1_0_driver.c,3696 :: 		CheckBox2.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox2+42)(GP)
;FirmwareIHM_v1_0_driver.c,3697 :: 		CheckBox2.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox2+44)(GP)
;FirmwareIHM_v1_0_driver.c,3698 :: 		CheckBox2.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_CheckBox2+50)(GP)
;FirmwareIHM_v1_0_driver.c,3699 :: 		CheckBox2.Rounded         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox2+46)(GP)
;FirmwareIHM_v1_0_driver.c,3700 :: 		CheckBox2.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_CheckBox2+47)(GP)
;FirmwareIHM_v1_0_driver.c,3701 :: 		CheckBox2.OnUpPtr         = 0;
SW	R0, Offset(_CheckBox2+52)(GP)
;FirmwareIHM_v1_0_driver.c,3702 :: 		CheckBox2.OnDownPtr       = 0;
SW	R0, Offset(_CheckBox2+56)(GP)
;FirmwareIHM_v1_0_driver.c,3703 :: 		CheckBox2.OnClickPtr      = malhaFechada;
LUI	R2, hi_addr(_malhaFechada+0)
ORI	R2, R2, lo_addr(_malhaFechada+0)
SW	R2, Offset(_CheckBox2+60)(GP)
;FirmwareIHM_v1_0_driver.c,3704 :: 		CheckBox2.OnPressPtr      = 0;
SW	R0, Offset(_CheckBox2+64)(GP)
;FirmwareIHM_v1_0_driver.c,3706 :: 		Label52.OwnerScreen     = &ScreenMalhaDeControle;
LUI	R2, hi_addr(_ScreenMalhaDeControle+0)
ORI	R2, R2, lo_addr(_ScreenMalhaDeControle+0)
SW	R2, Offset(_Label52+0)(GP)
;FirmwareIHM_v1_0_driver.c,3707 :: 		Label52.Order           = 6;
ORI	R2, R0, 6
SB	R2, Offset(_Label52+4)(GP)
;FirmwareIHM_v1_0_driver.c,3708 :: 		Label52.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label52+6)(GP)
;FirmwareIHM_v1_0_driver.c,3709 :: 		Label52.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label52+8)(GP)
;FirmwareIHM_v1_0_driver.c,3710 :: 		Label52.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label52+10)(GP)
;FirmwareIHM_v1_0_driver.c,3711 :: 		Label52.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label52+12)(GP)
;FirmwareIHM_v1_0_driver.c,3712 :: 		Label52.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label52+27)(GP)
;FirmwareIHM_v1_0_driver.c,3713 :: 		Label52.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label52+28)(GP)
;FirmwareIHM_v1_0_driver.c,3714 :: 		Label52.Caption         = Label52_Caption;
LUI	R2, hi_addr(_Label52_Caption+0)
ORI	R2, R2, lo_addr(_Label52_Caption+0)
SW	R2, Offset(_Label52+16)(GP)
;FirmwareIHM_v1_0_driver.c,3715 :: 		Label52.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label52+20)(GP)
;FirmwareIHM_v1_0_driver.c,3716 :: 		Label52.Font_Color      = 0x0000;
SH	R0, Offset(_Label52+24)(GP)
;FirmwareIHM_v1_0_driver.c,3717 :: 		Label52.VerticalText    = 0;
SB	R0, Offset(_Label52+26)(GP)
;FirmwareIHM_v1_0_driver.c,3718 :: 		Label52.OnUpPtr         = 0;
SW	R0, Offset(_Label52+32)(GP)
;FirmwareIHM_v1_0_driver.c,3719 :: 		Label52.OnDownPtr       = 0;
SW	R0, Offset(_Label52+36)(GP)
;FirmwareIHM_v1_0_driver.c,3720 :: 		Label52.OnClickPtr      = 0;
SW	R0, Offset(_Label52+40)(GP)
;FirmwareIHM_v1_0_driver.c,3721 :: 		Label52.OnPressPtr      = 0;
SW	R0, Offset(_Label52+44)(GP)
;FirmwareIHM_v1_0_driver.c,3723 :: 		Label53.OwnerScreen     = &ScreenMalhaDeControle;
LUI	R2, hi_addr(_ScreenMalhaDeControle+0)
ORI	R2, R2, lo_addr(_ScreenMalhaDeControle+0)
SW	R2, Offset(_Label53+0)(GP)
;FirmwareIHM_v1_0_driver.c,3724 :: 		Label53.Order           = 7;
ORI	R2, R0, 7
SB	R2, Offset(_Label53+4)(GP)
;FirmwareIHM_v1_0_driver.c,3725 :: 		Label53.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label53+6)(GP)
;FirmwareIHM_v1_0_driver.c,3726 :: 		Label53.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label53+8)(GP)
;FirmwareIHM_v1_0_driver.c,3727 :: 		Label53.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label53+10)(GP)
;FirmwareIHM_v1_0_driver.c,3728 :: 		Label53.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label53+12)(GP)
;FirmwareIHM_v1_0_driver.c,3729 :: 		Label53.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label53+27)(GP)
;FirmwareIHM_v1_0_driver.c,3730 :: 		Label53.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label53+28)(GP)
;FirmwareIHM_v1_0_driver.c,3731 :: 		Label53.Caption         = Label53_Caption;
LUI	R2, hi_addr(_Label53_Caption+0)
ORI	R2, R2, lo_addr(_Label53_Caption+0)
SW	R2, Offset(_Label53+16)(GP)
;FirmwareIHM_v1_0_driver.c,3732 :: 		Label53.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label53+20)(GP)
;FirmwareIHM_v1_0_driver.c,3733 :: 		Label53.Font_Color      = 0x0000;
SH	R0, Offset(_Label53+24)(GP)
;FirmwareIHM_v1_0_driver.c,3734 :: 		Label53.VerticalText    = 0;
SB	R0, Offset(_Label53+26)(GP)
;FirmwareIHM_v1_0_driver.c,3735 :: 		Label53.OnUpPtr         = 0;
SW	R0, Offset(_Label53+32)(GP)
;FirmwareIHM_v1_0_driver.c,3736 :: 		Label53.OnDownPtr       = 0;
SW	R0, Offset(_Label53+36)(GP)
;FirmwareIHM_v1_0_driver.c,3737 :: 		Label53.OnClickPtr      = 0;
SW	R0, Offset(_Label53+40)(GP)
;FirmwareIHM_v1_0_driver.c,3738 :: 		Label53.OnPressPtr      = 0;
SW	R0, Offset(_Label53+44)(GP)
;FirmwareIHM_v1_0_driver.c,3740 :: 		Label54.OwnerScreen     = &ScreenMalhaDeControle;
LUI	R2, hi_addr(_ScreenMalhaDeControle+0)
ORI	R2, R2, lo_addr(_ScreenMalhaDeControle+0)
SW	R2, Offset(_Label54+0)(GP)
;FirmwareIHM_v1_0_driver.c,3741 :: 		Label54.Order           = 8;
ORI	R2, R0, 8
SB	R2, Offset(_Label54+4)(GP)
;FirmwareIHM_v1_0_driver.c,3742 :: 		Label54.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label54+6)(GP)
;FirmwareIHM_v1_0_driver.c,3743 :: 		Label54.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label54+8)(GP)
;FirmwareIHM_v1_0_driver.c,3744 :: 		Label54.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label54+10)(GP)
;FirmwareIHM_v1_0_driver.c,3745 :: 		Label54.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label54+12)(GP)
;FirmwareIHM_v1_0_driver.c,3746 :: 		Label54.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label54+27)(GP)
;FirmwareIHM_v1_0_driver.c,3747 :: 		Label54.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label54+28)(GP)
;FirmwareIHM_v1_0_driver.c,3748 :: 		Label54.Caption         = Label54_Caption;
LUI	R2, hi_addr(_Label54_Caption+0)
ORI	R2, R2, lo_addr(_Label54_Caption+0)
SW	R2, Offset(_Label54+16)(GP)
;FirmwareIHM_v1_0_driver.c,3749 :: 		Label54.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label54+20)(GP)
;FirmwareIHM_v1_0_driver.c,3750 :: 		Label54.Font_Color      = 0x0000;
SH	R0, Offset(_Label54+24)(GP)
;FirmwareIHM_v1_0_driver.c,3751 :: 		Label54.VerticalText    = 0;
SB	R0, Offset(_Label54+26)(GP)
;FirmwareIHM_v1_0_driver.c,3752 :: 		Label54.OnUpPtr         = 0;
SW	R0, Offset(_Label54+32)(GP)
;FirmwareIHM_v1_0_driver.c,3753 :: 		Label54.OnDownPtr       = 0;
SW	R0, Offset(_Label54+36)(GP)
;FirmwareIHM_v1_0_driver.c,3754 :: 		Label54.OnClickPtr      = 0;
SW	R0, Offset(_Label54+40)(GP)
;FirmwareIHM_v1_0_driver.c,3755 :: 		Label54.OnPressPtr      = 0;
SW	R0, Offset(_Label54+44)(GP)
;FirmwareIHM_v1_0_driver.c,3757 :: 		Label55.OwnerScreen     = &ScreenMalhaDeControle;
LUI	R2, hi_addr(_ScreenMalhaDeControle+0)
ORI	R2, R2, lo_addr(_ScreenMalhaDeControle+0)
SW	R2, Offset(_Label55+0)(GP)
;FirmwareIHM_v1_0_driver.c,3758 :: 		Label55.Order           = 9;
ORI	R2, R0, 9
SB	R2, Offset(_Label55+4)(GP)
;FirmwareIHM_v1_0_driver.c,3759 :: 		Label55.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label55+6)(GP)
;FirmwareIHM_v1_0_driver.c,3760 :: 		Label55.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label55+8)(GP)
;FirmwareIHM_v1_0_driver.c,3761 :: 		Label55.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label55+10)(GP)
;FirmwareIHM_v1_0_driver.c,3762 :: 		Label55.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label55+12)(GP)
;FirmwareIHM_v1_0_driver.c,3763 :: 		Label55.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label55+27)(GP)
;FirmwareIHM_v1_0_driver.c,3764 :: 		Label55.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label55+28)(GP)
;FirmwareIHM_v1_0_driver.c,3765 :: 		Label55.Caption         = Label55_Caption;
LUI	R2, hi_addr(_Label55_Caption+0)
ORI	R2, R2, lo_addr(_Label55_Caption+0)
SW	R2, Offset(_Label55+16)(GP)
;FirmwareIHM_v1_0_driver.c,3766 :: 		Label55.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label55+20)(GP)
;FirmwareIHM_v1_0_driver.c,3767 :: 		Label55.Font_Color      = 0x0000;
SH	R0, Offset(_Label55+24)(GP)
;FirmwareIHM_v1_0_driver.c,3768 :: 		Label55.VerticalText    = 0;
SB	R0, Offset(_Label55+26)(GP)
;FirmwareIHM_v1_0_driver.c,3769 :: 		Label55.OnUpPtr         = 0;
SW	R0, Offset(_Label55+32)(GP)
;FirmwareIHM_v1_0_driver.c,3770 :: 		Label55.OnDownPtr       = 0;
SW	R0, Offset(_Label55+36)(GP)
;FirmwareIHM_v1_0_driver.c,3771 :: 		Label55.OnClickPtr      = 0;
SW	R0, Offset(_Label55+40)(GP)
;FirmwareIHM_v1_0_driver.c,3772 :: 		Label55.OnPressPtr      = 0;
SW	R0, Offset(_Label55+44)(GP)
;FirmwareIHM_v1_0_driver.c,3774 :: 		ButtonRound6.OwnerScreen     = &ScreenResetInterlock;
LUI	R2, hi_addr(_ScreenResetInterlock+0)
ORI	R2, R2, lo_addr(_ScreenResetInterlock+0)
SW	R2, Offset(_ButtonRound6+0)(GP)
;FirmwareIHM_v1_0_driver.c,3775 :: 		ButtonRound6.Order           = 3;
ORI	R2, R0, 3
SB	R2, Offset(_ButtonRound6+4)(GP)
;FirmwareIHM_v1_0_driver.c,3776 :: 		ButtonRound6.Left            = 160;
ORI	R2, R0, 160
SH	R2, Offset(_ButtonRound6+6)(GP)
;FirmwareIHM_v1_0_driver.c,3777 :: 		ButtonRound6.Top             = 276;
ORI	R2, R0, 276
SH	R2, Offset(_ButtonRound6+8)(GP)
;FirmwareIHM_v1_0_driver.c,3778 :: 		ButtonRound6.Width           = 70;
ORI	R2, R0, 70
SH	R2, Offset(_ButtonRound6+10)(GP)
;FirmwareIHM_v1_0_driver.c,3779 :: 		ButtonRound6.Height          = 35;
ORI	R2, R0, 35
SH	R2, Offset(_ButtonRound6+12)(GP)
;FirmwareIHM_v1_0_driver.c,3780 :: 		ButtonRound6.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+14)(GP)
;FirmwareIHM_v1_0_driver.c,3781 :: 		ButtonRound6.Pen_Color       = 0x0000;
SH	R0, Offset(_ButtonRound6+16)(GP)
;FirmwareIHM_v1_0_driver.c,3782 :: 		ButtonRound6.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+18)(GP)
;FirmwareIHM_v1_0_driver.c,3783 :: 		ButtonRound6.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+19)(GP)
;FirmwareIHM_v1_0_driver.c,3784 :: 		ButtonRound6.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+20)(GP)
;FirmwareIHM_v1_0_driver.c,3785 :: 		ButtonRound6.Caption         = ButtonRound6_Caption;
LUI	R2, hi_addr(_ButtonRound6_Caption+0)
ORI	R2, R2, lo_addr(_ButtonRound6_Caption+0)
SW	R2, Offset(_ButtonRound6+24)(GP)
;FirmwareIHM_v1_0_driver.c,3786 :: 		ButtonRound6.TextAlign       = _taCenter;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+28)(GP)
;FirmwareIHM_v1_0_driver.c,3787 :: 		ButtonRound6.TextAlignVertical= _tavMiddle;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+29)(GP)
;FirmwareIHM_v1_0_driver.c,3788 :: 		ButtonRound6.FontName        = Tahoma14x16_Bold;
SW	R5, Offset(_ButtonRound6+32)(GP)
;FirmwareIHM_v1_0_driver.c,3789 :: 		ButtonRound6.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+49)(GP)
;FirmwareIHM_v1_0_driver.c,3790 :: 		ButtonRound6.Font_Color      = 0x0000;
SH	R0, Offset(_ButtonRound6+36)(GP)
;FirmwareIHM_v1_0_driver.c,3791 :: 		ButtonRound6.VerticalText    = 0;
SB	R0, Offset(_ButtonRound6+38)(GP)
;FirmwareIHM_v1_0_driver.c,3792 :: 		ButtonRound6.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ButtonRound6+39)(GP)
;FirmwareIHM_v1_0_driver.c,3793 :: 		ButtonRound6.Gradient_Orientation = 0;
SB	R0, Offset(_ButtonRound6+40)(GP)
;FirmwareIHM_v1_0_driver.c,3794 :: 		ButtonRound6.Gradient_Start_Color = 0xB000;
ORI	R2, R0, 45056
SH	R2, Offset(_ButtonRound6+42)(GP)
;FirmwareIHM_v1_0_driver.c,3795 :: 		ButtonRound6.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_ButtonRound6+44)(GP)
;FirmwareIHM_v1_0_driver.c,3796 :: 		ButtonRound6.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_ButtonRound6+46)(GP)
;FirmwareIHM_v1_0_driver.c,3797 :: 		ButtonRound6.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_ButtonRound6+50)(GP)
;FirmwareIHM_v1_0_driver.c,3798 :: 		ButtonRound6.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_ButtonRound6+48)(GP)
;FirmwareIHM_v1_0_driver.c,3799 :: 		ButtonRound6.OnUpPtr         = 0;
SW	R0, Offset(_ButtonRound6+52)(GP)
;FirmwareIHM_v1_0_driver.c,3800 :: 		ButtonRound6.OnDownPtr       = 0;
SW	R0, Offset(_ButtonRound6+56)(GP)
;FirmwareIHM_v1_0_driver.c,3801 :: 		ButtonRound6.OnClickPtr      = resetInterlock;
LUI	R2, hi_addr(_resetInterlock+0)
ORI	R2, R2, lo_addr(_resetInterlock+0)
SW	R2, Offset(_ButtonRound6+60)(GP)
;FirmwareIHM_v1_0_driver.c,3802 :: 		ButtonRound6.OnPressPtr      = 0;
SW	R0, Offset(_ButtonRound6+64)(GP)
;FirmwareIHM_v1_0_driver.c,3804 :: 		Label56.OwnerScreen     = &ScreenResetInterlock;
LUI	R2, hi_addr(_ScreenResetInterlock+0)
ORI	R2, R2, lo_addr(_ScreenResetInterlock+0)
SW	R2, Offset(_Label56+0)(GP)
;FirmwareIHM_v1_0_driver.c,3805 :: 		Label56.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_Label56+4)(GP)
;FirmwareIHM_v1_0_driver.c,3806 :: 		Label56.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label56+6)(GP)
;FirmwareIHM_v1_0_driver.c,3807 :: 		Label56.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label56+8)(GP)
;FirmwareIHM_v1_0_driver.c,3808 :: 		Label56.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label56+10)(GP)
;FirmwareIHM_v1_0_driver.c,3809 :: 		Label56.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label56+12)(GP)
;FirmwareIHM_v1_0_driver.c,3810 :: 		Label56.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label56+27)(GP)
;FirmwareIHM_v1_0_driver.c,3811 :: 		Label56.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label56+28)(GP)
;FirmwareIHM_v1_0_driver.c,3812 :: 		Label56.Caption         = Label56_Caption;
LUI	R2, hi_addr(_Label56_Caption+0)
ORI	R2, R2, lo_addr(_Label56_Caption+0)
SW	R2, Offset(_Label56+16)(GP)
;FirmwareIHM_v1_0_driver.c,3813 :: 		Label56.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label56+20)(GP)
;FirmwareIHM_v1_0_driver.c,3814 :: 		Label56.Font_Color      = 0x0000;
SH	R0, Offset(_Label56+24)(GP)
;FirmwareIHM_v1_0_driver.c,3815 :: 		Label56.VerticalText    = 0;
SB	R0, Offset(_Label56+26)(GP)
;FirmwareIHM_v1_0_driver.c,3816 :: 		Label56.OnUpPtr         = 0;
SW	R0, Offset(_Label56+32)(GP)
;FirmwareIHM_v1_0_driver.c,3817 :: 		Label56.OnDownPtr       = 0;
SW	R0, Offset(_Label56+36)(GP)
;FirmwareIHM_v1_0_driver.c,3818 :: 		Label56.OnClickPtr      = 0;
SW	R0, Offset(_Label56+40)(GP)
;FirmwareIHM_v1_0_driver.c,3819 :: 		Label56.OnPressPtr      = 0;
SW	R0, Offset(_Label56+44)(GP)
;FirmwareIHM_v1_0_driver.c,3821 :: 		Label57.OwnerScreen     = &ScreenResetInterlock;
LUI	R2, hi_addr(_ScreenResetInterlock+0)
ORI	R2, R2, lo_addr(_ScreenResetInterlock+0)
SW	R2, Offset(_Label57+0)(GP)
;FirmwareIHM_v1_0_driver.c,3822 :: 		Label57.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_Label57+4)(GP)
;FirmwareIHM_v1_0_driver.c,3823 :: 		Label57.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label57+6)(GP)
;FirmwareIHM_v1_0_driver.c,3824 :: 		Label57.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label57+8)(GP)
;FirmwareIHM_v1_0_driver.c,3825 :: 		Label57.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label57+10)(GP)
;FirmwareIHM_v1_0_driver.c,3826 :: 		Label57.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label57+12)(GP)
;FirmwareIHM_v1_0_driver.c,3827 :: 		Label57.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label57+27)(GP)
;FirmwareIHM_v1_0_driver.c,3828 :: 		Label57.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label57+28)(GP)
;FirmwareIHM_v1_0_driver.c,3829 :: 		Label57.Caption         = Label57_Caption;
LUI	R2, hi_addr(_Label57_Caption+0)
ORI	R2, R2, lo_addr(_Label57_Caption+0)
SW	R2, Offset(_Label57+16)(GP)
;FirmwareIHM_v1_0_driver.c,3830 :: 		Label57.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label57+20)(GP)
;FirmwareIHM_v1_0_driver.c,3831 :: 		Label57.Font_Color      = 0x0000;
SH	R0, Offset(_Label57+24)(GP)
;FirmwareIHM_v1_0_driver.c,3832 :: 		Label57.VerticalText    = 0;
SB	R0, Offset(_Label57+26)(GP)
;FirmwareIHM_v1_0_driver.c,3833 :: 		Label57.OnUpPtr         = 0;
SW	R0, Offset(_Label57+32)(GP)
;FirmwareIHM_v1_0_driver.c,3834 :: 		Label57.OnDownPtr       = 0;
SW	R0, Offset(_Label57+36)(GP)
;FirmwareIHM_v1_0_driver.c,3835 :: 		Label57.OnClickPtr      = 0;
SW	R0, Offset(_Label57+40)(GP)
;FirmwareIHM_v1_0_driver.c,3836 :: 		Label57.OnPressPtr      = 0;
SW	R0, Offset(_Label57+44)(GP)
;FirmwareIHM_v1_0_driver.c,3838 :: 		Label58.OwnerScreen     = &ScreenResetInterlock;
LUI	R2, hi_addr(_ScreenResetInterlock+0)
ORI	R2, R2, lo_addr(_ScreenResetInterlock+0)
SW	R2, Offset(_Label58+0)(GP)
;FirmwareIHM_v1_0_driver.c,3839 :: 		Label58.Order           = 6;
ORI	R2, R0, 6
SB	R2, Offset(_Label58+4)(GP)
;FirmwareIHM_v1_0_driver.c,3840 :: 		Label58.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label58+6)(GP)
;FirmwareIHM_v1_0_driver.c,3841 :: 		Label58.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label58+8)(GP)
;FirmwareIHM_v1_0_driver.c,3842 :: 		Label58.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label58+10)(GP)
;FirmwareIHM_v1_0_driver.c,3843 :: 		Label58.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label58+12)(GP)
;FirmwareIHM_v1_0_driver.c,3844 :: 		Label58.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label58+27)(GP)
;FirmwareIHM_v1_0_driver.c,3845 :: 		Label58.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label58+28)(GP)
;FirmwareIHM_v1_0_driver.c,3846 :: 		Label58.Caption         = Label58_Caption;
LUI	R2, hi_addr(_Label58_Caption+0)
ORI	R2, R2, lo_addr(_Label58_Caption+0)
SW	R2, Offset(_Label58+16)(GP)
;FirmwareIHM_v1_0_driver.c,3847 :: 		Label58.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label58+20)(GP)
;FirmwareIHM_v1_0_driver.c,3848 :: 		Label58.Font_Color      = 0x0000;
SH	R0, Offset(_Label58+24)(GP)
;FirmwareIHM_v1_0_driver.c,3849 :: 		Label58.VerticalText    = 0;
SB	R0, Offset(_Label58+26)(GP)
;FirmwareIHM_v1_0_driver.c,3850 :: 		Label58.OnUpPtr         = 0;
SW	R0, Offset(_Label58+32)(GP)
;FirmwareIHM_v1_0_driver.c,3851 :: 		Label58.OnDownPtr       = 0;
SW	R0, Offset(_Label58+36)(GP)
;FirmwareIHM_v1_0_driver.c,3852 :: 		Label58.OnClickPtr      = 0;
SW	R0, Offset(_Label58+40)(GP)
;FirmwareIHM_v1_0_driver.c,3853 :: 		Label58.OnPressPtr      = 0;
SW	R0, Offset(_Label58+44)(GP)
;FirmwareIHM_v1_0_driver.c,3855 :: 		Label59.OwnerScreen     = &ScreenResetInterlock;
LUI	R2, hi_addr(_ScreenResetInterlock+0)
ORI	R2, R2, lo_addr(_ScreenResetInterlock+0)
SW	R2, Offset(_Label59+0)(GP)
;FirmwareIHM_v1_0_driver.c,3856 :: 		Label59.Order           = 7;
ORI	R2, R0, 7
SB	R2, Offset(_Label59+4)(GP)
;FirmwareIHM_v1_0_driver.c,3857 :: 		Label59.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label59+6)(GP)
;FirmwareIHM_v1_0_driver.c,3858 :: 		Label59.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label59+8)(GP)
;FirmwareIHM_v1_0_driver.c,3859 :: 		Label59.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label59+10)(GP)
;FirmwareIHM_v1_0_driver.c,3860 :: 		Label59.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label59+12)(GP)
;FirmwareIHM_v1_0_driver.c,3861 :: 		Label59.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label59+27)(GP)
;FirmwareIHM_v1_0_driver.c,3862 :: 		Label59.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label59+28)(GP)
;FirmwareIHM_v1_0_driver.c,3863 :: 		Label59.Caption         = Label59_Caption;
LUI	R2, hi_addr(_Label59_Caption+0)
ORI	R2, R2, lo_addr(_Label59_Caption+0)
SW	R2, Offset(_Label59+16)(GP)
;FirmwareIHM_v1_0_driver.c,3864 :: 		Label59.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label59+20)(GP)
;FirmwareIHM_v1_0_driver.c,3865 :: 		Label59.Font_Color      = 0x0000;
SH	R0, Offset(_Label59+24)(GP)
;FirmwareIHM_v1_0_driver.c,3866 :: 		Label59.VerticalText    = 0;
SB	R0, Offset(_Label59+26)(GP)
;FirmwareIHM_v1_0_driver.c,3867 :: 		Label59.OnUpPtr         = 0;
SW	R0, Offset(_Label59+32)(GP)
;FirmwareIHM_v1_0_driver.c,3868 :: 		Label59.OnDownPtr       = 0;
SW	R0, Offset(_Label59+36)(GP)
;FirmwareIHM_v1_0_driver.c,3869 :: 		Label59.OnClickPtr      = 0;
SW	R0, Offset(_Label59+40)(GP)
;FirmwareIHM_v1_0_driver.c,3870 :: 		Label59.OnPressPtr      = 0;
SW	R0, Offset(_Label59+44)(GP)
;FirmwareIHM_v1_0_driver.c,3872 :: 		Label43.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_Label43+0)(GP)
;FirmwareIHM_v1_0_driver.c,3873 :: 		Label43.Order           = 2;
ORI	R2, R0, 2
SB	R2, Offset(_Label43+4)(GP)
;FirmwareIHM_v1_0_driver.c,3874 :: 		Label43.Left            = 153;
ORI	R2, R0, 153
SH	R2, Offset(_Label43+6)(GP)
;FirmwareIHM_v1_0_driver.c,3875 :: 		Label43.Top             = 59;
ORI	R2, R0, 59
SH	R2, Offset(_Label43+8)(GP)
;FirmwareIHM_v1_0_driver.c,3876 :: 		Label43.Width           = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label43+10)(GP)
;FirmwareIHM_v1_0_driver.c,3877 :: 		Label43.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label43+12)(GP)
;FirmwareIHM_v1_0_driver.c,3878 :: 		Label43.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label43+27)(GP)
;FirmwareIHM_v1_0_driver.c,3879 :: 		Label43.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label43+28)(GP)
;FirmwareIHM_v1_0_driver.c,3880 :: 		Label43.Caption         = Label43_Caption;
LUI	R2, hi_addr(_Label43_Caption+0)
ORI	R2, R2, lo_addr(_Label43_Caption+0)
SW	R2, Offset(_Label43+16)(GP)
;FirmwareIHM_v1_0_driver.c,3881 :: 		Label43.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label43+20)(GP)
;FirmwareIHM_v1_0_driver.c,3882 :: 		Label43.Font_Color      = 0x0000;
SH	R0, Offset(_Label43+24)(GP)
;FirmwareIHM_v1_0_driver.c,3883 :: 		Label43.VerticalText    = 0;
SB	R0, Offset(_Label43+26)(GP)
;FirmwareIHM_v1_0_driver.c,3884 :: 		Label43.OnUpPtr         = 0;
SW	R0, Offset(_Label43+32)(GP)
;FirmwareIHM_v1_0_driver.c,3885 :: 		Label43.OnDownPtr       = 0;
SW	R0, Offset(_Label43+36)(GP)
;FirmwareIHM_v1_0_driver.c,3886 :: 		Label43.OnClickPtr      = 0;
SW	R0, Offset(_Label43+40)(GP)
;FirmwareIHM_v1_0_driver.c,3887 :: 		Label43.OnPressPtr      = 0;
SW	R0, Offset(_Label43+44)(GP)
;FirmwareIHM_v1_0_driver.c,3889 :: 		CheckBox3.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_CheckBox3+0)(GP)
;FirmwareIHM_v1_0_driver.c,3890 :: 		CheckBox3.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_CheckBox3+4)(GP)
;FirmwareIHM_v1_0_driver.c,3891 :: 		CheckBox3.Left            = 38;
ORI	R2, R0, 38
SH	R2, Offset(_CheckBox3+6)(GP)
;FirmwareIHM_v1_0_driver.c,3892 :: 		CheckBox3.Top             = 108;
ORI	R2, R0, 108
SH	R2, Offset(_CheckBox3+8)(GP)
;FirmwareIHM_v1_0_driver.c,3893 :: 		CheckBox3.Width           = 101;
ORI	R2, R0, 101
SH	R2, Offset(_CheckBox3+10)(GP)
;FirmwareIHM_v1_0_driver.c,3894 :: 		CheckBox3.Height          = 28;
ORI	R2, R0, 28
SH	R2, Offset(_CheckBox3+12)(GP)
;FirmwareIHM_v1_0_driver.c,3895 :: 		CheckBox3.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox3+14)(GP)
;FirmwareIHM_v1_0_driver.c,3896 :: 		CheckBox3.Pen_Color       = 0x0000;
SH	R0, Offset(_CheckBox3+16)(GP)
;FirmwareIHM_v1_0_driver.c,3897 :: 		CheckBox3.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox3+18)(GP)
;FirmwareIHM_v1_0_driver.c,3898 :: 		CheckBox3.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox3+19)(GP)
;FirmwareIHM_v1_0_driver.c,3899 :: 		CheckBox3.Checked         = 0;
SB	R0, Offset(_CheckBox3+20)(GP)
;FirmwareIHM_v1_0_driver.c,3900 :: 		CheckBox3.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox3+21)(GP)
;FirmwareIHM_v1_0_driver.c,3901 :: 		CheckBox3.Caption         = CheckBox3_Caption;
LUI	R2, hi_addr(_CheckBox3_Caption+0)
ORI	R2, R2, lo_addr(_CheckBox3_Caption+0)
SW	R2, Offset(_CheckBox3+24)(GP)
;FirmwareIHM_v1_0_driver.c,3902 :: 		CheckBox3.TextAlign       = _taLeft;
SB	R0, Offset(_CheckBox3+28)(GP)
;FirmwareIHM_v1_0_driver.c,3903 :: 		CheckBox3.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_CheckBox3+32)(GP)
;FirmwareIHM_v1_0_driver.c,3904 :: 		CheckBox3.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox3+48)(GP)
;FirmwareIHM_v1_0_driver.c,3905 :: 		CheckBox3.Font_Color      = 0x0000;
SH	R0, Offset(_CheckBox3+36)(GP)
;FirmwareIHM_v1_0_driver.c,3906 :: 		CheckBox3.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox3+38)(GP)
;FirmwareIHM_v1_0_driver.c,3907 :: 		CheckBox3.Gradient_Orientation = 0;
SB	R0, Offset(_CheckBox3+39)(GP)
;FirmwareIHM_v1_0_driver.c,3908 :: 		CheckBox3.Gradient_Start_Color = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_CheckBox3+40)(GP)
;FirmwareIHM_v1_0_driver.c,3909 :: 		CheckBox3.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox3+42)(GP)
;FirmwareIHM_v1_0_driver.c,3910 :: 		CheckBox3.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox3+44)(GP)
;FirmwareIHM_v1_0_driver.c,3911 :: 		CheckBox3.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_CheckBox3+50)(GP)
;FirmwareIHM_v1_0_driver.c,3912 :: 		CheckBox3.Rounded         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox3+46)(GP)
;FirmwareIHM_v1_0_driver.c,3913 :: 		CheckBox3.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_CheckBox3+47)(GP)
;FirmwareIHM_v1_0_driver.c,3914 :: 		CheckBox3.OnUpPtr         = 0;
SW	R0, Offset(_CheckBox3+52)(GP)
;FirmwareIHM_v1_0_driver.c,3915 :: 		CheckBox3.OnDownPtr       = 0;
SW	R0, Offset(_CheckBox3+56)(GP)
;FirmwareIHM_v1_0_driver.c,3916 :: 		CheckBox3.OnClickPtr      = modoRemoto;
LUI	R2, hi_addr(_modoRemoto+0)
ORI	R2, R2, lo_addr(_modoRemoto+0)
SW	R2, Offset(_CheckBox3+60)(GP)
;FirmwareIHM_v1_0_driver.c,3917 :: 		CheckBox3.OnPressPtr      = 0;
SW	R0, Offset(_CheckBox3+64)(GP)
;FirmwareIHM_v1_0_driver.c,3919 :: 		CheckBox4.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_CheckBox4+0)(GP)
;FirmwareIHM_v1_0_driver.c,3920 :: 		CheckBox4.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_CheckBox4+4)(GP)
;FirmwareIHM_v1_0_driver.c,3921 :: 		CheckBox4.Left            = 38;
ORI	R2, R0, 38
SH	R2, Offset(_CheckBox4+6)(GP)
;FirmwareIHM_v1_0_driver.c,3922 :: 		CheckBox4.Top             = 164;
ORI	R2, R0, 164
SH	R2, Offset(_CheckBox4+8)(GP)
;FirmwareIHM_v1_0_driver.c,3923 :: 		CheckBox4.Width           = 78;
ORI	R2, R0, 78
SH	R2, Offset(_CheckBox4+10)(GP)
;FirmwareIHM_v1_0_driver.c,3924 :: 		CheckBox4.Height          = 28;
ORI	R2, R0, 28
SH	R2, Offset(_CheckBox4+12)(GP)
;FirmwareIHM_v1_0_driver.c,3925 :: 		CheckBox4.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox4+14)(GP)
;FirmwareIHM_v1_0_driver.c,3926 :: 		CheckBox4.Pen_Color       = 0x0000;
SH	R0, Offset(_CheckBox4+16)(GP)
;FirmwareIHM_v1_0_driver.c,3927 :: 		CheckBox4.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox4+18)(GP)
;FirmwareIHM_v1_0_driver.c,3928 :: 		CheckBox4.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox4+19)(GP)
;FirmwareIHM_v1_0_driver.c,3929 :: 		CheckBox4.Checked         = 0;
SB	R0, Offset(_CheckBox4+20)(GP)
;FirmwareIHM_v1_0_driver.c,3930 :: 		CheckBox4.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox4+21)(GP)
;FirmwareIHM_v1_0_driver.c,3931 :: 		CheckBox4.Caption         = CheckBox4_Caption;
LUI	R2, hi_addr(_CheckBox4_Caption+0)
ORI	R2, R2, lo_addr(_CheckBox4_Caption+0)
SW	R2, Offset(_CheckBox4+24)(GP)
;FirmwareIHM_v1_0_driver.c,3932 :: 		CheckBox4.TextAlign       = _taLeft;
SB	R0, Offset(_CheckBox4+28)(GP)
;FirmwareIHM_v1_0_driver.c,3933 :: 		CheckBox4.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_CheckBox4+32)(GP)
;FirmwareIHM_v1_0_driver.c,3934 :: 		CheckBox4.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox4+48)(GP)
;FirmwareIHM_v1_0_driver.c,3935 :: 		CheckBox4.Font_Color      = 0x0000;
SH	R0, Offset(_CheckBox4+36)(GP)
;FirmwareIHM_v1_0_driver.c,3936 :: 		CheckBox4.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox4+38)(GP)
;FirmwareIHM_v1_0_driver.c,3937 :: 		CheckBox4.Gradient_Orientation = 0;
SB	R0, Offset(_CheckBox4+39)(GP)
;FirmwareIHM_v1_0_driver.c,3938 :: 		CheckBox4.Gradient_Start_Color = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_CheckBox4+40)(GP)
;FirmwareIHM_v1_0_driver.c,3939 :: 		CheckBox4.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox4+42)(GP)
;FirmwareIHM_v1_0_driver.c,3940 :: 		CheckBox4.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox4+44)(GP)
;FirmwareIHM_v1_0_driver.c,3941 :: 		CheckBox4.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_CheckBox4+50)(GP)
;FirmwareIHM_v1_0_driver.c,3942 :: 		CheckBox4.Rounded         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox4+46)(GP)
;FirmwareIHM_v1_0_driver.c,3943 :: 		CheckBox4.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_CheckBox4+47)(GP)
;FirmwareIHM_v1_0_driver.c,3944 :: 		CheckBox4.OnUpPtr         = 0;
SW	R0, Offset(_CheckBox4+52)(GP)
;FirmwareIHM_v1_0_driver.c,3945 :: 		CheckBox4.OnDownPtr       = 0;
SW	R0, Offset(_CheckBox4+56)(GP)
;FirmwareIHM_v1_0_driver.c,3946 :: 		CheckBox4.OnClickPtr      = modoLocal;
LUI	R2, hi_addr(_modoLocal+0)
ORI	R2, R2, lo_addr(_modoLocal+0)
SW	R2, Offset(_CheckBox4+60)(GP)
;FirmwareIHM_v1_0_driver.c,3947 :: 		CheckBox4.OnPressPtr      = 0;
SW	R0, Offset(_CheckBox4+64)(GP)
;FirmwareIHM_v1_0_driver.c,3949 :: 		CheckBox5.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_CheckBox5+0)(GP)
;FirmwareIHM_v1_0_driver.c,3950 :: 		CheckBox5.Order           = 6;
ORI	R2, R0, 6
SB	R2, Offset(_CheckBox5+4)(GP)
;FirmwareIHM_v1_0_driver.c,3951 :: 		CheckBox5.Left            = 38;
ORI	R2, R0, 38
SH	R2, Offset(_CheckBox5+6)(GP)
;FirmwareIHM_v1_0_driver.c,3952 :: 		CheckBox5.Top             = 220;
ORI	R2, R0, 220
SH	R2, Offset(_CheckBox5+8)(GP)
;FirmwareIHM_v1_0_driver.c,3953 :: 		CheckBox5.Width           = 101;
ORI	R2, R0, 101
SH	R2, Offset(_CheckBox5+10)(GP)
;FirmwareIHM_v1_0_driver.c,3954 :: 		CheckBox5.Height          = 28;
ORI	R2, R0, 28
SH	R2, Offset(_CheckBox5+12)(GP)
;FirmwareIHM_v1_0_driver.c,3955 :: 		CheckBox5.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox5+14)(GP)
;FirmwareIHM_v1_0_driver.c,3956 :: 		CheckBox5.Pen_Color       = 0x0000;
SH	R0, Offset(_CheckBox5+16)(GP)
;FirmwareIHM_v1_0_driver.c,3957 :: 		CheckBox5.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox5+18)(GP)
;FirmwareIHM_v1_0_driver.c,3958 :: 		CheckBox5.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox5+19)(GP)
;FirmwareIHM_v1_0_driver.c,3959 :: 		CheckBox5.Checked         = 0;
SB	R0, Offset(_CheckBox5+20)(GP)
;FirmwareIHM_v1_0_driver.c,3960 :: 		CheckBox5.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox5+21)(GP)
;FirmwareIHM_v1_0_driver.c,3961 :: 		CheckBox5.Caption         = CheckBox5_Caption;
LUI	R2, hi_addr(_CheckBox5_Caption+0)
ORI	R2, R2, lo_addr(_CheckBox5_Caption+0)
SW	R2, Offset(_CheckBox5+24)(GP)
;FirmwareIHM_v1_0_driver.c,3962 :: 		CheckBox5.TextAlign       = _taLeft;
SB	R0, Offset(_CheckBox5+28)(GP)
;FirmwareIHM_v1_0_driver.c,3963 :: 		CheckBox5.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_CheckBox5+32)(GP)
;FirmwareIHM_v1_0_driver.c,3964 :: 		CheckBox5.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox5+48)(GP)
;FirmwareIHM_v1_0_driver.c,3965 :: 		CheckBox5.Font_Color      = 0x0000;
SH	R0, Offset(_CheckBox5+36)(GP)
;FirmwareIHM_v1_0_driver.c,3966 :: 		CheckBox5.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox5+38)(GP)
;FirmwareIHM_v1_0_driver.c,3967 :: 		CheckBox5.Gradient_Orientation = 0;
SB	R0, Offset(_CheckBox5+39)(GP)
;FirmwareIHM_v1_0_driver.c,3968 :: 		CheckBox5.Gradient_Start_Color = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_CheckBox5+40)(GP)
;FirmwareIHM_v1_0_driver.c,3969 :: 		CheckBox5.Gradient_End_Color = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox5+42)(GP)
;FirmwareIHM_v1_0_driver.c,3970 :: 		CheckBox5.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_CheckBox5+44)(GP)
;FirmwareIHM_v1_0_driver.c,3971 :: 		CheckBox5.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_CheckBox5+50)(GP)
;FirmwareIHM_v1_0_driver.c,3972 :: 		CheckBox5.Rounded         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_CheckBox5+46)(GP)
;FirmwareIHM_v1_0_driver.c,3973 :: 		CheckBox5.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_CheckBox5+47)(GP)
;FirmwareIHM_v1_0_driver.c,3974 :: 		CheckBox5.OnUpPtr         = 0;
SW	R0, Offset(_CheckBox5+52)(GP)
;FirmwareIHM_v1_0_driver.c,3975 :: 		CheckBox5.OnDownPtr       = 0;
SW	R0, Offset(_CheckBox5+56)(GP)
;FirmwareIHM_v1_0_driver.c,3976 :: 		CheckBox5.OnClickPtr      = modoPCHost;
LUI	R2, hi_addr(_modoPCHost+0)
ORI	R2, R2, lo_addr(_modoPCHost+0)
SW	R2, Offset(_CheckBox5+60)(GP)
;FirmwareIHM_v1_0_driver.c,3977 :: 		CheckBox5.OnPressPtr      = 0;
SW	R0, Offset(_CheckBox5+64)(GP)
;FirmwareIHM_v1_0_driver.c,3979 :: 		Label60.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_Label60+0)(GP)
;FirmwareIHM_v1_0_driver.c,3980 :: 		Label60.Order           = 7;
ORI	R2, R0, 7
SB	R2, Offset(_Label60+4)(GP)
;FirmwareIHM_v1_0_driver.c,3981 :: 		Label60.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label60+6)(GP)
;FirmwareIHM_v1_0_driver.c,3982 :: 		Label60.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label60+8)(GP)
;FirmwareIHM_v1_0_driver.c,3983 :: 		Label60.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label60+10)(GP)
;FirmwareIHM_v1_0_driver.c,3984 :: 		Label60.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label60+12)(GP)
;FirmwareIHM_v1_0_driver.c,3985 :: 		Label60.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label60+27)(GP)
;FirmwareIHM_v1_0_driver.c,3986 :: 		Label60.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label60+28)(GP)
;FirmwareIHM_v1_0_driver.c,3987 :: 		Label60.Caption         = Label60_Caption;
LUI	R2, hi_addr(_Label60_Caption+0)
ORI	R2, R2, lo_addr(_Label60_Caption+0)
SW	R2, Offset(_Label60+16)(GP)
;FirmwareIHM_v1_0_driver.c,3988 :: 		Label60.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label60+20)(GP)
;FirmwareIHM_v1_0_driver.c,3989 :: 		Label60.Font_Color      = 0x0000;
SH	R0, Offset(_Label60+24)(GP)
;FirmwareIHM_v1_0_driver.c,3990 :: 		Label60.VerticalText    = 0;
SB	R0, Offset(_Label60+26)(GP)
;FirmwareIHM_v1_0_driver.c,3991 :: 		Label60.OnUpPtr         = 0;
SW	R0, Offset(_Label60+32)(GP)
;FirmwareIHM_v1_0_driver.c,3992 :: 		Label60.OnDownPtr       = 0;
SW	R0, Offset(_Label60+36)(GP)
;FirmwareIHM_v1_0_driver.c,3993 :: 		Label60.OnClickPtr      = 0;
SW	R0, Offset(_Label60+40)(GP)
;FirmwareIHM_v1_0_driver.c,3994 :: 		Label60.OnPressPtr      = 0;
SW	R0, Offset(_Label60+44)(GP)
;FirmwareIHM_v1_0_driver.c,3996 :: 		Label61.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_Label61+0)(GP)
;FirmwareIHM_v1_0_driver.c,3997 :: 		Label61.Order           = 8;
ORI	R2, R0, 8
SB	R2, Offset(_Label61+4)(GP)
;FirmwareIHM_v1_0_driver.c,3998 :: 		Label61.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label61+6)(GP)
;FirmwareIHM_v1_0_driver.c,3999 :: 		Label61.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label61+8)(GP)
;FirmwareIHM_v1_0_driver.c,4000 :: 		Label61.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label61+10)(GP)
;FirmwareIHM_v1_0_driver.c,4001 :: 		Label61.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label61+12)(GP)
;FirmwareIHM_v1_0_driver.c,4002 :: 		Label61.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label61+27)(GP)
;FirmwareIHM_v1_0_driver.c,4003 :: 		Label61.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label61+28)(GP)
;FirmwareIHM_v1_0_driver.c,4004 :: 		Label61.Caption         = Label61_Caption;
LUI	R2, hi_addr(_Label61_Caption+0)
ORI	R2, R2, lo_addr(_Label61_Caption+0)
SW	R2, Offset(_Label61+16)(GP)
;FirmwareIHM_v1_0_driver.c,4005 :: 		Label61.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label61+20)(GP)
;FirmwareIHM_v1_0_driver.c,4006 :: 		Label61.Font_Color      = 0x0000;
SH	R0, Offset(_Label61+24)(GP)
;FirmwareIHM_v1_0_driver.c,4007 :: 		Label61.VerticalText    = 0;
SB	R0, Offset(_Label61+26)(GP)
;FirmwareIHM_v1_0_driver.c,4008 :: 		Label61.OnUpPtr         = 0;
SW	R0, Offset(_Label61+32)(GP)
;FirmwareIHM_v1_0_driver.c,4009 :: 		Label61.OnDownPtr       = 0;
SW	R0, Offset(_Label61+36)(GP)
;FirmwareIHM_v1_0_driver.c,4010 :: 		Label61.OnClickPtr      = 0;
SW	R0, Offset(_Label61+40)(GP)
;FirmwareIHM_v1_0_driver.c,4011 :: 		Label61.OnPressPtr      = 0;
SW	R0, Offset(_Label61+44)(GP)
;FirmwareIHM_v1_0_driver.c,4013 :: 		Label62.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_Label62+0)(GP)
;FirmwareIHM_v1_0_driver.c,4014 :: 		Label62.Order           = 9;
ORI	R2, R0, 9
SB	R2, Offset(_Label62+4)(GP)
;FirmwareIHM_v1_0_driver.c,4015 :: 		Label62.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label62+6)(GP)
;FirmwareIHM_v1_0_driver.c,4016 :: 		Label62.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label62+8)(GP)
;FirmwareIHM_v1_0_driver.c,4017 :: 		Label62.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label62+10)(GP)
;FirmwareIHM_v1_0_driver.c,4018 :: 		Label62.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label62+12)(GP)
;FirmwareIHM_v1_0_driver.c,4019 :: 		Label62.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label62+27)(GP)
;FirmwareIHM_v1_0_driver.c,4020 :: 		Label62.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label62+28)(GP)
;FirmwareIHM_v1_0_driver.c,4021 :: 		Label62.Caption         = Label62_Caption;
LUI	R2, hi_addr(_Label62_Caption+0)
ORI	R2, R2, lo_addr(_Label62_Caption+0)
SW	R2, Offset(_Label62+16)(GP)
;FirmwareIHM_v1_0_driver.c,4022 :: 		Label62.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label62+20)(GP)
;FirmwareIHM_v1_0_driver.c,4023 :: 		Label62.Font_Color      = 0x0000;
SH	R0, Offset(_Label62+24)(GP)
;FirmwareIHM_v1_0_driver.c,4024 :: 		Label62.VerticalText    = 0;
SB	R0, Offset(_Label62+26)(GP)
;FirmwareIHM_v1_0_driver.c,4025 :: 		Label62.OnUpPtr         = 0;
SW	R0, Offset(_Label62+32)(GP)
;FirmwareIHM_v1_0_driver.c,4026 :: 		Label62.OnDownPtr       = 0;
SW	R0, Offset(_Label62+36)(GP)
;FirmwareIHM_v1_0_driver.c,4027 :: 		Label62.OnClickPtr      = 0;
SW	R0, Offset(_Label62+40)(GP)
;FirmwareIHM_v1_0_driver.c,4028 :: 		Label62.OnPressPtr      = 0;
SW	R0, Offset(_Label62+44)(GP)
;FirmwareIHM_v1_0_driver.c,4030 :: 		Label63.OwnerScreen     = &ScreenOperando;
LUI	R2, hi_addr(_ScreenOperando+0)
ORI	R2, R2, lo_addr(_ScreenOperando+0)
SW	R2, Offset(_Label63+0)(GP)
;FirmwareIHM_v1_0_driver.c,4031 :: 		Label63.Order           = 10;
ORI	R2, R0, 10
SB	R2, Offset(_Label63+4)(GP)
;FirmwareIHM_v1_0_driver.c,4032 :: 		Label63.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label63+6)(GP)
;FirmwareIHM_v1_0_driver.c,4033 :: 		Label63.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label63+8)(GP)
;FirmwareIHM_v1_0_driver.c,4034 :: 		Label63.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label63+10)(GP)
;FirmwareIHM_v1_0_driver.c,4035 :: 		Label63.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label63+12)(GP)
;FirmwareIHM_v1_0_driver.c,4036 :: 		Label63.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label63+27)(GP)
;FirmwareIHM_v1_0_driver.c,4037 :: 		Label63.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label63+28)(GP)
;FirmwareIHM_v1_0_driver.c,4038 :: 		Label63.Caption         = Label63_Caption;
LUI	R2, hi_addr(_Label63_Caption+0)
ORI	R2, R2, lo_addr(_Label63_Caption+0)
SW	R2, Offset(_Label63+16)(GP)
;FirmwareIHM_v1_0_driver.c,4039 :: 		Label63.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label63+20)(GP)
;FirmwareIHM_v1_0_driver.c,4040 :: 		Label63.Font_Color      = 0x0000;
SH	R0, Offset(_Label63+24)(GP)
;FirmwareIHM_v1_0_driver.c,4041 :: 		Label63.VerticalText    = 0;
SB	R0, Offset(_Label63+26)(GP)
;FirmwareIHM_v1_0_driver.c,4042 :: 		Label63.OnUpPtr         = 0;
SW	R0, Offset(_Label63+32)(GP)
;FirmwareIHM_v1_0_driver.c,4043 :: 		Label63.OnDownPtr       = 0;
SW	R0, Offset(_Label63+36)(GP)
;FirmwareIHM_v1_0_driver.c,4044 :: 		Label63.OnClickPtr      = 0;
SW	R0, Offset(_Label63+40)(GP)
;FirmwareIHM_v1_0_driver.c,4045 :: 		Label63.OnPressPtr      = 0;
SW	R0, Offset(_Label63+44)(GP)
;FirmwareIHM_v1_0_driver.c,4047 :: 		Label64.OwnerScreen     = &ScreenTecladoNumerico;
LUI	R2, hi_addr(_ScreenTecladoNumerico+0)
ORI	R2, R2, lo_addr(_ScreenTecladoNumerico+0)
SW	R2, Offset(_Label64+0)(GP)
;FirmwareIHM_v1_0_driver.c,4048 :: 		Label64.Order           = 16;
ORI	R2, R0, 16
SB	R2, Offset(_Label64+4)(GP)
;FirmwareIHM_v1_0_driver.c,4049 :: 		Label64.Left            = 8;
ORI	R2, R0, 8
SH	R2, Offset(_Label64+6)(GP)
;FirmwareIHM_v1_0_driver.c,4050 :: 		Label64.Top             = 25;
ORI	R2, R0, 25
SH	R2, Offset(_Label64+8)(GP)
;FirmwareIHM_v1_0_driver.c,4051 :: 		Label64.Width           = 80;
ORI	R2, R0, 80
SH	R2, Offset(_Label64+10)(GP)
;FirmwareIHM_v1_0_driver.c,4052 :: 		Label64.Height          = 20;
ORI	R2, R0, 20
SH	R2, Offset(_Label64+12)(GP)
;FirmwareIHM_v1_0_driver.c,4053 :: 		Label64.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label64+27)(GP)
;FirmwareIHM_v1_0_driver.c,4054 :: 		Label64.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label64+28)(GP)
;FirmwareIHM_v1_0_driver.c,4055 :: 		Label64.Caption         = Label64_Caption;
LUI	R2, hi_addr(_Label64_Caption+0)
ORI	R2, R2, lo_addr(_Label64_Caption+0)
SW	R2, Offset(_Label64+16)(GP)
;FirmwareIHM_v1_0_driver.c,4056 :: 		Label64.FontName        = Tahoma15x18_Regular;
LUI	R2, hi_addr(_Tahoma15x18_Regular+0)
ORI	R2, R2, lo_addr(_Tahoma15x18_Regular+0)
SW	R2, Offset(_Label64+20)(GP)
;FirmwareIHM_v1_0_driver.c,4057 :: 		Label64.Font_Color      = 0x0000;
SH	R0, Offset(_Label64+24)(GP)
;FirmwareIHM_v1_0_driver.c,4058 :: 		Label64.VerticalText    = 0;
SB	R0, Offset(_Label64+26)(GP)
;FirmwareIHM_v1_0_driver.c,4059 :: 		Label64.OnUpPtr         = 0;
SW	R0, Offset(_Label64+32)(GP)
;FirmwareIHM_v1_0_driver.c,4060 :: 		Label64.OnDownPtr       = 0;
SW	R0, Offset(_Label64+36)(GP)
;FirmwareIHM_v1_0_driver.c,4061 :: 		Label64.OnClickPtr      = 0;
SW	R0, Offset(_Label64+40)(GP)
;FirmwareIHM_v1_0_driver.c,4062 :: 		Label64.OnPressPtr      = 0;
SW	R0, Offset(_Label64+44)(GP)
;FirmwareIHM_v1_0_driver.c,4064 :: 		Label66.OwnerScreen     = &ScreenTecladoNumerico;
LUI	R2, hi_addr(_ScreenTecladoNumerico+0)
ORI	R2, R2, lo_addr(_ScreenTecladoNumerico+0)
SW	R2, Offset(_Label66+0)(GP)
;FirmwareIHM_v1_0_driver.c,4065 :: 		Label66.Order           = 19;
ORI	R2, R0, 19
SB	R2, Offset(_Label66+4)(GP)
;FirmwareIHM_v1_0_driver.c,4066 :: 		Label66.Left            = 62;
ORI	R2, R0, 62
SH	R2, Offset(_Label66+6)(GP)
;FirmwareIHM_v1_0_driver.c,4067 :: 		Label66.Top             = 58;
ORI	R2, R0, 58
SH	R2, Offset(_Label66+8)(GP)
;FirmwareIHM_v1_0_driver.c,4068 :: 		Label66.Width           = 0;
SH	R0, Offset(_Label66+10)(GP)
;FirmwareIHM_v1_0_driver.c,4069 :: 		Label66.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label66+12)(GP)
;FirmwareIHM_v1_0_driver.c,4070 :: 		Label66.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label66+27)(GP)
;FirmwareIHM_v1_0_driver.c,4071 :: 		Label66.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label66+28)(GP)
;FirmwareIHM_v1_0_driver.c,4072 :: 		Label66.Caption         = Label66_Caption;
LUI	R2, hi_addr(_Label66_Caption+0)
ORI	R2, R2, lo_addr(_Label66_Caption+0)
SW	R2, Offset(_Label66+16)(GP)
;FirmwareIHM_v1_0_driver.c,4073 :: 		Label66.FontName        = Tahoma20x21_Bold;
SW	R4, Offset(_Label66+20)(GP)
;FirmwareIHM_v1_0_driver.c,4074 :: 		Label66.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label66+24)(GP)
;FirmwareIHM_v1_0_driver.c,4075 :: 		Label66.VerticalText    = 0;
SB	R0, Offset(_Label66+26)(GP)
;FirmwareIHM_v1_0_driver.c,4076 :: 		Label66.OnUpPtr         = 0;
SW	R0, Offset(_Label66+32)(GP)
;FirmwareIHM_v1_0_driver.c,4077 :: 		Label66.OnDownPtr       = 0;
SW	R0, Offset(_Label66+36)(GP)
;FirmwareIHM_v1_0_driver.c,4078 :: 		Label66.OnClickPtr      = 0;
SW	R0, Offset(_Label66+40)(GP)
;FirmwareIHM_v1_0_driver.c,4079 :: 		Label66.OnPressPtr      = 0;
SW	R0, Offset(_Label66+44)(GP)
;FirmwareIHM_v1_0_driver.c,4081 :: 		Label86.OwnerScreen     = &ScreenTecladoNumerico;
LUI	R2, hi_addr(_ScreenTecladoNumerico+0)
ORI	R2, R2, lo_addr(_ScreenTecladoNumerico+0)
SW	R2, Offset(_Label86+0)(GP)
;FirmwareIHM_v1_0_driver.c,4082 :: 		Label86.Order           = 20;
ORI	R2, R0, 20
SB	R2, Offset(_Label86+4)(GP)
;FirmwareIHM_v1_0_driver.c,4083 :: 		Label86.Left            = 112;
ORI	R2, R0, 112
SH	R2, Offset(_Label86+6)(GP)
;FirmwareIHM_v1_0_driver.c,4084 :: 		Label86.Top             = 8;
ORI	R2, R0, 8
SH	R2, Offset(_Label86+8)(GP)
;FirmwareIHM_v1_0_driver.c,4085 :: 		Label86.Width           = 0;
SH	R0, Offset(_Label86+10)(GP)
;FirmwareIHM_v1_0_driver.c,4086 :: 		Label86.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label86+12)(GP)
;FirmwareIHM_v1_0_driver.c,4087 :: 		Label86.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label86+27)(GP)
;FirmwareIHM_v1_0_driver.c,4088 :: 		Label86.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label86+28)(GP)
;FirmwareIHM_v1_0_driver.c,4089 :: 		Label86.Caption         = Label86_Caption;
LUI	R2, hi_addr(_Label86_Caption+0)
ORI	R2, R2, lo_addr(_Label86_Caption+0)
SW	R2, Offset(_Label86+16)(GP)
;FirmwareIHM_v1_0_driver.c,4090 :: 		Label86.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label86+20)(GP)
;FirmwareIHM_v1_0_driver.c,4091 :: 		Label86.Font_Color      = 0x0000;
SH	R0, Offset(_Label86+24)(GP)
;FirmwareIHM_v1_0_driver.c,4092 :: 		Label86.VerticalText    = 0;
SB	R0, Offset(_Label86+26)(GP)
;FirmwareIHM_v1_0_driver.c,4093 :: 		Label86.OnUpPtr         = 0;
SW	R0, Offset(_Label86+32)(GP)
;FirmwareIHM_v1_0_driver.c,4094 :: 		Label86.OnDownPtr       = 0;
SW	R0, Offset(_Label86+36)(GP)
;FirmwareIHM_v1_0_driver.c,4095 :: 		Label86.OnClickPtr      = 0;
SW	R0, Offset(_Label86+40)(GP)
;FirmwareIHM_v1_0_driver.c,4096 :: 		Label86.OnPressPtr      = 0;
SW	R0, Offset(_Label86+44)(GP)
;FirmwareIHM_v1_0_driver.c,4098 :: 		Label87.OwnerScreen     = &ScreenTecladoNumerico;
LUI	R2, hi_addr(_ScreenTecladoNumerico+0)
ORI	R2, R2, lo_addr(_ScreenTecladoNumerico+0)
SW	R2, Offset(_Label87+0)(GP)
;FirmwareIHM_v1_0_driver.c,4099 :: 		Label87.Order           = 21;
ORI	R2, R0, 21
SB	R2, Offset(_Label87+4)(GP)
;FirmwareIHM_v1_0_driver.c,4100 :: 		Label87.Left            = 112;
ORI	R2, R0, 112
SH	R2, Offset(_Label87+6)(GP)
;FirmwareIHM_v1_0_driver.c,4101 :: 		Label87.Top             = 30;
ORI	R2, R0, 30
SH	R2, Offset(_Label87+8)(GP)
;FirmwareIHM_v1_0_driver.c,4102 :: 		Label87.Width           = 0;
SH	R0, Offset(_Label87+10)(GP)
;FirmwareIHM_v1_0_driver.c,4103 :: 		Label87.Height          = 15;
ORI	R2, R0, 15
SH	R2, Offset(_Label87+12)(GP)
;FirmwareIHM_v1_0_driver.c,4104 :: 		Label87.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label87+27)(GP)
;FirmwareIHM_v1_0_driver.c,4105 :: 		Label87.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label87+28)(GP)
;FirmwareIHM_v1_0_driver.c,4106 :: 		Label87.Caption         = Label87_Caption;
LUI	R2, hi_addr(_Label87_Caption+0)
ORI	R2, R2, lo_addr(_Label87_Caption+0)
SW	R2, Offset(_Label87+16)(GP)
;FirmwareIHM_v1_0_driver.c,4107 :: 		Label87.FontName        = Tahoma11x13_Regular;
SW	R6, Offset(_Label87+20)(GP)
;FirmwareIHM_v1_0_driver.c,4108 :: 		Label87.Font_Color      = 0x0000;
SH	R0, Offset(_Label87+24)(GP)
;FirmwareIHM_v1_0_driver.c,4109 :: 		Label87.VerticalText    = 0;
SB	R0, Offset(_Label87+26)(GP)
;FirmwareIHM_v1_0_driver.c,4110 :: 		Label87.OnUpPtr         = 0;
SW	R0, Offset(_Label87+32)(GP)
;FirmwareIHM_v1_0_driver.c,4111 :: 		Label87.OnDownPtr       = 0;
SW	R0, Offset(_Label87+36)(GP)
;FirmwareIHM_v1_0_driver.c,4112 :: 		Label87.OnClickPtr      = 0;
SW	R0, Offset(_Label87+40)(GP)
;FirmwareIHM_v1_0_driver.c,4113 :: 		Label87.OnPressPtr      = 0;
SW	R0, Offset(_Label87+44)(GP)
;FirmwareIHM_v1_0_driver.c,4115 :: 		Label67.OwnerScreen     = &ScreenAcessoNegado;
LUI	R2, hi_addr(_ScreenAcessoNegado+0)
ORI	R2, R2, lo_addr(_ScreenAcessoNegado+0)
SW	R2, Offset(_Label67+0)(GP)
;FirmwareIHM_v1_0_driver.c,4116 :: 		Label67.Order           = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label67+4)(GP)
;FirmwareIHM_v1_0_driver.c,4117 :: 		Label67.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label67+6)(GP)
;FirmwareIHM_v1_0_driver.c,4118 :: 		Label67.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label67+8)(GP)
;FirmwareIHM_v1_0_driver.c,4119 :: 		Label67.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label67+10)(GP)
;FirmwareIHM_v1_0_driver.c,4120 :: 		Label67.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label67+12)(GP)
;FirmwareIHM_v1_0_driver.c,4121 :: 		Label67.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label67+27)(GP)
;FirmwareIHM_v1_0_driver.c,4122 :: 		Label67.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label67+28)(GP)
;FirmwareIHM_v1_0_driver.c,4123 :: 		Label67.Caption         = Label67_Caption;
LUI	R2, hi_addr(_Label67_Caption+0)
ORI	R2, R2, lo_addr(_Label67_Caption+0)
SW	R2, Offset(_Label67+16)(GP)
;FirmwareIHM_v1_0_driver.c,4124 :: 		Label67.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label67+20)(GP)
;FirmwareIHM_v1_0_driver.c,4125 :: 		Label67.Font_Color      = 0x0000;
SH	R0, Offset(_Label67+24)(GP)
;FirmwareIHM_v1_0_driver.c,4126 :: 		Label67.VerticalText    = 0;
SB	R0, Offset(_Label67+26)(GP)
;FirmwareIHM_v1_0_driver.c,4127 :: 		Label67.OnUpPtr         = 0;
SW	R0, Offset(_Label67+32)(GP)
;FirmwareIHM_v1_0_driver.c,4128 :: 		Label67.OnDownPtr       = 0;
SW	R0, Offset(_Label67+36)(GP)
;FirmwareIHM_v1_0_driver.c,4129 :: 		Label67.OnClickPtr      = 0;
SW	R0, Offset(_Label67+40)(GP)
;FirmwareIHM_v1_0_driver.c,4130 :: 		Label67.OnPressPtr      = 0;
SW	R0, Offset(_Label67+44)(GP)
;FirmwareIHM_v1_0_driver.c,4132 :: 		Label68.OwnerScreen     = &ScreenAcessoNegado;
LUI	R2, hi_addr(_ScreenAcessoNegado+0)
ORI	R2, R2, lo_addr(_ScreenAcessoNegado+0)
SW	R2, Offset(_Label68+0)(GP)
;FirmwareIHM_v1_0_driver.c,4133 :: 		Label68.Order           = 2;
ORI	R2, R0, 2
SB	R2, Offset(_Label68+4)(GP)
;FirmwareIHM_v1_0_driver.c,4134 :: 		Label68.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label68+6)(GP)
;FirmwareIHM_v1_0_driver.c,4135 :: 		Label68.Top             = 3;
ORI	R2, R0, 3
SH	R2, Offset(_Label68+8)(GP)
;FirmwareIHM_v1_0_driver.c,4136 :: 		Label68.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label68+10)(GP)
;FirmwareIHM_v1_0_driver.c,4137 :: 		Label68.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label68+12)(GP)
;FirmwareIHM_v1_0_driver.c,4138 :: 		Label68.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label68+27)(GP)
;FirmwareIHM_v1_0_driver.c,4139 :: 		Label68.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label68+28)(GP)
;FirmwareIHM_v1_0_driver.c,4140 :: 		Label68.Caption         = Label68_Caption;
LUI	R2, hi_addr(_Label68_Caption+0)
ORI	R2, R2, lo_addr(_Label68_Caption+0)
SW	R2, Offset(_Label68+16)(GP)
;FirmwareIHM_v1_0_driver.c,4141 :: 		Label68.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label68+20)(GP)
;FirmwareIHM_v1_0_driver.c,4142 :: 		Label68.Font_Color      = 0x0000;
SH	R0, Offset(_Label68+24)(GP)
;FirmwareIHM_v1_0_driver.c,4143 :: 		Label68.VerticalText    = 0;
SB	R0, Offset(_Label68+26)(GP)
;FirmwareIHM_v1_0_driver.c,4144 :: 		Label68.OnUpPtr         = 0;
SW	R0, Offset(_Label68+32)(GP)
;FirmwareIHM_v1_0_driver.c,4145 :: 		Label68.OnDownPtr       = 0;
SW	R0, Offset(_Label68+36)(GP)
;FirmwareIHM_v1_0_driver.c,4146 :: 		Label68.OnClickPtr      = 0;
SW	R0, Offset(_Label68+40)(GP)
;FirmwareIHM_v1_0_driver.c,4147 :: 		Label68.OnPressPtr      = 0;
SW	R0, Offset(_Label68+44)(GP)
;FirmwareIHM_v1_0_driver.c,4149 :: 		Label69.OwnerScreen     = &ScreenAcessoNegado;
LUI	R2, hi_addr(_ScreenAcessoNegado+0)
ORI	R2, R2, lo_addr(_ScreenAcessoNegado+0)
SW	R2, Offset(_Label69+0)(GP)
;FirmwareIHM_v1_0_driver.c,4150 :: 		Label69.Order           = 3;
ORI	R2, R0, 3
SB	R2, Offset(_Label69+4)(GP)
;FirmwareIHM_v1_0_driver.c,4151 :: 		Label69.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label69+6)(GP)
;FirmwareIHM_v1_0_driver.c,4152 :: 		Label69.Top             = 3;
ORI	R2, R0, 3
SH	R2, Offset(_Label69+8)(GP)
;FirmwareIHM_v1_0_driver.c,4153 :: 		Label69.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label69+10)(GP)
;FirmwareIHM_v1_0_driver.c,4154 :: 		Label69.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label69+12)(GP)
;FirmwareIHM_v1_0_driver.c,4155 :: 		Label69.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label69+27)(GP)
;FirmwareIHM_v1_0_driver.c,4156 :: 		Label69.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label69+28)(GP)
;FirmwareIHM_v1_0_driver.c,4157 :: 		Label69.Caption         = Label69_Caption;
LUI	R2, hi_addr(_Label69_Caption+0)
ORI	R2, R2, lo_addr(_Label69_Caption+0)
SW	R2, Offset(_Label69+16)(GP)
;FirmwareIHM_v1_0_driver.c,4158 :: 		Label69.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label69+20)(GP)
;FirmwareIHM_v1_0_driver.c,4159 :: 		Label69.Font_Color      = 0x0000;
SH	R0, Offset(_Label69+24)(GP)
;FirmwareIHM_v1_0_driver.c,4160 :: 		Label69.VerticalText    = 0;
SB	R0, Offset(_Label69+26)(GP)
;FirmwareIHM_v1_0_driver.c,4161 :: 		Label69.OnUpPtr         = 0;
SW	R0, Offset(_Label69+32)(GP)
;FirmwareIHM_v1_0_driver.c,4162 :: 		Label69.OnDownPtr       = 0;
SW	R0, Offset(_Label69+36)(GP)
;FirmwareIHM_v1_0_driver.c,4163 :: 		Label69.OnClickPtr      = 0;
SW	R0, Offset(_Label69+40)(GP)
;FirmwareIHM_v1_0_driver.c,4164 :: 		Label69.OnPressPtr      = 0;
SW	R0, Offset(_Label69+44)(GP)
;FirmwareIHM_v1_0_driver.c,4166 :: 		Label71.OwnerScreen     = &ScreenAcessoNegado;
LUI	R2, hi_addr(_ScreenAcessoNegado+0)
ORI	R2, R2, lo_addr(_ScreenAcessoNegado+0)
SW	R2, Offset(_Label71+0)(GP)
;FirmwareIHM_v1_0_driver.c,4167 :: 		Label71.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_Label71+4)(GP)
;FirmwareIHM_v1_0_driver.c,4168 :: 		Label71.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label71+6)(GP)
;FirmwareIHM_v1_0_driver.c,4169 :: 		Label71.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label71+8)(GP)
;FirmwareIHM_v1_0_driver.c,4170 :: 		Label71.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label71+10)(GP)
;FirmwareIHM_v1_0_driver.c,4171 :: 		Label71.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label71+12)(GP)
;FirmwareIHM_v1_0_driver.c,4172 :: 		Label71.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label71+27)(GP)
;FirmwareIHM_v1_0_driver.c,4173 :: 		Label71.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label71+28)(GP)
;FirmwareIHM_v1_0_driver.c,4174 :: 		Label71.Caption         = Label71_Caption;
LUI	R2, hi_addr(_Label71_Caption+0)
ORI	R2, R2, lo_addr(_Label71_Caption+0)
SW	R2, Offset(_Label71+16)(GP)
;FirmwareIHM_v1_0_driver.c,4175 :: 		Label71.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label71+20)(GP)
;FirmwareIHM_v1_0_driver.c,4176 :: 		Label71.Font_Color      = 0x0000;
SH	R0, Offset(_Label71+24)(GP)
;FirmwareIHM_v1_0_driver.c,4177 :: 		Label71.VerticalText    = 0;
SB	R0, Offset(_Label71+26)(GP)
;FirmwareIHM_v1_0_driver.c,4178 :: 		Label71.OnUpPtr         = 0;
SW	R0, Offset(_Label71+32)(GP)
;FirmwareIHM_v1_0_driver.c,4179 :: 		Label71.OnDownPtr       = 0;
SW	R0, Offset(_Label71+36)(GP)
;FirmwareIHM_v1_0_driver.c,4180 :: 		Label71.OnClickPtr      = 0;
SW	R0, Offset(_Label71+40)(GP)
;FirmwareIHM_v1_0_driver.c,4181 :: 		Label71.OnPressPtr      = 0;
SW	R0, Offset(_Label71+44)(GP)
;FirmwareIHM_v1_0_driver.c,4183 :: 		BoxRound1.OwnerScreen     = &ScreenAcessoNegado;
LUI	R2, hi_addr(_ScreenAcessoNegado+0)
ORI	R2, R2, lo_addr(_ScreenAcessoNegado+0)
SW	R2, Offset(_BoxRound1+0)(GP)
;FirmwareIHM_v1_0_driver.c,4184 :: 		BoxRound1.Order           = 9;
ORI	R2, R0, 9
SB	R2, Offset(_BoxRound1+4)(GP)
;FirmwareIHM_v1_0_driver.c,4185 :: 		BoxRound1.Left            = 19;
ORI	R2, R0, 19
SH	R2, Offset(_BoxRound1+6)(GP)
;FirmwareIHM_v1_0_driver.c,4186 :: 		BoxRound1.Top             = 70;
ORI	R2, R0, 70
SH	R2, Offset(_BoxRound1+8)(GP)
;FirmwareIHM_v1_0_driver.c,4187 :: 		BoxRound1.Width           = 201;
ORI	R2, R0, 201
SH	R2, Offset(_BoxRound1+10)(GP)
;FirmwareIHM_v1_0_driver.c,4188 :: 		BoxRound1.Height          = 159;
ORI	R2, R0, 159
SH	R2, Offset(_BoxRound1+12)(GP)
;FirmwareIHM_v1_0_driver.c,4189 :: 		BoxRound1.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_BoxRound1+14)(GP)
;FirmwareIHM_v1_0_driver.c,4190 :: 		BoxRound1.Pen_Color       = 0x0000;
SH	R0, Offset(_BoxRound1+16)(GP)
;FirmwareIHM_v1_0_driver.c,4191 :: 		BoxRound1.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_BoxRound1+18)(GP)
;FirmwareIHM_v1_0_driver.c,4192 :: 		BoxRound1.Active          = 0;
SB	R0, Offset(_BoxRound1+19)(GP)
;FirmwareIHM_v1_0_driver.c,4193 :: 		BoxRound1.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_BoxRound1+20)(GP)
;FirmwareIHM_v1_0_driver.c,4194 :: 		BoxRound1.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_BoxRound1+21)(GP)
;FirmwareIHM_v1_0_driver.c,4195 :: 		BoxRound1.Gradient_Orientation = 0;
SB	R0, Offset(_BoxRound1+22)(GP)
;FirmwareIHM_v1_0_driver.c,4196 :: 		BoxRound1.Gradient_Start_Color = 0x0000;
SH	R0, Offset(_BoxRound1+24)(GP)
;FirmwareIHM_v1_0_driver.c,4197 :: 		BoxRound1.Gradient_End_Color = 0x0000;
SH	R0, Offset(_BoxRound1+26)(GP)
;FirmwareIHM_v1_0_driver.c,4198 :: 		BoxRound1.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_BoxRound1+28)(GP)
;FirmwareIHM_v1_0_driver.c,4199 :: 		BoxRound1.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_BoxRound1+31)(GP)
;FirmwareIHM_v1_0_driver.c,4200 :: 		BoxRound1.Press_Color     = 0xE71C;
ORI	R2, R0, 59164
SH	R2, Offset(_BoxRound1+32)(GP)
;FirmwareIHM_v1_0_driver.c,4201 :: 		BoxRound1.Corner_Radius   = 3;
ORI	R2, R0, 3
SB	R2, Offset(_BoxRound1+30)(GP)
;FirmwareIHM_v1_0_driver.c,4202 :: 		BoxRound1.OnUpPtr         = 0;
SW	R0, Offset(_BoxRound1+36)(GP)
;FirmwareIHM_v1_0_driver.c,4203 :: 		BoxRound1.OnDownPtr       = 0;
SW	R0, Offset(_BoxRound1+40)(GP)
;FirmwareIHM_v1_0_driver.c,4204 :: 		BoxRound1.OnClickPtr      = 0;
SW	R0, Offset(_BoxRound1+44)(GP)
;FirmwareIHM_v1_0_driver.c,4205 :: 		BoxRound1.OnPressPtr      = 0;
SW	R0, Offset(_BoxRound1+48)(GP)
;FirmwareIHM_v1_0_driver.c,4207 :: 		Label76.OwnerScreen     = &ScreenAcessoNegado;
LUI	R2, hi_addr(_ScreenAcessoNegado+0)
ORI	R2, R2, lo_addr(_ScreenAcessoNegado+0)
SW	R2, Offset(_Label76+0)(GP)
;FirmwareIHM_v1_0_driver.c,4208 :: 		Label76.Order           = 10;
ORI	R2, R0, 10
SB	R2, Offset(_Label76+4)(GP)
;FirmwareIHM_v1_0_driver.c,4209 :: 		Label76.Left            = 73;
ORI	R2, R0, 73
SH	R2, Offset(_Label76+6)(GP)
;FirmwareIHM_v1_0_driver.c,4210 :: 		Label76.Top             = 132;
ORI	R2, R0, 132
SH	R2, Offset(_Label76+8)(GP)
;FirmwareIHM_v1_0_driver.c,4211 :: 		Label76.Width           = 94;
ORI	R2, R0, 94
SH	R2, Offset(_Label76+10)(GP)
;FirmwareIHM_v1_0_driver.c,4212 :: 		Label76.Height          = 36;
ORI	R2, R0, 36
SH	R2, Offset(_Label76+12)(GP)
;FirmwareIHM_v1_0_driver.c,4213 :: 		Label76.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label76+27)(GP)
;FirmwareIHM_v1_0_driver.c,4214 :: 		Label76.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label76+28)(GP)
;FirmwareIHM_v1_0_driver.c,4215 :: 		Label76.Caption         = Label76_Caption;
LUI	R2, hi_addr(_Label76_Caption+0)
ORI	R2, R2, lo_addr(_Label76_Caption+0)
SW	R2, Offset(_Label76+16)(GP)
;FirmwareIHM_v1_0_driver.c,4216 :: 		Label76.FontName        = Tahoma26x33_Regular;
LUI	R2, hi_addr(_Tahoma26x33_Regular+0)
ORI	R2, R2, lo_addr(_Tahoma26x33_Regular+0)
SW	R2, Offset(_Label76+20)(GP)
;FirmwareIHM_v1_0_driver.c,4217 :: 		Label76.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label76+24)(GP)
;FirmwareIHM_v1_0_driver.c,4218 :: 		Label76.VerticalText    = 0;
SB	R0, Offset(_Label76+26)(GP)
;FirmwareIHM_v1_0_driver.c,4219 :: 		Label76.OnUpPtr         = 0;
SW	R0, Offset(_Label76+32)(GP)
;FirmwareIHM_v1_0_driver.c,4220 :: 		Label76.OnDownPtr       = 0;
SW	R0, Offset(_Label76+36)(GP)
;FirmwareIHM_v1_0_driver.c,4221 :: 		Label76.OnClickPtr      = 0;
SW	R0, Offset(_Label76+40)(GP)
;FirmwareIHM_v1_0_driver.c,4222 :: 		Label76.OnPressPtr      = 0;
SW	R0, Offset(_Label76+44)(GP)
;FirmwareIHM_v1_0_driver.c,4224 :: 		Label77.OwnerScreen     = &ScreenAcessoNegado;
LUI	R2, hi_addr(_ScreenAcessoNegado+0)
ORI	R2, R2, lo_addr(_ScreenAcessoNegado+0)
SW	R2, Offset(_Label77+0)(GP)
;FirmwareIHM_v1_0_driver.c,4225 :: 		Label77.Order           = 11;
ORI	R2, R0, 11
SB	R2, Offset(_Label77+4)(GP)
;FirmwareIHM_v1_0_driver.c,4226 :: 		Label77.Left            = 93;
ORI	R2, R0, 93
SH	R2, Offset(_Label77+6)(GP)
;FirmwareIHM_v1_0_driver.c,4227 :: 		Label77.Top             = 104;
ORI	R2, R0, 104
SH	R2, Offset(_Label77+8)(GP)
;FirmwareIHM_v1_0_driver.c,4228 :: 		Label77.Width           = 53;
ORI	R2, R0, 53
SH	R2, Offset(_Label77+10)(GP)
;FirmwareIHM_v1_0_driver.c,4229 :: 		Label77.Height          = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label77+12)(GP)
;FirmwareIHM_v1_0_driver.c,4230 :: 		Label77.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label77+27)(GP)
;FirmwareIHM_v1_0_driver.c,4231 :: 		Label77.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label77+28)(GP)
;FirmwareIHM_v1_0_driver.c,4232 :: 		Label77.Caption         = Label77_Caption;
LUI	R2, hi_addr(_Label77_Caption+0)
ORI	R2, R2, lo_addr(_Label77_Caption+0)
SW	R2, Offset(_Label77+16)(GP)
;FirmwareIHM_v1_0_driver.c,4233 :: 		Label77.FontName        = Tahoma17x21_Regular;
LUI	R2, hi_addr(_Tahoma17x21_Regular+0)
ORI	R2, R2, lo_addr(_Tahoma17x21_Regular+0)
SW	R2, Offset(_Label77+20)(GP)
;FirmwareIHM_v1_0_driver.c,4234 :: 		Label77.Font_Color      = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label77+24)(GP)
;FirmwareIHM_v1_0_driver.c,4235 :: 		Label77.VerticalText    = 0;
SB	R0, Offset(_Label77+26)(GP)
;FirmwareIHM_v1_0_driver.c,4236 :: 		Label77.OnUpPtr         = 0;
SW	R0, Offset(_Label77+32)(GP)
;FirmwareIHM_v1_0_driver.c,4237 :: 		Label77.OnDownPtr       = 0;
SW	R0, Offset(_Label77+36)(GP)
;FirmwareIHM_v1_0_driver.c,4238 :: 		Label77.OnClickPtr      = 0;
SW	R0, Offset(_Label77+40)(GP)
;FirmwareIHM_v1_0_driver.c,4239 :: 		Label77.OnPressPtr      = 0;
SW	R0, Offset(_Label77+44)(GP)
;FirmwareIHM_v1_0_driver.c,4241 :: 		Label78.OwnerScreen     = &ScreenMENU;
LUI	R2, hi_addr(_ScreenMENU+0)
ORI	R2, R2, lo_addr(_ScreenMENU+0)
SW	R2, Offset(_Label78+0)(GP)
;FirmwareIHM_v1_0_driver.c,4242 :: 		Label78.Order           = 2;
ORI	R2, R0, 2
SB	R2, Offset(_Label78+4)(GP)
;FirmwareIHM_v1_0_driver.c,4243 :: 		Label78.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label78+6)(GP)
;FirmwareIHM_v1_0_driver.c,4244 :: 		Label78.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label78+8)(GP)
;FirmwareIHM_v1_0_driver.c,4245 :: 		Label78.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label78+10)(GP)
;FirmwareIHM_v1_0_driver.c,4246 :: 		Label78.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label78+12)(GP)
;FirmwareIHM_v1_0_driver.c,4247 :: 		Label78.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label78+27)(GP)
;FirmwareIHM_v1_0_driver.c,4248 :: 		Label78.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label78+28)(GP)
;FirmwareIHM_v1_0_driver.c,4249 :: 		Label78.Caption         = Label78_Caption;
LUI	R2, hi_addr(_Label78_Caption+0)
ORI	R2, R2, lo_addr(_Label78_Caption+0)
SW	R2, Offset(_Label78+16)(GP)
;FirmwareIHM_v1_0_driver.c,4250 :: 		Label78.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label78+20)(GP)
;FirmwareIHM_v1_0_driver.c,4251 :: 		Label78.Font_Color      = 0x0000;
SH	R0, Offset(_Label78+24)(GP)
;FirmwareIHM_v1_0_driver.c,4252 :: 		Label78.VerticalText    = 0;
SB	R0, Offset(_Label78+26)(GP)
;FirmwareIHM_v1_0_driver.c,4253 :: 		Label78.OnUpPtr         = 0;
SW	R0, Offset(_Label78+32)(GP)
;FirmwareIHM_v1_0_driver.c,4254 :: 		Label78.OnDownPtr       = 0;
SW	R0, Offset(_Label78+36)(GP)
;FirmwareIHM_v1_0_driver.c,4255 :: 		Label78.OnClickPtr      = 0;
SW	R0, Offset(_Label78+40)(GP)
;FirmwareIHM_v1_0_driver.c,4256 :: 		Label78.OnPressPtr      = 0;
SW	R0, Offset(_Label78+44)(GP)
;FirmwareIHM_v1_0_driver.c,4258 :: 		Label79.OwnerScreen     = &ScreenMENU;
LUI	R2, hi_addr(_ScreenMENU+0)
ORI	R2, R2, lo_addr(_ScreenMENU+0)
SW	R2, Offset(_Label79+0)(GP)
;FirmwareIHM_v1_0_driver.c,4259 :: 		Label79.Order           = 3;
ORI	R2, R0, 3
SB	R2, Offset(_Label79+4)(GP)
;FirmwareIHM_v1_0_driver.c,4260 :: 		Label79.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label79+6)(GP)
;FirmwareIHM_v1_0_driver.c,4261 :: 		Label79.Top             = 3;
ORI	R2, R0, 3
SH	R2, Offset(_Label79+8)(GP)
;FirmwareIHM_v1_0_driver.c,4262 :: 		Label79.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label79+10)(GP)
;FirmwareIHM_v1_0_driver.c,4263 :: 		Label79.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label79+12)(GP)
;FirmwareIHM_v1_0_driver.c,4264 :: 		Label79.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label79+27)(GP)
;FirmwareIHM_v1_0_driver.c,4265 :: 		Label79.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label79+28)(GP)
;FirmwareIHM_v1_0_driver.c,4266 :: 		Label79.Caption         = Label79_Caption;
LUI	R2, hi_addr(_Label79_Caption+0)
ORI	R2, R2, lo_addr(_Label79_Caption+0)
SW	R2, Offset(_Label79+16)(GP)
;FirmwareIHM_v1_0_driver.c,4267 :: 		Label79.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label79+20)(GP)
;FirmwareIHM_v1_0_driver.c,4268 :: 		Label79.Font_Color      = 0x0000;
SH	R0, Offset(_Label79+24)(GP)
;FirmwareIHM_v1_0_driver.c,4269 :: 		Label79.VerticalText    = 0;
SB	R0, Offset(_Label79+26)(GP)
;FirmwareIHM_v1_0_driver.c,4270 :: 		Label79.OnUpPtr         = 0;
SW	R0, Offset(_Label79+32)(GP)
;FirmwareIHM_v1_0_driver.c,4271 :: 		Label79.OnDownPtr       = 0;
SW	R0, Offset(_Label79+36)(GP)
;FirmwareIHM_v1_0_driver.c,4272 :: 		Label79.OnClickPtr      = 0;
SW	R0, Offset(_Label79+40)(GP)
;FirmwareIHM_v1_0_driver.c,4273 :: 		Label79.OnPressPtr      = 0;
SW	R0, Offset(_Label79+44)(GP)
;FirmwareIHM_v1_0_driver.c,4275 :: 		Label80.OwnerScreen     = &ScreenMENU;
LUI	R2, hi_addr(_ScreenMENU+0)
ORI	R2, R2, lo_addr(_ScreenMENU+0)
SW	R2, Offset(_Label80+0)(GP)
;FirmwareIHM_v1_0_driver.c,4276 :: 		Label80.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_Label80+4)(GP)
;FirmwareIHM_v1_0_driver.c,4277 :: 		Label80.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label80+6)(GP)
;FirmwareIHM_v1_0_driver.c,4278 :: 		Label80.Top             = 3;
ORI	R2, R0, 3
SH	R2, Offset(_Label80+8)(GP)
;FirmwareIHM_v1_0_driver.c,4279 :: 		Label80.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label80+10)(GP)
;FirmwareIHM_v1_0_driver.c,4280 :: 		Label80.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label80+12)(GP)
;FirmwareIHM_v1_0_driver.c,4281 :: 		Label80.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label80+27)(GP)
;FirmwareIHM_v1_0_driver.c,4282 :: 		Label80.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label80+28)(GP)
;FirmwareIHM_v1_0_driver.c,4283 :: 		Label80.Caption         = Label80_Caption;
LUI	R2, hi_addr(_Label80_Caption+0)
ORI	R2, R2, lo_addr(_Label80_Caption+0)
SW	R2, Offset(_Label80+16)(GP)
;FirmwareIHM_v1_0_driver.c,4284 :: 		Label80.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label80+20)(GP)
;FirmwareIHM_v1_0_driver.c,4285 :: 		Label80.Font_Color      = 0x0000;
SH	R0, Offset(_Label80+24)(GP)
;FirmwareIHM_v1_0_driver.c,4286 :: 		Label80.VerticalText    = 0;
SB	R0, Offset(_Label80+26)(GP)
;FirmwareIHM_v1_0_driver.c,4287 :: 		Label80.OnUpPtr         = 0;
SW	R0, Offset(_Label80+32)(GP)
;FirmwareIHM_v1_0_driver.c,4288 :: 		Label80.OnDownPtr       = 0;
SW	R0, Offset(_Label80+36)(GP)
;FirmwareIHM_v1_0_driver.c,4289 :: 		Label80.OnClickPtr      = 0;
SW	R0, Offset(_Label80+40)(GP)
;FirmwareIHM_v1_0_driver.c,4290 :: 		Label80.OnPressPtr      = 0;
SW	R0, Offset(_Label80+44)(GP)
;FirmwareIHM_v1_0_driver.c,4292 :: 		Label81.OwnerScreen     = &ScreenMENU;
LUI	R2, hi_addr(_ScreenMENU+0)
ORI	R2, R2, lo_addr(_ScreenMENU+0)
SW	R2, Offset(_Label81+0)(GP)
;FirmwareIHM_v1_0_driver.c,4293 :: 		Label81.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_Label81+4)(GP)
;FirmwareIHM_v1_0_driver.c,4294 :: 		Label81.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label81+6)(GP)
;FirmwareIHM_v1_0_driver.c,4295 :: 		Label81.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label81+8)(GP)
;FirmwareIHM_v1_0_driver.c,4296 :: 		Label81.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label81+10)(GP)
;FirmwareIHM_v1_0_driver.c,4297 :: 		Label81.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label81+12)(GP)
;FirmwareIHM_v1_0_driver.c,4298 :: 		Label81.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label81+27)(GP)
;FirmwareIHM_v1_0_driver.c,4299 :: 		Label81.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label81+28)(GP)
;FirmwareIHM_v1_0_driver.c,4300 :: 		Label81.Caption         = Label81_Caption;
LUI	R2, hi_addr(_Label81_Caption+0)
ORI	R2, R2, lo_addr(_Label81_Caption+0)
SW	R2, Offset(_Label81+16)(GP)
;FirmwareIHM_v1_0_driver.c,4301 :: 		Label81.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label81+20)(GP)
;FirmwareIHM_v1_0_driver.c,4302 :: 		Label81.Font_Color      = 0x0000;
SH	R0, Offset(_Label81+24)(GP)
;FirmwareIHM_v1_0_driver.c,4303 :: 		Label81.VerticalText    = 0;
SB	R0, Offset(_Label81+26)(GP)
;FirmwareIHM_v1_0_driver.c,4304 :: 		Label81.OnUpPtr         = 0;
SW	R0, Offset(_Label81+32)(GP)
;FirmwareIHM_v1_0_driver.c,4305 :: 		Label81.OnDownPtr       = 0;
SW	R0, Offset(_Label81+36)(GP)
;FirmwareIHM_v1_0_driver.c,4306 :: 		Label81.OnClickPtr      = 0;
SW	R0, Offset(_Label81+40)(GP)
;FirmwareIHM_v1_0_driver.c,4307 :: 		Label81.OnPressPtr      = 0;
SW	R0, Offset(_Label81+44)(GP)
;FirmwareIHM_v1_0_driver.c,4309 :: 		Label89.OwnerScreen     = &ScreenEndSerial;
LUI	R2, hi_addr(_ScreenEndSerial+0)
ORI	R2, R2, lo_addr(_ScreenEndSerial+0)
SW	R2, Offset(_Label89+0)(GP)
;FirmwareIHM_v1_0_driver.c,4310 :: 		Label89.Order           = 3;
ORI	R2, R0, 3
SB	R2, Offset(_Label89+4)(GP)
;FirmwareIHM_v1_0_driver.c,4311 :: 		Label89.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label89+6)(GP)
;FirmwareIHM_v1_0_driver.c,4312 :: 		Label89.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label89+8)(GP)
;FirmwareIHM_v1_0_driver.c,4313 :: 		Label89.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label89+10)(GP)
;FirmwareIHM_v1_0_driver.c,4314 :: 		Label89.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label89+12)(GP)
;FirmwareIHM_v1_0_driver.c,4315 :: 		Label89.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label89+27)(GP)
;FirmwareIHM_v1_0_driver.c,4316 :: 		Label89.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label89+28)(GP)
;FirmwareIHM_v1_0_driver.c,4317 :: 		Label89.Caption         = Label89_Caption;
LUI	R2, hi_addr(_Label89_Caption+0)
ORI	R2, R2, lo_addr(_Label89_Caption+0)
SW	R2, Offset(_Label89+16)(GP)
;FirmwareIHM_v1_0_driver.c,4318 :: 		Label89.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label89+20)(GP)
;FirmwareIHM_v1_0_driver.c,4319 :: 		Label89.Font_Color      = 0x0000;
SH	R0, Offset(_Label89+24)(GP)
;FirmwareIHM_v1_0_driver.c,4320 :: 		Label89.VerticalText    = 0;
SB	R0, Offset(_Label89+26)(GP)
;FirmwareIHM_v1_0_driver.c,4321 :: 		Label89.OnUpPtr         = 0;
SW	R0, Offset(_Label89+32)(GP)
;FirmwareIHM_v1_0_driver.c,4322 :: 		Label89.OnDownPtr       = 0;
SW	R0, Offset(_Label89+36)(GP)
;FirmwareIHM_v1_0_driver.c,4323 :: 		Label89.OnClickPtr      = 0;
SW	R0, Offset(_Label89+40)(GP)
;FirmwareIHM_v1_0_driver.c,4324 :: 		Label89.OnPressPtr      = 0;
SW	R0, Offset(_Label89+44)(GP)
;FirmwareIHM_v1_0_driver.c,4326 :: 		Label90.OwnerScreen     = &ScreenEndSerial;
LUI	R2, hi_addr(_ScreenEndSerial+0)
ORI	R2, R2, lo_addr(_ScreenEndSerial+0)
SW	R2, Offset(_Label90+0)(GP)
;FirmwareIHM_v1_0_driver.c,4327 :: 		Label90.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_Label90+4)(GP)
;FirmwareIHM_v1_0_driver.c,4328 :: 		Label90.Left            = 185;
ORI	R2, R0, 185
SH	R2, Offset(_Label90+6)(GP)
;FirmwareIHM_v1_0_driver.c,4329 :: 		Label90.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label90+8)(GP)
;FirmwareIHM_v1_0_driver.c,4330 :: 		Label90.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label90+10)(GP)
;FirmwareIHM_v1_0_driver.c,4331 :: 		Label90.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label90+12)(GP)
;FirmwareIHM_v1_0_driver.c,4332 :: 		Label90.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label90+27)(GP)
;FirmwareIHM_v1_0_driver.c,4333 :: 		Label90.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label90+28)(GP)
;FirmwareIHM_v1_0_driver.c,4334 :: 		Label90.Caption         = Label90_Caption;
LUI	R2, hi_addr(_Label90_Caption+0)
ORI	R2, R2, lo_addr(_Label90_Caption+0)
SW	R2, Offset(_Label90+16)(GP)
;FirmwareIHM_v1_0_driver.c,4335 :: 		Label90.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label90+20)(GP)
;FirmwareIHM_v1_0_driver.c,4336 :: 		Label90.Font_Color      = 0x0000;
SH	R0, Offset(_Label90+24)(GP)
;FirmwareIHM_v1_0_driver.c,4337 :: 		Label90.VerticalText    = 0;
SB	R0, Offset(_Label90+26)(GP)
;FirmwareIHM_v1_0_driver.c,4338 :: 		Label90.OnUpPtr         = 0;
SW	R0, Offset(_Label90+32)(GP)
;FirmwareIHM_v1_0_driver.c,4339 :: 		Label90.OnDownPtr       = 0;
SW	R0, Offset(_Label90+36)(GP)
;FirmwareIHM_v1_0_driver.c,4340 :: 		Label90.OnClickPtr      = 0;
SW	R0, Offset(_Label90+40)(GP)
;FirmwareIHM_v1_0_driver.c,4341 :: 		Label90.OnPressPtr      = 0;
SW	R0, Offset(_Label90+44)(GP)
;FirmwareIHM_v1_0_driver.c,4343 :: 		Label91.OwnerScreen     = &ScreenEndSerial;
LUI	R2, hi_addr(_ScreenEndSerial+0)
ORI	R2, R2, lo_addr(_ScreenEndSerial+0)
SW	R2, Offset(_Label91+0)(GP)
;FirmwareIHM_v1_0_driver.c,4344 :: 		Label91.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_Label91+4)(GP)
;FirmwareIHM_v1_0_driver.c,4345 :: 		Label91.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label91+6)(GP)
;FirmwareIHM_v1_0_driver.c,4346 :: 		Label91.Top             = 2;
ORI	R2, R0, 2
SH	R2, Offset(_Label91+8)(GP)
;FirmwareIHM_v1_0_driver.c,4347 :: 		Label91.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label91+10)(GP)
;FirmwareIHM_v1_0_driver.c,4348 :: 		Label91.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label91+12)(GP)
;FirmwareIHM_v1_0_driver.c,4349 :: 		Label91.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label91+27)(GP)
;FirmwareIHM_v1_0_driver.c,4350 :: 		Label91.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label91+28)(GP)
;FirmwareIHM_v1_0_driver.c,4351 :: 		Label91.Caption         = Label91_Caption;
LUI	R2, hi_addr(_Label91_Caption+0)
ORI	R2, R2, lo_addr(_Label91_Caption+0)
SW	R2, Offset(_Label91+16)(GP)
;FirmwareIHM_v1_0_driver.c,4352 :: 		Label91.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label91+20)(GP)
;FirmwareIHM_v1_0_driver.c,4353 :: 		Label91.Font_Color      = 0x0000;
SH	R0, Offset(_Label91+24)(GP)
;FirmwareIHM_v1_0_driver.c,4354 :: 		Label91.VerticalText    = 0;
SB	R0, Offset(_Label91+26)(GP)
;FirmwareIHM_v1_0_driver.c,4355 :: 		Label91.OnUpPtr         = 0;
SW	R0, Offset(_Label91+32)(GP)
;FirmwareIHM_v1_0_driver.c,4356 :: 		Label91.OnDownPtr       = 0;
SW	R0, Offset(_Label91+36)(GP)
;FirmwareIHM_v1_0_driver.c,4357 :: 		Label91.OnClickPtr      = 0;
SW	R0, Offset(_Label91+40)(GP)
;FirmwareIHM_v1_0_driver.c,4358 :: 		Label91.OnPressPtr      = 0;
SW	R0, Offset(_Label91+44)(GP)
;FirmwareIHM_v1_0_driver.c,4360 :: 		Label92.OwnerScreen     = &ScreenEndSerial;
LUI	R2, hi_addr(_ScreenEndSerial+0)
ORI	R2, R2, lo_addr(_ScreenEndSerial+0)
SW	R2, Offset(_Label92+0)(GP)
;FirmwareIHM_v1_0_driver.c,4361 :: 		Label92.Order           = 6;
ORI	R2, R0, 6
SB	R2, Offset(_Label92+4)(GP)
;FirmwareIHM_v1_0_driver.c,4362 :: 		Label92.Left            = 45;
ORI	R2, R0, 45
SH	R2, Offset(_Label92+6)(GP)
;FirmwareIHM_v1_0_driver.c,4363 :: 		Label92.Top             = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label92+8)(GP)
;FirmwareIHM_v1_0_driver.c,4364 :: 		Label92.Width           = 39;
ORI	R2, R0, 39
SH	R2, Offset(_Label92+10)(GP)
;FirmwareIHM_v1_0_driver.c,4365 :: 		Label92.Height          = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label92+12)(GP)
;FirmwareIHM_v1_0_driver.c,4366 :: 		Label92.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label92+27)(GP)
;FirmwareIHM_v1_0_driver.c,4367 :: 		Label92.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label92+28)(GP)
;FirmwareIHM_v1_0_driver.c,4368 :: 		Label92.Caption         = Label92_Caption;
LUI	R2, hi_addr(_Label92_Caption+0)
ORI	R2, R2, lo_addr(_Label92_Caption+0)
SW	R2, Offset(_Label92+16)(GP)
;FirmwareIHM_v1_0_driver.c,4369 :: 		Label92.FontName        = Tahoma12x16_Regular;
SW	R3, Offset(_Label92+20)(GP)
;FirmwareIHM_v1_0_driver.c,4370 :: 		Label92.Font_Color      = 0x0000;
SH	R0, Offset(_Label92+24)(GP)
;FirmwareIHM_v1_0_driver.c,4371 :: 		Label92.VerticalText    = 0;
SB	R0, Offset(_Label92+26)(GP)
;FirmwareIHM_v1_0_driver.c,4372 :: 		Label92.OnUpPtr         = 0;
SW	R0, Offset(_Label92+32)(GP)
;FirmwareIHM_v1_0_driver.c,4373 :: 		Label92.OnDownPtr       = 0;
SW	R0, Offset(_Label92+36)(GP)
;FirmwareIHM_v1_0_driver.c,4374 :: 		Label92.OnClickPtr      = 0;
SW	R0, Offset(_Label92+40)(GP)
;FirmwareIHM_v1_0_driver.c,4375 :: 		Label92.OnPressPtr      = 0;
SW	R0, Offset(_Label92+44)(GP)
;FirmwareIHM_v1_0_driver.c,4376 :: 		}
L_end_InitializeObjects:
JR	RA
NOP	
; end of FirmwareIHM_v1_0_driver_InitializeObjects
FirmwareIHM_v1_0_driver_IsInsideObject:
;FirmwareIHM_v1_0_driver.c,4378 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Width start address is: 16 (R4)
LHU	R4, 0(SP)
; Height start address is: 20 (R5)
LHU	R5, 2(SP)
;FirmwareIHM_v1_0_driver.c,4379 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
ANDI	R3, R27, 65535
ANDI	R2, R25, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L_FirmwareIHM_v1_0_driver_IsInsideObject395
NOP	
J	L_FirmwareIHM_v1_0_driver_IsInsideObject331
NOP	
L_FirmwareIHM_v1_0_driver_IsInsideObject395:
ADDU	R2, R27, R4
; Width end address is: 16 (R4)
ADDIU	R2, R2, -1
ANDI	R3, R2, 65535
ANDI	R2, R25, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L_FirmwareIHM_v1_0_driver_IsInsideObject396
NOP	
J	L_FirmwareIHM_v1_0_driver_IsInsideObject330
NOP	
L_FirmwareIHM_v1_0_driver_IsInsideObject396:
;FirmwareIHM_v1_0_driver.c,4380 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
ANDI	R3, R28, 65535
ANDI	R2, R26, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L_FirmwareIHM_v1_0_driver_IsInsideObject397
NOP	
J	L_FirmwareIHM_v1_0_driver_IsInsideObject329
NOP	
L_FirmwareIHM_v1_0_driver_IsInsideObject397:
ADDU	R2, R28, R5
; Height end address is: 20 (R5)
ADDIU	R2, R2, -1
ANDI	R3, R2, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L_FirmwareIHM_v1_0_driver_IsInsideObject398
NOP	
J	L_FirmwareIHM_v1_0_driver_IsInsideObject328
NOP	
L_FirmwareIHM_v1_0_driver_IsInsideObject398:
L_FirmwareIHM_v1_0_driver_IsInsideObject327:
;FirmwareIHM_v1_0_driver.c,4381 :: 		return 1;
ORI	R2, R0, 1
J	L_end_IsInsideObject
NOP	
;FirmwareIHM_v1_0_driver.c,4379 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_FirmwareIHM_v1_0_driver_IsInsideObject331:
L_FirmwareIHM_v1_0_driver_IsInsideObject330:
;FirmwareIHM_v1_0_driver.c,4380 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_FirmwareIHM_v1_0_driver_IsInsideObject329:
L_FirmwareIHM_v1_0_driver_IsInsideObject328:
;FirmwareIHM_v1_0_driver.c,4383 :: 		return 0;
MOVZ	R2, R0, R0
;FirmwareIHM_v1_0_driver.c,4384 :: 		}
L_end_IsInsideObject:
JR	RA
NOP	
; end of FirmwareIHM_v1_0_driver_IsInsideObject
_DrawRoundButton:
;FirmwareIHM_v1_0_driver.c,4399 :: 		void DrawRoundButton(TButton_Round *Around_button) {
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4401 :: 		if (Around_button->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawRoundButton401
NOP	
J	L_DrawRoundButton10
NOP	
L__DrawRoundButton401:
;FirmwareIHM_v1_0_driver.c,4402 :: 		if (object_pressed == 1) {
LBU	R3, Offset(_object_pressed+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawRoundButton402
NOP	
J	L_DrawRoundButton11
NOP	
L__DrawRoundButton402:
;FirmwareIHM_v1_0_driver.c,4403 :: 		object_pressed = 0;
SB	R0, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,4405 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDIU	R2, R25, 42
LHU	R7, 0(R2)
ADDIU	R2, R25, 44
LHU	R6, 0(R2)
;FirmwareIHM_v1_0_driver.c,4404 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDIU	R2, R25, 40
LBU	R5, 0(R2)
ADDIU	R2, R25, 39
LBU	R4, 0(R2)
ADDIU	R2, R25, 50
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4405 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;FirmwareIHM_v1_0_driver.c,4404 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4406 :: 		}
J	L_DrawRoundButton12
NOP	
L_DrawRoundButton11:
;FirmwareIHM_v1_0_driver.c,4409 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDIU	R2, R25, 44
LHU	R7, 0(R2)
ADDIU	R2, R25, 42
LHU	R6, 0(R2)
;FirmwareIHM_v1_0_driver.c,4408 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDIU	R2, R25, 40
LBU	R5, 0(R2)
ADDIU	R2, R25, 39
LBU	R4, 0(R2)
ADDIU	R2, R25, 46
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4409 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;FirmwareIHM_v1_0_driver.c,4408 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4410 :: 		}
L_DrawRoundButton12:
;FirmwareIHM_v1_0_driver.c,4411 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4414 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDIU	R2, R25, 48
LBU	R7, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R6, R2, -2
;FirmwareIHM_v1_0_driver.c,4413 :: 		Around_button->Left + Around_button->Width - 2,
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R5, R2
ADDIU	R4, R2, -2
;FirmwareIHM_v1_0_driver.c,4412 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDIU	R3, R3, 1
ADDIU	R2, R5, 1
;FirmwareIHM_v1_0_driver.c,4414 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4413 :: 		Around_button->Left + Around_button->Width - 2,
ANDI	R27, R4, 65535
;FirmwareIHM_v1_0_driver.c,4412 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4414 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ANDI	R2, R7, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4415 :: 		if (Around_button->VerticalText != 0)
ADDIU	R2, R25, 38
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawRoundButton404
NOP	
J	L_DrawRoundButton13
NOP	
L__DrawRoundButton404:
;FirmwareIHM_v1_0_driver.c,4416 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LW	R2, 0(R2)
SW	R25, 20(SP)
ORI	R27, R0, 2
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 20(SP)
J	L_DrawRoundButton14
NOP	
L_DrawRoundButton13:
;FirmwareIHM_v1_0_driver.c,4418 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LW	R2, 0(R2)
SW	R25, 20(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 20(SP)
L_DrawRoundButton14:
;FirmwareIHM_v1_0_driver.c,4419 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4420 :: 		if (Around_button->TextAlign == _taLeft)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__DrawRoundButton405
NOP	
J	L_DrawRoundButton15
NOP	
L__DrawRoundButton405:
;FirmwareIHM_v1_0_driver.c,4421 :: 		ALeft = Around_button->Left + 4;
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R2, R2, 4
SH	R2, 24(SP)
J	L_DrawRoundButton16
NOP	
L_DrawRoundButton15:
;FirmwareIHM_v1_0_driver.c,4422 :: 		else if (Around_button->TextAlign == _taCenter)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawRoundButton406
NOP	
J	L_DrawRoundButton17
NOP	
L__DrawRoundButton406:
;FirmwareIHM_v1_0_driver.c,4423 :: 		ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R2, R4, R2
SH	R2, 24(SP)
J	L_DrawRoundButton18
NOP	
L_DrawRoundButton17:
;FirmwareIHM_v1_0_driver.c,4424 :: 		else if (Around_button->TextAlign == _taRight)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BEQ	R3, R2, L__DrawRoundButton407
NOP	
J	L_DrawRoundButton19
NOP	
L__DrawRoundButton407:
;FirmwareIHM_v1_0_driver.c,4425 :: 		ALeft = Around_button->Left + Around_button->Width - caption_length - 4;
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ADDIU	R2, R2, -4
SH	R2, 24(SP)
L_DrawRoundButton19:
L_DrawRoundButton18:
L_DrawRoundButton16:
;FirmwareIHM_v1_0_driver.c,4427 :: 		if (Around_button->TextAlignVertical == _tavTop)
ADDIU	R2, R25, 29
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__DrawRoundButton408
NOP	
J	L_DrawRoundButton20
NOP	
L__DrawRoundButton408:
;FirmwareIHM_v1_0_driver.c,4428 :: 		ATop = Around_button->Top + 3;
ADDIU	R2, R25, 8
LHU	R2, 0(R2)
ADDIU	R2, R2, 3
SH	R2, 26(SP)
J	L_DrawRoundButton21
NOP	
L_DrawRoundButton20:
;FirmwareIHM_v1_0_driver.c,4429 :: 		else if (Around_button->TextAlignVertical == _tavMiddle)
ADDIU	R2, R25, 29
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawRoundButton409
NOP	
J	L_DrawRoundButton22
NOP	
L__DrawRoundButton409:
;FirmwareIHM_v1_0_driver.c,4430 :: 		ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R2, R4, R2
SH	R2, 26(SP)
J	L_DrawRoundButton23
NOP	
L_DrawRoundButton22:
;FirmwareIHM_v1_0_driver.c,4431 :: 		else if (Around_button->TextAlignVertical == _tavBottom)
ADDIU	R2, R25, 29
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BEQ	R3, R2, L__DrawRoundButton410
NOP	
J	L_DrawRoundButton24
NOP	
L__DrawRoundButton410:
;FirmwareIHM_v1_0_driver.c,4432 :: 		ATop  = Around_button->Top + Around_button->Height - caption_height - 4;
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ADDIU	R2, R2, -4
SH	R2, 26(SP)
L_DrawRoundButton24:
L_DrawRoundButton23:
L_DrawRoundButton21:
;FirmwareIHM_v1_0_driver.c,4434 :: 		TFT_Write_Text(Around_button->Caption, ALeft, ATop);
ADDIU	R2, R25, 24
LW	R2, 0(R2)
LHU	R27, 26(SP)
LHU	R26, 24(SP)
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,4435 :: 		}
L_DrawRoundButton10:
;FirmwareIHM_v1_0_driver.c,4436 :: 		}
L_end_DrawRoundButton:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _DrawRoundButton
_DrawCRoundButton:
;FirmwareIHM_v1_0_driver.c,4438 :: 		void DrawCRoundButton(TCButton_Round *Around_button) {
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4440 :: 		if (Around_button->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCRoundButton413
NOP	
J	L_DrawCRoundButton25
NOP	
L__DrawCRoundButton413:
;FirmwareIHM_v1_0_driver.c,4441 :: 		if (object_pressed == 1) {
LBU	R3, Offset(_object_pressed+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawCRoundButton414
NOP	
J	L_DrawCRoundButton26
NOP	
L__DrawCRoundButton414:
;FirmwareIHM_v1_0_driver.c,4442 :: 		object_pressed = 0;
SB	R0, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,4444 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDIU	R2, R25, 42
LHU	R7, 0(R2)
ADDIU	R2, R25, 44
LHU	R6, 0(R2)
;FirmwareIHM_v1_0_driver.c,4443 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDIU	R2, R25, 40
LBU	R5, 0(R2)
ADDIU	R2, R25, 39
LBU	R4, 0(R2)
ADDIU	R2, R25, 50
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4444 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;FirmwareIHM_v1_0_driver.c,4443 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4445 :: 		}
J	L_DrawCRoundButton27
NOP	
L_DrawCRoundButton26:
;FirmwareIHM_v1_0_driver.c,4448 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDIU	R2, R25, 44
LHU	R7, 0(R2)
ADDIU	R2, R25, 42
LHU	R6, 0(R2)
;FirmwareIHM_v1_0_driver.c,4447 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDIU	R2, R25, 40
LBU	R5, 0(R2)
ADDIU	R2, R25, 39
LBU	R4, 0(R2)
ADDIU	R2, R25, 46
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4448 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;FirmwareIHM_v1_0_driver.c,4447 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4449 :: 		}
L_DrawCRoundButton27:
;FirmwareIHM_v1_0_driver.c,4450 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4453 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDIU	R2, R25, 48
LBU	R7, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R6, R2, -2
;FirmwareIHM_v1_0_driver.c,4452 :: 		Around_button->Left + Around_button->Width - 2,
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R5, R2
ADDIU	R4, R2, -2
;FirmwareIHM_v1_0_driver.c,4451 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDIU	R3, R3, 1
ADDIU	R2, R5, 1
;FirmwareIHM_v1_0_driver.c,4453 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4452 :: 		Around_button->Left + Around_button->Width - 2,
ANDI	R27, R4, 65535
;FirmwareIHM_v1_0_driver.c,4451 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4453 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ANDI	R2, R7, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4454 :: 		if (Around_button->VerticalText != 0)
ADDIU	R2, R25, 38
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCRoundButton416
NOP	
J	L_DrawCRoundButton28
NOP	
L__DrawCRoundButton416:
;FirmwareIHM_v1_0_driver.c,4455 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LW	R2, 0(R2)
SW	R25, 20(SP)
ORI	R27, R0, 2
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 20(SP)
J	L_DrawCRoundButton29
NOP	
L_DrawCRoundButton28:
;FirmwareIHM_v1_0_driver.c,4457 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LW	R2, 0(R2)
SW	R25, 20(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 20(SP)
L_DrawCRoundButton29:
;FirmwareIHM_v1_0_driver.c,4458 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4459 :: 		if (Around_button->TextAlign == _taLeft)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__DrawCRoundButton417
NOP	
J	L_DrawCRoundButton30
NOP	
L__DrawCRoundButton417:
;FirmwareIHM_v1_0_driver.c,4460 :: 		ALeft = Around_button->Left + 4;
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R2, R2, 4
SH	R2, 24(SP)
J	L_DrawCRoundButton31
NOP	
L_DrawCRoundButton30:
;FirmwareIHM_v1_0_driver.c,4461 :: 		else if (Around_button->TextAlign == _taCenter)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawCRoundButton418
NOP	
J	L_DrawCRoundButton32
NOP	
L__DrawCRoundButton418:
;FirmwareIHM_v1_0_driver.c,4462 :: 		ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R2, R4, R2
SH	R2, 24(SP)
J	L_DrawCRoundButton33
NOP	
L_DrawCRoundButton32:
;FirmwareIHM_v1_0_driver.c,4463 :: 		else if (Around_button->TextAlign == _taRight)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BEQ	R3, R2, L__DrawCRoundButton419
NOP	
J	L_DrawCRoundButton34
NOP	
L__DrawCRoundButton419:
;FirmwareIHM_v1_0_driver.c,4464 :: 		ALeft = Around_button->Left + Around_button->Width - caption_length - 4;
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ADDIU	R2, R2, -4
SH	R2, 24(SP)
L_DrawCRoundButton34:
L_DrawCRoundButton33:
L_DrawCRoundButton31:
;FirmwareIHM_v1_0_driver.c,4466 :: 		if (Around_button->TextAlignVertical == _tavTop)
ADDIU	R2, R25, 29
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__DrawCRoundButton420
NOP	
J	L_DrawCRoundButton35
NOP	
L__DrawCRoundButton420:
;FirmwareIHM_v1_0_driver.c,4467 :: 		ATop = Around_button->Top + 3;
ADDIU	R2, R25, 8
LHU	R2, 0(R2)
ADDIU	R2, R2, 3
SH	R2, 26(SP)
J	L_DrawCRoundButton36
NOP	
L_DrawCRoundButton35:
;FirmwareIHM_v1_0_driver.c,4468 :: 		else if (Around_button->TextAlignVertical == _tavMiddle)
ADDIU	R2, R25, 29
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawCRoundButton421
NOP	
J	L_DrawCRoundButton37
NOP	
L__DrawCRoundButton421:
;FirmwareIHM_v1_0_driver.c,4469 :: 		ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R2, R4, R2
SH	R2, 26(SP)
J	L_DrawCRoundButton38
NOP	
L_DrawCRoundButton37:
;FirmwareIHM_v1_0_driver.c,4470 :: 		else if (Around_button->TextAlignVertical == _tavBottom)
ADDIU	R2, R25, 29
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BEQ	R3, R2, L__DrawCRoundButton422
NOP	
J	L_DrawCRoundButton39
NOP	
L__DrawCRoundButton422:
;FirmwareIHM_v1_0_driver.c,4471 :: 		ATop  = Around_button->Top + Around_button->Height - caption_height - 4;
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ADDIU	R2, R2, -4
SH	R2, 26(SP)
L_DrawCRoundButton39:
L_DrawCRoundButton38:
L_DrawCRoundButton36:
;FirmwareIHM_v1_0_driver.c,4473 :: 		TFT_Write_Text(Around_button->Caption, ALeft, ATop);
ADDIU	R2, R25, 24
LW	R2, 0(R2)
LHU	R27, 26(SP)
LHU	R26, 24(SP)
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,4474 :: 		}
L_DrawCRoundButton25:
;FirmwareIHM_v1_0_driver.c,4475 :: 		}
L_end_DrawCRoundButton:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _DrawCRoundButton
_DrawLabel:
;FirmwareIHM_v1_0_driver.c,4477 :: 		void DrawLabel(TLabel *ALabel) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4478 :: 		if (ALabel->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, R25, 27
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawLabel425
NOP	
J	L_DrawLabel40
NOP	
L__DrawLabel425:
;FirmwareIHM_v1_0_driver.c,4479 :: 		if (ALabel->VerticalText != 0)
ADDIU	R2, R25, 26
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawLabel427
NOP	
J	L_DrawLabel41
NOP	
L__DrawLabel427:
;FirmwareIHM_v1_0_driver.c,4480 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDIU	R2, R25, 24
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
ORI	R27, R0, 2
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
J	L_DrawLabel42
NOP	
L_DrawLabel41:
;FirmwareIHM_v1_0_driver.c,4482 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 24
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
L_DrawLabel42:
;FirmwareIHM_v1_0_driver.c,4483 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 16
LW	R2, 0(R2)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,4484 :: 		}
L_DrawLabel40:
;FirmwareIHM_v1_0_driver.c,4485 :: 		}
L_end_DrawLabel:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawLabel
_DrawCLabel:
;FirmwareIHM_v1_0_driver.c,4487 :: 		void DrawCLabel(TCLabel *ALabel) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4488 :: 		if (ALabel->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, R25, 27
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCLabel430
NOP	
J	L_DrawCLabel43
NOP	
L__DrawCLabel430:
;FirmwareIHM_v1_0_driver.c,4489 :: 		if (ALabel->VerticalText != 0)
ADDIU	R2, R25, 26
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCLabel432
NOP	
J	L_DrawCLabel44
NOP	
L__DrawCLabel432:
;FirmwareIHM_v1_0_driver.c,4490 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDIU	R2, R25, 24
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
ORI	R27, R0, 2
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
J	L_DrawCLabel45
NOP	
L_DrawCLabel44:
;FirmwareIHM_v1_0_driver.c,4492 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 24
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
L_DrawCLabel45:
;FirmwareIHM_v1_0_driver.c,4493 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 16
LW	R2, 0(R2)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,4494 :: 		}
L_DrawCLabel43:
;FirmwareIHM_v1_0_driver.c,4495 :: 		}
L_end_DrawCLabel:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawCLabel
_DrawCBox:
;FirmwareIHM_v1_0_driver.c,4497 :: 		void DrawCBox(TCBox *ABox) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4498 :: 		if (ABox->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCBox435
NOP	
J	L_DrawCBox46
NOP	
L__DrawCBox435:
;FirmwareIHM_v1_0_driver.c,4499 :: 		if (object_pressed == 1) {
LBU	R3, Offset(_object_pressed+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawCBox436
NOP	
J	L_DrawCBox47
NOP	
L__DrawCBox436:
;FirmwareIHM_v1_0_driver.c,4500 :: 		object_pressed = 0;
SB	R0, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,4501 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDIU	R2, R25, 24
LHU	R7, 0(R2)
ADDIU	R2, R25, 26
LHU	R6, 0(R2)
ADDIU	R2, R25, 22
LBU	R5, 0(R2)
ADDIU	R2, R25, 21
LBU	R4, 0(R2)
ADDIU	R2, R25, 32
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4502 :: 		}
J	L_DrawCBox48
NOP	
L_DrawCBox47:
;FirmwareIHM_v1_0_driver.c,4504 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDIU	R2, R25, 26
LHU	R7, 0(R2)
ADDIU	R2, R25, 24
LHU	R6, 0(R2)
ADDIU	R2, R25, 22
LBU	R5, 0(R2)
ADDIU	R2, R25, 21
LBU	R4, 0(R2)
ADDIU	R2, R25, 28
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4505 :: 		}
L_DrawCBox48:
;FirmwareIHM_v1_0_driver.c,4506 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4507 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R5, R2
ADDIU	R4, R2, -1
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R2, R2, -1
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
;FirmwareIHM_v1_0_driver.c,4508 :: 		}
L_DrawCBox46:
;FirmwareIHM_v1_0_driver.c,4509 :: 		}
L_end_DrawCBox:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DrawCBox
_DrawRoundBox:
;FirmwareIHM_v1_0_driver.c,4511 :: 		void DrawRoundBox(TBox_Round *Around_box) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4512 :: 		if (Around_box->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawRoundBox439
NOP	
J	L_DrawRoundBox49
NOP	
L__DrawRoundBox439:
;FirmwareIHM_v1_0_driver.c,4513 :: 		if (object_pressed == 1) {
LBU	R3, Offset(_object_pressed+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawRoundBox440
NOP	
J	L_DrawRoundBox50
NOP	
L__DrawRoundBox440:
;FirmwareIHM_v1_0_driver.c,4514 :: 		object_pressed = 0;
SB	R0, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,4516 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
ADDIU	R2, R25, 24
LHU	R7, 0(R2)
ADDIU	R2, R25, 26
LHU	R6, 0(R2)
;FirmwareIHM_v1_0_driver.c,4515 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDIU	R2, R25, 22
LBU	R5, 0(R2)
ADDIU	R2, R25, 21
LBU	R4, 0(R2)
ADDIU	R2, R25, 32
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4516 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;FirmwareIHM_v1_0_driver.c,4515 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4517 :: 		}
J	L_DrawRoundBox51
NOP	
L_DrawRoundBox50:
;FirmwareIHM_v1_0_driver.c,4520 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
ADDIU	R2, R25, 26
LHU	R7, 0(R2)
ADDIU	R2, R25, 24
LHU	R6, 0(R2)
;FirmwareIHM_v1_0_driver.c,4519 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDIU	R2, R25, 22
LBU	R5, 0(R2)
ADDIU	R2, R25, 21
LBU	R4, 0(R2)
ADDIU	R2, R25, 28
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4520 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;FirmwareIHM_v1_0_driver.c,4519 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4521 :: 		}
L_DrawRoundBox51:
;FirmwareIHM_v1_0_driver.c,4522 :: 		TFT_Set_Pen(Around_box->Pen_Color, Around_box->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4525 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
ADDIU	R2, R25, 30
LBU	R7, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R6, R2, -2
;FirmwareIHM_v1_0_driver.c,4524 :: 		Around_box->Left + Around_box->Width - 2,
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R5, R2
ADDIU	R4, R2, -2
;FirmwareIHM_v1_0_driver.c,4523 :: 		TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
ADDIU	R3, R3, 1
ADDIU	R2, R5, 1
;FirmwareIHM_v1_0_driver.c,4525 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4524 :: 		Around_box->Left + Around_box->Width - 2,
ANDI	R27, R4, 65535
;FirmwareIHM_v1_0_driver.c,4523 :: 		TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4525 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
ANDI	R2, R7, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
;FirmwareIHM_v1_0_driver.c,4526 :: 		}
L_DrawRoundBox49:
;FirmwareIHM_v1_0_driver.c,4527 :: 		}
L_end_DrawRoundBox:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DrawRoundBox
_DrawLine:
;FirmwareIHM_v1_0_driver.c,4529 :: 		void DrawLine(TLine *Aline) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4530 :: 		if (Aline->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 15
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawLine443
NOP	
J	L_DrawLine52
NOP	
L__DrawLine443:
;FirmwareIHM_v1_0_driver.c,4531 :: 		TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4532 :: 		TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R4, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,4533 :: 		}
L_DrawLine52:
;FirmwareIHM_v1_0_driver.c,4534 :: 		}
L_end_DrawLine:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DrawLine
_DrawCLine:
;FirmwareIHM_v1_0_driver.c,4536 :: 		void DrawCLine(TCLine *Aline) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4537 :: 		if (Aline->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 15
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCLine446
NOP	
J	L_DrawCLine53
NOP	
L__DrawCLine446:
;FirmwareIHM_v1_0_driver.c,4538 :: 		TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4539 :: 		TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R4, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Line+0
NOP	
;FirmwareIHM_v1_0_driver.c,4540 :: 		}
L_DrawCLine53:
;FirmwareIHM_v1_0_driver.c,4541 :: 		}
L_end_DrawCLine:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DrawCLine
_DrawCheckBox:
;FirmwareIHM_v1_0_driver.c,4543 :: 		void DrawCheckBox(TCheckBox *ACheckBox) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4544 :: 		if (ACheckBox->Visible != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCheckBox449
NOP	
J	L_DrawCheckBox54
NOP	
L__DrawCheckBox449:
;FirmwareIHM_v1_0_driver.c,4545 :: 		if (object_pressed == 1) {
LBU	R3, Offset(_object_pressed+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawCheckBox450
NOP	
J	L_DrawCheckBox55
NOP	
L__DrawCheckBox450:
;FirmwareIHM_v1_0_driver.c,4546 :: 		object_pressed = 0;
SB	R0, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,4547 :: 		TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Press_Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_End_Color, ACheckBox->Gradient_Start_Color);
ADDIU	R2, R25, 40
LHU	R7, 0(R2)
ADDIU	R2, R25, 42
LHU	R6, 0(R2)
ADDIU	R2, R25, 39
LBU	R5, 0(R2)
ADDIU	R2, R25, 38
LBU	R4, 0(R2)
ADDIU	R2, R25, 50
LHU	R3, 0(R2)
ADDIU	R2, R25, 21
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4548 :: 		}
J	L_DrawCheckBox56
NOP	
L_DrawCheckBox55:
;FirmwareIHM_v1_0_driver.c,4550 :: 		TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_Start_Color, ACheckBox->Gradient_End_Color);
ADDIU	R2, R25, 42
LHU	R7, 0(R2)
ADDIU	R2, R25, 40
LHU	R6, 0(R2)
ADDIU	R2, R25, 39
LBU	R5, 0(R2)
ADDIU	R2, R25, 38
LBU	R4, 0(R2)
ADDIU	R2, R25, 44
LHU	R3, 0(R2)
ADDIU	R2, R25, 21
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4551 :: 		}
L_DrawCheckBox56:
;FirmwareIHM_v1_0_driver.c,4552 :: 		TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4553 :: 		TFT_Set_Font(ACheckBox->FontName, ACheckBox->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LW	R2, 0(R2)
SW	R25, 20(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4554 :: 		if (ACheckBox->TextAlign == _taLeft) {
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__DrawCheckBox451
NOP	
J	L_DrawCheckBox57
NOP	
L__DrawCheckBox451:
;FirmwareIHM_v1_0_driver.c,4555 :: 		if (ACheckBox->Rounded != 0)
ADDIU	R2, R25, 46
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCheckBox453
NOP	
J	L_DrawCheckBox58
NOP	
L__DrawCheckBox453:
;FirmwareIHM_v1_0_driver.c,4556 :: 		TFT_Rectangle_Round_Edges(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
ADDIU	R2, R25, 47
LBU	R7, 0(R2)
ADDIU	R2, R25, 8
LHU	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDU	R2, R6, R5
ADDIU	R4, R2, -1
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDU	R2, R3, R5
SW	R25, 20(SP)
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R6, 65535
ANDI	R25, R3, 65535
ANDI	R2, R7, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
J	L_DrawCheckBox59
NOP	
L_DrawCheckBox58:
;FirmwareIHM_v1_0_driver.c,4558 :: 		TFT_Rectangle(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1);
ADDIU	R2, R25, 8
LHU	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDU	R2, R6, R5
ADDIU	R4, R2, -1
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDU	R2, R3, R5
SW	R25, 20(SP)
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R6, 65535
ANDI	R25, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 20(SP)
L_DrawCheckBox59:
;FirmwareIHM_v1_0_driver.c,4559 :: 		if (ACheckBox->Checked != 0) {
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCheckBox455
NOP	
J	L_DrawCheckBox60
NOP	
L__DrawCheckBox455:
;FirmwareIHM_v1_0_driver.c,4560 :: 		TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SRL	R3, R2, 3
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4564 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
ADDIU	R2, R25, 8
LHU	R9, 0(R2)
ADDIU	R2, R25, 12
LHU	R8, 0(R2)
ADDU	R4, R9, R8
ANDI	R3, R8, 65535
ORI	R2, R0, 5
DIVU	R3, R2
MFLO	R7
SUBU	R2, R4, R7
ADDIU	R6, R2, -1
;FirmwareIHM_v1_0_driver.c,4563 :: 		ACheckBox->Left  + ACheckBox->Height / 2 - 1,
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
ANDI	R2, R8, 65535
SRL	R3, R2, 1
ADDU	R2, R5, R3
ADDIU	R4, R2, -1
;FirmwareIHM_v1_0_driver.c,4562 :: 		ACheckBox->Top   + ACheckBox->Height / 2 + 1,
ADDU	R2, R9, R3
ADDIU	R3, R2, 1
;FirmwareIHM_v1_0_driver.c,4561 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 5 + 1,
ADDU	R2, R5, R7
ADDIU	R2, R2, 1
;FirmwareIHM_v1_0_driver.c,4564 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4563 :: 		ACheckBox->Left  + ACheckBox->Height / 2 - 1,
ANDI	R27, R4, 65535
;FirmwareIHM_v1_0_driver.c,4562 :: 		ACheckBox->Top   + ACheckBox->Height / 2 + 1,
ANDI	R26, R3, 65535
;FirmwareIHM_v1_0_driver.c,4561 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 5 + 1,
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4564 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
JAL	_TFT_Line+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4568 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
ADDIU	R2, R25, 8
LHU	R8, 0(R2)
ADDIU	R2, R25, 12
LHU	R7, 0(R2)
ANDI	R3, R7, 65535
ORI	R2, R0, 5
DIVU	R3, R2
MFLO	R4
ADDU	R2, R8, R4
ADDIU	R6, R2, 1
;FirmwareIHM_v1_0_driver.c,4567 :: 		ACheckBox->Left  + ACheckBox->Height - ACheckBox->Height / 5 - 1,
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDU	R2, R3, R7
SUBU	R2, R2, R4
ADDIU	R5, R2, -1
;FirmwareIHM_v1_0_driver.c,4566 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
ADDU	R2, R8, R7
SUBU	R2, R2, R4
ADDIU	R4, R2, -1
;FirmwareIHM_v1_0_driver.c,4565 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 2 - ACheckBox->Pen_Width + 1,
ANDI	R2, R7, 65535
SRL	R2, R2, 1
ADDU	R3, R3, R2
ADDIU	R2, R25, 14
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SUBU	R2, R3, R2
ADDIU	R2, R2, 1
;FirmwareIHM_v1_0_driver.c,4568 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4567 :: 		ACheckBox->Left  + ACheckBox->Height - ACheckBox->Height / 5 - 1,
ANDI	R27, R5, 65535
;FirmwareIHM_v1_0_driver.c,4566 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
ANDI	R26, R4, 65535
;FirmwareIHM_v1_0_driver.c,4565 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 2 - ACheckBox->Pen_Width + 1,
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4568 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
JAL	_TFT_Line+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4569 :: 		}
L_DrawCheckBox60:
;FirmwareIHM_v1_0_driver.c,4570 :: 		TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Width / 4 + 3, ACheckBox->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SRL	R2, R2, 2
ADDU	R2, R3, R2
ADDIU	R3, R2, 3
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4571 :: 		TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Height + 3, (ACheckBox->Top + ((ACheckBox->Height - caption_height) / 2)));
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R4, R4, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R2, R2, R3
ADDIU	R3, R2, 3
ADDIU	R2, R25, 24
LW	R2, 0(R2)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,4572 :: 		}
J	L_DrawCheckBox61
NOP	
L_DrawCheckBox57:
;FirmwareIHM_v1_0_driver.c,4573 :: 		else if (ACheckBox->TextAlign == _taRight) {
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BEQ	R3, R2, L__DrawCheckBox456
NOP	
J	L_DrawCheckBox62
NOP	
L__DrawCheckBox456:
;FirmwareIHM_v1_0_driver.c,4574 :: 		if (ACheckBox->Rounded != 0)
ADDIU	R2, R25, 46
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCheckBox458
NOP	
J	L_DrawCheckBox63
NOP	
L__DrawCheckBox458:
;FirmwareIHM_v1_0_driver.c,4575 :: 		TFT_Rectangle_Round_Edges(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
ADDIU	R2, R25, 47
LBU	R7, 0(R2)
ADDIU	R2, R25, 8
LHU	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDU	R2, R6, R5
ADDIU	R4, R2, -1
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R3, R3, R2
SUBU	R2, R3, R5
SW	R25, 20(SP)
ANDI	R28, R4, 65535
ANDI	R27, R3, 65535
ANDI	R26, R6, 65535
ANDI	R25, R2, 65535
ANDI	R2, R7, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
J	L_DrawCheckBox64
NOP	
L_DrawCheckBox63:
;FirmwareIHM_v1_0_driver.c,4577 :: 		TFT_Rectangle(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1);
ADDIU	R2, R25, 8
LHU	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R5, 0(R2)
ADDU	R2, R6, R5
ADDIU	R4, R2, -1
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R3, R3, R2
SUBU	R2, R3, R5
SW	R25, 20(SP)
ANDI	R28, R4, 65535
ANDI	R27, R3, 65535
ANDI	R26, R6, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 20(SP)
L_DrawCheckBox64:
;FirmwareIHM_v1_0_driver.c,4578 :: 		if (ACheckBox->Checked != 0) {
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawCheckBox460
NOP	
J	L_DrawCheckBox65
NOP	
L__DrawCheckBox460:
;FirmwareIHM_v1_0_driver.c,4579 :: 		TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SRL	R3, R2, 3
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4583 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
ADDIU	R2, R25, 8
LHU	R9, 0(R2)
ADDIU	R2, R25, 12
LHU	R8, 0(R2)
ADDU	R4, R9, R8
ANDI	R3, R8, 65535
ORI	R2, R0, 5
DIVU	R3, R2
MFLO	R7
SUBU	R2, R4, R7
ADDIU	R6, R2, -1
;FirmwareIHM_v1_0_driver.c,4582 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 - 1,
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R5, R3, R2
ANDI	R2, R8, 65535
SRL	R3, R2, 1
SUBU	R2, R5, R3
ADDIU	R4, R2, -1
;FirmwareIHM_v1_0_driver.c,4581 :: 		ACheckBox->Top +  ACheckBox->Height / 2 + 1,
ADDU	R2, R9, R3
ADDIU	R3, R2, 1
;FirmwareIHM_v1_0_driver.c,4580 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Width - ACheckBox->Height + ACheckBox->Height / 5 + 1,
SUBU	R2, R5, R8
ADDU	R2, R2, R7
ADDIU	R2, R2, 1
;FirmwareIHM_v1_0_driver.c,4583 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4582 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 - 1,
ANDI	R27, R4, 65535
;FirmwareIHM_v1_0_driver.c,4581 :: 		ACheckBox->Top +  ACheckBox->Height / 2 + 1,
ANDI	R26, R3, 65535
;FirmwareIHM_v1_0_driver.c,4580 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Width - ACheckBox->Height + ACheckBox->Height / 5 + 1,
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4583 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
JAL	_TFT_Line+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4587 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
ADDIU	R2, R25, 8
LHU	R9, 0(R2)
ADDIU	R2, R25, 12
LHU	R8, 0(R2)
ANDI	R3, R8, 65535
ORI	R2, R0, 5
DIVU	R3, R2
MFLO	R7
ADDU	R2, R9, R7
ADDIU	R6, R2, 1
;FirmwareIHM_v1_0_driver.c,4586 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height / 5 - 1,
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R5, R3, R2
SUBU	R2, R5, R7
ADDIU	R4, R2, -1
;FirmwareIHM_v1_0_driver.c,4585 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
ADDU	R2, R9, R8
SUBU	R2, R2, R7
ADDIU	R3, R2, -1
;FirmwareIHM_v1_0_driver.c,4584 :: 		TFT_Line(ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 + 1,
ANDI	R2, R8, 65535
SRL	R2, R2, 1
SUBU	R2, R5, R2
ADDIU	R2, R2, 1
;FirmwareIHM_v1_0_driver.c,4587 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4586 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height / 5 - 1,
ANDI	R27, R4, 65535
;FirmwareIHM_v1_0_driver.c,4585 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
ANDI	R26, R3, 65535
;FirmwareIHM_v1_0_driver.c,4584 :: 		TFT_Line(ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 + 1,
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4587 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
JAL	_TFT_Line+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4588 :: 		}
L_DrawCheckBox65:
;FirmwareIHM_v1_0_driver.c,4589 :: 		TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, R2, 3
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4590 :: 		TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top + (ACheckBox->Height - caption_height) / 2);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R4, R4, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, R2, 3
ADDIU	R2, R25, 24
LW	R2, 0(R2)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,4591 :: 		}
L_DrawCheckBox62:
L_DrawCheckBox61:
;FirmwareIHM_v1_0_driver.c,4592 :: 		}
L_DrawCheckBox54:
;FirmwareIHM_v1_0_driver.c,4593 :: 		}
L_end_DrawCheckBox:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DrawCheckBox
_GetColorFromGradientRange:
;FirmwareIHM_v1_0_driver.c,4596 :: 		unsigned int distance, unsigned int range) {
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4602 :: 		if (distance == 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ANDI	R2, R27, 65535
BEQ	R2, R0, L__GetColorFromGradientRange462
NOP	
J	L_GetColorFromGradientRange66
NOP	
L__GetColorFromGradientRange462:
;FirmwareIHM_v1_0_driver.c,4603 :: 		return start_color;
ANDI	R2, R25, 65535
J	L_end_GetColorFromGradientRange
NOP	
L_GetColorFromGradientRange66:
;FirmwareIHM_v1_0_driver.c,4604 :: 		else if (distance == range)
ANDI	R3, R27, 65535
ANDI	R2, R28, 65535
BEQ	R3, R2, L__GetColorFromGradientRange463
NOP	
J	L_GetColorFromGradientRange68
NOP	
L__GetColorFromGradientRange463:
;FirmwareIHM_v1_0_driver.c,4605 :: 		return end_color;
ANDI	R2, R26, 65535
J	L_end_GetColorFromGradientRange
NOP	
L_GetColorFromGradientRange68:
;FirmwareIHM_v1_0_driver.c,4607 :: 		TFT_Color16bitToRGB(start_color, &red_start, &green_start, &blue_start);
ADDIU	R4, SP, 26
ADDIU	R3, SP, 24
ADDIU	R2, SP, 22
SH	R28, 16(SP)
SH	R27, 18(SP)
SH	R26, 20(SP)
MOVZ	R28, R4, R0
MOVZ	R27, R3, R0
MOVZ	R26, R2, R0
JAL	_TFT_Color16bitToRGB+0
NOP	
LHU	R26, 20(SP)
;FirmwareIHM_v1_0_driver.c,4608 :: 		TFT_Color16bitToRGB(end_color, &red_end, &green_end, &blue_end);
ADDIU	R4, SP, 27
ADDIU	R3, SP, 25
ADDIU	R2, SP, 23
MOVZ	R28, R4, R0
MOVZ	R27, R3, R0
ANDI	R25, R26, 65535
MOVZ	R26, R2, R0
JAL	_TFT_Color16bitToRGB+0
NOP	
LHU	R27, 18(SP)
LHU	R28, 16(SP)
;FirmwareIHM_v1_0_driver.c,4610 :: 		red_current   = red_start   + (long)distance * ((int)red_end   - red_start)   / range;
ANDI	R4, R27, 65535
LBU	R3, 23(SP)
LBU	R2, 22(SP)
SUBU	R2, R3, R2
SEH	R2, R2
MUL	R3, R4, R2
ANDI	R2, R28, 65535
DIV	R3, R2
MFLO	R3
LBU	R2, 22(SP)
ADDU	R6, R2, R3
;FirmwareIHM_v1_0_driver.c,4611 :: 		green_current = green_start + (long)distance * ((int)green_end - green_start) / range;
ANDI	R4, R27, 65535
LBU	R3, 25(SP)
LBU	R2, 24(SP)
SUBU	R2, R3, R2
SEH	R2, R2
MUL	R3, R4, R2
ANDI	R2, R28, 65535
DIV	R3, R2
MFLO	R3
LBU	R2, 24(SP)
ADDU	R5, R2, R3
;FirmwareIHM_v1_0_driver.c,4612 :: 		blue_current  = blue_start  + (long)distance * ((int)blue_end  - blue_start)  / range;
ANDI	R4, R27, 65535
LBU	R3, 27(SP)
LBU	R2, 26(SP)
SUBU	R2, R3, R2
SEH	R2, R2
MUL	R3, R4, R2
ANDI	R2, R28, 65535
DIV	R3, R2
MFLO	R3
LBU	R2, 26(SP)
ADDU	R2, R2, R3
;FirmwareIHM_v1_0_driver.c,4613 :: 		return TFT_RGBToColor16bit(red_current, green_current, blue_current);
ANDI	R27, R2, 255
ANDI	R26, R5, 255
ANDI	R25, R6, 255
JAL	_TFT_RGBToColor16bit+0
NOP	
;FirmwareIHM_v1_0_driver.c,4615 :: 		}
;FirmwareIHM_v1_0_driver.c,4613 :: 		return TFT_RGBToColor16bit(red_current, green_current, blue_current);
;FirmwareIHM_v1_0_driver.c,4615 :: 		}
L_end_GetColorFromGradientRange:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _GetColorFromGradientRange
_Update_Percentage:
;FirmwareIHM_v1_0_driver.c,4617 :: 		void Update_Percentage(TProgressBar *AProgressBar, unsigned int locPosition) {
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4620 :: 		if (AProgressBar->Show_Position != 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, R25, 48
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Update_Percentage466
NOP	
J	L_Update_Percentage70
NOP	
L__Update_Percentage466:
;FirmwareIHM_v1_0_driver.c,4621 :: 		if (AProgressBar->Show_Percentage != 0) {
ADDIU	R2, R25, 49
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Update_Percentage468
NOP	
J	L_Update_Percentage71
NOP	
L__Update_Percentage468:
;FirmwareIHM_v1_0_driver.c,4622 :: 		WordToStr(locPosition , tmpStr);
ADDIU	R2, SP, 20
SW	R25, 16(SP)
ANDI	R25, R26, 65535
MOVZ	R26, R2, R0
JAL	_WordToStr+0
NOP	
;FirmwareIHM_v1_0_driver.c,4623 :: 		Ltrim(tmpStr);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_Ltrim+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4624 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADDIU	R3, SP, 20
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4625 :: 		strcat(AProgressBar->Caption, "\%");
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
LUI	R26, hi_addr(?lstr5_FirmwareIHM_v1_0_driver+0)
ORI	R26, R26, lo_addr(?lstr5_FirmwareIHM_v1_0_driver+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4626 :: 		} else {
J	L_Update_Percentage72
NOP	
L_Update_Percentage71:
;FirmwareIHM_v1_0_driver.c,4627 :: 		WordToStr(AProgressBar->Position , tmpStr);
ADDIU	R3, SP, 20
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
ANDI	R25, R2, 65535
JAL	_WordToStr+0
NOP	
;FirmwareIHM_v1_0_driver.c,4628 :: 		Ltrim(tmpStr);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_Ltrim+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4629 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADDIU	R3, SP, 20
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4630 :: 		}
L_Update_Percentage72:
;FirmwareIHM_v1_0_driver.c,4631 :: 		TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 28
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4632 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4633 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R5, R4, R2
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R4, R2
ADDIU	R2, R25, 20
LW	R2, 0(R2)
ANDI	R27, R5, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;FirmwareIHM_v1_0_driver.c,4634 :: 		}
L_Update_Percentage70:
;FirmwareIHM_v1_0_driver.c,4635 :: 		}
L_end_Update_Percentage:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Update_Percentage
_Update_Sector:
;FirmwareIHM_v1_0_driver.c,4637 :: 		void Update_Sector(TProgressBar *AProgressBar, unsigned int AStartPos, unsigned int AEndPos, TProgressBarSector ASectorAction) {
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4638 :: 		unsigned int tmpWidth = 0;
SW	R28, 4(SP)
;FirmwareIHM_v1_0_driver.c,4639 :: 		unsigned int tmpRound = 0;
;FirmwareIHM_v1_0_driver.c,4640 :: 		unsigned cnt = 0;
;FirmwareIHM_v1_0_driver.c,4643 :: 		unsigned int locPosition = 0;
;FirmwareIHM_v1_0_driver.c,4645 :: 		if (AStartPos == AEndPos)
ANDI	R3, R26, 65535
ANDI	R2, R27, 65535
BEQ	R3, R2, L__Update_Sector470
NOP	
J	L_Update_Sector73
NOP	
L__Update_Sector470:
;FirmwareIHM_v1_0_driver.c,4646 :: 		return;
J	L_end_Update_Sector
NOP	
L_Update_Sector73:
;FirmwareIHM_v1_0_driver.c,4649 :: 		if (AStartPos <= AProgressBar->Left) {
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ANDI	R3, R26, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__Update_Sector471
NOP	
J	L_Update_Sector74
NOP	
L__Update_Sector471:
;FirmwareIHM_v1_0_driver.c,4650 :: 		if (AProgressBar->Rounded != 0)
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Update_Sector473
NOP	
J	L_Update_Sector75
NOP	
L__Update_Sector473:
;FirmwareIHM_v1_0_driver.c,4651 :: 		AStartPos = AProgressBar->Left + AProgressBar->Corner_Radius;
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 52
LBU	R2, 0(R2)
ANDI	R2, R2, 255
ADDU	R2, R3, R2
ANDI	R26, R2, 65535
J	L_Update_Sector76
NOP	
L_Update_Sector75:
;FirmwareIHM_v1_0_driver.c,4653 :: 		AStartPos = AProgressBar->Left + 1;
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R2, R2, 1
ANDI	R26, R2, 65535
L_Update_Sector76:
;FirmwareIHM_v1_0_driver.c,4654 :: 		}
L_Update_Sector74:
;FirmwareIHM_v1_0_driver.c,4656 :: 		if (AEndPos >= AProgressBar->Left + AProgressBar->Width) {
ADDIU	R4, R25, 6
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, 0(R4)
ADDU	R2, R2, R3
ANDI	R3, R27, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L__Update_Sector474
NOP	
J	L_Update_Sector77
NOP	
L__Update_Sector474:
;FirmwareIHM_v1_0_driver.c,4657 :: 		if (AProgressBar->Rounded != 0)
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Update_Sector476
NOP	
J	L_Update_Sector78
NOP	
L__Update_Sector476:
;FirmwareIHM_v1_0_driver.c,4658 :: 		AEndPos = AProgressBar->Left + AProgressBar->Width - (AProgressBar->Corner_Radius*2);
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R25, 52
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLL	R2, R2, 1
SUBU	R2, R3, R2
ANDI	R27, R2, 65535
J	L_Update_Sector79
NOP	
L_Update_Sector78:
;FirmwareIHM_v1_0_driver.c,4660 :: 		AEndPos = AProgressBar->Left + AProgressBar->Width - 1;
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R2, R2, -1
ANDI	R27, R2, 65535
L_Update_Sector79:
;FirmwareIHM_v1_0_driver.c,4661 :: 		}
L_Update_Sector77:
;FirmwareIHM_v1_0_driver.c,4663 :: 		if (AProgressBar->Rounded != 0) {
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Update_Sector478
NOP	
J	L_Update_Sector80
NOP	
L__Update_Sector478:
;FirmwareIHM_v1_0_driver.c,4664 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDIU	R2, R25, 52
LBU	R4, 0(R2)
; tmpRound start address is: 36 (R9)
ANDI	R9, R4, 255
;FirmwareIHM_v1_0_driver.c,4665 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ANDI	R2, R4, 255
SLL	R2, R2, 1
SUBU	R2, R3, R2
; tmpWidth start address is: 32 (R8)
ANDI	R8, R2, 65535
;FirmwareIHM_v1_0_driver.c,4666 :: 		}
; tmpRound end address is: 36 (R9)
; tmpWidth end address is: 32 (R8)
J	L_Update_Sector81
NOP	
L_Update_Sector80:
;FirmwareIHM_v1_0_driver.c,4668 :: 		tmpRound = 0;
; tmpRound start address is: 36 (R9)
MOVZ	R9, R0, R0
;FirmwareIHM_v1_0_driver.c,4669 :: 		tmpWidth = AProgressBar->Width;
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
; tmpWidth start address is: 32 (R8)
ANDI	R8, R2, 65535
; tmpRound end address is: 36 (R9)
; tmpWidth end address is: 32 (R8)
;FirmwareIHM_v1_0_driver.c,4670 :: 		}
L_Update_Sector81:
;FirmwareIHM_v1_0_driver.c,4673 :: 		TFT_Set_Pen(0, 0);
; tmpWidth start address is: 32 (R8)
; tmpRound start address is: 36 (R9)
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 12(SP)
LHU	R26, 8(SP)
;FirmwareIHM_v1_0_driver.c,4674 :: 		if (ASectorAction == _pbsFillSector) {
ANDI	R3, R28, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Update_Sector479
NOP	
J	L_Update_Sector82
NOP	
L__Update_Sector479:
;FirmwareIHM_v1_0_driver.c,4675 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
ADDIU	R2, R25, 30
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Update_Sector481
NOP	
J	L__Update_Sector336
NOP	
L__Update_Sector481:
ADDIU	R2, R25, 31
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Update_Sector483
NOP	
J	L__Update_Sector335
NOP	
L__Update_Sector483:
L__Update_Sector334:
;FirmwareIHM_v1_0_driver.c,4676 :: 		startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AStartPos, AProgressBar->Left + tmpWidth + tmpRound);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R2, R2, R8
ADDU	R4, R2, R9
ADDIU	R2, R25, 34
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LHU	R2, 0(R2)
SB	R28, 8(SP)
SH	R27, 10(SP)
SH	R26, 12(SP)
SW	R25, 16(SP)
ANDI	R28, R4, 65535
ANDI	R27, R26, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_GetColorFromGradientRange+0
NOP	
LW	R25, 16(SP)
LHU	R26, 12(SP)
LHU	R27, 10(SP)
; startcolor start address is: 28 (R7)
ANDI	R7, R2, 65535
;FirmwareIHM_v1_0_driver.c,4677 :: 		endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AEndPos, AProgressBar->Left + tmpWidth + tmpRound);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R2, R2, R8
ADDU	R4, R2, R9
ADDIU	R2, R25, 34
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LHU	R2, 0(R2)
SH	R27, 10(SP)
SH	R26, 12(SP)
SW	R25, 16(SP)
ANDI	R28, R4, 65535
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_GetColorFromGradientRange+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4678 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, startcolor, endcolor);
ADDIU	R3, R25, 31
LBU	R6, 0(R3)
ADDIU	R3, R25, 30
LBU	R5, 0(R3)
ADDIU	R3, R25, 36
LHU	R4, 0(R3)
ADDIU	R3, R25, 19
LBU	R3, 0(R3)
SW	R25, 16(SP)
ANDI	R28, R6, 255
ANDI	R27, R5, 255
ANDI	R26, R4, 65535
ANDI	R25, R3, 255
ADDIU	SP, SP, -4
SH	R2, 2(SP)
SH	R7, 0(SP)
; startcolor end address is: 28 (R7)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
LHU	R26, 12(SP)
LHU	R27, 10(SP)
LBU	R28, 8(SP)
;FirmwareIHM_v1_0_driver.c,4679 :: 		} else
J	L_Update_Sector86
NOP	
;FirmwareIHM_v1_0_driver.c,4675 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
L__Update_Sector336:
L__Update_Sector335:
;FirmwareIHM_v1_0_driver.c,4680 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDIU	R2, R25, 34
LHU	R7, 0(R2)
ADDIU	R2, R25, 32
LHU	R6, 0(R2)
ADDIU	R2, R25, 31
LBU	R5, 0(R2)
ADDIU	R2, R25, 30
LBU	R4, 0(R2)
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 19
LBU	R2, 0(R2)
SB	R28, 8(SP)
SH	R27, 10(SP)
SH	R26, 12(SP)
SW	R25, 16(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
LHU	R26, 12(SP)
LHU	R27, 10(SP)
LBU	R28, 8(SP)
L_Update_Sector86:
;FirmwareIHM_v1_0_driver.c,4681 :: 		} else {
J	L_Update_Sector87
NOP	
L_Update_Sector82:
;FirmwareIHM_v1_0_driver.c,4682 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
ADDIU	R2, R25, 38
LHU	R3, 0(R2)
ADDIU	R2, R25, 19
LBU	R2, 0(R2)
SB	R28, 8(SP)
SH	R27, 10(SP)
SH	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
LHU	R26, 12(SP)
LHU	R27, 10(SP)
LBU	R28, 8(SP)
;FirmwareIHM_v1_0_driver.c,4683 :: 		AEndPos += 1;
ADDIU	R2, R27, 1
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,4684 :: 		}
L_Update_Sector87:
;FirmwareIHM_v1_0_driver.c,4685 :: 		TFT_Rectangle(AStartPos, AProgressBar->Top + 1, AEndPos, AProgressBar->Top + 1 + AProgressBar->Height - 1);
ADDIU	R2, R25, 8
LHU	R2, 0(R2)
ADDIU	R3, R2, 1
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R2, R2, -1
SH	R9, 8(SP)
SH	R8, 10(SP)
SB	R28, 12(SP)
SH	R27, 14(SP)
SH	R26, 16(SP)
SW	R25, 20(SP)
ANDI	R28, R2, 65535
ANDI	R25, R26, 65535
ANDI	R26, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 20(SP)
LHU	R26, 16(SP)
LHU	R27, 14(SP)
LBU	R28, 12(SP)
LHU	R8, 10(SP)
LHU	R9, 8(SP)
;FirmwareIHM_v1_0_driver.c,4688 :: 		if ((AProgressBar->Smooth == 0) && (ASectorAction == _pbsFillSector)) {
ADDIU	R2, R25, 50
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__Update_Sector484
NOP	
J	L__Update_Sector340
NOP	
L__Update_Sector484:
ANDI	R3, R28, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Update_Sector485
NOP	
J	L__Update_Sector339
NOP	
L__Update_Sector485:
L__Update_Sector333:
;FirmwareIHM_v1_0_driver.c,4689 :: 		move_offset = 10;
; move_offset start address is: 24 (R6)
ORI	R6, R0, 10
;FirmwareIHM_v1_0_driver.c,4690 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SH	R26, 8(SP)
SW	R25, 12(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 12(SP)
LHU	R26, 8(SP)
;FirmwareIHM_v1_0_driver.c,4691 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
ADDIU	R2, R25, 38
LHU	R3, 0(R2)
ADDIU	R2, R25, 19
LBU	R2, 0(R2)
SH	R27, 8(SP)
SH	R26, 10(SP)
SW	R25, 12(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 12(SP)
LHU	R26, 10(SP)
LHU	R27, 8(SP)
;FirmwareIHM_v1_0_driver.c,4692 :: 		locPosition = AStartPos;
; locPosition start address is: 8 (R2)
ANDI	R2, R26, 65535
; tmpRound end address is: 36 (R9)
; locPosition end address is: 8 (R2)
ANDI	R7, R9, 65535
ANDI	R9, R2, 65535
;FirmwareIHM_v1_0_driver.c,4693 :: 		while (locPosition < AEndPos) {
L_Update_Sector91:
; locPosition start address is: 36 (R9)
; tmpRound start address is: 28 (R7)
; move_offset start address is: 24 (R6)
; move_offset end address is: 24 (R6)
; tmpRound start address is: 28 (R7)
; tmpRound end address is: 28 (R7)
; tmpWidth start address is: 32 (R8)
; tmpWidth end address is: 32 (R8)
ANDI	R3, R9, 65535
ANDI	R2, R27, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__Update_Sector486
NOP	
J	L_Update_Sector92
NOP	
L__Update_Sector486:
; move_offset end address is: 24 (R6)
; tmpRound end address is: 28 (R7)
; tmpWidth end address is: 32 (R8)
;FirmwareIHM_v1_0_driver.c,4694 :: 		if (((locPosition - AProgressBar->Left - tmpRound)%(move_offset + 3) == 0) && (locPosition - 3 > AProgressBar->Left + tmpRound)) {
; tmpWidth start address is: 32 (R8)
; tmpRound start address is: 28 (R7)
; move_offset start address is: 24 (R6)
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
SUBU	R2, R9, R2
SUBU	R3, R2, R7
ADDIU	R2, R6, 3
DIVU	R3, R2
MFHI	R2
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Update_Sector487
NOP	
J	L__Update_Sector338
NOP	
L__Update_Sector487:
ADDIU	R3, R9, -3
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R2, R2, R7
ANDI	R3, R3, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__Update_Sector488
NOP	
J	L__Update_Sector337
NOP	
L__Update_Sector488:
L__Update_Sector332:
;FirmwareIHM_v1_0_driver.c,4695 :: 		if (locPosition + 3 >= AProgressBar->Left + tmpWidth + tmpRound)
ADDIU	R3, R9, 3
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R2, R2, R8
ADDU	R2, R2, R7
ANDI	R3, R3, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L__Update_Sector489
NOP	
J	L_Update_Sector96
NOP	
L__Update_Sector489:
;FirmwareIHM_v1_0_driver.c,4696 :: 		TFT_Rectangle(locPosition - 3, AProgressBar->Top, AProgressBar->Left + tmpWidth + tmpRound, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R2, R2, R8
ADDU	R3, R2, R7
ADDIU	R2, R9, -3
SH	R8, 8(SP)
SH	R7, 10(SP)
SH	R6, 12(SP)
SH	R9, 14(SP)
SB	R28, 16(SP)
SH	R27, 18(SP)
SH	R26, 20(SP)
SW	R25, 24(SP)
ANDI	R28, R4, 65535
ANDI	R27, R3, 65535
ANDI	R26, R5, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 24(SP)
LHU	R26, 20(SP)
LHU	R27, 18(SP)
LBU	R28, 16(SP)
LHU	R9, 14(SP)
LH	R6, 12(SP)
LHU	R7, 10(SP)
LHU	R8, 8(SP)
J	L_Update_Sector97
NOP	
L_Update_Sector96:
;FirmwareIHM_v1_0_driver.c,4698 :: 		TFT_Rectangle(locPosition - 3, AProgressBar->Top, locPosition, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R3, R4, R2
ADDIU	R2, R9, -3
SH	R8, 8(SP)
SH	R7, 10(SP)
SH	R6, 12(SP)
SH	R9, 14(SP)
SB	R28, 16(SP)
SH	R27, 18(SP)
SH	R26, 20(SP)
SW	R25, 24(SP)
ANDI	R28, R3, 65535
ANDI	R27, R9, 65535
ANDI	R26, R4, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 24(SP)
LHU	R26, 20(SP)
LHU	R27, 18(SP)
LBU	R28, 16(SP)
LHU	R9, 14(SP)
LH	R6, 12(SP)
LHU	R7, 10(SP)
LHU	R8, 8(SP)
L_Update_Sector97:
;FirmwareIHM_v1_0_driver.c,4699 :: 		locPosition += move_offset + 3;
ADDIU	R2, R6, 3
ADDU	R2, R9, R2
; locPosition end address is: 36 (R9)
; locPosition start address is: 8 (R2)
;FirmwareIHM_v1_0_driver.c,4700 :: 		} else
ANDI	R9, R2, 65535
; locPosition end address is: 8 (R2)
J	L_Update_Sector98
NOP	
;FirmwareIHM_v1_0_driver.c,4694 :: 		if (((locPosition - AProgressBar->Left - tmpRound)%(move_offset + 3) == 0) && (locPosition - 3 > AProgressBar->Left + tmpRound)) {
L__Update_Sector338:
; locPosition start address is: 36 (R9)
L__Update_Sector337:
;FirmwareIHM_v1_0_driver.c,4701 :: 		locPosition++;
ADDIU	R2, R9, 1
; locPosition end address is: 36 (R9)
; locPosition start address is: 12 (R3)
ANDI	R3, R2, 65535
; locPosition end address is: 12 (R3)
ANDI	R9, R3, 65535
L_Update_Sector98:
;FirmwareIHM_v1_0_driver.c,4702 :: 		}
; locPosition start address is: 36 (R9)
; move_offset end address is: 24 (R6)
; tmpRound end address is: 28 (R7)
; tmpWidth end address is: 32 (R8)
; locPosition end address is: 36 (R9)
J	L_Update_Sector91
NOP	
L_Update_Sector92:
;FirmwareIHM_v1_0_driver.c,4688 :: 		if ((AProgressBar->Smooth == 0) && (ASectorAction == _pbsFillSector)) {
L__Update_Sector340:
L__Update_Sector339:
;FirmwareIHM_v1_0_driver.c,4704 :: 		}
L_end_Update_Sector:
LW	R28, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _Update_Sector
_UpdatePBPosition:
;FirmwareIHM_v1_0_driver.c,4706 :: 		void UpdatePBPosition(TProgressBar *AProgressBar) {
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4708 :: 		unsigned long locPosition = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
;FirmwareIHM_v1_0_driver.c,4710 :: 		unsigned int locStartPos = 0;
;FirmwareIHM_v1_0_driver.c,4711 :: 		unsigned int locEndPos   = 0;
;FirmwareIHM_v1_0_driver.c,4713 :: 		if (AProgressBar->Prev_Position == AProgressBar->Position)
ADDIU	R2, R25, 46
LHU	R3, 0(R2)
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
ANDI	R3, R3, 65535
ANDI	R2, R2, 65535
BEQ	R3, R2, L__UpdatePBPosition491
NOP	
J	L_UpdatePBPosition99
NOP	
L__UpdatePBPosition491:
;FirmwareIHM_v1_0_driver.c,4714 :: 		return;
J	L_end_UpdatePBPosition
NOP	
L_UpdatePBPosition99:
;FirmwareIHM_v1_0_driver.c,4716 :: 		locPosition = (unsigned long)(AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
ADDIU	R2, R25, 44
LHU	R3, 0(R2)
ADDIU	R2, R25, 40
LHU	R4, 0(R2)
SUBU	R2, R3, R4
ANDI	R3, R2, 65535
ORI	R2, R0, 100
MULTU	R3, R2
MFLO	R3
ADDIU	R2, R25, 42
LHU	R2, 0(R2)
SUBU	R2, R2, R4
ANDI	R2, R2, 65535
DIVU	R3, R2
MFLO	R2
; locPosition start address is: 24 (R6)
MOVZ	R6, R2, R0
;FirmwareIHM_v1_0_driver.c,4717 :: 		if (AProgressBar->Visible != 0) {
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__UpdatePBPosition493
NOP	
J	L_UpdatePBPosition100
NOP	
L__UpdatePBPosition493:
;FirmwareIHM_v1_0_driver.c,4719 :: 		_temp = (AProgressBar->Position - AProgressBar->Min);
ADDIU	R2, R25, 44
LHU	R3, 0(R2)
ADDIU	R2, R25, 40
LHU	R5, 0(R2)
SUBU	R3, R3, R5
;FirmwareIHM_v1_0_driver.c,4720 :: 		_tempII = AProgressBar->Max - AProgressBar->Min;
ADDIU	R2, R25, 42
LHU	R2, 0(R2)
SUBU	R4, R2, R5
;FirmwareIHM_v1_0_driver.c,4721 :: 		locEndPos = _temp * 100 / _tempII;
ORI	R2, R0, 100
MULTU	R3, R2
MFLO	R2
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
DIVU	R3, R2
MFLO	R2
; locEndPos start address is: 28 (R7)
ANDI	R7, R2, 65535
;FirmwareIHM_v1_0_driver.c,4722 :: 		_temp = (AProgressBar->Prev_Position - AProgressBar->Min);
ADDIU	R2, R25, 46
LHU	R2, 0(R2)
SUBU	R3, R2, R5
;FirmwareIHM_v1_0_driver.c,4723 :: 		locStartPos =  _temp * 100 / _tempII;
ORI	R2, R0, 100
MULTU	R3, R2
MFLO	R2
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
DIVU	R3, R2
MFLO	R2
; locStartPos start address is: 20 (R5)
ANDI	R5, R2, 65535
;FirmwareIHM_v1_0_driver.c,4724 :: 		if (AProgressBar->Rounded != 0) {
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__UpdatePBPosition495
NOP	
J	L_UpdatePBPosition101
NOP	
L__UpdatePBPosition495:
;FirmwareIHM_v1_0_driver.c,4725 :: 		_temp = AProgressBar->Width - (AProgressBar->Corner_Radius * 2);
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ADDIU	R2, R25, 52
LBU	R4, 0(R2)
ANDI	R2, R4, 255
SLL	R2, R2, 1
SUBU	R2, R3, R2
; _temp start address is: 36 (R9)
ANDI	R9, R2, 65535
;FirmwareIHM_v1_0_driver.c,4726 :: 		_tempII = AProgressBar->Left + AProgressBar->Corner_Radius;
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ANDI	R2, R4, 255
ADDU	R2, R3, R2
; _tempII start address is: 32 (R8)
ANDI	R8, R2, 65535
;FirmwareIHM_v1_0_driver.c,4727 :: 		} else {
; _temp end address is: 36 (R9)
; _tempII end address is: 32 (R8)
J	L_UpdatePBPosition102
NOP	
L_UpdatePBPosition101:
;FirmwareIHM_v1_0_driver.c,4728 :: 		_temp = (AProgressBar->Width - 2);
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDIU	R2, R2, -2
; _temp start address is: 36 (R9)
ANDI	R9, R2, 65535
;FirmwareIHM_v1_0_driver.c,4729 :: 		_tempII = AProgressBar->Left + 1;
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R2, R2, 1
; _tempII start address is: 32 (R8)
ANDI	R8, R2, 65535
; _temp end address is: 36 (R9)
; _tempII end address is: 32 (R8)
;FirmwareIHM_v1_0_driver.c,4730 :: 		}
L_UpdatePBPosition102:
;FirmwareIHM_v1_0_driver.c,4731 :: 		locStartPos = _tempII + locStartPos * _temp / 100;
; _tempII start address is: 32 (R8)
; _temp start address is: 36 (R9)
MULTU	R5, R9
MFLO	R2
; locStartPos end address is: 20 (R5)
ANDI	R3, R2, 65535
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R4, R8, R2
; locStartPos start address is: 20 (R5)
ANDI	R5, R4, 65535
;FirmwareIHM_v1_0_driver.c,4732 :: 		locEndPos   = _tempII + locEndPos * _temp / 100;
MULTU	R7, R9
MFLO	R2
; _temp end address is: 36 (R9)
; locEndPos end address is: 28 (R7)
ANDI	R3, R2, 65535
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R2, R8, R2
; _tempII end address is: 32 (R8)
; locEndPos start address is: 28 (R7)
ANDI	R7, R2, 65535
;FirmwareIHM_v1_0_driver.c,4734 :: 		if (locStartPos < locEndPos)
ANDI	R3, R4, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__UpdatePBPosition496
NOP	
J	L_UpdatePBPosition103
NOP	
L__UpdatePBPosition496:
;FirmwareIHM_v1_0_driver.c,4735 :: 		sector_action = _pbsFillSector;
; sector_action start address is: 8 (R2)
ORI	R2, R0, 1
; sector_action end address is: 8 (R2)
J	L_UpdatePBPosition104
NOP	
L_UpdatePBPosition103:
;FirmwareIHM_v1_0_driver.c,4737 :: 		sector_action = _pbsClearSector;
; sector_action start address is: 8 (R2)
MOVZ	R2, R0, R0
;FirmwareIHM_v1_0_driver.c,4738 :: 		_temp = locStartPos;
; _temp start address is: 12 (R3)
ANDI	R3, R5, 65535
;FirmwareIHM_v1_0_driver.c,4739 :: 		locStartPos = locEndPos;
ANDI	R5, R7, 65535
;FirmwareIHM_v1_0_driver.c,4740 :: 		locEndPos = _temp;
ANDI	R7, R3, 65535
; _temp end address is: 12 (R3)
; locEndPos end address is: 28 (R7)
; locStartPos end address is: 20 (R5)
; sector_action end address is: 8 (R2)
;FirmwareIHM_v1_0_driver.c,4741 :: 		}
L_UpdatePBPosition104:
;FirmwareIHM_v1_0_driver.c,4742 :: 		Update_Sector(AProgressBar, locStartPos, locEndPos, sector_action);
; locEndPos start address is: 28 (R7)
; locStartPos start address is: 20 (R5)
; sector_action start address is: 8 (R2)
SH	R5, 16(SP)
; sector_action end address is: 8 (R2)
SH	R7, 18(SP)
SW	R6, 20(SP)
SW	R25, 24(SP)
ANDI	R28, R2, 255
ANDI	R27, R7, 65535
ANDI	R26, R5, 65535
JAL	_Update_Sector+0
NOP	
LW	R25, 24(SP)
LW	R6, 20(SP)
LHU	R7, 18(SP)
LHU	R5, 16(SP)
;FirmwareIHM_v1_0_driver.c,4744 :: 		if (AProgressBar->Show_Position == 0) {
ADDIU	R2, R25, 48
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__UpdatePBPosition497
NOP	
J	L_UpdatePBPosition105
NOP	
L__UpdatePBPosition497:
; locPosition end address is: 24 (R6)
; locEndPos end address is: 28 (R7)
; locStartPos end address is: 20 (R5)
;FirmwareIHM_v1_0_driver.c,4745 :: 		AProgressBar->Prev_Position = AProgressBar->Position;
ADDIU	R3, R25, 46
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
SH	R2, 0(R3)
;FirmwareIHM_v1_0_driver.c,4746 :: 		return;
J	L_end_UpdatePBPosition
NOP	
;FirmwareIHM_v1_0_driver.c,4747 :: 		}
L_UpdatePBPosition105:
;FirmwareIHM_v1_0_driver.c,4750 :: 		TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
; locStartPos start address is: 20 (R5)
; locEndPos start address is: 28 (R7)
; locPosition start address is: 24 (R6)
ADDIU	R2, R25, 28
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4751 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SH	R5, 16(SP)
SH	R7, 18(SP)
SW	R6, 20(SP)
SW	R25, 24(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 24(SP)
LW	R6, 20(SP)
LHU	R7, 18(SP)
LHU	R5, 16(SP)
;FirmwareIHM_v1_0_driver.c,4752 :: 		if (caption_length >  AProgressBar->Width)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, Offset(_caption_length+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__UpdatePBPosition498
NOP	
J	L_UpdatePBPosition106
NOP	
L__UpdatePBPosition498:
;FirmwareIHM_v1_0_driver.c,4753 :: 		caption_length =  AProgressBar->Width;
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
SH	R2, Offset(_caption_length+0)(GP)
L_UpdatePBPosition106:
;FirmwareIHM_v1_0_driver.c,4754 :: 		_temp   = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2;
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R4, R2
; _temp start address is: 16 (R4)
ANDI	R4, R3, 65535
;FirmwareIHM_v1_0_driver.c,4755 :: 		_tempII = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length;
LHU	R2, Offset(_caption_length+0)(GP)
ADDU	R2, R3, R2
; _tempII start address is: 32 (R8)
ANDI	R8, R2, 65535
;FirmwareIHM_v1_0_driver.c,4758 :: 		if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (locEndPos <= _temp))
ANDI	R3, R7, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition499
NOP	
J	L__UpdatePBPosition349
NOP	
L__UpdatePBPosition499:
ANDI	R3, R5, 65535
ANDI	R2, R4, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition500
NOP	
J	L__UpdatePBPosition348
NOP	
L__UpdatePBPosition500:
ANDI	R3, R5, 65535
ANDI	R2, R8, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition501
NOP	
J	L__UpdatePBPosition347
NOP	
L__UpdatePBPosition501:
ANDI	R3, R7, 65535
ANDI	R2, R4, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition502
NOP	
J	L__UpdatePBPosition346
NOP	
L__UpdatePBPosition502:
; locEndPos end address is: 28 (R7)
; locStartPos end address is: 20 (R5)
L__UpdatePBPosition345:
;FirmwareIHM_v1_0_driver.c,4759 :: 		Update_Sector(AProgressBar, _temp, _tempII, _pbsClearSector);
SW	R6, 16(SP)
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ANDI	R27, R8, 65535
; _tempII end address is: 32 (R8)
ANDI	R26, R4, 65535
; _temp end address is: 16 (R4)
JAL	_Update_Sector+0
NOP	
LW	R25, 20(SP)
LW	R6, 16(SP)
J	L_UpdatePBPosition110
NOP	
;FirmwareIHM_v1_0_driver.c,4758 :: 		if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (locEndPos <= _temp))
L__UpdatePBPosition349:
; _tempII start address is: 32 (R8)
; _temp start address is: 16 (R4)
; locStartPos start address is: 20 (R5)
; locEndPos start address is: 28 (R7)
L__UpdatePBPosition348:
L__UpdatePBPosition347:
L__UpdatePBPosition346:
;FirmwareIHM_v1_0_driver.c,4760 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (_tempII <= locStartPos) && (_temp <= locEndPos))
ANDI	R3, R8, 65535
ANDI	R2, R7, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition503
NOP	
J	L__UpdatePBPosition353
NOP	
L__UpdatePBPosition503:
ANDI	R3, R4, 65535
ANDI	R2, R5, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition504
NOP	
J	L__UpdatePBPosition352
NOP	
L__UpdatePBPosition504:
ANDI	R3, R8, 65535
ANDI	R2, R5, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition505
NOP	
J	L__UpdatePBPosition351
NOP	
L__UpdatePBPosition505:
ANDI	R3, R4, 65535
ANDI	R2, R7, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition506
NOP	
J	L__UpdatePBPosition350
NOP	
L__UpdatePBPosition506:
; locEndPos end address is: 28 (R7)
; locStartPos end address is: 20 (R5)
L__UpdatePBPosition344:
;FirmwareIHM_v1_0_driver.c,4761 :: 		Update_Sector(AProgressBar, _temp, _tempII, _pbsFillSector);
SW	R6, 16(SP)
SW	R25, 20(SP)
ORI	R28, R0, 1
ANDI	R27, R8, 65535
; _tempII end address is: 32 (R8)
ANDI	R26, R4, 65535
; _temp end address is: 16 (R4)
JAL	_Update_Sector+0
NOP	
LW	R25, 20(SP)
LW	R6, 16(SP)
J	L_UpdatePBPosition114
NOP	
;FirmwareIHM_v1_0_driver.c,4760 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (_tempII <= locStartPos) && (_temp <= locEndPos))
L__UpdatePBPosition353:
; _tempII start address is: 32 (R8)
; _temp start address is: 16 (R4)
; locStartPos start address is: 20 (R5)
; locEndPos start address is: 28 (R7)
L__UpdatePBPosition352:
L__UpdatePBPosition351:
L__UpdatePBPosition350:
;FirmwareIHM_v1_0_driver.c,4762 :: 		else if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (_temp <= locEndPos))
ANDI	R3, R7, 65535
ANDI	R2, R8, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition507
NOP	
J	L__UpdatePBPosition357
NOP	
L__UpdatePBPosition507:
ANDI	R3, R5, 65535
ANDI	R2, R4, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition508
NOP	
J	L__UpdatePBPosition356
NOP	
L__UpdatePBPosition508:
ANDI	R3, R5, 65535
ANDI	R2, R8, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition509
NOP	
J	L__UpdatePBPosition355
NOP	
L__UpdatePBPosition509:
ANDI	R3, R4, 65535
ANDI	R2, R7, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition510
NOP	
J	L__UpdatePBPosition354
NOP	
L__UpdatePBPosition510:
; locStartPos end address is: 20 (R5)
; _temp end address is: 16 (R4)
L__UpdatePBPosition343:
;FirmwareIHM_v1_0_driver.c,4763 :: 		Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
SW	R6, 16(SP)
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ANDI	R27, R8, 65535
; _tempII end address is: 32 (R8)
ANDI	R26, R7, 65535
; locEndPos end address is: 28 (R7)
JAL	_Update_Sector+0
NOP	
LW	R25, 20(SP)
LW	R6, 16(SP)
J	L_UpdatePBPosition118
NOP	
;FirmwareIHM_v1_0_driver.c,4762 :: 		else if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (_temp <= locEndPos))
L__UpdatePBPosition357:
; _tempII start address is: 32 (R8)
; _temp start address is: 16 (R4)
; locStartPos start address is: 20 (R5)
; locEndPos start address is: 28 (R7)
L__UpdatePBPosition356:
L__UpdatePBPosition355:
L__UpdatePBPosition354:
;FirmwareIHM_v1_0_driver.c,4764 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos))
ANDI	R3, R8, 65535
ANDI	R2, R7, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition511
NOP	
J	L__UpdatePBPosition361
NOP	
L__UpdatePBPosition511:
ANDI	R3, R4, 65535
ANDI	R2, R5, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition512
NOP	
J	L__UpdatePBPosition360
NOP	
L__UpdatePBPosition512:
ANDI	R3, R5, 65535
ANDI	R2, R8, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition513
NOP	
J	L__UpdatePBPosition359
NOP	
L__UpdatePBPosition513:
ANDI	R3, R4, 65535
ANDI	R2, R7, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition514
NOP	
J	L__UpdatePBPosition358
NOP	
L__UpdatePBPosition514:
; locEndPos end address is: 28 (R7)
; _tempII end address is: 32 (R8)
L__UpdatePBPosition342:
;FirmwareIHM_v1_0_driver.c,4765 :: 		Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
SW	R6, 16(SP)
SW	R25, 20(SP)
ORI	R28, R0, 1
ANDI	R27, R5, 65535
; locStartPos end address is: 20 (R5)
ANDI	R26, R4, 65535
; _temp end address is: 16 (R4)
JAL	_Update_Sector+0
NOP	
LW	R25, 20(SP)
LW	R6, 16(SP)
J	L_UpdatePBPosition122
NOP	
;FirmwareIHM_v1_0_driver.c,4764 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos))
L__UpdatePBPosition361:
; _tempII start address is: 32 (R8)
; _temp start address is: 16 (R4)
; locStartPos start address is: 20 (R5)
; locEndPos start address is: 28 (R7)
L__UpdatePBPosition360:
L__UpdatePBPosition359:
L__UpdatePBPosition358:
;FirmwareIHM_v1_0_driver.c,4766 :: 		else if ((locEndPos <= _tempII) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos)) {
ANDI	R3, R7, 65535
ANDI	R2, R8, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition515
NOP	
J	L__UpdatePBPosition365
NOP	
L__UpdatePBPosition515:
ANDI	R3, R4, 65535
ANDI	R2, R5, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition516
NOP	
J	L__UpdatePBPosition364
NOP	
L__UpdatePBPosition516:
ANDI	R3, R5, 65535
ANDI	R2, R8, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition517
NOP	
J	L__UpdatePBPosition363
NOP	
L__UpdatePBPosition517:
ANDI	R3, R4, 65535
ANDI	R2, R7, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__UpdatePBPosition518
NOP	
J	L__UpdatePBPosition362
NOP	
L__UpdatePBPosition518:
L__UpdatePBPosition341:
;FirmwareIHM_v1_0_driver.c,4767 :: 		Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
SH	R8, 16(SP)
SH	R7, 18(SP)
SW	R6, 20(SP)
SW	R25, 24(SP)
ORI	R28, R0, 1
ANDI	R27, R5, 65535
; locStartPos end address is: 20 (R5)
ANDI	R26, R4, 65535
; _temp end address is: 16 (R4)
JAL	_Update_Sector+0
NOP	
LW	R25, 24(SP)
LW	R6, 20(SP)
LHU	R7, 18(SP)
LHU	R8, 16(SP)
;FirmwareIHM_v1_0_driver.c,4768 :: 		Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
SW	R6, 16(SP)
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ANDI	R27, R8, 65535
; _tempII end address is: 32 (R8)
ANDI	R26, R7, 65535
; locEndPos end address is: 28 (R7)
JAL	_Update_Sector+0
NOP	
LW	R25, 20(SP)
LW	R6, 16(SP)
;FirmwareIHM_v1_0_driver.c,4766 :: 		else if ((locEndPos <= _tempII) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos)) {
L__UpdatePBPosition365:
L__UpdatePBPosition364:
L__UpdatePBPosition363:
L__UpdatePBPosition362:
;FirmwareIHM_v1_0_driver.c,4769 :: 		}
L_UpdatePBPosition122:
L_UpdatePBPosition118:
L_UpdatePBPosition114:
L_UpdatePBPosition110:
;FirmwareIHM_v1_0_driver.c,4772 :: 		Update_Percentage(AProgressBar, locPosition);
SW	R25, 16(SP)
; locPosition end address is: 24 (R6)
MOVZ	R26, R6, R0
JAL	_Update_Percentage+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4773 :: 		AProgressBar->Prev_Position = AProgressBar->Position;
ADDIU	R3, R25, 46
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
SH	R2, 0(R3)
;FirmwareIHM_v1_0_driver.c,4774 :: 		}
L_UpdatePBPosition100:
;FirmwareIHM_v1_0_driver.c,4775 :: 		}
L_end_UpdatePBPosition:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _UpdatePBPosition
_DrawProgressBar:
;FirmwareIHM_v1_0_driver.c,4777 :: 		void DrawProgressBar(TProgressBar *AProgressBar) {
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4778 :: 		unsigned long locPosition = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
;FirmwareIHM_v1_0_driver.c,4779 :: 		int move_offset = 0;
;FirmwareIHM_v1_0_driver.c,4780 :: 		unsigned cnt = 0;
;FirmwareIHM_v1_0_driver.c,4781 :: 		unsigned int tmpWidth = 0;
;FirmwareIHM_v1_0_driver.c,4782 :: 		unsigned int tmpRound = 0;
;FirmwareIHM_v1_0_driver.c,4785 :: 		move_offset = 10;
ORI	R2, R0, 10
SH	R2, 28(SP)
;FirmwareIHM_v1_0_driver.c,4786 :: 		_tmpI = AProgressBar->Position - AProgressBar->Min;
ADDIU	R2, R25, 44
LHU	R3, 0(R2)
ADDIU	R2, R25, 40
LHU	R4, 0(R2)
SUBU	R3, R3, R4
;FirmwareIHM_v1_0_driver.c,4787 :: 		_tmpII = AProgressBar->Max - AProgressBar->Min;
ADDIU	R2, R25, 42
LHU	R2, 0(R2)
SUBU	R4, R2, R4
;FirmwareIHM_v1_0_driver.c,4788 :: 		locPosition = (unsigned long)_tmpI * 100 / _tmpII;
ANDI	R3, R3, 65535
ORI	R2, R0, 100
MULTU	R3, R2
MFLO	R3
ANDI	R2, R4, 65535
DIVU	R3, R2
MFLO	R2
SW	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4789 :: 		if (AProgressBar->Visible != 0) {
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawProgressBar521
NOP	
J	L_DrawProgressBar126
NOP	
L__DrawProgressBar521:
;FirmwareIHM_v1_0_driver.c,4790 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
ADDIU	R2, R25, 38
LHU	R3, 0(R2)
ADDIU	R2, R25, 19
LBU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4791 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4793 :: 		if (AProgressBar->Rounded != 0) {
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawProgressBar523
NOP	
J	L_DrawProgressBar127
NOP	
L__DrawProgressBar523:
;FirmwareIHM_v1_0_driver.c,4794 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDIU	R2, R25, 52
LBU	R4, 0(R2)
ANDI	R2, R4, 255
SH	R2, 34(SP)
;FirmwareIHM_v1_0_driver.c,4795 :: 		cnt = move_offset + tmpRound;
LHU	R3, 34(SP)
LH	R2, 28(SP)
ADDU	R2, R2, R3
SH	R2, 30(SP)
;FirmwareIHM_v1_0_driver.c,4796 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ANDI	R2, R4, 255
SLL	R2, R2, 1
SUBU	R2, R3, R2
SH	R2, 32(SP)
;FirmwareIHM_v1_0_driver.c,4797 :: 		} else {
J	L_DrawProgressBar128
NOP	
L_DrawProgressBar127:
;FirmwareIHM_v1_0_driver.c,4798 :: 		tmpRound = 0;
SH	R0, 34(SP)
;FirmwareIHM_v1_0_driver.c,4799 :: 		cnt = move_offset;
LH	R2, 28(SP)
SH	R2, 30(SP)
;FirmwareIHM_v1_0_driver.c,4800 :: 		tmpWidth = AProgressBar->Width;
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
SH	R2, 32(SP)
;FirmwareIHM_v1_0_driver.c,4801 :: 		}
L_DrawProgressBar128:
;FirmwareIHM_v1_0_driver.c,4803 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
ADDIU	R2, R25, 30
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawProgressBar525
NOP	
J	L__DrawProgressBar368
NOP	
L__DrawProgressBar525:
ADDIU	R2, R25, 31
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawProgressBar527
NOP	
J	L__DrawProgressBar367
NOP	
L__DrawProgressBar527:
L__DrawProgressBar366:
;FirmwareIHM_v1_0_driver.c,4805 :: 		0, AProgressBar->Max - AProgressBar->Min);
ADDIU	R2, R25, 42
LHU	R3, 0(R2)
ADDIU	R2, R25, 40
LHU	R2, 0(R2)
SUBU	R4, R3, R2
;FirmwareIHM_v1_0_driver.c,4804 :: 		startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
ADDIU	R2, R25, 34
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LHU	R2, 0(R2)
;FirmwareIHM_v1_0_driver.c,4805 :: 		0, AProgressBar->Max - AProgressBar->Min);
SW	R25, 16(SP)
ANDI	R28, R4, 65535
MOVZ	R27, R0, R0
;FirmwareIHM_v1_0_driver.c,4804 :: 		startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4805 :: 		0, AProgressBar->Max - AProgressBar->Min);
JAL	_GetColorFromGradientRange+0
NOP	
LW	R25, 16(SP)
SH	R2, 20(SP)
;FirmwareIHM_v1_0_driver.c,4807 :: 		AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
ADDIU	R2, R25, 42
LHU	R4, 0(R2)
ADDIU	R2, R25, 40
LHU	R3, 0(R2)
SUBU	R5, R4, R3
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
SUBU	R4, R2, R3
;FirmwareIHM_v1_0_driver.c,4806 :: 		endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
ADDIU	R2, R25, 34
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LHU	R2, 0(R2)
;FirmwareIHM_v1_0_driver.c,4807 :: 		AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
SW	R25, 16(SP)
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
;FirmwareIHM_v1_0_driver.c,4806 :: 		endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
;FirmwareIHM_v1_0_driver.c,4807 :: 		AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
JAL	_GetColorFromGradientRange+0
NOP	
LW	R25, 16(SP)
SH	R2, 22(SP)
;FirmwareIHM_v1_0_driver.c,4808 :: 		} else {
J	L_DrawProgressBar132
NOP	
;FirmwareIHM_v1_0_driver.c,4803 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
L__DrawProgressBar368:
L__DrawProgressBar367:
;FirmwareIHM_v1_0_driver.c,4809 :: 		startcolor = AProgressBar->Gradient_Start_Color;
ADDIU	R2, R25, 32
LHU	R2, 0(R2)
SH	R2, 20(SP)
;FirmwareIHM_v1_0_driver.c,4810 :: 		endcolor   = AProgressBar->Gradient_End_Color;
ADDIU	R2, R25, 34
LHU	R2, 0(R2)
SH	R2, 22(SP)
;FirmwareIHM_v1_0_driver.c,4811 :: 		}
L_DrawProgressBar132:
;FirmwareIHM_v1_0_driver.c,4814 :: 		if (AProgressBar->Rounded != 0)
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawProgressBar529
NOP	
J	L_DrawProgressBar133
NOP	
L__DrawProgressBar529:
;FirmwareIHM_v1_0_driver.c,4816 :: 		AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
ADDIU	R2, R25, 52
LBU	R6, 0(R2)
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
;FirmwareIHM_v1_0_driver.c,4815 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R3, R2
;FirmwareIHM_v1_0_driver.c,4816 :: 		AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
SW	R25, 16(SP)
ANDI	R28, R4, 65535
;FirmwareIHM_v1_0_driver.c,4815 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
;FirmwareIHM_v1_0_driver.c,4816 :: 		AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
ANDI	R2, R6, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
J	L_DrawProgressBar134
NOP	
L_DrawProgressBar133:
;FirmwareIHM_v1_0_driver.c,4819 :: 		AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
;FirmwareIHM_v1_0_driver.c,4818 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R3, R2
;FirmwareIHM_v1_0_driver.c,4819 :: 		AProgressBar->Top + AProgressBar->Height);
SW	R25, 16(SP)
ANDI	R28, R4, 65535
;FirmwareIHM_v1_0_driver.c,4818 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
;FirmwareIHM_v1_0_driver.c,4819 :: 		AProgressBar->Top + AProgressBar->Height);
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
L_DrawProgressBar134:
;FirmwareIHM_v1_0_driver.c,4821 :: 		if (locPosition > 0) {
LW	R2, 24(SP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DrawProgressBar530
NOP	
J	L_DrawProgressBar135
NOP	
L__DrawProgressBar530:
;FirmwareIHM_v1_0_driver.c,4822 :: 		if (AProgressBar->Rounded != 0) {
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__DrawProgressBar532
NOP	
J	L_DrawProgressBar136
NOP	
L__DrawProgressBar532:
;FirmwareIHM_v1_0_driver.c,4824 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
ADDIU	R2, R25, 31
LBU	R5, 0(R2)
;FirmwareIHM_v1_0_driver.c,4823 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
ADDIU	R2, R25, 30
LBU	R4, 0(R2)
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 19
LBU	R2, 0(R2)
;FirmwareIHM_v1_0_driver.c,4824 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
SW	R25, 16(SP)
ANDI	R28, R5, 255
;FirmwareIHM_v1_0_driver.c,4823 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4824 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
LHU	R2, 22(SP)
ADDIU	SP, SP, -4
SH	R2, 2(SP)
LHU	R2, 24(SP)
SH	R2, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4827 :: 		AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R7, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R6, R7, R2
;FirmwareIHM_v1_0_driver.c,4826 :: 		AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100,
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 52
LBU	R5, 0(R2)
ANDI	R2, R5, 255
ADDU	R4, R3, R2
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ANDI	R2, R5, 255
SLL	R2, R2, 1
SUBU	R2, R3, R2
ANDI	R3, R2, 65535
LW	R2, 24(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R2, R4, R2
;FirmwareIHM_v1_0_driver.c,4827 :: 		AProgressBar->Top + AProgressBar->Height);
SW	R25, 16(SP)
ANDI	R28, R6, 65535
;FirmwareIHM_v1_0_driver.c,4826 :: 		AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100,
SEH	R27, R2
;FirmwareIHM_v1_0_driver.c,4825 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,
ANDI	R26, R7, 65535
ANDI	R25, R4, 65535
;FirmwareIHM_v1_0_driver.c,4827 :: 		AProgressBar->Top + AProgressBar->Height);
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4828 :: 		} else {
J	L_DrawProgressBar137
NOP	
L_DrawProgressBar136:
;FirmwareIHM_v1_0_driver.c,4830 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
ADDIU	R2, R25, 31
LBU	R5, 0(R2)
;FirmwareIHM_v1_0_driver.c,4829 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
ADDIU	R2, R25, 30
LBU	R4, 0(R2)
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 19
LBU	R2, 0(R2)
;FirmwareIHM_v1_0_driver.c,4830 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
SW	R25, 16(SP)
ANDI	R28, R5, 255
;FirmwareIHM_v1_0_driver.c,4829 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;FirmwareIHM_v1_0_driver.c,4830 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
LHU	R2, 22(SP)
ADDIU	SP, SP, -4
SH	R2, 2(SP)
LHU	R2, 24(SP)
SH	R2, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4832 :: 		AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R5, R6, R2
;FirmwareIHM_v1_0_driver.c,4831 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LW	R2, 24(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R2, R4, R2
;FirmwareIHM_v1_0_driver.c,4832 :: 		AProgressBar->Top + AProgressBar->Height);
SW	R25, 16(SP)
ANDI	R28, R5, 65535
;FirmwareIHM_v1_0_driver.c,4831 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
SEH	R27, R2
ANDI	R26, R6, 65535
ANDI	R25, R4, 65535
;FirmwareIHM_v1_0_driver.c,4832 :: 		AProgressBar->Top + AProgressBar->Height);
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4833 :: 		}
L_DrawProgressBar137:
;FirmwareIHM_v1_0_driver.c,4835 :: 		if (AProgressBar->Smooth == 0) {
ADDIU	R2, R25, 50
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__DrawProgressBar533
NOP	
J	L_DrawProgressBar138
NOP	
L__DrawProgressBar533:
;FirmwareIHM_v1_0_driver.c,4836 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
ADDIU	R2, R25, 38
LHU	R3, 0(R2)
ADDIU	R2, R25, 19
LBU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4837 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_DrawProgressBar139:
LHU	R3, 34(SP)
LHU	R2, 30(SP)
SUBU	R4, R2, R3
LHU	R3, 32(SP)
LW	R2, 24(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R3
ANDI	R2, R4, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawProgressBar534
NOP	
J	L_DrawProgressBar140
NOP	
L__DrawProgressBar534:
;FirmwareIHM_v1_0_driver.c,4838 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
LHU	R3, 34(SP)
LHU	R2, 30(SP)
SUBU	R2, R2, R3
ADDIU	R4, R2, 3
LW	R3, 24(SP)
LHU	R2, 32(SP)
MULTU	R2, R3
MFLO	R3
ANDI	R2, R4, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__DrawProgressBar535
NOP	
J	L_DrawProgressBar141
NOP	
L__DrawProgressBar535:
;FirmwareIHM_v1_0_driver.c,4839 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R7, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R6, R7, R2
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
LHU	R2, 34(SP)
ADDU	R4, R5, R2
LW	R3, 24(SP)
LHU	R2, 32(SP)
MULTU	R2, R3
MFLO	R2
ADDU	R3, R4, R2
LHU	R2, 30(SP)
ADDU	R2, R5, R2
SW	R25, 16(SP)
ANDI	R28, R6, 65535
SEH	R27, R3
ANDI	R26, R7, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
J	L_DrawProgressBar142
NOP	
L_DrawProgressBar141:
;FirmwareIHM_v1_0_driver.c,4841 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
LHU	R2, 30(SP)
ADDU	R3, R3, R2
ADDIU	R2, R3, 3
SW	R25, 16(SP)
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
L_DrawProgressBar142:
;FirmwareIHM_v1_0_driver.c,4842 :: 		cnt = cnt + move_offset + 3;
LH	R3, 28(SP)
LHU	R2, 30(SP)
ADDU	R2, R2, R3
ADDIU	R2, R2, 3
SH	R2, 30(SP)
;FirmwareIHM_v1_0_driver.c,4843 :: 		}
J	L_DrawProgressBar139
NOP	
L_DrawProgressBar140:
;FirmwareIHM_v1_0_driver.c,4844 :: 		}
L_DrawProgressBar138:
;FirmwareIHM_v1_0_driver.c,4845 :: 		}
L_DrawProgressBar135:
;FirmwareIHM_v1_0_driver.c,4847 :: 		Update_Percentage(AProgressBar, locPosition);
SW	R25, 16(SP)
LW	R26, 24(SP)
JAL	_Update_Percentage+0
NOP	
LW	R25, 16(SP)
;FirmwareIHM_v1_0_driver.c,4848 :: 		AProgressBar->Prev_Position = AProgressBar->Position;
ADDIU	R3, R25, 46
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
SH	R2, 0(R3)
;FirmwareIHM_v1_0_driver.c,4849 :: 		}
L_DrawProgressBar126:
;FirmwareIHM_v1_0_driver.c,4850 :: 		}
L_end_DrawProgressBar:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _DrawProgressBar
_DrawScreen:
;FirmwareIHM_v1_0_driver.c,4852 :: 		void DrawScreen(TScreen *aScreen) {
ADDIU	SP, SP, -108
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,4876 :: 		object_pressed = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
SB	R0, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,4877 :: 		order = 0;
SH	R0, 24(SP)
;FirmwareIHM_v1_0_driver.c,4878 :: 		round_button_idx = 0;
SB	R0, 26(SP)
;FirmwareIHM_v1_0_driver.c,4879 :: 		round_cbutton_idx = 0;
SB	R0, 32(SP)
;FirmwareIHM_v1_0_driver.c,4880 :: 		label_idx = 0;
SB	R0, 40(SP)
;FirmwareIHM_v1_0_driver.c,4881 :: 		clabel_idx = 0;
SB	R0, 48(SP)
;FirmwareIHM_v1_0_driver.c,4882 :: 		cbox_idx = 0;
SB	R0, 56(SP)
;FirmwareIHM_v1_0_driver.c,4883 :: 		round_box_idx = 0;
SB	R0, 64(SP)
;FirmwareIHM_v1_0_driver.c,4884 :: 		line_idx = 0;
SB	R0, 72(SP)
;FirmwareIHM_v1_0_driver.c,4885 :: 		cline_idx = 0;
SB	R0, 80(SP)
;FirmwareIHM_v1_0_driver.c,4886 :: 		checkbox_idx = 0;
SB	R0, 88(SP)
;FirmwareIHM_v1_0_driver.c,4887 :: 		progress_bar_idx = 0;
SB	R0, 96(SP)
;FirmwareIHM_v1_0_driver.c,4888 :: 		CurrentScreen = aScreen;
SW	R25, Offset(_CurrentScreen+0)(GP)
;FirmwareIHM_v1_0_driver.c,4890 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, Offset(_display_width+0)(GP)
BEQ	R2, R3, L__DrawScreen537
NOP	
J	L__DrawScreen371
NOP	
L__DrawScreen537:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, Offset(_display_height+0)(GP)
BEQ	R2, R3, L__DrawScreen538
NOP	
J	L__DrawScreen370
NOP	
L__DrawScreen538:
J	L_DrawScreen145
NOP	
L__DrawScreen371:
L__DrawScreen370:
;FirmwareIHM_v1_0_driver.c,4891 :: 		save_bled = TFT_BLED;
_LX	
EXT	R2, R2, BitPos(LATD2_bit+0), 1
SB	R2, 104(SP)
;FirmwareIHM_v1_0_driver.c,4892 :: 		save_bled_direction = TFT_BLED_Direction;
_LX	
EXT	R2, R2, BitPos(TRISD2_bit+0), 1
SB	R2, 105(SP)
;FirmwareIHM_v1_0_driver.c,4893 :: 		TFT_BLED_Direction = 0;
LUI	R2, BitMask(TRISD2_bit+0)
ORI	R2, R2, BitMask(TRISD2_bit+0)
_SX	
;FirmwareIHM_v1_0_driver.c,4894 :: 		TFT_BLED           = 0;
LUI	R2, BitMask(LATD2_bit+0)
ORI	R2, R2, BitMask(LATD2_bit+0)
_SX	
;FirmwareIHM_v1_0_driver.c,4895 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
LUI	R27, hi_addr(_Write_Data+0)
ORI	R27, R27, lo_addr(_Write_Data+0)
LUI	R26, hi_addr(_Write_Command+0)
ORI	R26, R26, lo_addr(_Write_Command+0)
LUI	R25, hi_addr(_Set_Index+0)
ORI	R25, R25, lo_addr(_Set_Index+0)
JAL	_TFT_Set_Active+0
NOP	
;FirmwareIHM_v1_0_driver.c,4896 :: 		TFT_Init_ILI9341_8bit(CurrentScreen->Width, CurrentScreen->Height);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Init_ILI9341_8bit+0
NOP	
;FirmwareIHM_v1_0_driver.c,4897 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 13, 12);                                  // Initialize touch panel
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ORI	R28, R0, 12
ORI	R27, R0, 13
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TP_TFT_Init+0
NOP	
;FirmwareIHM_v1_0_driver.c,4898 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
ORI	R25, R0, 900
JAL	_TP_TFT_Set_ADC_Threshold+0
NOP	
;FirmwareIHM_v1_0_driver.c,4899 :: 		TFT_Fill_Screen(CurrentScreen->Color);
LW	R2, Offset(_CurrentScreen+0)(GP)
LHU	R25, 0(R2)
JAL	_TFT_Fill_Screen+0
NOP	
;FirmwareIHM_v1_0_driver.c,4900 :: 		display_width = CurrentScreen->Width;
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
SH	R2, Offset(_display_width+0)(GP)
;FirmwareIHM_v1_0_driver.c,4901 :: 		display_height = CurrentScreen->Height;
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
SH	R2, Offset(_display_height+0)(GP)
;FirmwareIHM_v1_0_driver.c,4902 :: 		TFT_BLED           = save_bled;
LBU	R3, 104(SP)
_LX	
INS	R2, R3, BitPos(LATD2_bit+0), 1
_SX	
;FirmwareIHM_v1_0_driver.c,4903 :: 		TFT_BLED_Direction = save_bled_direction;
LBU	R3, 105(SP)
_LX	
INS	R2, R3, BitPos(TRISD2_bit+0), 1
_SX	
;FirmwareIHM_v1_0_driver.c,4904 :: 		}
J	L_DrawScreen146
NOP	
L_DrawScreen145:
;FirmwareIHM_v1_0_driver.c,4906 :: 		TFT_Fill_Screen(CurrentScreen->Color);
LW	R2, Offset(_CurrentScreen+0)(GP)
LHU	R25, 0(R2)
JAL	_TFT_Fill_Screen+0
NOP	
L_DrawScreen146:
;FirmwareIHM_v1_0_driver.c,4909 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen147:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, 24(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen539
NOP	
J	L_DrawScreen148
NOP	
L__DrawScreen539:
;FirmwareIHM_v1_0_driver.c,4910 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 26(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen540
NOP	
J	L_DrawScreen149
NOP	
L__DrawScreen540:
;FirmwareIHM_v1_0_driver.c,4911 :: 		local_round_button = GetRoundButton(round_button_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 12
LW	R3, 0(R2)
LBU	R2, 26(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 28(SP)
;FirmwareIHM_v1_0_driver.c,4912 :: 		if (order == local_round_button->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen541
NOP	
J	L_DrawScreen150
NOP	
L__DrawScreen541:
;FirmwareIHM_v1_0_driver.c,4913 :: 		round_button_idx++;
LBU	R2, 26(SP)
ADDIU	R2, R2, 1
SB	R2, 26(SP)
;FirmwareIHM_v1_0_driver.c,4914 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4915 :: 		DrawRoundButton(local_round_button);
SW	R25, 20(SP)
LW	R25, 28(SP)
JAL	_DrawRoundButton+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4916 :: 		}
L_DrawScreen150:
;FirmwareIHM_v1_0_driver.c,4917 :: 		}
L_DrawScreen149:
;FirmwareIHM_v1_0_driver.c,4919 :: 		if (round_cbutton_idx < CurrentScreen->CButtons_RoundCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 16
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 32(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen542
NOP	
J	L_DrawScreen151
NOP	
L__DrawScreen542:
;FirmwareIHM_v1_0_driver.c,4920 :: 		local_round_cbutton = GetCRoundButton(round_cbutton_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 20
LW	R3, 0(R2)
LBU	R2, 32(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 36(SP)
;FirmwareIHM_v1_0_driver.c,4921 :: 		if (order == local_round_cbutton->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen543
NOP	
J	L_DrawScreen152
NOP	
L__DrawScreen543:
;FirmwareIHM_v1_0_driver.c,4922 :: 		round_cbutton_idx++;
LBU	R2, 32(SP)
ADDIU	R2, R2, 1
SB	R2, 32(SP)
;FirmwareIHM_v1_0_driver.c,4923 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4924 :: 		DrawCRoundButton(local_round_cbutton);
SW	R25, 20(SP)
LW	R25, 36(SP)
JAL	_DrawCRoundButton+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4925 :: 		}
L_DrawScreen152:
;FirmwareIHM_v1_0_driver.c,4926 :: 		}
L_DrawScreen151:
;FirmwareIHM_v1_0_driver.c,4928 :: 		if (label_idx < CurrentScreen->LabelsCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 24
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 40(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen544
NOP	
J	L_DrawScreen153
NOP	
L__DrawScreen544:
;FirmwareIHM_v1_0_driver.c,4929 :: 		local_label = GetLabel(label_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 28
LW	R3, 0(R2)
LBU	R2, 40(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 44(SP)
;FirmwareIHM_v1_0_driver.c,4930 :: 		if (order == local_label->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen545
NOP	
J	L_DrawScreen154
NOP	
L__DrawScreen545:
;FirmwareIHM_v1_0_driver.c,4931 :: 		label_idx++;
LBU	R2, 40(SP)
ADDIU	R2, R2, 1
SB	R2, 40(SP)
;FirmwareIHM_v1_0_driver.c,4932 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4933 :: 		DrawLabel(local_label);
SW	R25, 20(SP)
LW	R25, 44(SP)
JAL	_DrawLabel+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4934 :: 		}
L_DrawScreen154:
;FirmwareIHM_v1_0_driver.c,4935 :: 		}
L_DrawScreen153:
;FirmwareIHM_v1_0_driver.c,4937 :: 		if (clabel_idx < CurrentScreen->CLabelsCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 32
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 48(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen546
NOP	
J	L_DrawScreen155
NOP	
L__DrawScreen546:
;FirmwareIHM_v1_0_driver.c,4938 :: 		local_clabel = GetCLabel(clabel_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 36
LW	R3, 0(R2)
LBU	R2, 48(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 52(SP)
;FirmwareIHM_v1_0_driver.c,4939 :: 		if (order == local_clabel->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen547
NOP	
J	L_DrawScreen156
NOP	
L__DrawScreen547:
;FirmwareIHM_v1_0_driver.c,4940 :: 		clabel_idx++;
LBU	R2, 48(SP)
ADDIU	R2, R2, 1
SB	R2, 48(SP)
;FirmwareIHM_v1_0_driver.c,4941 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4942 :: 		DrawCLabel(local_clabel);
SW	R25, 20(SP)
LW	R25, 52(SP)
JAL	_DrawCLabel+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4943 :: 		}
L_DrawScreen156:
;FirmwareIHM_v1_0_driver.c,4944 :: 		}
L_DrawScreen155:
;FirmwareIHM_v1_0_driver.c,4946 :: 		if (cbox_idx < CurrentScreen->CBoxesCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 40
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 56(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen548
NOP	
J	L_DrawScreen157
NOP	
L__DrawScreen548:
;FirmwareIHM_v1_0_driver.c,4947 :: 		local_cbox = GetCBox(cbox_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 44
LW	R3, 0(R2)
LBU	R2, 56(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 60(SP)
;FirmwareIHM_v1_0_driver.c,4948 :: 		if (order == local_cbox->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen549
NOP	
J	L_DrawScreen158
NOP	
L__DrawScreen549:
;FirmwareIHM_v1_0_driver.c,4949 :: 		cbox_idx++;
LBU	R2, 56(SP)
ADDIU	R2, R2, 1
SB	R2, 56(SP)
;FirmwareIHM_v1_0_driver.c,4950 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4951 :: 		DrawCBox(local_cbox);
SW	R25, 20(SP)
LW	R25, 60(SP)
JAL	_DrawCBox+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4952 :: 		}
L_DrawScreen158:
;FirmwareIHM_v1_0_driver.c,4953 :: 		}
L_DrawScreen157:
;FirmwareIHM_v1_0_driver.c,4955 :: 		if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 48
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 64(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen550
NOP	
J	L_DrawScreen159
NOP	
L__DrawScreen550:
;FirmwareIHM_v1_0_driver.c,4956 :: 		local_round_box = GetBox_Round(round_box_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 52
LW	R3, 0(R2)
LBU	R2, 64(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 68(SP)
;FirmwareIHM_v1_0_driver.c,4957 :: 		if (order == local_round_box->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen551
NOP	
J	L_DrawScreen160
NOP	
L__DrawScreen551:
;FirmwareIHM_v1_0_driver.c,4958 :: 		round_box_idx++;
LBU	R2, 64(SP)
ADDIU	R2, R2, 1
SB	R2, 64(SP)
;FirmwareIHM_v1_0_driver.c,4959 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4960 :: 		DrawRoundBox(local_round_box);
SW	R25, 20(SP)
LW	R25, 68(SP)
JAL	_DrawRoundBox+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4961 :: 		}
L_DrawScreen160:
;FirmwareIHM_v1_0_driver.c,4962 :: 		}
L_DrawScreen159:
;FirmwareIHM_v1_0_driver.c,4964 :: 		if (line_idx < CurrentScreen->LinesCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 56
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 72(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen552
NOP	
J	L_DrawScreen161
NOP	
L__DrawScreen552:
;FirmwareIHM_v1_0_driver.c,4965 :: 		local_line = GetLine(line_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 60
LW	R3, 0(R2)
LBU	R2, 72(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 76(SP)
;FirmwareIHM_v1_0_driver.c,4966 :: 		if (order == local_line->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen553
NOP	
J	L_DrawScreen162
NOP	
L__DrawScreen553:
;FirmwareIHM_v1_0_driver.c,4967 :: 		line_idx++;
LBU	R2, 72(SP)
ADDIU	R2, R2, 1
SB	R2, 72(SP)
;FirmwareIHM_v1_0_driver.c,4968 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4969 :: 		DrawLine(local_line);
SW	R25, 20(SP)
LW	R25, 76(SP)
JAL	_DrawLine+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4970 :: 		}
L_DrawScreen162:
;FirmwareIHM_v1_0_driver.c,4971 :: 		}
L_DrawScreen161:
;FirmwareIHM_v1_0_driver.c,4973 :: 		if (cline_idx < CurrentScreen->CLinesCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 64
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 80(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen554
NOP	
J	L_DrawScreen163
NOP	
L__DrawScreen554:
;FirmwareIHM_v1_0_driver.c,4974 :: 		local_cline = GetCLine(cline_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 68
LW	R3, 0(R2)
LBU	R2, 80(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 84(SP)
;FirmwareIHM_v1_0_driver.c,4975 :: 		if (order == local_cline->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen555
NOP	
J	L_DrawScreen164
NOP	
L__DrawScreen555:
;FirmwareIHM_v1_0_driver.c,4976 :: 		cline_idx++;
LBU	R2, 80(SP)
ADDIU	R2, R2, 1
SB	R2, 80(SP)
;FirmwareIHM_v1_0_driver.c,4977 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4978 :: 		DrawCLine(local_cline);
SW	R25, 20(SP)
LW	R25, 84(SP)
JAL	_DrawCLine+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4979 :: 		}
L_DrawScreen164:
;FirmwareIHM_v1_0_driver.c,4980 :: 		}
L_DrawScreen163:
;FirmwareIHM_v1_0_driver.c,4982 :: 		if (checkbox_idx < CurrentScreen->CheckBoxesCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 72
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 88(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen556
NOP	
J	L_DrawScreen165
NOP	
L__DrawScreen556:
;FirmwareIHM_v1_0_driver.c,4983 :: 		local_checkbox = GetCheckBox(checkbox_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 76
LW	R3, 0(R2)
LBU	R2, 88(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 92(SP)
;FirmwareIHM_v1_0_driver.c,4984 :: 		if (order == local_checkbox->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen557
NOP	
J	L_DrawScreen166
NOP	
L__DrawScreen557:
;FirmwareIHM_v1_0_driver.c,4985 :: 		checkbox_idx++;
LBU	R2, 88(SP)
ADDIU	R2, R2, 1
SB	R2, 88(SP)
;FirmwareIHM_v1_0_driver.c,4986 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4987 :: 		DrawCheckBox(local_checkbox);
SW	R25, 20(SP)
LW	R25, 92(SP)
JAL	_DrawCheckBox+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4988 :: 		}
L_DrawScreen166:
;FirmwareIHM_v1_0_driver.c,4989 :: 		}
L_DrawScreen165:
;FirmwareIHM_v1_0_driver.c,4991 :: 		if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 80
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 96(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen558
NOP	
J	L_DrawScreen167
NOP	
L__DrawScreen558:
;FirmwareIHM_v1_0_driver.c,4992 :: 		local_progress_bar = GetProgressBar(progress_bar_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 84
LW	R3, 0(R2)
LBU	R2, 96(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 100(SP)
;FirmwareIHM_v1_0_driver.c,4993 :: 		if (order == local_progress_bar->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LHU	R2, 24(SP)
BEQ	R2, R3, L__DrawScreen559
NOP	
J	L_DrawScreen168
NOP	
L__DrawScreen559:
;FirmwareIHM_v1_0_driver.c,4994 :: 		progress_bar_idx++;
LBU	R2, 96(SP)
ADDIU	R2, R2, 1
SB	R2, 96(SP)
;FirmwareIHM_v1_0_driver.c,4995 :: 		order++;
LHU	R2, 24(SP)
ADDIU	R2, R2, 1
SH	R2, 24(SP)
;FirmwareIHM_v1_0_driver.c,4996 :: 		DrawProgressBar(local_progress_bar);
SW	R25, 20(SP)
LW	R25, 100(SP)
JAL	_DrawProgressBar+0
NOP	
LW	R25, 20(SP)
;FirmwareIHM_v1_0_driver.c,4997 :: 		}
L_DrawScreen168:
;FirmwareIHM_v1_0_driver.c,4998 :: 		}
L_DrawScreen167:
;FirmwareIHM_v1_0_driver.c,5000 :: 		}
J	L_DrawScreen147
NOP	
L_DrawScreen148:
;FirmwareIHM_v1_0_driver.c,5001 :: 		}
L_end_DrawScreen:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 108
JR	RA
NOP	
; end of _DrawScreen
_Get_Object:
;FirmwareIHM_v1_0_driver.c,5003 :: 		void Get_Object(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,5004 :: 		round_button_order  = -1;
SW	R27, 4(SP)
SW	R28, 8(SP)
ORI	R2, R0, 65535
SH	R2, Offset(_round_button_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5005 :: 		round_cbutton_order = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_round_cbutton_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5006 :: 		label_order         = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_label_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5007 :: 		clabel_order        = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_clabel_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5008 :: 		cbox_order          = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_cbox_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5009 :: 		box_round_order     = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_box_round_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5010 :: 		checkbox_order      = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_checkbox_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5012 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object169:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object561
NOP	
J	L_Get_Object170
NOP	
L__Get_Object561:
;FirmwareIHM_v1_0_driver.c,5013 :: 		local_round_button = GetRoundButton(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 12
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_round_button+0)(GP)
;FirmwareIHM_v1_0_driver.c,5014 :: 		if (local_round_button->Active != 0) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Get_Object563
NOP	
J	L_Get_Object172
NOP	
L__Get_Object563:
;FirmwareIHM_v1_0_driver.c,5016 :: 		local_round_button->Width, local_round_button->Height) == 1) {
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;FirmwareIHM_v1_0_driver.c,5015 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,5016 :: 		local_round_button->Width, local_round_button->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	FirmwareIHM_v1_0_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object564
NOP	
J	L_Get_Object173
NOP	
L__Get_Object564:
;FirmwareIHM_v1_0_driver.c,5017 :: 		round_button_order = local_round_button->Order;
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_round_button_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5018 :: 		exec_round_button = local_round_button;
LW	R2, Offset(_local_round_button+0)(GP)
SW	R2, Offset(_exec_round_button+0)(GP)
;FirmwareIHM_v1_0_driver.c,5019 :: 		}
L_Get_Object173:
;FirmwareIHM_v1_0_driver.c,5020 :: 		}
L_Get_Object172:
;FirmwareIHM_v1_0_driver.c,5012 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5021 :: 		}
J	L_Get_Object169
NOP	
L_Get_Object170:
;FirmwareIHM_v1_0_driver.c,5024 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CButtons_RoundCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object174:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 16
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object565
NOP	
J	L_Get_Object175
NOP	
L__Get_Object565:
;FirmwareIHM_v1_0_driver.c,5025 :: 		local_round_cbutton = GetCRoundButton(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 20
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_round_cbutton+0)(GP)
;FirmwareIHM_v1_0_driver.c,5026 :: 		if (local_round_cbutton->Active != 0) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Get_Object567
NOP	
J	L_Get_Object177
NOP	
L__Get_Object567:
;FirmwareIHM_v1_0_driver.c,5028 :: 		local_round_cbutton->Width, local_round_cbutton->Height) == 1) {
LW	R2, Offset(_local_round_cbutton+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_round_cbutton+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;FirmwareIHM_v1_0_driver.c,5027 :: 		if (IsInsideObject(X, Y, local_round_cbutton->Left, local_round_cbutton->Top,
LW	R2, Offset(_local_round_cbutton+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_round_cbutton+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,5028 :: 		local_round_cbutton->Width, local_round_cbutton->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	FirmwareIHM_v1_0_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object568
NOP	
J	L_Get_Object178
NOP	
L__Get_Object568:
;FirmwareIHM_v1_0_driver.c,5029 :: 		round_cbutton_order = local_round_cbutton->Order;
LW	R2, Offset(_local_round_cbutton+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_round_cbutton_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5030 :: 		exec_round_cbutton = local_round_cbutton;
LW	R2, Offset(_local_round_cbutton+0)(GP)
SW	R2, Offset(_exec_round_cbutton+0)(GP)
;FirmwareIHM_v1_0_driver.c,5031 :: 		}
L_Get_Object178:
;FirmwareIHM_v1_0_driver.c,5032 :: 		}
L_Get_Object177:
;FirmwareIHM_v1_0_driver.c,5024 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CButtons_RoundCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5033 :: 		}
J	L_Get_Object174
NOP	
L_Get_Object175:
;FirmwareIHM_v1_0_driver.c,5036 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object179:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 24
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object569
NOP	
J	L_Get_Object180
NOP	
L__Get_Object569:
;FirmwareIHM_v1_0_driver.c,5037 :: 		local_label = GetLabel(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 28
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_label+0)(GP)
;FirmwareIHM_v1_0_driver.c,5038 :: 		if (local_label->Active != 0) {
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Get_Object571
NOP	
J	L_Get_Object182
NOP	
L__Get_Object571:
;FirmwareIHM_v1_0_driver.c,5040 :: 		local_label->Width, local_label->Height) == 1) {
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;FirmwareIHM_v1_0_driver.c,5039 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,5040 :: 		local_label->Width, local_label->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	FirmwareIHM_v1_0_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object572
NOP	
J	L_Get_Object183
NOP	
L__Get_Object572:
;FirmwareIHM_v1_0_driver.c,5041 :: 		label_order = local_label->Order;
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_label_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5042 :: 		exec_label = local_label;
LW	R2, Offset(_local_label+0)(GP)
SW	R2, Offset(_exec_label+0)(GP)
;FirmwareIHM_v1_0_driver.c,5043 :: 		}
L_Get_Object183:
;FirmwareIHM_v1_0_driver.c,5044 :: 		}
L_Get_Object182:
;FirmwareIHM_v1_0_driver.c,5036 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5045 :: 		}
J	L_Get_Object179
NOP	
L_Get_Object180:
;FirmwareIHM_v1_0_driver.c,5048 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object184:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 32
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object573
NOP	
J	L_Get_Object185
NOP	
L__Get_Object573:
;FirmwareIHM_v1_0_driver.c,5049 :: 		local_clabel = GetCLabel(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 36
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_clabel+0)(GP)
;FirmwareIHM_v1_0_driver.c,5050 :: 		if (local_clabel->Active != 0) {
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Get_Object575
NOP	
J	L_Get_Object187
NOP	
L__Get_Object575:
;FirmwareIHM_v1_0_driver.c,5052 :: 		local_clabel->Width, local_clabel->Height) == 1) {
LW	R2, Offset(_local_clabel+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_clabel+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;FirmwareIHM_v1_0_driver.c,5051 :: 		if (IsInsideObject(X, Y, local_clabel->Left, local_clabel->Top,
LW	R2, Offset(_local_clabel+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_clabel+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,5052 :: 		local_clabel->Width, local_clabel->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	FirmwareIHM_v1_0_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object576
NOP	
J	L_Get_Object188
NOP	
L__Get_Object576:
;FirmwareIHM_v1_0_driver.c,5053 :: 		clabel_order = local_clabel->Order;
LW	R2, Offset(_local_clabel+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_clabel_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5054 :: 		exec_clabel = local_clabel;
LW	R2, Offset(_local_clabel+0)(GP)
SW	R2, Offset(_exec_clabel+0)(GP)
;FirmwareIHM_v1_0_driver.c,5055 :: 		}
L_Get_Object188:
;FirmwareIHM_v1_0_driver.c,5056 :: 		}
L_Get_Object187:
;FirmwareIHM_v1_0_driver.c,5048 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5057 :: 		}
J	L_Get_Object184
NOP	
L_Get_Object185:
;FirmwareIHM_v1_0_driver.c,5060 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object189:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 40
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object577
NOP	
J	L_Get_Object190
NOP	
L__Get_Object577:
;FirmwareIHM_v1_0_driver.c,5061 :: 		local_cbox = GetCBox(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 44
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_cbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5062 :: 		if (local_cbox->Active != 0) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Get_Object579
NOP	
J	L_Get_Object192
NOP	
L__Get_Object579:
;FirmwareIHM_v1_0_driver.c,5064 :: 		local_cbox->Width, local_cbox->Height) == 1) {
LW	R2, Offset(_local_cbox+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_cbox+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;FirmwareIHM_v1_0_driver.c,5063 :: 		if (IsInsideObject(X, Y, local_cbox->Left, local_cbox->Top,
LW	R2, Offset(_local_cbox+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_cbox+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,5064 :: 		local_cbox->Width, local_cbox->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	FirmwareIHM_v1_0_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object580
NOP	
J	L_Get_Object193
NOP	
L__Get_Object580:
;FirmwareIHM_v1_0_driver.c,5065 :: 		cbox_order = local_cbox->Order;
LW	R2, Offset(_local_cbox+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_cbox_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5066 :: 		exec_cbox = local_cbox;
LW	R2, Offset(_local_cbox+0)(GP)
SW	R2, Offset(_exec_cbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5067 :: 		}
L_Get_Object193:
;FirmwareIHM_v1_0_driver.c,5068 :: 		}
L_Get_Object192:
;FirmwareIHM_v1_0_driver.c,5060 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5069 :: 		}
J	L_Get_Object189
NOP	
L_Get_Object190:
;FirmwareIHM_v1_0_driver.c,5072 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object194:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 48
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object581
NOP	
J	L_Get_Object195
NOP	
L__Get_Object581:
;FirmwareIHM_v1_0_driver.c,5073 :: 		local_round_box = GetBox_Round(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 52
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_round_box+0)(GP)
;FirmwareIHM_v1_0_driver.c,5074 :: 		if (local_round_box->Active != 0) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Get_Object583
NOP	
J	L_Get_Object197
NOP	
L__Get_Object583:
;FirmwareIHM_v1_0_driver.c,5076 :: 		local_round_box->Width, local_round_box->Height) == 1) {
LW	R2, Offset(_local_round_box+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_round_box+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;FirmwareIHM_v1_0_driver.c,5075 :: 		if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
LW	R2, Offset(_local_round_box+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_round_box+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,5076 :: 		local_round_box->Width, local_round_box->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	FirmwareIHM_v1_0_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object584
NOP	
J	L_Get_Object198
NOP	
L__Get_Object584:
;FirmwareIHM_v1_0_driver.c,5077 :: 		box_round_order = local_round_box->Order;
LW	R2, Offset(_local_round_box+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_box_round_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5078 :: 		exec_round_box = local_round_box;
LW	R2, Offset(_local_round_box+0)(GP)
SW	R2, Offset(_exec_round_box+0)(GP)
;FirmwareIHM_v1_0_driver.c,5079 :: 		}
L_Get_Object198:
;FirmwareIHM_v1_0_driver.c,5080 :: 		}
L_Get_Object197:
;FirmwareIHM_v1_0_driver.c,5072 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5081 :: 		}
J	L_Get_Object194
NOP	
L_Get_Object195:
;FirmwareIHM_v1_0_driver.c,5084 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CheckBoxesCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object199:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 72
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object585
NOP	
J	L_Get_Object200
NOP	
L__Get_Object585:
;FirmwareIHM_v1_0_driver.c,5085 :: 		local_checkbox = GetCheckBox(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 76
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_checkbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5086 :: 		if (local_checkbox->Active != 0) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Get_Object587
NOP	
J	L_Get_Object202
NOP	
L__Get_Object587:
;FirmwareIHM_v1_0_driver.c,5088 :: 		local_checkbox->Width, local_checkbox->Height) == 1) {
LW	R2, Offset(_local_checkbox+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_checkbox+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;FirmwareIHM_v1_0_driver.c,5087 :: 		if (IsInsideObject(X, Y, local_checkbox->Left, local_checkbox->Top,
LW	R2, Offset(_local_checkbox+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_checkbox+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;FirmwareIHM_v1_0_driver.c,5088 :: 		local_checkbox->Width, local_checkbox->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	FirmwareIHM_v1_0_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object588
NOP	
J	L_Get_Object203
NOP	
L__Get_Object588:
;FirmwareIHM_v1_0_driver.c,5089 :: 		checkbox_order = local_checkbox->Order;
LW	R2, Offset(_local_checkbox+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_checkbox_order+0)(GP)
;FirmwareIHM_v1_0_driver.c,5090 :: 		exec_checkbox = local_checkbox;
LW	R2, Offset(_local_checkbox+0)(GP)
SW	R2, Offset(_exec_checkbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5091 :: 		}
L_Get_Object203:
;FirmwareIHM_v1_0_driver.c,5092 :: 		}
L_Get_Object202:
;FirmwareIHM_v1_0_driver.c,5084 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CheckBoxesCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5093 :: 		}
J	L_Get_Object199
NOP	
L_Get_Object200:
;FirmwareIHM_v1_0_driver.c,5095 :: 		_object_count = -1;
ORI	R2, R0, 65535
SH	R2, Offset(__object_count+0)(GP)
;FirmwareIHM_v1_0_driver.c,5096 :: 		if (round_button_order >  _object_count )
LH	R2, Offset(_round_button_order+0)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Get_Object589
NOP	
J	L_Get_Object204
NOP	
L__Get_Object589:
;FirmwareIHM_v1_0_driver.c,5097 :: 		_object_count = round_button_order;
LH	R2, Offset(_round_button_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object204:
;FirmwareIHM_v1_0_driver.c,5098 :: 		if (round_cbutton_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_round_cbutton_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object590
NOP	
J	L_Get_Object205
NOP	
L__Get_Object590:
;FirmwareIHM_v1_0_driver.c,5099 :: 		_object_count = round_cbutton_order;
LH	R2, Offset(_round_cbutton_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object205:
;FirmwareIHM_v1_0_driver.c,5100 :: 		if (label_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_label_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object591
NOP	
J	L_Get_Object206
NOP	
L__Get_Object591:
;FirmwareIHM_v1_0_driver.c,5101 :: 		_object_count = label_order;
LH	R2, Offset(_label_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object206:
;FirmwareIHM_v1_0_driver.c,5102 :: 		if (clabel_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_clabel_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object592
NOP	
J	L_Get_Object207
NOP	
L__Get_Object592:
;FirmwareIHM_v1_0_driver.c,5103 :: 		_object_count = clabel_order;
LH	R2, Offset(_clabel_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object207:
;FirmwareIHM_v1_0_driver.c,5104 :: 		if (cbox_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_cbox_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object593
NOP	
J	L_Get_Object208
NOP	
L__Get_Object593:
;FirmwareIHM_v1_0_driver.c,5105 :: 		_object_count = cbox_order;
LH	R2, Offset(_cbox_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object208:
;FirmwareIHM_v1_0_driver.c,5106 :: 		if (box_round_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_box_round_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object594
NOP	
J	L_Get_Object209
NOP	
L__Get_Object594:
;FirmwareIHM_v1_0_driver.c,5107 :: 		_object_count = box_round_order;
LH	R2, Offset(_box_round_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object209:
;FirmwareIHM_v1_0_driver.c,5108 :: 		if (checkbox_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_checkbox_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object595
NOP	
J	L_Get_Object210
NOP	
L__Get_Object595:
;FirmwareIHM_v1_0_driver.c,5109 :: 		_object_count = checkbox_order;
LH	R2, Offset(_checkbox_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object210:
;FirmwareIHM_v1_0_driver.c,5110 :: 		}
L_end_Get_Object:
LW	R28, 8(SP)
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Get_Object
_Process_TP_Press:
;FirmwareIHM_v1_0_driver.c,5113 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,5114 :: 		exec_round_button   = 0;
SW	R0, Offset(_exec_round_button+0)(GP)
;FirmwareIHM_v1_0_driver.c,5115 :: 		exec_round_cbutton  = 0;
SW	R0, Offset(_exec_round_cbutton+0)(GP)
;FirmwareIHM_v1_0_driver.c,5116 :: 		exec_label          = 0;
SW	R0, Offset(_exec_label+0)(GP)
;FirmwareIHM_v1_0_driver.c,5117 :: 		exec_clabel         = 0;
SW	R0, Offset(_exec_clabel+0)(GP)
;FirmwareIHM_v1_0_driver.c,5118 :: 		exec_cbox           = 0;
SW	R0, Offset(_exec_cbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5119 :: 		exec_round_box      = 0;
SW	R0, Offset(_exec_round_box+0)(GP)
;FirmwareIHM_v1_0_driver.c,5120 :: 		exec_checkbox       = 0;
SW	R0, Offset(_exec_checkbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5122 :: 		Get_Object(X, Y);
JAL	_Get_Object+0
NOP	
;FirmwareIHM_v1_0_driver.c,5124 :: 		if (_object_count != -1) {
LH	R3, Offset(__object_count+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Process_TP_Press598
NOP	
J	L_Process_TP_Press211
NOP	
L__Process_TP_Press598:
;FirmwareIHM_v1_0_driver.c,5125 :: 		if (_object_count == round_button_order) {
LH	R3, Offset(_round_button_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Press599
NOP	
J	L_Process_TP_Press212
NOP	
L__Process_TP_Press599:
;FirmwareIHM_v1_0_driver.c,5126 :: 		if (exec_round_button->Active != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Press601
NOP	
J	L_Process_TP_Press213
NOP	
L__Process_TP_Press601:
;FirmwareIHM_v1_0_driver.c,5127 :: 		if (exec_round_button->OnPressPtr != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Press603
NOP	
J	L_Process_TP_Press214
NOP	
L__Process_TP_Press603:
;FirmwareIHM_v1_0_driver.c,5128 :: 		exec_round_button->OnPressPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5129 :: 		return;
J	L_end_Process_TP_Press
NOP	
;FirmwareIHM_v1_0_driver.c,5130 :: 		}
L_Process_TP_Press214:
;FirmwareIHM_v1_0_driver.c,5131 :: 		}
L_Process_TP_Press213:
;FirmwareIHM_v1_0_driver.c,5132 :: 		}
L_Process_TP_Press212:
;FirmwareIHM_v1_0_driver.c,5134 :: 		if (_object_count == round_cbutton_order) {
LH	R3, Offset(_round_cbutton_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Press604
NOP	
J	L_Process_TP_Press215
NOP	
L__Process_TP_Press604:
;FirmwareIHM_v1_0_driver.c,5135 :: 		if (exec_round_cbutton->Active != 0) {
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Press606
NOP	
J	L_Process_TP_Press216
NOP	
L__Process_TP_Press606:
;FirmwareIHM_v1_0_driver.c,5136 :: 		if (exec_round_cbutton->OnPressPtr != 0) {
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Press608
NOP	
J	L_Process_TP_Press217
NOP	
L__Process_TP_Press608:
;FirmwareIHM_v1_0_driver.c,5137 :: 		exec_round_cbutton->OnPressPtr();
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5138 :: 		return;
J	L_end_Process_TP_Press
NOP	
;FirmwareIHM_v1_0_driver.c,5139 :: 		}
L_Process_TP_Press217:
;FirmwareIHM_v1_0_driver.c,5140 :: 		}
L_Process_TP_Press216:
;FirmwareIHM_v1_0_driver.c,5141 :: 		}
L_Process_TP_Press215:
;FirmwareIHM_v1_0_driver.c,5143 :: 		if (_object_count == label_order) {
LH	R3, Offset(_label_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Press609
NOP	
J	L_Process_TP_Press218
NOP	
L__Process_TP_Press609:
;FirmwareIHM_v1_0_driver.c,5144 :: 		if (exec_label->Active != 0) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Press611
NOP	
J	L_Process_TP_Press219
NOP	
L__Process_TP_Press611:
;FirmwareIHM_v1_0_driver.c,5145 :: 		if (exec_label->OnPressPtr != 0) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Press613
NOP	
J	L_Process_TP_Press220
NOP	
L__Process_TP_Press613:
;FirmwareIHM_v1_0_driver.c,5146 :: 		exec_label->OnPressPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5147 :: 		return;
J	L_end_Process_TP_Press
NOP	
;FirmwareIHM_v1_0_driver.c,5148 :: 		}
L_Process_TP_Press220:
;FirmwareIHM_v1_0_driver.c,5149 :: 		}
L_Process_TP_Press219:
;FirmwareIHM_v1_0_driver.c,5150 :: 		}
L_Process_TP_Press218:
;FirmwareIHM_v1_0_driver.c,5152 :: 		if (_object_count == clabel_order) {
LH	R3, Offset(_clabel_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Press614
NOP	
J	L_Process_TP_Press221
NOP	
L__Process_TP_Press614:
;FirmwareIHM_v1_0_driver.c,5153 :: 		if (exec_clabel->Active != 0) {
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Press616
NOP	
J	L_Process_TP_Press222
NOP	
L__Process_TP_Press616:
;FirmwareIHM_v1_0_driver.c,5154 :: 		if (exec_clabel->OnPressPtr != 0) {
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Press618
NOP	
J	L_Process_TP_Press223
NOP	
L__Process_TP_Press618:
;FirmwareIHM_v1_0_driver.c,5155 :: 		exec_clabel->OnPressPtr();
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5156 :: 		return;
J	L_end_Process_TP_Press
NOP	
;FirmwareIHM_v1_0_driver.c,5157 :: 		}
L_Process_TP_Press223:
;FirmwareIHM_v1_0_driver.c,5158 :: 		}
L_Process_TP_Press222:
;FirmwareIHM_v1_0_driver.c,5159 :: 		}
L_Process_TP_Press221:
;FirmwareIHM_v1_0_driver.c,5161 :: 		if (_object_count == cbox_order) {
LH	R3, Offset(_cbox_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Press619
NOP	
J	L_Process_TP_Press224
NOP	
L__Process_TP_Press619:
;FirmwareIHM_v1_0_driver.c,5162 :: 		if (exec_cbox->Active != 0) {
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Press621
NOP	
J	L_Process_TP_Press225
NOP	
L__Process_TP_Press621:
;FirmwareIHM_v1_0_driver.c,5163 :: 		if (exec_cbox->OnPressPtr != 0) {
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Press623
NOP	
J	L_Process_TP_Press226
NOP	
L__Process_TP_Press623:
;FirmwareIHM_v1_0_driver.c,5164 :: 		exec_cbox->OnPressPtr();
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 48
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5165 :: 		return;
J	L_end_Process_TP_Press
NOP	
;FirmwareIHM_v1_0_driver.c,5166 :: 		}
L_Process_TP_Press226:
;FirmwareIHM_v1_0_driver.c,5167 :: 		}
L_Process_TP_Press225:
;FirmwareIHM_v1_0_driver.c,5168 :: 		}
L_Process_TP_Press224:
;FirmwareIHM_v1_0_driver.c,5170 :: 		if (_object_count == box_round_order) {
LH	R3, Offset(_box_round_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Press624
NOP	
J	L_Process_TP_Press227
NOP	
L__Process_TP_Press624:
;FirmwareIHM_v1_0_driver.c,5171 :: 		if (exec_round_box->Active != 0) {
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Press626
NOP	
J	L_Process_TP_Press228
NOP	
L__Process_TP_Press626:
;FirmwareIHM_v1_0_driver.c,5172 :: 		if (exec_round_box->OnPressPtr != 0) {
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Press628
NOP	
J	L_Process_TP_Press229
NOP	
L__Process_TP_Press628:
;FirmwareIHM_v1_0_driver.c,5173 :: 		exec_round_box->OnPressPtr();
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 48
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5174 :: 		return;
J	L_end_Process_TP_Press
NOP	
;FirmwareIHM_v1_0_driver.c,5175 :: 		}
L_Process_TP_Press229:
;FirmwareIHM_v1_0_driver.c,5176 :: 		}
L_Process_TP_Press228:
;FirmwareIHM_v1_0_driver.c,5177 :: 		}
L_Process_TP_Press227:
;FirmwareIHM_v1_0_driver.c,5179 :: 		if (_object_count == checkbox_order) {
LH	R3, Offset(_checkbox_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Press629
NOP	
J	L_Process_TP_Press230
NOP	
L__Process_TP_Press629:
;FirmwareIHM_v1_0_driver.c,5180 :: 		if (exec_checkbox->Active != 0) {
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Press631
NOP	
J	L_Process_TP_Press231
NOP	
L__Process_TP_Press631:
;FirmwareIHM_v1_0_driver.c,5181 :: 		if (exec_checkbox->OnPressPtr != 0) {
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Press633
NOP	
J	L_Process_TP_Press232
NOP	
L__Process_TP_Press633:
;FirmwareIHM_v1_0_driver.c,5182 :: 		exec_checkbox->OnPressPtr();
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5183 :: 		return;
J	L_end_Process_TP_Press
NOP	
;FirmwareIHM_v1_0_driver.c,5184 :: 		}
L_Process_TP_Press232:
;FirmwareIHM_v1_0_driver.c,5185 :: 		}
L_Process_TP_Press231:
;FirmwareIHM_v1_0_driver.c,5186 :: 		}
L_Process_TP_Press230:
;FirmwareIHM_v1_0_driver.c,5188 :: 		}
L_Process_TP_Press211:
;FirmwareIHM_v1_0_driver.c,5189 :: 		}
L_end_Process_TP_Press:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Process_TP_Press
_Process_TP_Up:
;FirmwareIHM_v1_0_driver.c,5191 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,5193 :: 		switch (PressedObjectType) {
SW	R25, 4(SP)
J	L_Process_TP_Up233
NOP	
;FirmwareIHM_v1_0_driver.c,5195 :: 		case 1: {
L_Process_TP_Up235:
;FirmwareIHM_v1_0_driver.c,5196 :: 		if (PressedObject != 0) {
LW	R2, Offset(_PressedObject+0)(GP)
BNE	R2, R0, L__Process_TP_Up636
NOP	
J	L_Process_TP_Up236
NOP	
L__Process_TP_Up636:
;FirmwareIHM_v1_0_driver.c,5197 :: 		exec_round_button = (TButton_Round*)PressedObject;
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
SW	R2, Offset(_exec_round_button+0)(GP)
;FirmwareIHM_v1_0_driver.c,5198 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
ADDIU	R2, R2, 49
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up638
NOP	
J	L__Process_TP_Up377
NOP	
L__Process_TP_Up638:
LW	R2, Offset(_exec_round_button+0)(GP)
LW	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
BEQ	R3, R2, L__Process_TP_Up639
NOP	
J	L__Process_TP_Up376
NOP	
L__Process_TP_Up639:
L__Process_TP_Up375:
;FirmwareIHM_v1_0_driver.c,5199 :: 		DrawRoundButton(exec_round_button);
SH	R26, 8(SP)
SH	R25, 10(SP)
LW	R25, Offset(_exec_round_button+0)(GP)
JAL	_DrawRoundButton+0
NOP	
LHU	R25, 10(SP)
LHU	R26, 8(SP)
;FirmwareIHM_v1_0_driver.c,5198 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up377:
L__Process_TP_Up376:
;FirmwareIHM_v1_0_driver.c,5201 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5202 :: 		}
L_Process_TP_Up236:
;FirmwareIHM_v1_0_driver.c,5203 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5206 :: 		case 9: {
L_Process_TP_Up240:
;FirmwareIHM_v1_0_driver.c,5207 :: 		if (PressedObject != 0) {
LW	R2, Offset(_PressedObject+0)(GP)
BNE	R2, R0, L__Process_TP_Up641
NOP	
J	L_Process_TP_Up241
NOP	
L__Process_TP_Up641:
;FirmwareIHM_v1_0_driver.c,5208 :: 		exec_round_cbutton = (TCButton_Round*)PressedObject;
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
SW	R2, Offset(_exec_round_cbutton+0)(GP)
;FirmwareIHM_v1_0_driver.c,5209 :: 		if ((exec_round_cbutton->PressColEnabled != 0) && (exec_round_cbutton->OwnerScreen == CurrentScreen)) {
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
ADDIU	R2, R2, 49
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up643
NOP	
J	L__Process_TP_Up379
NOP	
L__Process_TP_Up643:
LW	R2, Offset(_exec_round_cbutton+0)(GP)
LW	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
BEQ	R3, R2, L__Process_TP_Up644
NOP	
J	L__Process_TP_Up378
NOP	
L__Process_TP_Up644:
L__Process_TP_Up374:
;FirmwareIHM_v1_0_driver.c,5210 :: 		DrawCRoundButton(exec_round_cbutton);
SH	R26, 8(SP)
SH	R25, 10(SP)
LW	R25, Offset(_exec_round_cbutton+0)(GP)
JAL	_DrawCRoundButton+0
NOP	
LHU	R25, 10(SP)
LHU	R26, 8(SP)
;FirmwareIHM_v1_0_driver.c,5209 :: 		if ((exec_round_cbutton->PressColEnabled != 0) && (exec_round_cbutton->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up379:
L__Process_TP_Up378:
;FirmwareIHM_v1_0_driver.c,5212 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5213 :: 		}
L_Process_TP_Up241:
;FirmwareIHM_v1_0_driver.c,5214 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5217 :: 		case 14: {
L_Process_TP_Up245:
;FirmwareIHM_v1_0_driver.c,5218 :: 		if (PressedObject != 0) {
LW	R2, Offset(_PressedObject+0)(GP)
BNE	R2, R0, L__Process_TP_Up646
NOP	
J	L_Process_TP_Up246
NOP	
L__Process_TP_Up646:
;FirmwareIHM_v1_0_driver.c,5219 :: 		exec_cbox = (TCBox*)PressedObject;
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
SW	R2, Offset(_exec_cbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5220 :: 		if ((exec_cbox->PressColEnabled != 0) && (exec_cbox->OwnerScreen == CurrentScreen)) {
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
ADDIU	R2, R2, 30
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up648
NOP	
J	L__Process_TP_Up381
NOP	
L__Process_TP_Up648:
LW	R2, Offset(_exec_cbox+0)(GP)
LW	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
BEQ	R3, R2, L__Process_TP_Up649
NOP	
J	L__Process_TP_Up380
NOP	
L__Process_TP_Up649:
L__Process_TP_Up373:
;FirmwareIHM_v1_0_driver.c,5221 :: 		DrawCBox(exec_cbox);
SH	R26, 8(SP)
SH	R25, 10(SP)
LW	R25, Offset(_exec_cbox+0)(GP)
JAL	_DrawCBox+0
NOP	
LHU	R25, 10(SP)
LHU	R26, 8(SP)
;FirmwareIHM_v1_0_driver.c,5220 :: 		if ((exec_cbox->PressColEnabled != 0) && (exec_cbox->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up381:
L__Process_TP_Up380:
;FirmwareIHM_v1_0_driver.c,5223 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5224 :: 		}
L_Process_TP_Up246:
;FirmwareIHM_v1_0_driver.c,5225 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5228 :: 		case 7: {
L_Process_TP_Up250:
;FirmwareIHM_v1_0_driver.c,5229 :: 		if (PressedObject != 0) {
LW	R2, Offset(_PressedObject+0)(GP)
BNE	R2, R0, L__Process_TP_Up651
NOP	
J	L_Process_TP_Up251
NOP	
L__Process_TP_Up651:
;FirmwareIHM_v1_0_driver.c,5230 :: 		exec_round_box = (TBox_Round*)PressedObject;
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
SW	R2, Offset(_exec_round_box+0)(GP)
;FirmwareIHM_v1_0_driver.c,5231 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
ADDIU	R2, R2, 31
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up653
NOP	
J	L__Process_TP_Up383
NOP	
L__Process_TP_Up653:
LW	R2, Offset(_exec_round_box+0)(GP)
LW	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
BEQ	R3, R2, L__Process_TP_Up654
NOP	
J	L__Process_TP_Up382
NOP	
L__Process_TP_Up654:
L__Process_TP_Up372:
;FirmwareIHM_v1_0_driver.c,5232 :: 		DrawRoundBox(exec_round_box);
SH	R26, 8(SP)
SH	R25, 10(SP)
LW	R25, Offset(_exec_round_box+0)(GP)
JAL	_DrawRoundBox+0
NOP	
LHU	R25, 10(SP)
LHU	R26, 8(SP)
;FirmwareIHM_v1_0_driver.c,5231 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up383:
L__Process_TP_Up382:
;FirmwareIHM_v1_0_driver.c,5234 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5235 :: 		}
L_Process_TP_Up251:
;FirmwareIHM_v1_0_driver.c,5236 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5239 :: 		case 16: {
L_Process_TP_Up255:
;FirmwareIHM_v1_0_driver.c,5240 :: 		if (PressedObject != 0) {
LW	R2, Offset(_PressedObject+0)(GP)
BNE	R2, R0, L__Process_TP_Up656
NOP	
J	L_Process_TP_Up256
NOP	
L__Process_TP_Up656:
;FirmwareIHM_v1_0_driver.c,5241 :: 		exec_checkbox = (TCheckBox*)PressedObject;
LWR	R2, Offset(_PressedObject+0)(GP)
LWL	R2, Offset(_PressedObject+3)(GP)
SW	R2, Offset(_exec_checkbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5242 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5243 :: 		}
L_Process_TP_Up256:
;FirmwareIHM_v1_0_driver.c,5244 :: 		break;
J	L_Process_TP_Up234
NOP	
;FirmwareIHM_v1_0_driver.c,5246 :: 		}
L_Process_TP_Up233:
LH	R3, Offset(_PressedObjectType+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Process_TP_Up658
NOP	
J	L_Process_TP_Up235
NOP	
L__Process_TP_Up658:
LH	R3, Offset(_PressedObjectType+0)(GP)
ORI	R2, R0, 9
BNE	R3, R2, L__Process_TP_Up660
NOP	
J	L_Process_TP_Up240
NOP	
L__Process_TP_Up660:
LH	R3, Offset(_PressedObjectType+0)(GP)
ORI	R2, R0, 14
BNE	R3, R2, L__Process_TP_Up662
NOP	
J	L_Process_TP_Up245
NOP	
L__Process_TP_Up662:
LH	R3, Offset(_PressedObjectType+0)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__Process_TP_Up664
NOP	
J	L_Process_TP_Up250
NOP	
L__Process_TP_Up664:
LH	R3, Offset(_PressedObjectType+0)(GP)
ORI	R2, R0, 16
BNE	R3, R2, L__Process_TP_Up666
NOP	
J	L_Process_TP_Up255
NOP	
L__Process_TP_Up666:
L_Process_TP_Up234:
;FirmwareIHM_v1_0_driver.c,5248 :: 		exec_label          = 0;
SW	R0, Offset(_exec_label+0)(GP)
;FirmwareIHM_v1_0_driver.c,5249 :: 		exec_clabel          = 0;
SW	R0, Offset(_exec_clabel+0)(GP)
;FirmwareIHM_v1_0_driver.c,5251 :: 		Get_Object(X, Y);
JAL	_Get_Object+0
NOP	
;FirmwareIHM_v1_0_driver.c,5254 :: 		if (_object_count != -1) {
LH	R3, Offset(__object_count+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Process_TP_Up668
NOP	
J	L_Process_TP_Up257
NOP	
L__Process_TP_Up668:
;FirmwareIHM_v1_0_driver.c,5256 :: 		if (_object_count == round_button_order) {
LH	R3, Offset(_round_button_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Up669
NOP	
J	L_Process_TP_Up258
NOP	
L__Process_TP_Up669:
;FirmwareIHM_v1_0_driver.c,5257 :: 		if (exec_round_button->Active != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up671
NOP	
J	L_Process_TP_Up259
NOP	
L__Process_TP_Up671:
;FirmwareIHM_v1_0_driver.c,5258 :: 		if (exec_round_button->OnUpPtr != 0)
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up673
NOP	
J	L_Process_TP_Up260
NOP	
L__Process_TP_Up673:
;FirmwareIHM_v1_0_driver.c,5259 :: 		exec_round_button->OnUpPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up260:
;FirmwareIHM_v1_0_driver.c,5260 :: 		if (PressedObject == (TPointer)exec_round_button)
LWR	R3, Offset(_exec_round_button+0)(GP)
LWL	R3, Offset(_exec_round_button+3)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L__Process_TP_Up674
NOP	
J	L_Process_TP_Up261
NOP	
L__Process_TP_Up674:
;FirmwareIHM_v1_0_driver.c,5261 :: 		if (exec_round_button->OnClickPtr != 0)
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up676
NOP	
J	L_Process_TP_Up262
NOP	
L__Process_TP_Up676:
;FirmwareIHM_v1_0_driver.c,5262 :: 		exec_round_button->OnClickPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up262:
L_Process_TP_Up261:
;FirmwareIHM_v1_0_driver.c,5263 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5264 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5265 :: 		return;
J	L_end_Process_TP_Up
NOP	
;FirmwareIHM_v1_0_driver.c,5266 :: 		}
L_Process_TP_Up259:
;FirmwareIHM_v1_0_driver.c,5267 :: 		}
L_Process_TP_Up258:
;FirmwareIHM_v1_0_driver.c,5270 :: 		if (_object_count == round_cbutton_order) {
LH	R3, Offset(_round_cbutton_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Up677
NOP	
J	L_Process_TP_Up263
NOP	
L__Process_TP_Up677:
;FirmwareIHM_v1_0_driver.c,5271 :: 		if (exec_round_cbutton->Active != 0) {
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up679
NOP	
J	L_Process_TP_Up264
NOP	
L__Process_TP_Up679:
;FirmwareIHM_v1_0_driver.c,5272 :: 		if (exec_round_cbutton->OnUpPtr != 0)
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up681
NOP	
J	L_Process_TP_Up265
NOP	
L__Process_TP_Up681:
;FirmwareIHM_v1_0_driver.c,5273 :: 		exec_round_cbutton->OnUpPtr();
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up265:
;FirmwareIHM_v1_0_driver.c,5274 :: 		if (PressedObject == (TPointer)exec_round_cbutton)
LWR	R3, Offset(_exec_round_cbutton+0)(GP)
LWL	R3, Offset(_exec_round_cbutton+3)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L__Process_TP_Up682
NOP	
J	L_Process_TP_Up266
NOP	
L__Process_TP_Up682:
;FirmwareIHM_v1_0_driver.c,5275 :: 		if (exec_round_cbutton->OnClickPtr != 0)
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up684
NOP	
J	L_Process_TP_Up267
NOP	
L__Process_TP_Up684:
;FirmwareIHM_v1_0_driver.c,5276 :: 		exec_round_cbutton->OnClickPtr();
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up267:
L_Process_TP_Up266:
;FirmwareIHM_v1_0_driver.c,5277 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5278 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5279 :: 		return;
J	L_end_Process_TP_Up
NOP	
;FirmwareIHM_v1_0_driver.c,5280 :: 		}
L_Process_TP_Up264:
;FirmwareIHM_v1_0_driver.c,5281 :: 		}
L_Process_TP_Up263:
;FirmwareIHM_v1_0_driver.c,5284 :: 		if (_object_count == label_order) {
LH	R3, Offset(_label_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Up685
NOP	
J	L_Process_TP_Up268
NOP	
L__Process_TP_Up685:
;FirmwareIHM_v1_0_driver.c,5285 :: 		if (exec_label->Active != 0) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up687
NOP	
J	L_Process_TP_Up269
NOP	
L__Process_TP_Up687:
;FirmwareIHM_v1_0_driver.c,5286 :: 		if (exec_label->OnUpPtr != 0)
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 32
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up689
NOP	
J	L_Process_TP_Up270
NOP	
L__Process_TP_Up689:
;FirmwareIHM_v1_0_driver.c,5287 :: 		exec_label->OnUpPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 32
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up270:
;FirmwareIHM_v1_0_driver.c,5288 :: 		if (PressedObject == (TPointer)exec_label)
LWR	R3, Offset(_exec_label+0)(GP)
LWL	R3, Offset(_exec_label+3)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L__Process_TP_Up690
NOP	
J	L_Process_TP_Up271
NOP	
L__Process_TP_Up690:
;FirmwareIHM_v1_0_driver.c,5289 :: 		if (exec_label->OnClickPtr != 0)
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up692
NOP	
J	L_Process_TP_Up272
NOP	
L__Process_TP_Up692:
;FirmwareIHM_v1_0_driver.c,5290 :: 		exec_label->OnClickPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up272:
L_Process_TP_Up271:
;FirmwareIHM_v1_0_driver.c,5291 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5292 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5293 :: 		return;
J	L_end_Process_TP_Up
NOP	
;FirmwareIHM_v1_0_driver.c,5294 :: 		}
L_Process_TP_Up269:
;FirmwareIHM_v1_0_driver.c,5295 :: 		}
L_Process_TP_Up268:
;FirmwareIHM_v1_0_driver.c,5298 :: 		if (_object_count == clabel_order) {
LH	R3, Offset(_clabel_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Up693
NOP	
J	L_Process_TP_Up273
NOP	
L__Process_TP_Up693:
;FirmwareIHM_v1_0_driver.c,5299 :: 		if (exec_clabel->Active != 0) {
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up695
NOP	
J	L_Process_TP_Up274
NOP	
L__Process_TP_Up695:
;FirmwareIHM_v1_0_driver.c,5300 :: 		if (exec_clabel->OnUpPtr != 0)
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 32
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up697
NOP	
J	L_Process_TP_Up275
NOP	
L__Process_TP_Up697:
;FirmwareIHM_v1_0_driver.c,5301 :: 		exec_clabel->OnUpPtr();
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 32
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up275:
;FirmwareIHM_v1_0_driver.c,5302 :: 		if (PressedObject == (TPointer)exec_clabel)
LWR	R3, Offset(_exec_clabel+0)(GP)
LWL	R3, Offset(_exec_clabel+3)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L__Process_TP_Up698
NOP	
J	L_Process_TP_Up276
NOP	
L__Process_TP_Up698:
;FirmwareIHM_v1_0_driver.c,5303 :: 		if (exec_clabel->OnClickPtr != 0)
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up700
NOP	
J	L_Process_TP_Up277
NOP	
L__Process_TP_Up700:
;FirmwareIHM_v1_0_driver.c,5304 :: 		exec_clabel->OnClickPtr();
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up277:
L_Process_TP_Up276:
;FirmwareIHM_v1_0_driver.c,5305 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5306 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5307 :: 		return;
J	L_end_Process_TP_Up
NOP	
;FirmwareIHM_v1_0_driver.c,5308 :: 		}
L_Process_TP_Up274:
;FirmwareIHM_v1_0_driver.c,5309 :: 		}
L_Process_TP_Up273:
;FirmwareIHM_v1_0_driver.c,5312 :: 		if (_object_count == cbox_order) {
LH	R3, Offset(_cbox_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Up701
NOP	
J	L_Process_TP_Up278
NOP	
L__Process_TP_Up701:
;FirmwareIHM_v1_0_driver.c,5313 :: 		if (exec_cbox->Active != 0) {
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up703
NOP	
J	L_Process_TP_Up279
NOP	
L__Process_TP_Up703:
;FirmwareIHM_v1_0_driver.c,5314 :: 		if (exec_cbox->OnUpPtr != 0)
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up705
NOP	
J	L_Process_TP_Up280
NOP	
L__Process_TP_Up705:
;FirmwareIHM_v1_0_driver.c,5315 :: 		exec_cbox->OnUpPtr();
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up280:
;FirmwareIHM_v1_0_driver.c,5316 :: 		if (PressedObject == (TPointer)exec_cbox)
LWR	R3, Offset(_exec_cbox+0)(GP)
LWL	R3, Offset(_exec_cbox+3)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L__Process_TP_Up706
NOP	
J	L_Process_TP_Up281
NOP	
L__Process_TP_Up706:
;FirmwareIHM_v1_0_driver.c,5317 :: 		if (exec_cbox->OnClickPtr != 0)
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up708
NOP	
J	L_Process_TP_Up282
NOP	
L__Process_TP_Up708:
;FirmwareIHM_v1_0_driver.c,5318 :: 		exec_cbox->OnClickPtr();
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up282:
L_Process_TP_Up281:
;FirmwareIHM_v1_0_driver.c,5319 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5320 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5321 :: 		return;
J	L_end_Process_TP_Up
NOP	
;FirmwareIHM_v1_0_driver.c,5322 :: 		}
L_Process_TP_Up279:
;FirmwareIHM_v1_0_driver.c,5323 :: 		}
L_Process_TP_Up278:
;FirmwareIHM_v1_0_driver.c,5326 :: 		if (_object_count == box_round_order) {
LH	R3, Offset(_box_round_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Up709
NOP	
J	L_Process_TP_Up283
NOP	
L__Process_TP_Up709:
;FirmwareIHM_v1_0_driver.c,5327 :: 		if (exec_round_box->Active != 0) {
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up711
NOP	
J	L_Process_TP_Up284
NOP	
L__Process_TP_Up711:
;FirmwareIHM_v1_0_driver.c,5328 :: 		if (exec_round_box->OnUpPtr != 0)
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up713
NOP	
J	L_Process_TP_Up285
NOP	
L__Process_TP_Up713:
;FirmwareIHM_v1_0_driver.c,5329 :: 		exec_round_box->OnUpPtr();
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up285:
;FirmwareIHM_v1_0_driver.c,5330 :: 		if (PressedObject == (TPointer)exec_round_box)
LWR	R3, Offset(_exec_round_box+0)(GP)
LWL	R3, Offset(_exec_round_box+3)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L__Process_TP_Up714
NOP	
J	L_Process_TP_Up286
NOP	
L__Process_TP_Up714:
;FirmwareIHM_v1_0_driver.c,5331 :: 		if (exec_round_box->OnClickPtr != 0)
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up716
NOP	
J	L_Process_TP_Up287
NOP	
L__Process_TP_Up716:
;FirmwareIHM_v1_0_driver.c,5332 :: 		exec_round_box->OnClickPtr();
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up287:
L_Process_TP_Up286:
;FirmwareIHM_v1_0_driver.c,5333 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5334 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5335 :: 		return;
J	L_end_Process_TP_Up
NOP	
;FirmwareIHM_v1_0_driver.c,5336 :: 		}
L_Process_TP_Up284:
;FirmwareIHM_v1_0_driver.c,5337 :: 		}
L_Process_TP_Up283:
;FirmwareIHM_v1_0_driver.c,5340 :: 		if (_object_count == checkbox_order) {
LH	R3, Offset(_checkbox_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Up717
NOP	
J	L_Process_TP_Up288
NOP	
L__Process_TP_Up717:
;FirmwareIHM_v1_0_driver.c,5341 :: 		if (exec_checkbox->Active != 0) {
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up719
NOP	
J	L_Process_TP_Up289
NOP	
L__Process_TP_Up719:
;FirmwareIHM_v1_0_driver.c,5342 :: 		if (exec_checkbox->OnUpPtr != 0)
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up721
NOP	
J	L_Process_TP_Up290
NOP	
L__Process_TP_Up721:
;FirmwareIHM_v1_0_driver.c,5343 :: 		exec_checkbox->OnUpPtr();
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up290:
;FirmwareIHM_v1_0_driver.c,5344 :: 		if (PressedObject == (TPointer)exec_checkbox) {
LWR	R3, Offset(_exec_checkbox+0)(GP)
LWL	R3, Offset(_exec_checkbox+3)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L__Process_TP_Up722
NOP	
J	L_Process_TP_Up291
NOP	
L__Process_TP_Up722:
;FirmwareIHM_v1_0_driver.c,5345 :: 		if (exec_checkbox->Checked != 0)
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 20
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Up724
NOP	
J	L_Process_TP_Up292
NOP	
L__Process_TP_Up724:
;FirmwareIHM_v1_0_driver.c,5346 :: 		exec_checkbox->Checked = 0;
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 20
SB	R0, 0(R2)
J	L_Process_TP_Up293
NOP	
L_Process_TP_Up292:
;FirmwareIHM_v1_0_driver.c,5348 :: 		exec_checkbox->Checked = 1;
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R3, R2, 20
ORI	R2, R0, 1
SB	R2, 0(R3)
L_Process_TP_Up293:
;FirmwareIHM_v1_0_driver.c,5349 :: 		DrawCheckBox(exec_checkbox);
LW	R25, Offset(_exec_checkbox+0)(GP)
JAL	_DrawCheckBox+0
NOP	
;FirmwareIHM_v1_0_driver.c,5350 :: 		if (exec_checkbox->OnClickPtr != 0)
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Up726
NOP	
J	L_Process_TP_Up294
NOP	
L__Process_TP_Up726:
;FirmwareIHM_v1_0_driver.c,5351 :: 		exec_checkbox->OnClickPtr();
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_Process_TP_Up294:
;FirmwareIHM_v1_0_driver.c,5352 :: 		}
L_Process_TP_Up291:
;FirmwareIHM_v1_0_driver.c,5353 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5354 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5355 :: 		return;
J	L_end_Process_TP_Up
NOP	
;FirmwareIHM_v1_0_driver.c,5356 :: 		}
L_Process_TP_Up289:
;FirmwareIHM_v1_0_driver.c,5357 :: 		}
L_Process_TP_Up288:
;FirmwareIHM_v1_0_driver.c,5359 :: 		}
L_Process_TP_Up257:
;FirmwareIHM_v1_0_driver.c,5360 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5361 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5362 :: 		}
L_end_Process_TP_Up:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Process_TP_Up
_Process_TP_Down:
;FirmwareIHM_v1_0_driver.c,5364 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,5366 :: 		object_pressed      = 0;
SW	R25, 4(SP)
SB	R0, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,5367 :: 		exec_round_button   = 0;
SW	R0, Offset(_exec_round_button+0)(GP)
;FirmwareIHM_v1_0_driver.c,5368 :: 		exec_round_cbutton  = 0;
SW	R0, Offset(_exec_round_cbutton+0)(GP)
;FirmwareIHM_v1_0_driver.c,5369 :: 		exec_label          = 0;
SW	R0, Offset(_exec_label+0)(GP)
;FirmwareIHM_v1_0_driver.c,5370 :: 		exec_clabel         = 0;
SW	R0, Offset(_exec_clabel+0)(GP)
;FirmwareIHM_v1_0_driver.c,5371 :: 		exec_cbox           = 0;
SW	R0, Offset(_exec_cbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5372 :: 		exec_round_box      = 0;
SW	R0, Offset(_exec_round_box+0)(GP)
;FirmwareIHM_v1_0_driver.c,5373 :: 		exec_checkbox       = 0;
SW	R0, Offset(_exec_checkbox+0)(GP)
;FirmwareIHM_v1_0_driver.c,5375 :: 		Get_Object(X, Y);
JAL	_Get_Object+0
NOP	
;FirmwareIHM_v1_0_driver.c,5377 :: 		if (_object_count != -1) {
LH	R3, Offset(__object_count+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L__Process_TP_Down729
NOP	
J	L_Process_TP_Down295
NOP	
L__Process_TP_Down729:
;FirmwareIHM_v1_0_driver.c,5378 :: 		if (_object_count == round_button_order) {
LH	R3, Offset(_round_button_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Down730
NOP	
J	L_Process_TP_Down296
NOP	
L__Process_TP_Down730:
;FirmwareIHM_v1_0_driver.c,5379 :: 		if (exec_round_button->Active != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down732
NOP	
J	L_Process_TP_Down297
NOP	
L__Process_TP_Down732:
;FirmwareIHM_v1_0_driver.c,5380 :: 		if (exec_round_button->PressColEnabled != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 49
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down734
NOP	
J	L_Process_TP_Down298
NOP	
L__Process_TP_Down734:
;FirmwareIHM_v1_0_driver.c,5381 :: 		object_pressed = 1;
ORI	R2, R0, 1
SB	R2, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,5382 :: 		DrawRoundButton(exec_round_button);
LW	R25, Offset(_exec_round_button+0)(GP)
JAL	_DrawRoundButton+0
NOP	
;FirmwareIHM_v1_0_driver.c,5383 :: 		}
L_Process_TP_Down298:
;FirmwareIHM_v1_0_driver.c,5384 :: 		PressedObject = (TPointer)exec_round_button;
LWR	R2, Offset(_exec_round_button+0)(GP)
LWL	R2, Offset(_exec_round_button+3)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5385 :: 		PressedObjectType = 1;
ORI	R2, R0, 1
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5386 :: 		if (exec_round_button->OnDownPtr != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Down736
NOP	
J	L_Process_TP_Down299
NOP	
L__Process_TP_Down736:
;FirmwareIHM_v1_0_driver.c,5387 :: 		exec_round_button->OnDownPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5388 :: 		return;
J	L_end_Process_TP_Down
NOP	
;FirmwareIHM_v1_0_driver.c,5389 :: 		}
L_Process_TP_Down299:
;FirmwareIHM_v1_0_driver.c,5390 :: 		}
L_Process_TP_Down297:
;FirmwareIHM_v1_0_driver.c,5391 :: 		}
L_Process_TP_Down296:
;FirmwareIHM_v1_0_driver.c,5393 :: 		if (_object_count == round_cbutton_order) {
LH	R3, Offset(_round_cbutton_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Down737
NOP	
J	L_Process_TP_Down300
NOP	
L__Process_TP_Down737:
;FirmwareIHM_v1_0_driver.c,5394 :: 		if (exec_round_cbutton->Active != 0) {
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down739
NOP	
J	L_Process_TP_Down301
NOP	
L__Process_TP_Down739:
;FirmwareIHM_v1_0_driver.c,5395 :: 		if (exec_round_cbutton->PressColEnabled != 0) {
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 49
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down741
NOP	
J	L_Process_TP_Down302
NOP	
L__Process_TP_Down741:
;FirmwareIHM_v1_0_driver.c,5396 :: 		object_pressed = 1;
ORI	R2, R0, 1
SB	R2, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,5397 :: 		DrawCRoundButton(exec_round_cbutton);
LW	R25, Offset(_exec_round_cbutton+0)(GP)
JAL	_DrawCRoundButton+0
NOP	
;FirmwareIHM_v1_0_driver.c,5398 :: 		}
L_Process_TP_Down302:
;FirmwareIHM_v1_0_driver.c,5399 :: 		PressedObject = (TPointer)exec_round_cbutton;
LWR	R2, Offset(_exec_round_cbutton+0)(GP)
LWL	R2, Offset(_exec_round_cbutton+3)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5400 :: 		PressedObjectType = 9;
ORI	R2, R0, 9
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5401 :: 		if (exec_round_cbutton->OnDownPtr != 0) {
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Down743
NOP	
J	L_Process_TP_Down303
NOP	
L__Process_TP_Down743:
;FirmwareIHM_v1_0_driver.c,5402 :: 		exec_round_cbutton->OnDownPtr();
LW	R2, Offset(_exec_round_cbutton+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5403 :: 		return;
J	L_end_Process_TP_Down
NOP	
;FirmwareIHM_v1_0_driver.c,5404 :: 		}
L_Process_TP_Down303:
;FirmwareIHM_v1_0_driver.c,5405 :: 		}
L_Process_TP_Down301:
;FirmwareIHM_v1_0_driver.c,5406 :: 		}
L_Process_TP_Down300:
;FirmwareIHM_v1_0_driver.c,5408 :: 		if (_object_count == label_order) {
LH	R3, Offset(_label_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Down744
NOP	
J	L_Process_TP_Down304
NOP	
L__Process_TP_Down744:
;FirmwareIHM_v1_0_driver.c,5409 :: 		if (exec_label->Active != 0) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down746
NOP	
J	L_Process_TP_Down305
NOP	
L__Process_TP_Down746:
;FirmwareIHM_v1_0_driver.c,5410 :: 		PressedObject = (TPointer)exec_label;
LWR	R2, Offset(_exec_label+0)(GP)
LWL	R2, Offset(_exec_label+3)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5411 :: 		PressedObjectType = 2;
ORI	R2, R0, 2
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5412 :: 		if (exec_label->OnDownPtr != 0) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Down748
NOP	
J	L_Process_TP_Down306
NOP	
L__Process_TP_Down748:
;FirmwareIHM_v1_0_driver.c,5413 :: 		exec_label->OnDownPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5414 :: 		return;
J	L_end_Process_TP_Down
NOP	
;FirmwareIHM_v1_0_driver.c,5415 :: 		}
L_Process_TP_Down306:
;FirmwareIHM_v1_0_driver.c,5416 :: 		}
L_Process_TP_Down305:
;FirmwareIHM_v1_0_driver.c,5417 :: 		}
L_Process_TP_Down304:
;FirmwareIHM_v1_0_driver.c,5419 :: 		if (_object_count == clabel_order) {
LH	R3, Offset(_clabel_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Down749
NOP	
J	L_Process_TP_Down307
NOP	
L__Process_TP_Down749:
;FirmwareIHM_v1_0_driver.c,5420 :: 		if (exec_clabel->Active != 0) {
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down751
NOP	
J	L_Process_TP_Down308
NOP	
L__Process_TP_Down751:
;FirmwareIHM_v1_0_driver.c,5421 :: 		PressedObject = (TPointer)exec_clabel;
LWR	R2, Offset(_exec_clabel+0)(GP)
LWL	R2, Offset(_exec_clabel+3)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5422 :: 		PressedObjectType = 10;
ORI	R2, R0, 10
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5423 :: 		if (exec_clabel->OnDownPtr != 0) {
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Down753
NOP	
J	L_Process_TP_Down309
NOP	
L__Process_TP_Down753:
;FirmwareIHM_v1_0_driver.c,5424 :: 		exec_clabel->OnDownPtr();
LW	R2, Offset(_exec_clabel+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5425 :: 		return;
J	L_end_Process_TP_Down
NOP	
;FirmwareIHM_v1_0_driver.c,5426 :: 		}
L_Process_TP_Down309:
;FirmwareIHM_v1_0_driver.c,5427 :: 		}
L_Process_TP_Down308:
;FirmwareIHM_v1_0_driver.c,5428 :: 		}
L_Process_TP_Down307:
;FirmwareIHM_v1_0_driver.c,5430 :: 		if (_object_count == cbox_order) {
LH	R3, Offset(_cbox_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Down754
NOP	
J	L_Process_TP_Down310
NOP	
L__Process_TP_Down754:
;FirmwareIHM_v1_0_driver.c,5431 :: 		if (exec_cbox->Active != 0) {
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down756
NOP	
J	L_Process_TP_Down311
NOP	
L__Process_TP_Down756:
;FirmwareIHM_v1_0_driver.c,5432 :: 		if (exec_cbox->PressColEnabled != 0) {
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 30
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down758
NOP	
J	L_Process_TP_Down312
NOP	
L__Process_TP_Down758:
;FirmwareIHM_v1_0_driver.c,5433 :: 		object_pressed = 1;
ORI	R2, R0, 1
SB	R2, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,5434 :: 		DrawCBox(exec_cbox);
LW	R25, Offset(_exec_cbox+0)(GP)
JAL	_DrawCBox+0
NOP	
;FirmwareIHM_v1_0_driver.c,5435 :: 		}
L_Process_TP_Down312:
;FirmwareIHM_v1_0_driver.c,5436 :: 		PressedObject = (TPointer)exec_cbox;
LWR	R2, Offset(_exec_cbox+0)(GP)
LWL	R2, Offset(_exec_cbox+3)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5437 :: 		PressedObjectType = 14;
ORI	R2, R0, 14
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5438 :: 		if (exec_cbox->OnDownPtr != 0) {
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Down760
NOP	
J	L_Process_TP_Down313
NOP	
L__Process_TP_Down760:
;FirmwareIHM_v1_0_driver.c,5439 :: 		exec_cbox->OnDownPtr();
LW	R2, Offset(_exec_cbox+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5440 :: 		return;
J	L_end_Process_TP_Down
NOP	
;FirmwareIHM_v1_0_driver.c,5441 :: 		}
L_Process_TP_Down313:
;FirmwareIHM_v1_0_driver.c,5442 :: 		}
L_Process_TP_Down311:
;FirmwareIHM_v1_0_driver.c,5443 :: 		}
L_Process_TP_Down310:
;FirmwareIHM_v1_0_driver.c,5445 :: 		if (_object_count == box_round_order) {
LH	R3, Offset(_box_round_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Down761
NOP	
J	L_Process_TP_Down314
NOP	
L__Process_TP_Down761:
;FirmwareIHM_v1_0_driver.c,5446 :: 		if (exec_round_box->Active != 0) {
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down763
NOP	
J	L_Process_TP_Down315
NOP	
L__Process_TP_Down763:
;FirmwareIHM_v1_0_driver.c,5447 :: 		if (exec_round_box->PressColEnabled != 0) {
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 31
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down765
NOP	
J	L_Process_TP_Down316
NOP	
L__Process_TP_Down765:
;FirmwareIHM_v1_0_driver.c,5448 :: 		object_pressed = 1;
ORI	R2, R0, 1
SB	R2, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,5449 :: 		DrawRoundBox(exec_round_box);
LW	R25, Offset(_exec_round_box+0)(GP)
JAL	_DrawRoundBox+0
NOP	
;FirmwareIHM_v1_0_driver.c,5450 :: 		}
L_Process_TP_Down316:
;FirmwareIHM_v1_0_driver.c,5451 :: 		PressedObject = (TPointer)exec_round_box;
LWR	R2, Offset(_exec_round_box+0)(GP)
LWL	R2, Offset(_exec_round_box+3)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5452 :: 		PressedObjectType = 7;
ORI	R2, R0, 7
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5453 :: 		if (exec_round_box->OnDownPtr != 0) {
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Down767
NOP	
J	L_Process_TP_Down317
NOP	
L__Process_TP_Down767:
;FirmwareIHM_v1_0_driver.c,5454 :: 		exec_round_box->OnDownPtr();
LW	R2, Offset(_exec_round_box+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5455 :: 		return;
J	L_end_Process_TP_Down
NOP	
;FirmwareIHM_v1_0_driver.c,5456 :: 		}
L_Process_TP_Down317:
;FirmwareIHM_v1_0_driver.c,5457 :: 		}
L_Process_TP_Down315:
;FirmwareIHM_v1_0_driver.c,5458 :: 		}
L_Process_TP_Down314:
;FirmwareIHM_v1_0_driver.c,5460 :: 		if (_object_count == checkbox_order) {
LH	R3, Offset(_checkbox_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L__Process_TP_Down768
NOP	
J	L_Process_TP_Down318
NOP	
L__Process_TP_Down768:
;FirmwareIHM_v1_0_driver.c,5461 :: 		if (exec_checkbox->Active != 0) {
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down770
NOP	
J	L_Process_TP_Down319
NOP	
L__Process_TP_Down770:
;FirmwareIHM_v1_0_driver.c,5462 :: 		if (exec_checkbox->PressColEnabled != 0) {
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 48
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__Process_TP_Down772
NOP	
J	L_Process_TP_Down320
NOP	
L__Process_TP_Down772:
;FirmwareIHM_v1_0_driver.c,5463 :: 		object_pressed = 1;
ORI	R2, R0, 1
SB	R2, Offset(_object_pressed+0)(GP)
;FirmwareIHM_v1_0_driver.c,5464 :: 		DrawCheckBox(exec_checkbox);
LW	R25, Offset(_exec_checkbox+0)(GP)
JAL	_DrawCheckBox+0
NOP	
;FirmwareIHM_v1_0_driver.c,5465 :: 		}
L_Process_TP_Down320:
;FirmwareIHM_v1_0_driver.c,5466 :: 		PressedObject = (TPointer)exec_checkbox;
LWR	R2, Offset(_exec_checkbox+0)(GP)
LWL	R2, Offset(_exec_checkbox+3)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;FirmwareIHM_v1_0_driver.c,5467 :: 		PressedObjectType = 16;
ORI	R2, R0, 16
SH	R2, Offset(_PressedObjectType+0)(GP)
;FirmwareIHM_v1_0_driver.c,5468 :: 		if (exec_checkbox->OnDownPtr != 0) {
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
BNE	R2, R0, L__Process_TP_Down774
NOP	
J	L_Process_TP_Down321
NOP	
L__Process_TP_Down774:
;FirmwareIHM_v1_0_driver.c,5469 :: 		exec_checkbox->OnDownPtr();
LW	R2, Offset(_exec_checkbox+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;FirmwareIHM_v1_0_driver.c,5470 :: 		return;
J	L_end_Process_TP_Down
NOP	
;FirmwareIHM_v1_0_driver.c,5471 :: 		}
L_Process_TP_Down321:
;FirmwareIHM_v1_0_driver.c,5472 :: 		}
L_Process_TP_Down319:
;FirmwareIHM_v1_0_driver.c,5473 :: 		}
L_Process_TP_Down318:
;FirmwareIHM_v1_0_driver.c,5475 :: 		}
L_Process_TP_Down295:
;FirmwareIHM_v1_0_driver.c,5476 :: 		}
L_end_Process_TP_Down:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Process_TP_Down
_Check_TP:
;FirmwareIHM_v1_0_driver.c,5478 :: 		void Check_TP() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,5479 :: 		if (TP_TFT_Press_Detect()) {
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_TP_TFT_Press_Detect+0
NOP	
BNE	R2, R0, L__Check_TP777
NOP	
J	L_Check_TP322
NOP	
L__Check_TP777:
;FirmwareIHM_v1_0_driver.c,5480 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
LUI	R26, hi_addr(_Ycoord+0)
ORI	R26, R26, lo_addr(_Ycoord+0)
LUI	R25, hi_addr(_Xcoord+0)
ORI	R25, R25, lo_addr(_Xcoord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__Check_TP778
NOP	
J	L_Check_TP323
NOP	
L__Check_TP778:
;FirmwareIHM_v1_0_driver.c,5482 :: 		Process_TP_Press(Xcoord, Ycoord);
LHU	R26, Offset(_Ycoord+0)(GP)
LHU	R25, Offset(_Xcoord+0)(GP)
JAL	_Process_TP_Press+0
NOP	
;FirmwareIHM_v1_0_driver.c,5483 :: 		if (PenDown == 0) {
LBU	R2, Offset(_PenDown+0)(GP)
BEQ	R2, R0, L__Check_TP779
NOP	
J	L_Check_TP324
NOP	
L__Check_TP779:
;FirmwareIHM_v1_0_driver.c,5484 :: 		PenDown = 1;
ORI	R2, R0, 1
SB	R2, Offset(_PenDown+0)(GP)
;FirmwareIHM_v1_0_driver.c,5485 :: 		Process_TP_Down(Xcoord, Ycoord);
LHU	R26, Offset(_Ycoord+0)(GP)
LHU	R25, Offset(_Xcoord+0)(GP)
JAL	_Process_TP_Down+0
NOP	
;FirmwareIHM_v1_0_driver.c,5486 :: 		}
L_Check_TP324:
;FirmwareIHM_v1_0_driver.c,5487 :: 		}
L_Check_TP323:
;FirmwareIHM_v1_0_driver.c,5488 :: 		}
J	L_Check_TP325
NOP	
L_Check_TP322:
;FirmwareIHM_v1_0_driver.c,5489 :: 		else if (PenDown == 1) {
LBU	R3, Offset(_PenDown+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_TP780
NOP	
J	L_Check_TP326
NOP	
L__Check_TP780:
;FirmwareIHM_v1_0_driver.c,5490 :: 		PenDown = 0;
SB	R0, Offset(_PenDown+0)(GP)
;FirmwareIHM_v1_0_driver.c,5491 :: 		Process_TP_Up(Xcoord, Ycoord);
LHU	R26, Offset(_Ycoord+0)(GP)
LHU	R25, Offset(_Xcoord+0)(GP)
JAL	_Process_TP_Up+0
NOP	
;FirmwareIHM_v1_0_driver.c,5492 :: 		}
L_Check_TP326:
L_Check_TP325:
;FirmwareIHM_v1_0_driver.c,5493 :: 		}
L_end_Check_TP:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Check_TP
_Init_MCU:
;FirmwareIHM_v1_0_driver.c,5495 :: 		void Init_MCU() {
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,5497 :: 		PMMODE = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R0, Offset(PMMODE+0)(GP)
;FirmwareIHM_v1_0_driver.c,5498 :: 		PMAEN  = 0;
SW	R0, Offset(PMAEN+0)(GP)
;FirmwareIHM_v1_0_driver.c,5499 :: 		PMCON  = 0;  // WRSP: Write Strobe Polarity bit
SW	R0, Offset(PMCON+0)(GP)
;FirmwareIHM_v1_0_driver.c,5500 :: 		PMMODEbits.MODE = 2;     // Master 2
ORI	R3, R0, 2
LHU	R2, Offset(PMMODEbits+0)(GP)
INS	R2, R3, 8, 2
SH	R2, Offset(PMMODEbits+0)(GP)
;FirmwareIHM_v1_0_driver.c,5501 :: 		PMMODEbits.WAITB = 0;
ORI	R4, R0, 192
SB	R4, Offset(PMMODEbits+4)(GP)
;FirmwareIHM_v1_0_driver.c,5502 :: 		PMMODEbits.WAITM = 1;
ORI	R3, R0, 1
LBU	R2, Offset(PMMODEbits+0)(GP)
INS	R2, R3, 2, 4
SB	R2, Offset(PMMODEbits+0)(GP)
;FirmwareIHM_v1_0_driver.c,5503 :: 		PMMODEbits.WAITE = 0;
ORI	R2, R0, 3
SB	R2, Offset(PMMODEbits+4)(GP)
;FirmwareIHM_v1_0_driver.c,5504 :: 		PMMODEbits.MODE16 = 1;   // 16 bit mode
ORI	R2, R0, 1024
SW	R2, Offset(PMMODEbits+8)(GP)
;FirmwareIHM_v1_0_driver.c,5505 :: 		PMCONbits.CSF = 0;
SB	R4, Offset(PMCONbits+4)(GP)
;FirmwareIHM_v1_0_driver.c,5506 :: 		PMCONbits.PTRDEN = 1;
ORI	R2, R0, 256
SW	R2, Offset(PMCONbits+8)(GP)
;FirmwareIHM_v1_0_driver.c,5507 :: 		PMCONbits.PTWREN = 1;
ORI	R2, R0, 512
SW	R2, Offset(PMCONbits+8)(GP)
;FirmwareIHM_v1_0_driver.c,5508 :: 		PMCONbits.PMPEN = 1;
ORI	R2, R0, 32768
SW	R2, Offset(PMCONbits+8)(GP)
;FirmwareIHM_v1_0_driver.c,5509 :: 		TFT_Set_Default_Mode();
JAL	_TFT_Set_Default_Mode+0
NOP	
;FirmwareIHM_v1_0_driver.c,5510 :: 		TP_TFT_Set_Default_Mode();
JAL	_TP_TFT_Set_Default_Mode+0
NOP	
;FirmwareIHM_v1_0_driver.c,5511 :: 		TFT_Set_Active(Set_Index,Write_Command,Write_Data);
LUI	R27, hi_addr(_Write_Data+0)
ORI	R27, R27, lo_addr(_Write_Data+0)
LUI	R26, hi_addr(_Write_Command+0)
ORI	R26, R26, lo_addr(_Write_Command+0)
LUI	R25, hi_addr(_Set_Index+0)
ORI	R25, R25, lo_addr(_Set_Index+0)
JAL	_TFT_Set_Active+0
NOP	
;FirmwareIHM_v1_0_driver.c,5512 :: 		}
L_end_Init_MCU:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Init_MCU
_Start_TP:
;FirmwareIHM_v1_0_driver.c,5514 :: 		void Start_TP() {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;FirmwareIHM_v1_0_driver.c,5515 :: 		Init_MCU();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Init_MCU+0
NOP	
;FirmwareIHM_v1_0_driver.c,5517 :: 		InitializeTouchPanel();
JAL	FirmwareIHM_v1_0_driver_InitializeTouchPanel+0
NOP	
;FirmwareIHM_v1_0_driver.c,5519 :: 		TP_TFT_Set_Calibration_Consts(76, 907, 77, 915);    // Set calibration constants
ORI	R28, R0, 915
ORI	R27, R0, 77
ORI	R26, R0, 907
ORI	R25, R0, 76
JAL	_TP_TFT_Set_Calibration_Consts+0
NOP	
;FirmwareIHM_v1_0_driver.c,5521 :: 		InitializeObjects();
JAL	FirmwareIHM_v1_0_driver_InitializeObjects+0
NOP	
;FirmwareIHM_v1_0_driver.c,5522 :: 		display_width = ScreenInicializacao.Width;
LHU	R2, Offset(_ScreenInicializacao+2)(GP)
SH	R2, Offset(_display_width+0)(GP)
;FirmwareIHM_v1_0_driver.c,5523 :: 		display_height = ScreenInicializacao.Height;
LHU	R2, Offset(_ScreenInicializacao+4)(GP)
SH	R2, Offset(_display_height+0)(GP)
;FirmwareIHM_v1_0_driver.c,5524 :: 		DrawScreen(&ScreenInicializacao);
LUI	R25, hi_addr(_ScreenInicializacao+0)
ORI	R25, R25, lo_addr(_ScreenInicializacao+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_driver.c,5525 :: 		}
L_end_Start_TP:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Start_TP
FirmwareIHM_v1_0_driver____?ag:
L_end_FirmwareIHM_v1_0_driver___?ag:
JR	RA
NOP	
; end of FirmwareIHM_v1_0_driver____?ag
