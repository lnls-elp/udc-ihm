_malhaAberta:
;FirmwareIHM_v1_0_events_code.c,12 :: 		void malhaAberta() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,13 :: 		if ((CheckBox1.Checked == 0)&&(CheckBox2.Checked == 0)){
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_CheckBox1+20)(GP)
BEQ	R2, R0, L__malhaAberta53
NOP	
J	L__malhaAberta48
NOP	
L__malhaAberta53:
LBU	R2, Offset(_CheckBox2+20)(GP)
BEQ	R2, R0, L__malhaAberta54
NOP	
J	L__malhaAberta47
NOP	
L__malhaAberta54:
L__malhaAberta46:
;FirmwareIHM_v1_0_events_code.c,14 :: 		strcpy(Label26.Caption,"----------");
LUI	R26, hi_addr(?lstr1_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr1_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label26+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,15 :: 		strcpy(Label27.Caption,"----------");
LUI	R26, hi_addr(?lstr2_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr2_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label27+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,16 :: 		DrawScreen(&ScreenMalhaDeControle);
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,17 :: 		}
J	L_malhaAberta3
NOP	
;FirmwareIHM_v1_0_events_code.c,13 :: 		if ((CheckBox1.Checked == 0)&&(CheckBox2.Checked == 0)){
L__malhaAberta48:
L__malhaAberta47:
;FirmwareIHM_v1_0_events_code.c,19 :: 		if (CheckBox1.Checked == 0){
LBU	R2, Offset(_CheckBox1+20)(GP)
BEQ	R2, R0, L__malhaAberta55
NOP	
J	L_malhaAberta4
NOP	
L__malhaAberta55:
;FirmwareIHM_v1_0_events_code.c,20 :: 		strcpy(Label26.Caption,"Fechada");
LUI	R26, hi_addr(?lstr3_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr3_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label26+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,21 :: 		strcpy(Label27.Caption,"Fechada");
LUI	R26, hi_addr(?lstr4_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr4_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label27+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,22 :: 		DrawScreen(&ScreenMalhaDeControle);
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,23 :: 		}
L_malhaAberta4:
;FirmwareIHM_v1_0_events_code.c,24 :: 		if (CheckBox1.Checked == 1){
LBU	R3, Offset(_CheckBox1+20)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__malhaAberta56
NOP	
J	L_malhaAberta5
NOP	
L__malhaAberta56:
;FirmwareIHM_v1_0_events_code.c,25 :: 		CheckBox2.Checked = 0;  //DESMARCA o CheckBox2 quando o CheckBox1
SB	R0, Offset(_CheckBox2+20)(GP)
;FirmwareIHM_v1_0_events_code.c,27 :: 		strcpy(Label26.Caption,"Aberta");
LUI	R26, hi_addr(?lstr5_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr5_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label26+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,28 :: 		strcpy(Label27.Caption,"Aberta");
LUI	R26, hi_addr(?lstr6_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr6_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label27+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,29 :: 		DrawScreen(&ScreenMalhaDeControle);
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,30 :: 		}
L_malhaAberta5:
;FirmwareIHM_v1_0_events_code.c,31 :: 		}
L_malhaAberta3:
;FirmwareIHM_v1_0_events_code.c,32 :: 		}
L_end_malhaAberta:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _malhaAberta
_malhaFechada:
;FirmwareIHM_v1_0_events_code.c,34 :: 		void malhaFechada() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,35 :: 		if ((CheckBox1.Checked == 0)&&(CheckBox2.Checked == 0)){
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_CheckBox1+20)(GP)
BEQ	R2, R0, L__malhaFechada58
NOP	
J	L__malhaFechada51
NOP	
L__malhaFechada58:
LBU	R2, Offset(_CheckBox2+20)(GP)
BEQ	R2, R0, L__malhaFechada59
NOP	
J	L__malhaFechada50
NOP	
L__malhaFechada59:
L__malhaFechada49:
;FirmwareIHM_v1_0_events_code.c,36 :: 		strcpy(Label26.Caption,"----------");
LUI	R26, hi_addr(?lstr7_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr7_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label26+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,37 :: 		strcpy(Label27.Caption,"----------");
LUI	R26, hi_addr(?lstr8_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr8_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label27+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,38 :: 		DrawScreen(&ScreenMalhaDeControle);
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,39 :: 		}
J	L_malhaFechada9
NOP	
;FirmwareIHM_v1_0_events_code.c,35 :: 		if ((CheckBox1.Checked == 0)&&(CheckBox2.Checked == 0)){
L__malhaFechada51:
L__malhaFechada50:
;FirmwareIHM_v1_0_events_code.c,41 :: 		if (CheckBox2.Checked == 0){
LBU	R2, Offset(_CheckBox2+20)(GP)
BEQ	R2, R0, L__malhaFechada60
NOP	
J	L_malhaFechada10
NOP	
L__malhaFechada60:
;FirmwareIHM_v1_0_events_code.c,42 :: 		strcpy(Label26.Caption,"Aberta");
LUI	R26, hi_addr(?lstr9_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr9_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label26+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,43 :: 		strcpy(Label27.Caption,"Aberta");
LUI	R26, hi_addr(?lstr10_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr10_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label27+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,44 :: 		DrawScreen(&ScreenMalhaDeControle);
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,45 :: 		}
L_malhaFechada10:
;FirmwareIHM_v1_0_events_code.c,46 :: 		if (CheckBox2.Checked == 1){
LBU	R3, Offset(_CheckBox2+20)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__malhaFechada61
NOP	
J	L_malhaFechada11
NOP	
L__malhaFechada61:
;FirmwareIHM_v1_0_events_code.c,47 :: 		CheckBox1.Checked = 0;  //DESMARCA o CheckBox1 quando o CheckBox2
SB	R0, Offset(_CheckBox1+20)(GP)
;FirmwareIHM_v1_0_events_code.c,49 :: 		strcpy(Label26.Caption,"Fechada");
LUI	R26, hi_addr(?lstr11_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr11_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label26+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,50 :: 		strcpy(Label27.Caption,"Fechada");
LUI	R26, hi_addr(?lstr12_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr12_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label27+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,51 :: 		DrawScreen(&ScreenMalhaDeControle);
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,52 :: 		}
L_malhaFechada11:
;FirmwareIHM_v1_0_events_code.c,53 :: 		}
L_malhaFechada9:
;FirmwareIHM_v1_0_events_code.c,54 :: 		}
L_end_malhaFechada:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _malhaFechada
_modoRemoto:
;FirmwareIHM_v1_0_events_code.c,57 :: 		void modoRemoto() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,58 :: 		if (CheckBox3.Checked == 0){
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_CheckBox3+20)(GP)
BEQ	R2, R0, L__modoRemoto63
NOP	
J	L_modoRemoto12
NOP	
L__modoRemoto63:
;FirmwareIHM_v1_0_events_code.c,59 :: 		strcpy(Label43.Caption," ");
LUI	R26, hi_addr(?lstr13_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr13_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label43+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,60 :: 		strcpy(Label44.Caption," ");
LUI	R26, hi_addr(?lstr14_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr14_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label44+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,61 :: 		strcpy(Label48.Caption," ");
LUI	R26, hi_addr(?lstr15_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr15_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label48+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,62 :: 		strcpy(Label52.Caption," ");
LUI	R26, hi_addr(?lstr16_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr16_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label52+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,63 :: 		strcpy(Label56.Caption," ");
LUI	R26, hi_addr(?lstr17_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr17_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label56+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,64 :: 		strcpy(Label60.Caption," ");
LUI	R26, hi_addr(?lstr18_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr18_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label60+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,68 :: 		DrawScreen(&ScreenOperando);
LUI	R25, hi_addr(_ScreenOperando+0)
ORI	R25, R25, lo_addr(_ScreenOperando+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,69 :: 		}
L_modoRemoto12:
;FirmwareIHM_v1_0_events_code.c,70 :: 		if (CheckBox3.Checked == 1){
LBU	R3, Offset(_CheckBox3+20)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__modoRemoto64
NOP	
J	L_modoRemoto13
NOP	
L__modoRemoto64:
;FirmwareIHM_v1_0_events_code.c,71 :: 		CheckBox4.Checked = 0;
SB	R0, Offset(_CheckBox4+20)(GP)
;FirmwareIHM_v1_0_events_code.c,72 :: 		CheckBox5.Checked = 0;
SB	R0, Offset(_CheckBox5+20)(GP)
;FirmwareIHM_v1_0_events_code.c,74 :: 		strcpy(Label43.Caption,"Remoto");
LUI	R26, hi_addr(?lstr19_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr19_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label43+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,75 :: 		strcpy(Label44.Caption,"Remoto");
LUI	R26, hi_addr(?lstr20_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr20_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label44+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,76 :: 		strcpy(Label48.Caption,"Remoto");
LUI	R26, hi_addr(?lstr21_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr21_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label48+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,77 :: 		strcpy(Label52.Caption,"Remoto");
LUI	R26, hi_addr(?lstr22_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr22_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label52+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,78 :: 		strcpy(Label56.Caption,"Remoto");
LUI	R26, hi_addr(?lstr23_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr23_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label56+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,79 :: 		strcpy(Label60.Caption,"Remoto");
LUI	R26, hi_addr(?lstr24_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr24_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label60+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,82 :: 		DrawScreen(&ScreenOperando);
LUI	R25, hi_addr(_ScreenOperando+0)
ORI	R25, R25, lo_addr(_ScreenOperando+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,83 :: 		}
L_modoRemoto13:
;FirmwareIHM_v1_0_events_code.c,84 :: 		}
L_end_modoRemoto:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _modoRemoto
_modoLocal:
;FirmwareIHM_v1_0_events_code.c,86 :: 		void modoLocal() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,87 :: 		if (CheckBox4.Checked == 0){
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_CheckBox4+20)(GP)
BEQ	R2, R0, L__modoLocal66
NOP	
J	L_modoLocal14
NOP	
L__modoLocal66:
;FirmwareIHM_v1_0_events_code.c,88 :: 		strcpy(Label43.Caption," ");
LUI	R26, hi_addr(?lstr25_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr25_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label43+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,89 :: 		strcpy(Label44.Caption," ");
LUI	R26, hi_addr(?lstr26_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr26_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label44+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,90 :: 		strcpy(Label48.Caption," ");
LUI	R26, hi_addr(?lstr27_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr27_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label48+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,91 :: 		strcpy(Label52.Caption," ");
LUI	R26, hi_addr(?lstr28_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr28_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label52+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,92 :: 		strcpy(Label56.Caption," ");
LUI	R26, hi_addr(?lstr29_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr29_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label56+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,93 :: 		strcpy(Label60.Caption," ");
LUI	R26, hi_addr(?lstr30_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr30_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label60+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,97 :: 		DrawScreen(&ScreenOperando);
LUI	R25, hi_addr(_ScreenOperando+0)
ORI	R25, R25, lo_addr(_ScreenOperando+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,98 :: 		}
L_modoLocal14:
;FirmwareIHM_v1_0_events_code.c,99 :: 		if (CheckBox4.Checked == 1){
LBU	R3, Offset(_CheckBox4+20)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__modoLocal67
NOP	
J	L_modoLocal15
NOP	
L__modoLocal67:
;FirmwareIHM_v1_0_events_code.c,100 :: 		CheckBox3.Checked = 0;
SB	R0, Offset(_CheckBox3+20)(GP)
;FirmwareIHM_v1_0_events_code.c,101 :: 		CheckBox5.Checked = 0;
SB	R0, Offset(_CheckBox5+20)(GP)
;FirmwareIHM_v1_0_events_code.c,103 :: 		strcpy(Label43.Caption,"Local");
LUI	R26, hi_addr(?lstr31_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr31_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label43+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,104 :: 		strcpy(Label44.Caption,"Local");
LUI	R26, hi_addr(?lstr32_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr32_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label44+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,105 :: 		strcpy(Label48.Caption,"Local");
LUI	R26, hi_addr(?lstr33_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr33_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label48+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,106 :: 		strcpy(Label52.Caption,"Local");
LUI	R26, hi_addr(?lstr34_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr34_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label52+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,107 :: 		strcpy(Label56.Caption,"Local");
LUI	R26, hi_addr(?lstr35_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr35_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label56+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,108 :: 		strcpy(Label60.Caption,"Local");
LUI	R26, hi_addr(?lstr36_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr36_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label60+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,111 :: 		DrawScreen(&ScreenOperando);
LUI	R25, hi_addr(_ScreenOperando+0)
ORI	R25, R25, lo_addr(_ScreenOperando+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,112 :: 		}
L_modoLocal15:
;FirmwareIHM_v1_0_events_code.c,114 :: 		}
L_end_modoLocal:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _modoLocal
_modoPCHost:
;FirmwareIHM_v1_0_events_code.c,116 :: 		void modoPCHost() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,117 :: 		if (CheckBox5.Checked == 0){
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_CheckBox5+20)(GP)
BEQ	R2, R0, L__modoPCHost69
NOP	
J	L_modoPCHost16
NOP	
L__modoPCHost69:
;FirmwareIHM_v1_0_events_code.c,118 :: 		strcpy(Label43.Caption," ");
LUI	R26, hi_addr(?lstr37_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr37_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label43+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,119 :: 		strcpy(Label44.Caption," ");
LUI	R26, hi_addr(?lstr38_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr38_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label44+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,120 :: 		strcpy(Label48.Caption," ");
LUI	R26, hi_addr(?lstr39_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr39_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label48+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,121 :: 		strcpy(Label52.Caption," ");
LUI	R26, hi_addr(?lstr40_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr40_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label52+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,122 :: 		strcpy(Label56.Caption," ");
LUI	R26, hi_addr(?lstr41_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr41_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label56+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,123 :: 		strcpy(Label60.Caption," ");
LUI	R26, hi_addr(?lstr42_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr42_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label60+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,127 :: 		DrawScreen(&ScreenOperando);
LUI	R25, hi_addr(_ScreenOperando+0)
ORI	R25, R25, lo_addr(_ScreenOperando+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,128 :: 		}
L_modoPCHost16:
;FirmwareIHM_v1_0_events_code.c,129 :: 		if (CheckBox5.Checked == 1){
LBU	R3, Offset(_CheckBox5+20)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__modoPCHost70
NOP	
J	L_modoPCHost17
NOP	
L__modoPCHost70:
;FirmwareIHM_v1_0_events_code.c,130 :: 		CheckBox3.Checked = 0;
SB	R0, Offset(_CheckBox3+20)(GP)
;FirmwareIHM_v1_0_events_code.c,131 :: 		CheckBox4.Checked = 0;
SB	R0, Offset(_CheckBox4+20)(GP)
;FirmwareIHM_v1_0_events_code.c,133 :: 		strcpy(Label43.Caption,"PC Host");
LUI	R26, hi_addr(?lstr43_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr43_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label43+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,134 :: 		strcpy(Label44.Caption,"PC Host");
LUI	R26, hi_addr(?lstr44_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr44_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label44+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,135 :: 		strcpy(Label48.Caption,"PC Host");
LUI	R26, hi_addr(?lstr45_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr45_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label48+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,136 :: 		strcpy(Label52.Caption,"PC Host");
LUI	R26, hi_addr(?lstr46_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr46_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label52+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,137 :: 		strcpy(Label56.Caption,"PC Host");
LUI	R26, hi_addr(?lstr47_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr47_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label56+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,138 :: 		strcpy(Label60.Caption,"PC Host");
LUI	R26, hi_addr(?lstr48_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr48_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label60+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,141 :: 		DrawScreen(&ScreenOperando);
LUI	R25, hi_addr(_ScreenOperando+0)
ORI	R25, R25, lo_addr(_ScreenOperando+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,142 :: 		}
L_modoPCHost17:
;FirmwareIHM_v1_0_events_code.c,144 :: 		}
L_end_modoPCHost:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _modoPCHost
_resetInterlock:
;FirmwareIHM_v1_0_events_code.c,147 :: 		void resetInterlock() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,148 :: 		DrawScreen(&ScreenPrincipal);
SW	R25, 4(SP)
LUI	R25, hi_addr(_ScreenPrincipal+0)
ORI	R25, R25, lo_addr(_ScreenPrincipal+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,149 :: 		}
L_end_resetInterlock:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _resetInterlock
_goScreenOperando:
;FirmwareIHM_v1_0_events_code.c,151 :: 		void goScreenOperando() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,152 :: 		DrawScreen(&ScreenOperando);
SW	R25, 4(SP)
LUI	R25, hi_addr(_ScreenOperando+0)
ORI	R25, R25, lo_addr(_ScreenOperando+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,153 :: 		}
L_end_goScreenOperando:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _goScreenOperando
_goScreenTecladoNumerico:
;FirmwareIHM_v1_0_events_code.c,155 :: 		void goScreenTecladoNumerico() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,156 :: 		strcpy(Label86.Caption,Label29.Caption); //Copia a Label da Referência, da
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R26, Offset(_Label29+16)(GP)
LW	R25, Offset(_Label86+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,159 :: 		strcpy(Label87.Caption,"");             //Limpa o campo Novo Valor.
LUI	R26, hi_addr(?lstr49_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr49_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label87+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,160 :: 		DrawScreen(&ScreenTecladoNumerico);
LUI	R25, hi_addr(_ScreenTecladoNumerico+0)
ORI	R25, R25, lo_addr(_ScreenTecladoNumerico+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,161 :: 		}
L_end_goScreenTecladoNumerico:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _goScreenTecladoNumerico
_goScreenResetInterlock:
;FirmwareIHM_v1_0_events_code.c,163 :: 		void goScreenResetInterlock() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,164 :: 		DrawScreen(&ScreenResetInterlock);
SW	R25, 4(SP)
LUI	R25, hi_addr(_ScreenResetInterlock+0)
ORI	R25, R25, lo_addr(_ScreenResetInterlock+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,165 :: 		}
L_end_goScreenResetInterlock:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _goScreenResetInterlock
_goScreenPrincipal:
;FirmwareIHM_v1_0_events_code.c,167 :: 		void goScreenPrincipal() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,168 :: 		DrawScreen(&ScreenPrincipal);
SW	R25, 4(SP)
LUI	R25, hi_addr(_ScreenPrincipal+0)
ORI	R25, R25, lo_addr(_ScreenPrincipal+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,169 :: 		}
L_end_goScreenPrincipal:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _goScreenPrincipal
_goScreenMalhaDeControle:
;FirmwareIHM_v1_0_events_code.c,171 :: 		void goScreenMalhaDeControle() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,172 :: 		DrawScreen(&ScreenMalhaDeControle);
SW	R25, 4(SP)
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,173 :: 		}
L_end_goScreenMalhaDeControle:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _goScreenMalhaDeControle
_buttonMENU:
;FirmwareIHM_v1_0_events_code.c,177 :: 		void buttonMENU() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,178 :: 		_screenLocked=1;
SW	R25, 4(SP)
ORI	R2, R0, 1
SH	R2, Offset(__screenLocked+0)(GP)
;FirmwareIHM_v1_0_events_code.c,179 :: 		DrawScreen(&ScreenSenha);
LUI	R25, hi_addr(_ScreenSenha+0)
ORI	R25, R25, lo_addr(_ScreenSenha+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,180 :: 		}
L_end_buttonMENU:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _buttonMENU
_buttonEndSerial:
;FirmwareIHM_v1_0_events_code.c,181 :: 		void buttonEndSerial() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,182 :: 		_screenLocked=2;
SW	R25, 4(SP)
ORI	R2, R0, 2
SH	R2, Offset(__screenLocked+0)(GP)
;FirmwareIHM_v1_0_events_code.c,183 :: 		DrawScreen(&ScreenSenha);
LUI	R25, hi_addr(_ScreenSenha+0)
ORI	R25, R25, lo_addr(_ScreenSenha+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,184 :: 		}
L_end_buttonEndSerial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _buttonEndSerial
_buttonMalhaDeControle:
;FirmwareIHM_v1_0_events_code.c,185 :: 		void buttonMalhaDeControle() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,186 :: 		_screenLocked=3;
SW	R25, 4(SP)
ORI	R2, R0, 3
SH	R2, Offset(__screenLocked+0)(GP)
;FirmwareIHM_v1_0_events_code.c,187 :: 		DrawScreen(&ScreenSenha);
LUI	R25, hi_addr(_ScreenSenha+0)
ORI	R25, R25, lo_addr(_ScreenSenha+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,188 :: 		}
L_end_buttonMalhaDeControle:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _buttonMalhaDeControle
_buttonReferencia:
;FirmwareIHM_v1_0_events_code.c,191 :: 		void buttonReferencia() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,192 :: 		DrawScreen(&ScreenTecladoNumerico);
SW	R25, 4(SP)
LUI	R25, hi_addr(_ScreenTecladoNumerico+0)
ORI	R25, R25, lo_addr(_ScreenTecladoNumerico+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,193 :: 		}
L_end_buttonReferencia:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _buttonReferencia
_buttonSenha_0:
;FirmwareIHM_v1_0_events_code.c,198 :: 		void buttonSenha_0(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,199 :: 		Password(0);
SW	R25, 4(SP)
SW	R26, 8(SP)
MOVZ	R25, R0, R0
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,200 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_082
NOP	
J	L_buttonSenha_018
NOP	
L__buttonSenha_082:
;FirmwareIHM_v1_0_events_code.c,201 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr50_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr50_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,202 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,203 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,204 :: 		}
L_buttonSenha_018:
;FirmwareIHM_v1_0_events_code.c,205 :: 		}
L_end_buttonSenha_0:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_0
_buttonSenha_1:
;FirmwareIHM_v1_0_events_code.c,206 :: 		void buttonSenha_1(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,207 :: 		Password(1);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 1
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,208 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_184
NOP	
J	L_buttonSenha_119
NOP	
L__buttonSenha_184:
;FirmwareIHM_v1_0_events_code.c,209 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr51_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr51_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,210 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,211 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,212 :: 		}
L_buttonSenha_119:
;FirmwareIHM_v1_0_events_code.c,213 :: 		}
L_end_buttonSenha_1:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_1
_buttonSenha_2:
;FirmwareIHM_v1_0_events_code.c,214 :: 		void buttonSenha_2(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,215 :: 		Password(2);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 2
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,216 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_286
NOP	
J	L_buttonSenha_220
NOP	
L__buttonSenha_286:
;FirmwareIHM_v1_0_events_code.c,217 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr52_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr52_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,218 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,219 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,220 :: 		}
L_buttonSenha_220:
;FirmwareIHM_v1_0_events_code.c,221 :: 		}
L_end_buttonSenha_2:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_2
_buttonSenha_3:
;FirmwareIHM_v1_0_events_code.c,222 :: 		void buttonSenha_3(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,223 :: 		Password(3);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 3
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,224 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_388
NOP	
J	L_buttonSenha_321
NOP	
L__buttonSenha_388:
;FirmwareIHM_v1_0_events_code.c,225 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr53_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr53_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,226 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,227 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,228 :: 		}
L_buttonSenha_321:
;FirmwareIHM_v1_0_events_code.c,229 :: 		}
L_end_buttonSenha_3:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_3
_buttonSenha_4:
;FirmwareIHM_v1_0_events_code.c,230 :: 		void buttonSenha_4(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,231 :: 		Password(4);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 4
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,232 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_490
NOP	
J	L_buttonSenha_422
NOP	
L__buttonSenha_490:
;FirmwareIHM_v1_0_events_code.c,233 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr54_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr54_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,234 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,235 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,236 :: 		}
L_buttonSenha_422:
;FirmwareIHM_v1_0_events_code.c,237 :: 		}
L_end_buttonSenha_4:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_4
_buttonSenha_5:
;FirmwareIHM_v1_0_events_code.c,238 :: 		void buttonSenha_5(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,239 :: 		Password(5);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 5
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,240 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_592
NOP	
J	L_buttonSenha_523
NOP	
L__buttonSenha_592:
;FirmwareIHM_v1_0_events_code.c,241 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr55_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr55_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,242 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,243 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,244 :: 		}
L_buttonSenha_523:
;FirmwareIHM_v1_0_events_code.c,245 :: 		}
L_end_buttonSenha_5:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_5
_buttonSenha_6:
;FirmwareIHM_v1_0_events_code.c,246 :: 		void buttonSenha_6(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,247 :: 		Password(6);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 6
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,248 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_694
NOP	
J	L_buttonSenha_624
NOP	
L__buttonSenha_694:
;FirmwareIHM_v1_0_events_code.c,249 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr56_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr56_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,250 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,251 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,252 :: 		}
L_buttonSenha_624:
;FirmwareIHM_v1_0_events_code.c,253 :: 		}
L_end_buttonSenha_6:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_6
_buttonSenha_7:
;FirmwareIHM_v1_0_events_code.c,254 :: 		void buttonSenha_7(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,255 :: 		Password(7);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 7
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,256 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_796
NOP	
J	L_buttonSenha_725
NOP	
L__buttonSenha_796:
;FirmwareIHM_v1_0_events_code.c,257 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr57_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr57_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,258 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,259 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,260 :: 		}
L_buttonSenha_725:
;FirmwareIHM_v1_0_events_code.c,261 :: 		}
L_end_buttonSenha_7:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_7
_buttonSenha_8:
;FirmwareIHM_v1_0_events_code.c,262 :: 		void buttonSenha_8(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,263 :: 		Password(8);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 8
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,264 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_898
NOP	
J	L_buttonSenha_826
NOP	
L__buttonSenha_898:
;FirmwareIHM_v1_0_events_code.c,265 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr58_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr58_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,266 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,267 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,268 :: 		}
L_buttonSenha_826:
;FirmwareIHM_v1_0_events_code.c,269 :: 		}
L_end_buttonSenha_8:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_8
_buttonSenha_9:
;FirmwareIHM_v1_0_events_code.c,270 :: 		void buttonSenha_9(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,271 :: 		Password(9);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 9
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,272 :: 		if(_contA<=SIZE_ASTERISK){
LH	R2, Offset(__contA+0)(GP)
SLTI	R2, R2, 7
BNE	R2, R0, L__buttonSenha_9100
NOP	
J	L_buttonSenha_927
NOP	
L__buttonSenha_9100:
;FirmwareIHM_v1_0_events_code.c,273 :: 		strcat(Label15.Caption,"*");
LUI	R26, hi_addr(?lstr59_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr59_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,274 :: 		DrawLabel(&Label15);
LUI	R25, hi_addr(_Label15+0)
ORI	R25, R25, lo_addr(_Label15+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,275 :: 		_contA++;
LH	R2, Offset(__contA+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,276 :: 		}
L_buttonSenha_927:
;FirmwareIHM_v1_0_events_code.c,277 :: 		}
L_end_buttonSenha_9:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_9
_buttonSenha_APAGAR:
;FirmwareIHM_v1_0_events_code.c,278 :: 		void buttonSenha_APAGAR(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,279 :: 		Password(10);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 10
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,280 :: 		strcpy(Label15.Caption," ");
LUI	R26, hi_addr(?lstr60_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr60_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,281 :: 		DrawScreen(&ScreenSenha);
LUI	R25, hi_addr(_ScreenSenha+0)
ORI	R25, R25, lo_addr(_ScreenSenha+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,282 :: 		_contA=1;
ORI	R2, R0, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,283 :: 		}
L_end_buttonSenha_APAGAR:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_APAGAR
_buttonSenha_ENTER:
;FirmwareIHM_v1_0_events_code.c,284 :: 		void buttonSenha_ENTER(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,285 :: 		if(Password(11)==1){
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 11
JAL	_Password+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__buttonSenha_ENTER103
NOP	
J	L_buttonSenha_ENTER28
NOP	
L__buttonSenha_ENTER103:
;FirmwareIHM_v1_0_events_code.c,286 :: 		if(_screenLocked==1){
LH	R3, Offset(__screenLocked+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__buttonSenha_ENTER104
NOP	
J	L_buttonSenha_ENTER29
NOP	
L__buttonSenha_ENTER104:
;FirmwareIHM_v1_0_events_code.c,287 :: 		strcpy(Label15.Caption," ");
LUI	R26, hi_addr(?lstr61_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr61_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,288 :: 		DrawScreen(&ScreenMENU);
LUI	R25, hi_addr(_ScreenMENU+0)
ORI	R25, R25, lo_addr(_ScreenMENU+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,289 :: 		}
L_buttonSenha_ENTER29:
;FirmwareIHM_v1_0_events_code.c,290 :: 		if(_screenLocked==2){
LH	R3, Offset(__screenLocked+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__buttonSenha_ENTER105
NOP	
J	L_buttonSenha_ENTER30
NOP	
L__buttonSenha_ENTER105:
;FirmwareIHM_v1_0_events_code.c,291 :: 		strcpy(Label15.Caption," ");
LUI	R26, hi_addr(?lstr62_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr62_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,292 :: 		DrawScreen(&ScreenEndSerial);
LUI	R25, hi_addr(_ScreenEndSerial+0)
ORI	R25, R25, lo_addr(_ScreenEndSerial+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,293 :: 		}
L_buttonSenha_ENTER30:
;FirmwareIHM_v1_0_events_code.c,294 :: 		if(_screenLocked==3){
LH	R3, Offset(__screenLocked+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__buttonSenha_ENTER106
NOP	
J	L_buttonSenha_ENTER31
NOP	
L__buttonSenha_ENTER106:
;FirmwareIHM_v1_0_events_code.c,295 :: 		strcpy(Label15.Caption," ");
LUI	R26, hi_addr(?lstr63_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr63_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,296 :: 		DrawScreen(&ScreenMalhaDeControle);
LUI	R25, hi_addr(_ScreenMalhaDeControle+0)
ORI	R25, R25, lo_addr(_ScreenMalhaDeControle+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,297 :: 		}
L_buttonSenha_ENTER31:
;FirmwareIHM_v1_0_events_code.c,298 :: 		}
J	L_buttonSenha_ENTER32
NOP	
L_buttonSenha_ENTER28:
;FirmwareIHM_v1_0_events_code.c,300 :: 		strcpy(Label15.Caption," ");
LUI	R26, hi_addr(?lstr64_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr64_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,301 :: 		DrawScreen(&ScreenAcessoNegado);
LUI	R25, hi_addr(_ScreenAcessoNegado+0)
ORI	R25, R25, lo_addr(_ScreenAcessoNegado+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,302 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_buttonSenha_ENTER33:
ADDIU	R24, R24, -1
BNE	R24, R0, L_buttonSenha_ENTER33
NOP	
NOP	
NOP	
;FirmwareIHM_v1_0_events_code.c,303 :: 		DrawScreen(&ScreenSenha);
LUI	R25, hi_addr(_ScreenSenha+0)
ORI	R25, R25, lo_addr(_ScreenSenha+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,304 :: 		}
L_buttonSenha_ENTER32:
;FirmwareIHM_v1_0_events_code.c,305 :: 		_contA=1;
ORI	R2, R0, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,306 :: 		}
L_end_buttonSenha_ENTER:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_ENTER
_buttonSenha_VOLTAR:
;FirmwareIHM_v1_0_events_code.c,307 :: 		void buttonSenha_VOLTAR(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,308 :: 		Password(12);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 12
JAL	_Password+0
NOP	
;FirmwareIHM_v1_0_events_code.c,309 :: 		strcpy(Label15.Caption," ");
LUI	R26, hi_addr(?lstr65_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr65_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label15+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,310 :: 		DrawScreen(&ScreenPrincipal);
LUI	R25, hi_addr(_ScreenPrincipal+0)
ORI	R25, R25, lo_addr(_ScreenPrincipal+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,311 :: 		_contA=1;
ORI	R2, R0, 1
SH	R2, Offset(__contA+0)(GP)
;FirmwareIHM_v1_0_events_code.c,312 :: 		}
L_end_buttonSenha_VOLTAR:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonSenha_VOLTAR
_buttonTeclado_0:
;FirmwareIHM_v1_0_events_code.c,319 :: 		void buttonTeclado_0() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,320 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_0109
NOP	
J	L_buttonTeclado_035
NOP	
L__buttonTeclado_0109:
;FirmwareIHM_v1_0_events_code.c,321 :: 		strcat(Label66.Caption,"0");
LUI	R26, hi_addr(?lstr66_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr66_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,322 :: 		strcat(_vetNumTecl,"0");
LUI	R26, hi_addr(?lstr67_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr67_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,323 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,324 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,325 :: 		}
L_buttonTeclado_035:
;FirmwareIHM_v1_0_events_code.c,326 :: 		}
L_end_buttonTeclado_0:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_0
_buttonTeclado_1:
;FirmwareIHM_v1_0_events_code.c,328 :: 		void buttonTeclado_1() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,329 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_1111
NOP	
J	L_buttonTeclado_136
NOP	
L__buttonTeclado_1111:
;FirmwareIHM_v1_0_events_code.c,330 :: 		strcat(Label66.Caption,"1");
LUI	R26, hi_addr(?lstr68_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr68_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,331 :: 		strcat(_vetNumTecl,"1");
LUI	R26, hi_addr(?lstr69_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr69_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,332 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,333 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,334 :: 		}
L_buttonTeclado_136:
;FirmwareIHM_v1_0_events_code.c,335 :: 		}
L_end_buttonTeclado_1:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_1
_buttonTeclado_2:
;FirmwareIHM_v1_0_events_code.c,337 :: 		void buttonTeclado_2() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,338 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_2113
NOP	
J	L_buttonTeclado_237
NOP	
L__buttonTeclado_2113:
;FirmwareIHM_v1_0_events_code.c,339 :: 		strcat(Label66.Caption,"2");
LUI	R26, hi_addr(?lstr70_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr70_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,340 :: 		strcat(_vetNumTecl,"2");
LUI	R26, hi_addr(?lstr71_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr71_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,341 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,342 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,343 :: 		}
L_buttonTeclado_237:
;FirmwareIHM_v1_0_events_code.c,344 :: 		}
L_end_buttonTeclado_2:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_2
_buttonTeclado_3:
;FirmwareIHM_v1_0_events_code.c,346 :: 		void buttonTeclado_3() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,347 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_3115
NOP	
J	L_buttonTeclado_338
NOP	
L__buttonTeclado_3115:
;FirmwareIHM_v1_0_events_code.c,348 :: 		strcat(Label66.Caption,"3");
LUI	R26, hi_addr(?lstr72_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr72_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,349 :: 		strcat(_vetNumTecl,"3");
LUI	R26, hi_addr(?lstr73_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr73_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,350 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,351 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,352 :: 		}
L_buttonTeclado_338:
;FirmwareIHM_v1_0_events_code.c,353 :: 		}
L_end_buttonTeclado_3:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_3
_buttonTeclado_4:
;FirmwareIHM_v1_0_events_code.c,355 :: 		void buttonTeclado_4() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,356 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_4117
NOP	
J	L_buttonTeclado_439
NOP	
L__buttonTeclado_4117:
;FirmwareIHM_v1_0_events_code.c,357 :: 		strcat(Label66.Caption,"4");
LUI	R26, hi_addr(?lstr74_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr74_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,358 :: 		strcat(_vetNumTecl,"4");
LUI	R26, hi_addr(?lstr75_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr75_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,359 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,360 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,361 :: 		}
L_buttonTeclado_439:
;FirmwareIHM_v1_0_events_code.c,362 :: 		}
L_end_buttonTeclado_4:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_4
_buttonTeclado_5:
;FirmwareIHM_v1_0_events_code.c,364 :: 		void buttonTeclado_5() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,365 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_5119
NOP	
J	L_buttonTeclado_540
NOP	
L__buttonTeclado_5119:
;FirmwareIHM_v1_0_events_code.c,366 :: 		strcat(Label66.Caption,"5");
LUI	R26, hi_addr(?lstr76_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr76_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,367 :: 		strcat(_vetNumTecl,"5");
LUI	R26, hi_addr(?lstr77_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr77_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,368 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,369 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,370 :: 		}
L_buttonTeclado_540:
;FirmwareIHM_v1_0_events_code.c,371 :: 		}
L_end_buttonTeclado_5:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_5
_buttonTeclado_6:
;FirmwareIHM_v1_0_events_code.c,373 :: 		void buttonTeclado_6() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,374 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_6121
NOP	
J	L_buttonTeclado_641
NOP	
L__buttonTeclado_6121:
;FirmwareIHM_v1_0_events_code.c,375 :: 		strcat(Label66.Caption,"6");
LUI	R26, hi_addr(?lstr78_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr78_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,376 :: 		strcat(_vetNumTecl,"6");
LUI	R26, hi_addr(?lstr79_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr79_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,377 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,378 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,379 :: 		}
L_buttonTeclado_641:
;FirmwareIHM_v1_0_events_code.c,380 :: 		}
L_end_buttonTeclado_6:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_6
_buttonTeclado_7:
;FirmwareIHM_v1_0_events_code.c,382 :: 		void buttonTeclado_7() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,383 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_7123
NOP	
J	L_buttonTeclado_742
NOP	
L__buttonTeclado_7123:
;FirmwareIHM_v1_0_events_code.c,384 :: 		strcat(Label66.Caption,"7");
LUI	R26, hi_addr(?lstr80_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr80_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,385 :: 		strcat(_vetNumTecl,"7");
LUI	R26, hi_addr(?lstr81_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr81_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,386 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,387 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,388 :: 		}
L_buttonTeclado_742:
;FirmwareIHM_v1_0_events_code.c,389 :: 		}
L_end_buttonTeclado_7:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_7
_buttonTeclado_8:
;FirmwareIHM_v1_0_events_code.c,391 :: 		void buttonTeclado_8() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,392 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_8125
NOP	
J	L_buttonTeclado_843
NOP	
L__buttonTeclado_8125:
;FirmwareIHM_v1_0_events_code.c,393 :: 		strcat(Label66.Caption,"8");
LUI	R26, hi_addr(?lstr82_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr82_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,394 :: 		strcat(_vetNumTecl,"8");
LUI	R26, hi_addr(?lstr83_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr83_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,395 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,396 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,397 :: 		}
L_buttonTeclado_843:
;FirmwareIHM_v1_0_events_code.c,398 :: 		}
L_end_buttonTeclado_8:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_8
_buttonTeclado_9:
;FirmwareIHM_v1_0_events_code.c,400 :: 		void buttonTeclado_9() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,401 :: 		if(_contB<=_SIZE_NUMBER){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R2, Offset(__contB+0)(GP)
SLTI	R2, R2, 16
BNE	R2, R0, L__buttonTeclado_9127
NOP	
J	L_buttonTeclado_944
NOP	
L__buttonTeclado_9127:
;FirmwareIHM_v1_0_events_code.c,402 :: 		strcat(Label66.Caption,"9");
LUI	R26, hi_addr(?lstr84_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr84_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,403 :: 		strcat(_vetNumTecl,"9");
LUI	R26, hi_addr(?lstr85_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr85_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,404 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,405 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,406 :: 		}
L_buttonTeclado_944:
;FirmwareIHM_v1_0_events_code.c,407 :: 		}
L_end_buttonTeclado_9:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_9
_buttonTeclado_P:
;FirmwareIHM_v1_0_events_code.c,409 :: 		void buttonTeclado_P() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,410 :: 		if(_pontoTecl==1){
SW	R25, 4(SP)
SW	R26, 8(SP)
LH	R3, Offset(__pontoTecl+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__buttonTeclado_P129
NOP	
J	L_buttonTeclado_P45
NOP	
L__buttonTeclado_P129:
;FirmwareIHM_v1_0_events_code.c,411 :: 		strcat(Label66.Caption,".");
LUI	R26, hi_addr(?lstr86_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr86_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,412 :: 		strcat(_vetNumTecl,".");
LUI	R26, hi_addr(?lstr87_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr87_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcat+0
NOP	
;FirmwareIHM_v1_0_events_code.c,413 :: 		DrawLabel(&Label66);
LUI	R25, hi_addr(_Label66+0)
ORI	R25, R25, lo_addr(_Label66+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,414 :: 		_pontoTecl=0;
SH	R0, Offset(__pontoTecl+0)(GP)
;FirmwareIHM_v1_0_events_code.c,415 :: 		_contB++;
LH	R2, Offset(__contB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,416 :: 		}
L_buttonTeclado_P45:
;FirmwareIHM_v1_0_events_code.c,417 :: 		}
L_end_buttonTeclado_P:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_P
_buttonTeclado_VOLTAR:
;FirmwareIHM_v1_0_events_code.c,419 :: 		void buttonTeclado_VOLTAR() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,420 :: 		strcpy(Label87.Caption," ");  //ZERA Label Novo Valor.
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr88_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr88_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label87+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,421 :: 		strcpy(Label66.Caption," ");  //ZERA Label do Visor Valor.
LUI	R26, hi_addr(?lstr89_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr89_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,422 :: 		DrawScreen(&ScreenPrincipal);
LUI	R25, hi_addr(_ScreenPrincipal+0)
ORI	R25, R25, lo_addr(_ScreenPrincipal+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,423 :: 		_pontoTecl=1;
ORI	R2, R0, 1
SH	R2, Offset(__pontoTecl+0)(GP)
;FirmwareIHM_v1_0_events_code.c,424 :: 		}
L_end_buttonTeclado_VOLTAR:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_VOLTAR
_buttonTeclado_APAGAR:
;FirmwareIHM_v1_0_events_code.c,426 :: 		void buttonTeclado_APAGAR() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,427 :: 		strcpy(Label66.Caption," ");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr90_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr90_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,428 :: 		strcpy(_vetNumTecl," ");
LUI	R26, hi_addr(?lstr91_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr91_FirmwareIHM_v1_0_events_code+0)
LUI	R25, hi_addr(__vetNumTecl+0)
ORI	R25, R25, lo_addr(__vetNumTecl+0)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,429 :: 		DrawScreen(&ScreenTecladoNumerico);
LUI	R25, hi_addr(_ScreenTecladoNumerico+0)
ORI	R25, R25, lo_addr(_ScreenTecladoNumerico+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,430 :: 		_contB=1;
ORI	R2, R0, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,431 :: 		_pontoTecl=1;
ORI	R2, R0, 1
SH	R2, Offset(__pontoTecl+0)(GP)
;FirmwareIHM_v1_0_events_code.c,432 :: 		}
L_end_buttonTeclado_APAGAR:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_APAGAR
_buttonTeclado_ENTER:
;FirmwareIHM_v1_0_events_code.c,434 :: 		void buttonTeclado_ENTER() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;FirmwareIHM_v1_0_events_code.c,435 :: 		strcpy(Label87.Caption,_vetNumTecl);  //Label Novo Valor.
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(__vetNumTecl+0)
ORI	R26, R26, lo_addr(__vetNumTecl+0)
LW	R25, Offset(_Label87+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,436 :: 		DrawLabel(&Label87);
LUI	R25, hi_addr(_Label87+0)
ORI	R25, R25, lo_addr(_Label87+0)
JAL	_DrawLabel+0
NOP	
;FirmwareIHM_v1_0_events_code.c,437 :: 		strcpy(Label29.Caption,_vetNumTecl);  //Label Referencia.
LUI	R26, hi_addr(__vetNumTecl+0)
ORI	R26, R26, lo_addr(__vetNumTecl+0)
LW	R25, Offset(_Label29+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,438 :: 		strcpy(Label66.Caption," ");  //Label do Visor Valor.
LUI	R26, hi_addr(?lstr92_FirmwareIHM_v1_0_events_code+0)
ORI	R26, R26, lo_addr(?lstr92_FirmwareIHM_v1_0_events_code+0)
LW	R25, Offset(_Label66+16)(GP)
JAL	_strcpy+0
NOP	
;FirmwareIHM_v1_0_events_code.c,439 :: 		DrawScreen(&ScreenTecladoNumerico);
LUI	R25, hi_addr(_ScreenTecladoNumerico+0)
ORI	R25, R25, lo_addr(_ScreenTecladoNumerico+0)
JAL	_DrawScreen+0
NOP	
;FirmwareIHM_v1_0_events_code.c,440 :: 		_contB=1;
ORI	R2, R0, 1
SH	R2, Offset(__contB+0)(GP)
;FirmwareIHM_v1_0_events_code.c,441 :: 		_pontoTecl=1;
ORI	R2, R0, 1
SH	R2, Offset(__pontoTecl+0)(GP)
;FirmwareIHM_v1_0_events_code.c,442 :: 		}
L_end_buttonTeclado_ENTER:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _buttonTeclado_ENTER
