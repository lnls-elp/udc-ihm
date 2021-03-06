#line 1 "C:/Users/paulo.santos/lnls-elp/udc-ihm/FirmwareIHM_v1_0_Code/mikroC PRO for PIC32/FirmwareIHM_v1_0_main.c"
#line 1 "c:/users/paulo.santos/lnls-elp/udc-ihm/firmwareihm_v1_0_code/mikroc pro for pic32/firmwareihm_v1_0_objects.h"
typedef enum {_pbsClearSector, _pbsFillSector} TProgressBarSector;

typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef const struct CButton_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 const char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef const struct CLabel {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCLabel;

typedef const struct CBox {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCBox;

typedef struct Box_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox_Round;

typedef struct Line {
 TScreen* OwnerScreen;
 char Order;
 unsigned int First_Point_X;
 unsigned int First_Point_Y;
 unsigned int Second_Point_X;
 unsigned int Second_Point_Y;
 char Pen_Width;
 char Visible;
 unsigned int Color;
} TLine;

typedef const struct CLine {
 TScreen* OwnerScreen;
 char Order;
 unsigned int First_Point_X;
 unsigned int First_Point_Y;
 unsigned int Second_Point_X;
 unsigned int Second_Point_Y;
 char Pen_Width;
 char Visible;
 unsigned int Color;
} TCLine;

typedef struct CheckBox {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Checked;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Rounded;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCheckBox;

typedef struct ProgressBar {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Transparent;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 unsigned int Min;
 unsigned int Max;
 unsigned int Position;
 unsigned int Prev_Position;
 char Show_Position;
 char Show_Percentage;
 char Smooth;
 char Rounded;
 char Corner_Radius;
} TProgressBar;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int CButtons_RoundCount;
 TCButton_Round * const code *CButtons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int CLabelsCount;
 TCLabel * const code *CLabels;
 unsigned int CBoxesCount;
 TCBox * const code *CBoxes;
 unsigned int Boxes_RoundCount;
 TBox_Round * const code *Boxes_Round;
 unsigned int LinesCount;
 TLine * const code *Lines;
 unsigned int CLinesCount;
 TCLine * const code *CLines;
 unsigned int CheckBoxesCount;
 TCheckBox * const code *CheckBoxes;
 unsigned int ProgressBarsCount;
 TProgressBar * const code *ProgressBars;
};

extern TScreen ScreenInicializacao;
extern TProgressBar ProgressBar1;
extern TLabel Label32;
extern TLabel Label33;
extern TLabel Label34;
extern TLabel Label35;
extern TLine Line2;
extern TLabel Label36;
extern TLabel Label37;
extern TCBox Box7;
extern TLabel * const code Screen1_Labels[6];
extern TCBox * const code Screen1_CBoxes[1];
extern TLine * const code Screen1_Lines[1];
extern TProgressBar * const code Screen1_ProgressBars[1];

extern TScreen ScreenPrincipal;
extern TCBox Box1;
extern TCBox Box2;
extern TCLabel Label1;
extern TCLabel Label2;
extern TCLabel Label3;
extern TCLabel Label4;
extern TCLabel Label5;
extern TCLabel Label6;
extern TCLabel Label7;
extern TCLabel Label8;
extern TCButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TCLabel Label9;
extern TCLine Line1;
extern TLabel Label26;
extern TLabel Label28;
extern TLabel Label29;
extern TLabel Label30;
extern TLabel Label31;
extern TLabel Label44;
extern TLabel Label45;
extern TLabel Label46;
extern TLabel Label47;
extern TButton_Round * const code Screen2_Buttons_Round[1];
extern TCButton_Round * const code Screen2_CButtons_Round[1];
extern TLabel * const code Screen2_Labels[9];
extern TCLabel * const code Screen2_CLabels[9];
extern TCBox * const code Screen2_CBoxes[2];
extern TCLine * const code Screen2_CLines[1];

extern TScreen ScreenSenha;
extern TCButton_Round ButtonRound4;
extern TCButton_Round ButtonRound11;
extern TCButton_Round ButtonRoundVoltarSenha;
extern TCButton_Round ButtonRoundEnter1;
extern TCLabel Label14;
extern TCButton_Round ButtonRound5;
extern TCButton_Round ButtonRound12;
extern TCButton_Round ButtonRound15;
extern TCButton_Round ButtonRound16;
extern TCButton_Round ButtonRound17;
extern TCButton_Round ButtonRound18;
extern TCButton_Round ButtonRound19;
extern TCButton_Round ButtonRound20;
extern TCButton_Round ButtonRound21;
extern TCBox Box4;
extern TLabel Label15;
extern TCBox Box3;
extern TLabel Label48;
extern TLabel Label49;
extern TLabel Label50;
extern TLabel Label51;
extern TCLabel Label17;
extern TCLabel Label18;
extern TCLabel Label19;
extern TCLabel Label20;
extern TCButton_Round * const code Screen3_CButtons_Round[13];
extern TLabel * const code Screen3_Labels[5];
extern TCLabel * const code Screen3_CLabels[5];
extern TCBox * const code Screen3_CBoxes[2];

extern TScreen ScreenMalhaDeControle;
extern TCBox Box6;
extern TCLabel Label25;
extern TLabel Label27;
extern TCButton_Round ButtonRound7;
extern TCheckBox CheckBox1;
extern TCheckBox CheckBox2;
extern TLabel Label52;
extern TLabel Label53;
extern TLabel Label54;
extern TLabel Label55;
extern TCLabel Label21;
extern TCLabel Label22;
extern TCLabel Label23;
extern TCLabel Label24;
extern TCButton_Round * const code Screen4_CButtons_Round[1];
extern TLabel * const code Screen4_Labels[5];
extern TCLabel * const code Screen4_CLabels[5];
extern TCBox * const code Screen4_CBoxes[1];
extern TCheckBox * const code Screen4_CheckBoxes[2];

extern TScreen ScreenResetInterlock;
extern TCBox Box5;
extern TCLabel Label10;
extern TCButton_Round ButtonRound3;
extern TButton_Round ButtonRound6;
extern TLabel Label56;
extern TLabel Label57;
extern TLabel Label58;
extern TLabel Label59;
extern TCLabel Label11;
extern TCLabel Label12;
extern TCLabel Label13;
extern TCLabel Label16;
extern TButton_Round * const code Screen5_Buttons_Round[1];
extern TCButton_Round * const code Screen5_CButtons_Round[1];
extern TLabel * const code Screen5_Labels[4];
extern TCLabel * const code Screen5_CLabels[5];
extern TCBox * const code Screen5_CBoxes[1];

extern TScreen ScreenOperando;
extern TCBox Box8;
extern TCLabel Label42;
extern TLabel Label43;
extern TCButton_Round ButtonRound8;
extern TCheckBox CheckBox3;
extern TCheckBox CheckBox4;
extern TCheckBox CheckBox5;
extern TLabel Label60;
extern TLabel Label61;
extern TLabel Label62;
extern TLabel Label63;
extern TCLabel Label38;
extern TCLabel Label39;
extern TCLabel Label40;
extern TCLabel Label41;
extern TCButton_Round * const code Screen6_CButtons_Round[1];
extern TLabel * const code Screen6_Labels[5];
extern TCLabel * const code Screen6_CLabels[5];
extern TCBox * const code Screen6_CBoxes[1];
extern TCheckBox * const code Screen6_CheckBoxes[3];

extern TScreen ScreenTecladoNumerico;
extern TCButton_Round ButtonRound9;
extern TCButton_Round ButtonRound10;
extern TCButton_Round ButtonRound13;
extern TCButton_Round ButtonRound14;
extern TCButton_Round ButtonRound22;
extern TCButton_Round ButtonRound23;
extern TCButton_Round ButtonRound24;
extern TCButton_Round ButtonRound25;
extern TCButton_Round ButtonRound26;
extern TCButton_Round ButtonRound27;
extern TCButton_Round ButtonRound28;
extern TCButton_Round ButtonRound29;
extern TCButton_Round ButtonRound30;
extern TCBox Box10;
extern TCLabel Label70;
extern TCButton_Round ButtonRound31;
extern TLabel Label64;
extern TCLabel Label65;
extern TCBox Box9;
extern TLabel Label66;
extern TLabel Label86;
extern TLabel Label87;
extern TCButton_Round * const code Screen7_CButtons_Round[14];
extern TLabel * const code Screen7_Labels[4];
extern TCLabel * const code Screen7_CLabels[2];
extern TCBox * const code Screen7_CBoxes[2];

extern TScreen ScreenAcessoNegado;
extern TCBox Box11;
extern TLabel Label67;
extern TLabel Label68;
extern TLabel Label69;
extern TLabel Label71;
extern TCLabel Label72;
extern TCLabel Label73;
extern TCLabel Label74;
extern TCLabel Label75;
extern TBox_Round BoxRound1;
extern TLabel Label76;
extern TLabel Label77;
extern TLabel * const code Screen8_Labels[6];
extern TCLabel * const code Screen8_CLabels[4];
extern TCBox * const code Screen8_CBoxes[1];
extern TBox_Round * const code Screen8_Boxes_Round[1];

extern TScreen ScreenMENU;
extern TCButton_Round ButtonRound32;
extern TCBox Box12;
extern TLabel Label78;
extern TLabel Label79;
extern TLabel Label80;
extern TLabel Label81;
extern TCLabel Label82;
extern TCLabel Label83;
extern TCLabel Label84;
extern TCLabel Label85;
extern TCButton_Round * const code Screen9_CButtons_Round[1];
extern TLabel * const code Screen9_Labels[4];
extern TCLabel * const code Screen9_CLabels[4];
extern TCBox * const code Screen9_CBoxes[1];

extern TScreen ScreenEndSerial;
extern TCBox Box13;
extern TCLabel Label88;
extern TCButton_Round ButtonRound33;
extern TLabel Label89;
extern TLabel Label90;
extern TLabel Label91;
extern TLabel Label92;
extern TCLabel Label93;
extern TCLabel Label94;
extern TCLabel Label95;
extern TCLabel Label96;
extern TCButton_Round * const code Screen10_CButtons_Round[1];
extern TLabel * const code Screen10_Labels[4];
extern TCLabel * const code Screen10_CLabels[5];
extern TCBox * const code Screen10_CBoxes[1];




void buttonEndSerial();
void buttonMalhaDeControle();
void buttonMENU();
void buttonReferencia();
void buttonSenha_0();
void buttonSenha_1();
void buttonSenha_2();
void buttonSenha_3();
void buttonSenha_4();
void buttonSenha_5();
void buttonSenha_6();
void buttonSenha_7();
void buttonSenha_8();
void buttonSenha_9();
void buttonSenha_APAGAR();
void buttonSenha_ENTER();
void buttonSenha_VOLTAR();
void buttonTeclado_0();
void buttonTeclado_1();
void buttonTeclado_2();
void buttonTeclado_3();
void buttonTeclado_4();
void buttonTeclado_5();
void buttonTeclado_6();
void buttonTeclado_7();
void buttonTeclado_8();
void buttonTeclado_9();
void buttonTeclado_APAGAR();
void buttonTeclado_ENTER();
void buttonTeclado_P();
void buttonTeclado_VOLTAR();
void goScreenMalhaDeControle();
void goScreenOperando();
void goScreenPrincipal();
void goScreenResetInterlock();
void goScreenTecladoNumerico();
void malhaAberta();
void malhaFechada();
void modoLocal();
void modoPCHost();
void modoRemoto();
void resetInterlock();




extern char ProgressBar1_Caption[];
extern char Label32_Caption[];
extern char Label33_Caption[];
extern char Label34_Caption[];
extern char Label35_Caption[];
extern char Line2_Caption[];
extern char Label36_Caption[];
extern char Label37_Caption[];
extern const char Box7_Caption[];
extern const char Box1_Caption[];
extern const char Box2_Caption[];
extern const char Label1_Caption[];
extern const char Label2_Caption[];
extern const char Label3_Caption[];
extern const char Label4_Caption[];
extern const char Label5_Caption[];
extern const char Label6_Caption[];
extern const char Label7_Caption[];
extern const char Label8_Caption[];
extern const char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern const char Label9_Caption[];
extern const char Line1_Caption[];
extern char Label26_Caption[];
extern char Label28_Caption[];
extern char Label29_Caption[];
extern char Label30_Caption[];
extern char Label31_Caption[];
extern char Label44_Caption[];
extern char Label45_Caption[];
extern char Label46_Caption[];
extern char Label47_Caption[];
extern const char ButtonRound4_Caption[];
extern const char ButtonRound11_Caption[];
extern const char ButtonRoundVoltarSenha_Caption[];
extern const char ButtonRoundEnter1_Caption[];
extern const char Label14_Caption[];
extern const char ButtonRound5_Caption[];
extern const char ButtonRound12_Caption[];
extern const char ButtonRound15_Caption[];
extern const char ButtonRound16_Caption[];
extern const char ButtonRound17_Caption[];
extern const char ButtonRound18_Caption[];
extern const char ButtonRound19_Caption[];
extern const char ButtonRound20_Caption[];
extern const char ButtonRound21_Caption[];
extern const char Box4_Caption[];
extern char Label15_Caption[];
extern const char Box3_Caption[];
extern char Label48_Caption[];
extern char Label49_Caption[];
extern char Label50_Caption[];
extern char Label51_Caption[];
extern const char Label17_Caption[];
extern const char Label18_Caption[];
extern const char Label19_Caption[];
extern const char Label20_Caption[];
extern const char Box6_Caption[];
extern const char Label25_Caption[];
extern char Label27_Caption[];
extern const char ButtonRound7_Caption[];
extern char CheckBox1_Caption[];
extern char CheckBox2_Caption[];
extern char Label52_Caption[];
extern char Label53_Caption[];
extern char Label54_Caption[];
extern char Label55_Caption[];
extern const char Label21_Caption[];
extern const char Label22_Caption[];
extern const char Label23_Caption[];
extern const char Label24_Caption[];
extern const char Box5_Caption[];
extern const char Label10_Caption[];
extern const char ButtonRound3_Caption[];
extern char ButtonRound6_Caption[];
extern char Label56_Caption[];
extern char Label57_Caption[];
extern char Label58_Caption[];
extern char Label59_Caption[];
extern const char Label11_Caption[];
extern const char Label12_Caption[];
extern const char Label13_Caption[];
extern const char Label16_Caption[];
extern const char Box8_Caption[];
extern const char Label42_Caption[];
extern char Label43_Caption[];
extern const char ButtonRound8_Caption[];
extern char CheckBox3_Caption[];
extern char CheckBox4_Caption[];
extern char CheckBox5_Caption[];
extern char Label60_Caption[];
extern char Label61_Caption[];
extern char Label62_Caption[];
extern char Label63_Caption[];
extern const char Label38_Caption[];
extern const char Label39_Caption[];
extern const char Label40_Caption[];
extern const char Label41_Caption[];
extern const char ButtonRound9_Caption[];
extern const char ButtonRound10_Caption[];
extern const char ButtonRound13_Caption[];
extern const char ButtonRound14_Caption[];
extern const char ButtonRound22_Caption[];
extern const char ButtonRound23_Caption[];
extern const char ButtonRound24_Caption[];
extern const char ButtonRound25_Caption[];
extern const char ButtonRound26_Caption[];
extern const char ButtonRound27_Caption[];
extern const char ButtonRound28_Caption[];
extern const char ButtonRound29_Caption[];
extern const char ButtonRound30_Caption[];
extern const char Box10_Caption[];
extern const char Label70_Caption[];
extern const char ButtonRound31_Caption[];
extern char Label64_Caption[];
extern const char Label65_Caption[];
extern const char Box9_Caption[];
extern char Label66_Caption[];
extern char Label86_Caption[];
extern char Label87_Caption[];
extern const char Box11_Caption[];
extern char Label67_Caption[];
extern char Label68_Caption[];
extern char Label69_Caption[];
extern char Label71_Caption[];
extern const char Label72_Caption[];
extern const char Label73_Caption[];
extern const char Label74_Caption[];
extern const char Label75_Caption[];
extern char BoxRound1_Caption[];
extern char Label76_Caption[];
extern char Label77_Caption[];
extern const char ButtonRound32_Caption[];
extern const char Box12_Caption[];
extern char Label78_Caption[];
extern char Label79_Caption[];
extern char Label80_Caption[];
extern char Label81_Caption[];
extern const char Label82_Caption[];
extern const char Label83_Caption[];
extern const char Label84_Caption[];
extern const char Label85_Caption[];
extern const char Box13_Caption[];
extern const char Label88_Caption[];
extern const char ButtonRound33_Caption[];
extern char Label89_Caption[];
extern char Label90_Caption[];
extern char Label91_Caption[];
extern char Label92_Caption[];
extern const char Label93_Caption[];
extern const char Label94_Caption[];
extern const char Label95_Caption[];
extern const char Label96_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawCRoundButton(TCButton_Round *ACround_button);
void DrawLabel(TLabel *ALabel);
void DrawCLabel(TCLabel *AClabel);
void DrawCBox(TCBox *ACbox);
void DrawRoundBox(TBox_Round *Around_box);
void DrawLine(TLine *Aline);
void DrawCLine(TCLine *ACline);
void DrawCheckBox(TCheckBox *ACheckBox);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/users/paulo.santos/lnls-elp/udc-ihm/firmwareihm_v1_0_code/mikroc pro for pic32/funcoesihm.h"




void FirmwareVersaoIHM();
void InicializaParametros();
int Password(int val);
#line 1 "c:/users/paulo.santos/lnls-elp/udc-ihm/firmwareihm_v1_0_code/mikroc pro for pic32/funcoesihm.c"
#line 1 "c:/users/paulo.santos/lnls-elp/udc-ihm/firmwareihm_v1_0_code/mikroc pro for pic32/funcoesihm.h"
#line 14 "c:/users/paulo.santos/lnls-elp/udc-ihm/firmwareihm_v1_0_code/mikroc pro for pic32/funcoesihm.c"
void FirmwareVersaoIHM(){
 strcpy(Label37.Caption,"v1.0");
 DrawScreen(&ScreenInicializacao);
}



void InicializaParametros(){
 char count;

 for(count = 0; count < 101; count++){
 ProgressBar1.Position = count;
 UpdatePBPosition(&ProgressBar1);
 Delay_ms(10);
 if(count == 90){

 Delay_ms(500);
 }
 if(count == 91){

 Delay_ms(500);
 }
 if(count == 92){

 Delay_ms(500);
 }
 if(count == 93){

 Delay_ms(500);
 }
 if(count == 94){

 Delay_ms(500);
 }
 if(count == 95){

 Delay_ms(500);
 }
 }

}



char _vetNum[ 6 ]=" ";
int _cont=1;
int Password(int val){
 if(_cont<= 6 ){
 if(val==0){
 strcat(_vetNum,"0");
 Delay_ms(100);
 }
 if(val==1){
 strcat(_vetNum,"1");
 Delay_ms(100);
 }
 if(val==2){
 strcat(_vetNum,"2");
 Delay_ms(100);
 }
 if(val==3){
 strcat(_vetNum,"3");
 Delay_ms(100);
 }
 if(val==4){
 strcat(_vetNum,"4");
 Delay_ms(100);
 }
 if(val==5){
 strcat(_vetNum,"5");
 Delay_ms(100);
 }
 if(val==6){
 strcat(_vetNum,"6");
 Delay_ms(100);
 }
 if(val==7){
 strcat(_vetNum,"7");
 Delay_ms(100);
 }
 if(val==8){
 strcat(_vetNum,"8");
 Delay_ms(100);
 }
 if(val==9){
 strcat(_vetNum,"9");
 Delay_ms(100);
 }
 _cont++;
 }

 if((val==10)||(val==12)){
 _cont=1;
 strcpy(_vetNum," ");
 }

 if (val==11){
 double password_TESTE = atof(_vetNum);
 if (password_TESTE== 123456 ){
 _cont=1;
 strcpy(_vetNum," ");
 return 1;
 }
 else{
 _cont=1;
 strcpy(_vetNum," ");
 return 0;
 }
 }
}
#line 23 "C:/Users/paulo.santos/lnls-elp/udc-ihm/FirmwareIHM_v1_0_Code/mikroC PRO for PIC32/FirmwareIHM_v1_0_main.c"
void main() {

 Start_TP();

 FirmwareVersaoIHM();
 Delay_ms(100);
 InicializaParametros();
 DrawScreen(&ScreenPrincipal);
 Delay_ms(100);

 while (1) {
 Check_TP();
 }
}
