_FirmwareVersaoIHM:
;funcoesihm.c,14 :: 		void FirmwareVersaoIHM(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;funcoesihm.c,15 :: 		strcpy(Label37.Caption,"v1.0");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr1_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr1_FirmwareIHM_v1_0_main+0)
LW	R25, Offset(_Label37+16)(GP)
JAL	_strcpy+0
NOP	
;funcoesihm.c,16 :: 		DrawScreen(&ScreenInicializacao);
LUI	R25, hi_addr(_ScreenInicializacao+0)
ORI	R25, R25, lo_addr(_ScreenInicializacao+0)
JAL	_DrawScreen+0
NOP	
;funcoesihm.c,17 :: 		}
L_end_FirmwareVersaoIHM:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _FirmwareVersaoIHM
_InicializaParametros:
;funcoesihm.c,21 :: 		void InicializaParametros(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;funcoesihm.c,24 :: 		for(count = 0; count < 101; count++){
SW	R25, 4(SP)
; count start address is: 16 (R4)
MOVZ	R4, R0, R0
; count end address is: 16 (R4)
L_InicializaParametros0:
; count start address is: 16 (R4)
ANDI	R2, R4, 255
SLTIU	R2, R2, 101
BNE	R2, R0, L__InicializaParametros71
NOP	
J	L_InicializaParametros1
NOP	
L__InicializaParametros71:
;funcoesihm.c,25 :: 		ProgressBar1.Position = count;
ANDI	R2, R4, 255
SH	R2, Offset(_ProgressBar1+44)(GP)
;funcoesihm.c,26 :: 		UpdatePBPosition(&ProgressBar1);
SB	R4, 8(SP)
LUI	R25, hi_addr(_ProgressBar1+0)
ORI	R25, R25, lo_addr(_ProgressBar1+0)
JAL	_UpdatePBPosition+0
NOP	
LBU	R4, 8(SP)
;funcoesihm.c,27 :: 		Delay_ms(10);
LUI	R24, 4
ORI	R24, R24, 4522
L_InicializaParametros3:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InicializaParametros3
NOP	
;funcoesihm.c,28 :: 		if(count == 90){
ANDI	R3, R4, 255
ORI	R2, R0, 90
BEQ	R3, R2, L__InicializaParametros72
NOP	
J	L_InicializaParametros5
NOP	
L__InicializaParametros72:
;funcoesihm.c,30 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_InicializaParametros6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InicializaParametros6
NOP	
NOP	
NOP	
;funcoesihm.c,31 :: 		}
L_InicializaParametros5:
;funcoesihm.c,32 :: 		if(count == 91){
ANDI	R3, R4, 255
ORI	R2, R0, 91
BEQ	R3, R2, L__InicializaParametros73
NOP	
J	L_InicializaParametros8
NOP	
L__InicializaParametros73:
;funcoesihm.c,34 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_InicializaParametros9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InicializaParametros9
NOP	
NOP	
NOP	
;funcoesihm.c,35 :: 		}
L_InicializaParametros8:
;funcoesihm.c,36 :: 		if(count == 92){
ANDI	R3, R4, 255
ORI	R2, R0, 92
BEQ	R3, R2, L__InicializaParametros74
NOP	
J	L_InicializaParametros11
NOP	
L__InicializaParametros74:
;funcoesihm.c,38 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_InicializaParametros12:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InicializaParametros12
NOP	
NOP	
NOP	
;funcoesihm.c,39 :: 		}
L_InicializaParametros11:
;funcoesihm.c,40 :: 		if(count == 93){
ANDI	R3, R4, 255
ORI	R2, R0, 93
BEQ	R3, R2, L__InicializaParametros75
NOP	
J	L_InicializaParametros14
NOP	
L__InicializaParametros75:
;funcoesihm.c,42 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_InicializaParametros15:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InicializaParametros15
NOP	
NOP	
NOP	
;funcoesihm.c,43 :: 		}
L_InicializaParametros14:
;funcoesihm.c,44 :: 		if(count == 94){
ANDI	R3, R4, 255
ORI	R2, R0, 94
BEQ	R3, R2, L__InicializaParametros76
NOP	
J	L_InicializaParametros17
NOP	
L__InicializaParametros76:
;funcoesihm.c,46 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_InicializaParametros18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InicializaParametros18
NOP	
NOP	
NOP	
;funcoesihm.c,47 :: 		}
L_InicializaParametros17:
;funcoesihm.c,48 :: 		if(count == 95){
ANDI	R3, R4, 255
ORI	R2, R0, 95
BEQ	R3, R2, L__InicializaParametros77
NOP	
J	L_InicializaParametros20
NOP	
L__InicializaParametros77:
;funcoesihm.c,50 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_InicializaParametros21:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InicializaParametros21
NOP	
NOP	
NOP	
;funcoesihm.c,51 :: 		}
L_InicializaParametros20:
;funcoesihm.c,24 :: 		for(count = 0; count < 101; count++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;funcoesihm.c,52 :: 		}
; count end address is: 16 (R4)
J	L_InicializaParametros0
NOP	
L_InicializaParametros1:
;funcoesihm.c,54 :: 		}
L_end_InicializaParametros:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _InicializaParametros
_Password:
;funcoesihm.c,60 :: 		int Password(int val){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;funcoesihm.c,61 :: 		if(_cont<=_SIZE_PASSWORD){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__cont+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__Password79
NOP	
J	L_Password23
NOP	
L__Password79:
;funcoesihm.c,62 :: 		if(val==0){
SEH	R2, R25
BEQ	R2, R0, L__Password80
NOP	
J	L_Password24
NOP	
L__Password80:
;funcoesihm.c,63 :: 		strcat(_vetNum,"0");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr2_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr2_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,64 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password25:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password25
NOP	
;funcoesihm.c,65 :: 		}
L_Password24:
;funcoesihm.c,66 :: 		if(val==1){
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__Password81
NOP	
J	L_Password27
NOP	
L__Password81:
;funcoesihm.c,67 :: 		strcat(_vetNum,"1");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr3_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr3_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,68 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password28:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password28
NOP	
;funcoesihm.c,69 :: 		}
L_Password27:
;funcoesihm.c,70 :: 		if(val==2){
SEH	R3, R25
ORI	R2, R0, 2
BEQ	R3, R2, L__Password82
NOP	
J	L_Password30
NOP	
L__Password82:
;funcoesihm.c,71 :: 		strcat(_vetNum,"2");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr4_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr4_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,72 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password31
NOP	
;funcoesihm.c,73 :: 		}
L_Password30:
;funcoesihm.c,74 :: 		if(val==3){
SEH	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__Password83
NOP	
J	L_Password33
NOP	
L__Password83:
;funcoesihm.c,75 :: 		strcat(_vetNum,"3");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr5_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr5_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,76 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password34
NOP	
;funcoesihm.c,77 :: 		}
L_Password33:
;funcoesihm.c,78 :: 		if(val==4){
SEH	R3, R25
ORI	R2, R0, 4
BEQ	R3, R2, L__Password84
NOP	
J	L_Password36
NOP	
L__Password84:
;funcoesihm.c,79 :: 		strcat(_vetNum,"4");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr6_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr6_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,80 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password37:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password37
NOP	
;funcoesihm.c,81 :: 		}
L_Password36:
;funcoesihm.c,82 :: 		if(val==5){
SEH	R3, R25
ORI	R2, R0, 5
BEQ	R3, R2, L__Password85
NOP	
J	L_Password39
NOP	
L__Password85:
;funcoesihm.c,83 :: 		strcat(_vetNum,"5");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr7_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr7_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,84 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password40:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password40
NOP	
;funcoesihm.c,85 :: 		}
L_Password39:
;funcoesihm.c,86 :: 		if(val==6){
SEH	R3, R25
ORI	R2, R0, 6
BEQ	R3, R2, L__Password86
NOP	
J	L_Password42
NOP	
L__Password86:
;funcoesihm.c,87 :: 		strcat(_vetNum,"6");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr8_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr8_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,88 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password43:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password43
NOP	
;funcoesihm.c,89 :: 		}
L_Password42:
;funcoesihm.c,90 :: 		if(val==7){
SEH	R3, R25
ORI	R2, R0, 7
BEQ	R3, R2, L__Password87
NOP	
J	L_Password45
NOP	
L__Password87:
;funcoesihm.c,91 :: 		strcat(_vetNum,"7");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr9_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr9_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,92 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password46
NOP	
;funcoesihm.c,93 :: 		}
L_Password45:
;funcoesihm.c,94 :: 		if(val==8){
SEH	R3, R25
ORI	R2, R0, 8
BEQ	R3, R2, L__Password88
NOP	
J	L_Password48
NOP	
L__Password88:
;funcoesihm.c,95 :: 		strcat(_vetNum,"8");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr10_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr10_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,96 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password49:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password49
NOP	
;funcoesihm.c,97 :: 		}
L_Password48:
;funcoesihm.c,98 :: 		if(val==9){
SEH	R3, R25
ORI	R2, R0, 9
BEQ	R3, R2, L__Password89
NOP	
J	L_Password51
NOP	
L__Password89:
;funcoesihm.c,99 :: 		strcat(_vetNum,"9");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr11_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr11_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcat+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,100 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_Password52:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Password52
NOP	
;funcoesihm.c,101 :: 		}
L_Password51:
;funcoesihm.c,102 :: 		_cont++;
LH	R2, Offset(__cont+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__cont+0)(GP)
;funcoesihm.c,103 :: 		}
L_Password23:
;funcoesihm.c,105 :: 		if((val==10)||(val==12)){
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Password91
NOP	
J	L__Password68
NOP	
L__Password91:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Password93
NOP	
J	L__Password67
NOP	
L__Password93:
J	L_Password56
NOP	
L__Password68:
L__Password67:
;funcoesihm.c,106 :: 		_cont=1;
ORI	R2, R0, 1
SH	R2, Offset(__cont+0)(GP)
;funcoesihm.c,107 :: 		strcpy(_vetNum," ");
SH	R25, 12(SP)
LUI	R26, hi_addr(?lstr12_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr12_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcpy+0
NOP	
LH	R25, 12(SP)
;funcoesihm.c,108 :: 		}
L_Password56:
;funcoesihm.c,110 :: 		if (val==11){
SEH	R3, R25
ORI	R2, R0, 11
BEQ	R3, R2, L__Password94
NOP	
J	L_Password57
NOP	
L__Password94:
;funcoesihm.c,111 :: 		double password_TESTE = atof(_vetNum);
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_atof+0
NOP	
;funcoesihm.c,112 :: 		if (password_TESTE==_PASSWORD_IHM){
LUI	R4, 18417
ORI	R4, R4, 8192
MOVZ	R6, R2, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
BNE	R2, R0, L__Password97
NOP	
J	L_Password58
NOP	
L__Password97:
;funcoesihm.c,113 :: 		_cont=1;
ORI	R2, R0, 1
SH	R2, Offset(__cont+0)(GP)
;funcoesihm.c,114 :: 		strcpy(_vetNum," ");
LUI	R26, hi_addr(?lstr13_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr13_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcpy+0
NOP	
;funcoesihm.c,115 :: 		return 1;
ORI	R2, R0, 1
J	L_end_Password
NOP	
;funcoesihm.c,116 :: 		}
L_Password58:
;funcoesihm.c,118 :: 		_cont=1;
ORI	R2, R0, 1
SH	R2, Offset(__cont+0)(GP)
;funcoesihm.c,119 :: 		strcpy(_vetNum," ");
LUI	R26, hi_addr(?lstr14_FirmwareIHM_v1_0_main+0)
ORI	R26, R26, lo_addr(?lstr14_FirmwareIHM_v1_0_main+0)
LUI	R25, hi_addr(__vetNum+0)
ORI	R25, R25, lo_addr(__vetNum+0)
JAL	_strcpy+0
NOP	
;funcoesihm.c,120 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_Password
NOP	
;funcoesihm.c,122 :: 		}
L_Password57:
;funcoesihm.c,123 :: 		}
L_end_Password:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Password
_main:
;FirmwareIHM_v1_0_main.c,23 :: 		void main() {
;FirmwareIHM_v1_0_main.c,25 :: 		Start_TP();
JAL	_Start_TP+0
NOP	
;FirmwareIHM_v1_0_main.c,27 :: 		FirmwareVersaoIHM();
JAL	_FirmwareVersaoIHM+0
NOP	
;FirmwareIHM_v1_0_main.c,28 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_main60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main60
NOP	
;FirmwareIHM_v1_0_main.c,29 :: 		InicializaParametros();
JAL	_InicializaParametros+0
NOP	
;FirmwareIHM_v1_0_main.c,30 :: 		DrawScreen(&ScreenPrincipal);
LUI	R25, hi_addr(_ScreenPrincipal+0)
ORI	R25, R25, lo_addr(_ScreenPrincipal+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_main.c,31 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_main62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main62
NOP	
;FirmwareIHM_v1_0_main.c,33 :: 		while (1) {
L_main64:
;FirmwareIHM_v1_0_main.c,34 :: 		Check_TP();
JAL	_Check_TP+0
NOP	
;FirmwareIHM_v1_0_main.c,35 :: 		}
J	L_main64
NOP	
;FirmwareIHM_v1_0_main.c,36 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
