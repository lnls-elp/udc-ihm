#line 1 "C:/Users/paulo.santos/Desktop/Versões_2018 - Cópia/FirmwareIHM_v1_0/FirmwareIHM_v1_0_Code/mikroC PRO for PIC32/FirmwareIHM_v1_0_driver.c"
#line 1 "c:/users/paulo.santos/desktop/versões_2018 - cópia/firmwareihm_v1_0/firmwareihm_v1_0_code/mikroc pro for pic32/firmwareihm_v1_0_objects.h"
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
#line 1 "c:/users/paulo.santos/desktop/versões_2018 - cópia/firmwareihm_v1_0/firmwareihm_v1_0_code/mikroc pro for pic32/firmwareihm_v1_0_resources.h"
const code char Tahoma12x16_Regular[];
const code char Tahoma14x16_Bold[];
const code char Tahoma15x18_Regular[];
const code char Tahoma17x21_Regular[];
const code char Tahoma20x21_Bold[];
const code char Tahoma25x25_Bold[];
const code char Tahoma26x33_Regular[];
const code char Tahoma11x13_Regular[];
const code char Tahoma12x14_Regular[];
#line 1 "c:/users/paulo.santos/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 7 "C:/Users/paulo.santos/Desktop/Versões_2018 - Cópia/FirmwareIHM_v1_0/FirmwareIHM_v1_0_Code/mikroC PRO for PIC32/FirmwareIHM_v1_0_driver.c"
char TFT_DataPort at LATE;
sbit TFT_RST at LATC1_bit;
sbit TFT_BLED at LATD2_bit;
sbit TFT_RS at LATB15_bit;
sbit TFT_CS at LATB14_bit;
sbit TFT_RD at LATD5_bit;
sbit TFT_WR at LATD4_bit;
char TFT_DataPort_Direction at TRISE;
sbit TFT_RST_Direction at TRISC1_bit;
sbit TFT_BLED_Direction at TRISD2_bit;
sbit TFT_RS_Direction at TRISB15_bit;
sbit TFT_CS_Direction at TRISB14_bit;
sbit TFT_RD_Direction at TRISD5_bit;
sbit TFT_WR_Direction at TRISD4_bit;



sbit DriveX_Left at LATB13_bit;
sbit DriveX_Right at LATB11_bit;
sbit DriveY_Up at LATB12_bit;
sbit DriveY_Down at LATB10_bit;
sbit DriveX_Left_Direction at TRISB13_bit;
sbit DriveX_Right_Direction at TRISB11_bit;
sbit DriveY_Up_Direction at TRISB12_bit;
sbit DriveY_Down_Direction at TRISB10_bit;



unsigned int Xcoord, Ycoord;
const ADC_THRESHOLD = 900;
char PenDown;
typedef unsigned long TPointer;
TPointer PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TCButton_Round *local_round_cbutton;
TCButton_Round *exec_round_cbutton;
int round_cbutton_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TCLabel *local_clabel;
TCLabel *exec_clabel;
int clabel_order;
TCBox *local_cbox;
TCBox *exec_cbox;
int cbox_order;
TBox_Round *local_round_box;
TBox_Round *exec_round_box;
int box_round_order;
TCheckBox *local_checkbox;
TCheckBox *exec_checkbox;
int checkbox_order;
TProgressBar *local_progress_bar;
TProgressBar *exec_progress_bar;
int progress_bar_order;


void PMPWaitBusy() {
 while(PMMODEbits.BUSY);
}

void Set_Index(unsigned short index) {
 TFT_RS = 0;
 PMDIN = index;
 PMPWaitBusy();
}

void Write_Command( unsigned short cmd ) {
 TFT_RS = 1;
 PMDIN = cmd;
 PMPWaitBusy();
}

void Write_Data(unsigned int _data) {
 TFT_RS = 1;
 PMDIN = _data;
 PMPWaitBusy();
}


void Init_ADC() {
 AD1PCFG = 0xFFFF;
 PCFG12_bit = 0;
 PCFG13_bit = 0;
 ADC1_Init();
}
static void InitializeTouchPanel() {
 Init_ADC();
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_ILI9341_8bit(240, 320);

 TP_TFT_Init(240, 320, 13, 12);
 TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}

void Calibrate() {
 TFT_Set_Pen(CL_WHITE, 3);
 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
 TFT_Write_Text("Touch selected corners for calibration", 1, 160);
 TFT_Line(229, 309, 239, 319);
 TFT_Line(233, 319, 239, 319);
 TFT_Line(239, 313, 239, 319);
 TFT_Write_Text("first here", 160, 290);

 TP_TFT_Calibrate_Min();
 Delay_ms(500);

 TFT_Set_Pen(CL_BLACK, 3);
 TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
 TFT_Line(229, 309, 239, 319);
 TFT_Line(233, 319, 239, 319);
 TFT_Line(239, 313, 239, 319);
 TFT_Write_Text("first here", 160, 290);

 TFT_Set_Pen(CL_WHITE, 3);
 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
 TFT_Line(0, 0, 10, 10);
 TFT_Line(0, 0, 6, 0);
 TFT_Line(0, 0, 0, 6);
 TFT_Write_Text("now here", 20, 5);

 TP_TFT_Calibrate_Max();
 Delay_ms(500);
}



 TScreen* CurrentScreen;

 TScreen ScreenInicializacao;
 TProgressBar ProgressBar1;
char ProgressBar1_Caption[5] = "50\%";

 TLabel Label32;
char Label32_Caption[46] = "LNLS - Laboratorio Nacional de Luz Sincrotron";

 TLabel Label33;
char Label33_Caption[14] = "Carregando...";

 TLabel Label34;
char Label34_Caption[21] = "Versao Firmware IHM:";

 TLabel Label35;
char Label35_Caption[15] = "GRUPO ELP 2018";

 TLine Line2;
 TLabel Label36;
char Label36_Caption[19] = "IHM, Inicializacao";

 TLabel Label37;
char Label37_Caption[11] = "----------";

 TCBox Box7 =
 {
 &ScreenInicializacao ,
 8 ,
 6 ,
 42 ,
 228 ,
 161 ,
 1 ,
 0x0000 ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0x0000 ,
 0x0000 ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TLabel * const code Screen1_Labels[6]=
 {
 &Label32,
 &Label33,
 &Label34,
 &Label35,
 &Label36,
 &Label37
 };
 TCBox * const code Screen1_CBoxes[1]=
 {
 &Box7
 };
 TLine * const code Screen1_Lines[1]=
 {
 &Line2
 };
 TProgressBar * const code Screen1_ProgressBars[1]=
 {
 &ProgressBar1
 };

 TScreen ScreenPrincipal;
 TCBox Box1 =
 {
 &ScreenPrincipal ,
 0 ,
 0 ,
 0 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TCBox Box2 =
 {
 &ScreenPrincipal ,
 1 ,
 6 ,
 54 ,
 228 ,
 212 ,
 1 ,
 0x0000 ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0x0000 ,
 0x0000 ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TCLabel Label1 =
 {
 &ScreenPrincipal ,
 2 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label1_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label1_Caption[7] = "Fonte:";

 TCLabel Label2 =
 {
 &ScreenPrincipal ,
 3 ,
 1 ,
 24 ,
 43 ,
 16 ,
 &Label2_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label2_Caption[8] = "Modelo:";

 TCLabel Label3 =
 {
 &ScreenPrincipal ,
 4 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label3_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 buttonEndSerial ,
 0
 };
const char Label3_Caption[13] = "End. Serial:";

 TCLabel Label4 =
 {
 &ScreenPrincipal ,
 5 ,
 10 ,
 59 ,
 116 ,
 20 ,
 &Label4_Caption ,
 &Tahoma15x18_Regular ,
 0xFFFF ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label4_Caption[17] = "Estado da Fonte:";

 TCLabel Label5 =
 {
 &ScreenPrincipal ,
 6 ,
 10 ,
 150 ,
 129 ,
 20 ,
 &Label5_Caption ,
 &Tahoma15x18_Regular ,
 0xFFFF ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 buttonMalhaDeControle ,
 0
 };
const char Label5_Caption[19] = "Malha de Controle:";

 TCLabel Label6 =
 {
 &ScreenPrincipal ,
 7 ,
 10 ,
 195 ,
 77 ,
 20 ,
 &Label6_Caption ,
 &Tahoma15x18_Regular ,
 0xFFFF ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 buttonReferencia ,
 0
 };
const char Label6_Caption[12] = "Referencia:";

 TCLabel Label7 =
 {
 &ScreenPrincipal ,
 8 ,
 122 ,
 24 ,
 58 ,
 16 ,
 &Label7_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 goScreenOperando ,
 0
 };
const char Label7_Caption[10] = "Operando:";

 TCLabel Label8 =
 {
 &ScreenPrincipal ,
 9 ,
 10 ,
 104 ,
 135 ,
 20 ,
 &Label8_Caption ,
 &Tahoma15x18_Regular ,
 0xFFFF ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label8_Caption[20] = "V/A (out) na Carga:";

 TCButton_Round ButtonRound1 =
 {
 &ScreenPrincipal ,
 10 ,
 10 ,
 276 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound1_Caption ,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
const char ButtonRound1_Caption[7] = "ON/OFF";

 TButton_Round ButtonRound2;
char ButtonRound2_Caption[5] = "MENU";

 TCLabel Label9 =
 {
 &ScreenPrincipal ,
 12 ,
 10 ,
 241 ,
 65 ,
 20 ,
 &Label9_Caption ,
 &Tahoma15x18_Regular ,
 0xFFFF ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 goScreenResetInterlock,
 0
 };
const char Label9_Caption[11] = "Interlock:";

 TCLine Line1 =
 {
 &ScreenPrincipal ,
 13 ,
 0 ,
 140 ,
 240 ,
 140 ,
 1 ,
 1 ,
 0xCE53
 };
 TLabel Label26;
char Label26_Caption[9] = "--------";

 TLabel Label28;
char Label28_Caption[9] = "--------";

 TLabel Label29;
char Label29_Caption[9] = "--------";

 TLabel Label30;
char Label30_Caption[9] = "--------";

 TLabel Label31;
char Label31_Caption[9] = "--------";

 TLabel Label44;
char Label44_Caption[9] = "--------";

 TLabel Label45;
char Label45_Caption[9] = "--------";

 TLabel Label46;
char Label46_Caption[9] = "--------";

 TLabel Label47;
char Label47_Caption[9] = "--------";

 TButton_Round * const code Screen2_Buttons_Round[1]=
 {
 &ButtonRound2
 };
 TCButton_Round * const code Screen2_CButtons_Round[1]=
 {
 &ButtonRound1
 };
 TLabel * const code Screen2_Labels[9]=
 {
 &Label26,
 &Label28,
 &Label29,
 &Label30,
 &Label31,
 &Label44,
 &Label45,
 &Label46,
 &Label47
 };
 TCLabel * const code Screen2_CLabels[9]=
 {
 &Label1,
 &Label2,
 &Label3,
 &Label4,
 &Label5,
 &Label6,
 &Label7,
 &Label8,
 &Label9
 };
 TCBox * const code Screen2_CBoxes[2]=
 {
 &Box1,
 &Box2
 };
 TCLine * const code Screen2_CLines[1]=
 {
 &Line1
 };

 TScreen ScreenSenha;
 TCButton_Round ButtonRound4 =
 {
 &ScreenSenha ,
 0 ,
 10 ,
 91 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound4_Caption ,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_1 ,
 0
 };
const char ButtonRound4_Caption[2] = "1";

 TCButton_Round ButtonRound11 =
 {
 &ScreenSenha ,
 1 ,
 86 ,
 277 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound11_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xB000 ,
 0xC618 ,
 0xA800 ,
 3 ,
 0 ,
 0xC618 ,
 0 ,
 0 ,
 buttonSenha_APAGAR ,
 0
 };
const char ButtonRound11_Caption[7] = "APAGAR";

 TCButton_Round ButtonRoundVoltarSenha =
 {
 &ScreenSenha ,
 2 ,
 8 ,
 277 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRoundVoltarSenha_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_VOLTAR ,
 0
 };
const char ButtonRoundVoltarSenha_Caption[7] = "VOLTAR";

 TCButton_Round ButtonRoundEnter1 =
 {
 &ScreenSenha ,
 3 ,
 163 ,
 277 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRoundEnter1_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0x0400 ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_ENTER ,
 0
 };
const char ButtonRoundEnter1_Caption[6] = "ENTER";

 TCLabel Label14 =
 {
 &ScreenSenha ,
 4 ,
 8 ,
 59 ,
 48 ,
 20 ,
 &Label14_Caption ,
 &Tahoma15x18_Regular ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label14_Caption[7] = "Senha:";

 TCButton_Round ButtonRound5 =
 {
 &ScreenSenha ,
 5 ,
 88 ,
 92 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound5_Caption ,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_2 ,
 0
 };
const char ButtonRound5_Caption[2] = "2";

 TCButton_Round ButtonRound12 =
 {
 &ScreenSenha ,
 6 ,
 166 ,
 92 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound12_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_3 ,
 0
 };
const char ButtonRound12_Caption[2] = "3";

 TCButton_Round ButtonRound15 =
 {
 &ScreenSenha ,
 7 ,
 10 ,
 135 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound15_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_4 ,
 0
 };
const char ButtonRound15_Caption[2] = "4";

 TCButton_Round ButtonRound16 =
 {
 &ScreenSenha ,
 8 ,
 88 ,
 135 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound16_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_5 ,
 0
 };
const char ButtonRound16_Caption[2] = "5";

 TCButton_Round ButtonRound17 =
 {
 &ScreenSenha ,
 9 ,
 166 ,
 135 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound17_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_6 ,
 0
 };
const char ButtonRound17_Caption[2] = "6";

 TCButton_Round ButtonRound18 =
 {
 &ScreenSenha ,
 10 ,
 10 ,
 179 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound18_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_7 ,
 0
 };
const char ButtonRound18_Caption[2] = "7";

 TCButton_Round ButtonRound19 =
 {
 &ScreenSenha ,
 11 ,
 88 ,
 179 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound19_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_8 ,
 0
 };
const char ButtonRound19_Caption[2] = "8";

 TCButton_Round ButtonRound20 =
 {
 &ScreenSenha ,
 12 ,
 166 ,
 179 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound20_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_9 ,
 0
 };
const char ButtonRound20_Caption[2] = "9";

 TCButton_Round ButtonRound21 =
 {
 &ScreenSenha ,
 13 ,
 88 ,
 223 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound21_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonSenha_0 ,
 0
 };
const char ButtonRound21_Caption[2] = "0";

 TCBox Box4 =
 {
 &ScreenSenha ,
 14 ,
 59 ,
 53 ,
 171 ,
 33 ,
 1 ,
 0x0000 ,
 1 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0x0000 ,
 0xC618 ,
 0x0000 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 0 ,
 0
 };
 TLabel Label15;
char Label15_Caption[2] = " ";

 TCBox Box3 =
 {
 &ScreenSenha ,
 16 ,
 0 ,
 1 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TLabel Label48;
char Label48_Caption[9] = "--------";

 TLabel Label49;
char Label49_Caption[9] = "--------";

 TLabel Label50;
char Label50_Caption[9] = "--------";

 TLabel Label51;
char Label51_Caption[9] = "--------";

 TCLabel Label17 =
 {
 &ScreenSenha ,
 21 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label17_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label17_Caption[7] = "Fonte:";

 TCLabel Label18 =
 {
 &ScreenSenha ,
 22 ,
 1 ,
 25 ,
 43 ,
 16 ,
 &Label18_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label18_Caption[8] = "Modelo:";

 TCLabel Label19 =
 {
 &ScreenSenha ,
 23 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label19_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label19_Caption[13] = "End. Serial:";

 TCLabel Label20 =
 {
 &ScreenSenha ,
 24 ,
 122 ,
 25 ,
 58 ,
 16 ,
 &Label20_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label20_Caption[10] = "Operando:";

 TCButton_Round * const code Screen3_CButtons_Round[13]=
 {
 &ButtonRound4,
 &ButtonRound11,
 &ButtonRoundVoltarSenha,
 &ButtonRoundEnter1,
 &ButtonRound5,
 &ButtonRound12,
 &ButtonRound15,
 &ButtonRound16,
 &ButtonRound17,
 &ButtonRound18,
 &ButtonRound19,
 &ButtonRound20,
 &ButtonRound21
 };
 TLabel * const code Screen3_Labels[5]=
 {
 &Label15,
 &Label48,
 &Label49,
 &Label50,
 &Label51
 };
 TCLabel * const code Screen3_CLabels[5]=
 {
 &Label14,
 &Label17,
 &Label18,
 &Label19,
 &Label20
 };
 TCBox * const code Screen3_CBoxes[2]=
 {
 &Box4,
 &Box3
 };

 TScreen ScreenMalhaDeControle;
 TCBox Box6 =
 {
 &ScreenMalhaDeControle,
 0 ,
 0 ,
 0 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TCLabel Label25 =
 {
 &ScreenMalhaDeControle,
 1 ,
 8 ,
 60 ,
 129 ,
 20 ,
 &Label25_Caption ,
 &Tahoma15x18_Regular ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label25_Caption[19] = "Malha de Controle:";

 TLabel Label27;
char Label27_Caption[9] = "--------";

 TCButton_Round ButtonRound7 =
 {
 &ScreenMalhaDeControle,
 3 ,
 10 ,
 276 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound7_Caption ,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 goScreenPrincipal ,
 0
 };
const char ButtonRound7_Caption[7] = "VOLTAR";

 TCheckBox CheckBox1;
char CheckBox1_Caption[7] = "Aberta";

 TCheckBox CheckBox2;
char CheckBox2_Caption[8] = "Fechada";

 TLabel Label52;
char Label52_Caption[9] = "--------";

 TLabel Label53;
char Label53_Caption[9] = "--------";

 TLabel Label54;
char Label54_Caption[9] = "--------";

 TLabel Label55;
char Label55_Caption[9] = "--------";

 TCLabel Label21 =
 {
 &ScreenMalhaDeControle,
 10 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label21_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label21_Caption[7] = "Fonte:";

 TCLabel Label22 =
 {
 &ScreenMalhaDeControle,
 11 ,
 1 ,
 24 ,
 43 ,
 16 ,
 &Label22_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label22_Caption[8] = "Modelo:";

 TCLabel Label23 =
 {
 &ScreenMalhaDeControle,
 12 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label23_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label23_Caption[13] = "End. Serial:";

 TCLabel Label24 =
 {
 &ScreenMalhaDeControle,
 13 ,
 122 ,
 24 ,
 58 ,
 16 ,
 &Label24_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label24_Caption[10] = "Operando:";

 TCButton_Round * const code Screen4_CButtons_Round[1]=
 {
 &ButtonRound7
 };
 TLabel * const code Screen4_Labels[5]=
 {
 &Label27,
 &Label52,
 &Label53,
 &Label54,
 &Label55
 };
 TCLabel * const code Screen4_CLabels[5]=
 {
 &Label25,
 &Label21,
 &Label22,
 &Label23,
 &Label24
 };
 TCBox * const code Screen4_CBoxes[1]=
 {
 &Box6
 };
 TCheckBox * const code Screen4_CheckBoxes[2]=
 {
 &CheckBox1,
 &CheckBox2
 };

 TScreen ScreenResetInterlock;
 TCBox Box5 =
 {
 &ScreenResetInterlock ,
 0 ,
 0 ,
 0 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TCLabel Label10 =
 {
 &ScreenResetInterlock ,
 1 ,
 8 ,
 60 ,
 65 ,
 20 ,
 &Label10_Caption ,
 &Tahoma15x18_Regular ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label10_Caption[11] = "Interlock:";

 TCButton_Round ButtonRound3 =
 {
 &ScreenResetInterlock ,
 2 ,
 10 ,
 276 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound3_Caption ,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 goScreenPrincipal ,
 0
 };
const char ButtonRound3_Caption[7] = "VOLTAR";

 TButton_Round ButtonRound6;
char ButtonRound6_Caption[6] = "RESET";

 TLabel Label56;
char Label56_Caption[9] = "--------";

 TLabel Label57;
char Label57_Caption[9] = "--------";

 TLabel Label58;
char Label58_Caption[9] = "--------";

 TLabel Label59;
char Label59_Caption[9] = "--------";

 TCLabel Label11 =
 {
 &ScreenResetInterlock ,
 8 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label11_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label11_Caption[7] = "Fonte:";

 TCLabel Label12 =
 {
 &ScreenResetInterlock ,
 9 ,
 1 ,
 24 ,
 43 ,
 16 ,
 &Label12_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label12_Caption[8] = "Modelo:";

 TCLabel Label13 =
 {
 &ScreenResetInterlock ,
 10 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label13_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label13_Caption[13] = "End. Serial:";

 TCLabel Label16 =
 {
 &ScreenResetInterlock ,
 11 ,
 122 ,
 24 ,
 58 ,
 16 ,
 &Label16_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label16_Caption[10] = "Operando:";

 TButton_Round * const code Screen5_Buttons_Round[1]=
 {
 &ButtonRound6
 };
 TCButton_Round * const code Screen5_CButtons_Round[1]=
 {
 &ButtonRound3
 };
 TLabel * const code Screen5_Labels[4]=
 {
 &Label56,
 &Label57,
 &Label58,
 &Label59
 };
 TCLabel * const code Screen5_CLabels[5]=
 {
 &Label10,
 &Label11,
 &Label12,
 &Label13,
 &Label16
 };
 TCBox * const code Screen5_CBoxes[1]=
 {
 &Box5
 };

 TScreen ScreenOperando;
 TCBox Box8 =
 {
 &ScreenOperando ,
 0 ,
 0 ,
 0 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TCLabel Label42 =
 {
 &ScreenOperando ,
 1 ,
 8 ,
 60 ,
 134 ,
 20 ,
 &Label42_Caption ,
 &Tahoma15x18_Regular ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label42_Caption[18] = "Mado de Operacao:";

 TLabel Label43;
char Label43_Caption[9] = "--------";

 TCButton_Round ButtonRound8 =
 {
 &ScreenOperando ,
 3 ,
 10 ,
 276 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound8_Caption ,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 goScreenPrincipal ,
 0
 };
const char ButtonRound8_Caption[7] = "VOLTAR";

 TCheckBox CheckBox3;
char CheckBox3_Caption[7] = "Remoto";

 TCheckBox CheckBox4;
char CheckBox4_Caption[6] = "Local";

 TCheckBox CheckBox5;
char CheckBox5_Caption[8] = "PC Host";

 TLabel Label60;
char Label60_Caption[9] = "--------";

 TLabel Label61;
char Label61_Caption[9] = "--------";

 TLabel Label62;
char Label62_Caption[9] = "--------";

 TLabel Label63;
char Label63_Caption[9] = "--------";

 TCLabel Label38 =
 {
 &ScreenOperando ,
 11 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label38_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label38_Caption[7] = "Fonte:";

 TCLabel Label39 =
 {
 &ScreenOperando ,
 12 ,
 1 ,
 24 ,
 43 ,
 16 ,
 &Label39_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label39_Caption[8] = "Modelo:";

 TCLabel Label40 =
 {
 &ScreenOperando ,
 13 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label40_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label40_Caption[13] = "End. Serial:";

 TCLabel Label41 =
 {
 &ScreenOperando ,
 14 ,
 122 ,
 24 ,
 58 ,
 16 ,
 &Label41_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label41_Caption[10] = "Operando:";

 TCButton_Round * const code Screen6_CButtons_Round[1]=
 {
 &ButtonRound8
 };
 TLabel * const code Screen6_Labels[5]=
 {
 &Label43,
 &Label60,
 &Label61,
 &Label62,
 &Label63
 };
 TCLabel * const code Screen6_CLabels[5]=
 {
 &Label42,
 &Label38,
 &Label39,
 &Label40,
 &Label41
 };
 TCBox * const code Screen6_CBoxes[1]=
 {
 &Box8
 };
 TCheckBox * const code Screen6_CheckBoxes[3]=
 {
 &CheckBox3,
 &CheckBox4,
 &CheckBox5
 };

 TScreen ScreenTecladoNumerico;
 TCButton_Round ButtonRound9 =
 {
 &ScreenTecladoNumerico,
 0 ,
 10 ,
 91 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound9_Caption ,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_1 ,
 0
 };
const char ButtonRound9_Caption[2] = "1";

 TCButton_Round ButtonRound10 =
 {
 &ScreenTecladoNumerico,
 1 ,
 86 ,
 277 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound10_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xB000 ,
 0xC618 ,
 0xA800 ,
 3 ,
 0 ,
 0xC618 ,
 0 ,
 0 ,
 buttonTeclado_APAGAR ,
 0
 };
const char ButtonRound10_Caption[7] = "APAGAR";

 TCButton_Round ButtonRound13 =
 {
 &ScreenTecladoNumerico,
 2 ,
 8 ,
 277 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound13_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_VOLTAR ,
 0
 };
const char ButtonRound13_Caption[7] = "VOLTAR";

 TCButton_Round ButtonRound14 =
 {
 &ScreenTecladoNumerico,
 3 ,
 163 ,
 277 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound14_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0x0400 ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_ENTER ,
 0
 };
const char ButtonRound14_Caption[6] = "ENTER";

 TCButton_Round ButtonRound22 =
 {
 &ScreenTecladoNumerico,
 4 ,
 88 ,
 92 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound22_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_2 ,
 0
 };
const char ButtonRound22_Caption[2] = "2";

 TCButton_Round ButtonRound23 =
 {
 &ScreenTecladoNumerico,
 5 ,
 166 ,
 92 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound23_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_3 ,
 0
 };
const char ButtonRound23_Caption[2] = "3";

 TCButton_Round ButtonRound24 =
 {
 &ScreenTecladoNumerico,
 6 ,
 10 ,
 135 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound24_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_4 ,
 0
 };
const char ButtonRound24_Caption[2] = "4";

 TCButton_Round ButtonRound25 =
 {
 &ScreenTecladoNumerico,
 7 ,
 88 ,
 135 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound25_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_5 ,
 0
 };
const char ButtonRound25_Caption[2] = "5";

 TCButton_Round ButtonRound26 =
 {
 &ScreenTecladoNumerico,
 8 ,
 166 ,
 135 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound26_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_6 ,
 0
 };
const char ButtonRound26_Caption[2] = "6";

 TCButton_Round ButtonRound27 =
 {
 &ScreenTecladoNumerico,
 9 ,
 10 ,
 179 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound27_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_7 ,
 0
 };
const char ButtonRound27_Caption[2] = "7";

 TCButton_Round ButtonRound28 =
 {
 &ScreenTecladoNumerico,
 10 ,
 88 ,
 179 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound28_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_8 ,
 0
 };
const char ButtonRound28_Caption[2] = "8";

 TCButton_Round ButtonRound29 =
 {
 &ScreenTecladoNumerico,
 11 ,
 166 ,
 179 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound29_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_9 ,
 0
 };
const char ButtonRound29_Caption[2] = "9";

 TCButton_Round ButtonRound30 =
 {
 &ScreenTecladoNumerico,
 12 ,
 88 ,
 223 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound30_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_0 ,
 0
 };
const char ButtonRound30_Caption[2] = "0";

 TCBox Box10 =
 {
 &ScreenTecladoNumerico,
 13 ,
 0 ,
 1 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TCLabel Label70 =
 {
 &ScreenTecladoNumerico,
 14 ,
 8 ,
 3 ,
 99 ,
 20 ,
 &Label70_Caption ,
 &Tahoma15x18_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label70_Caption[16] = "Valor Anterior:";

 TCButton_Round ButtonRound31 =
 {
 &ScreenTecladoNumerico,
 15 ,
 166 ,
 223 ,
 65 ,
 39 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound31_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma25x25_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 buttonTeclado_P ,
 0
 };
const char ButtonRound31_Caption[2] = ",";

 TLabel Label64;
char Label64_Caption[12] = "Novo Valor:";

 TCLabel Label65 =
 {
 &ScreenTecladoNumerico,
 17 ,
 8 ,
 59 ,
 40 ,
 20 ,
 &Label65_Caption ,
 &Tahoma15x18_Regular ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label65_Caption[7] = "Valor:";

 TCBox Box9 =
 {
 &ScreenTecladoNumerico,
 18 ,
 59 ,
 53 ,
 171 ,
 33 ,
 1 ,
 0x0000 ,
 1 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0x0000 ,
 0xC618 ,
 0x0000 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 0 ,
 0
 };
 TLabel Label66;
char Label66_Caption[2] = " ";

 TLabel Label86;
char Label86_Caption[2] = " ";

 TLabel Label87;
char Label87_Caption[2] = " ";

 TCButton_Round * const code Screen7_CButtons_Round[14]=
 {
 &ButtonRound9,
 &ButtonRound10,
 &ButtonRound13,
 &ButtonRound14,
 &ButtonRound22,
 &ButtonRound23,
 &ButtonRound24,
 &ButtonRound25,
 &ButtonRound26,
 &ButtonRound27,
 &ButtonRound28,
 &ButtonRound29,
 &ButtonRound30,
 &ButtonRound31
 };
 TLabel * const code Screen7_Labels[4]=
 {
 &Label64,
 &Label66,
 &Label86,
 &Label87
 };
 TCLabel * const code Screen7_CLabels[2]=
 {
 &Label70,
 &Label65
 };
 TCBox * const code Screen7_CBoxes[2]=
 {
 &Box10,
 &Box9
 };

 TScreen ScreenAcessoNegado;
 TCBox Box11 =
 {
 &ScreenAcessoNegado ,
 0 ,
 0 ,
 1 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TLabel Label67;
char Label67_Caption[9] = "--------";

 TLabel Label68;
char Label68_Caption[9] = "--------";

 TLabel Label69;
char Label69_Caption[9] = "--------";

 TLabel Label71;
char Label71_Caption[9] = "--------";

 TCLabel Label72 =
 {
 &ScreenAcessoNegado ,
 5 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label72_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label72_Caption[7] = "Fonte:";

 TCLabel Label73 =
 {
 &ScreenAcessoNegado ,
 6 ,
 1 ,
 25 ,
 43 ,
 16 ,
 &Label73_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label73_Caption[8] = "Modelo:";

 TCLabel Label74 =
 {
 &ScreenAcessoNegado ,
 7 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label74_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label74_Caption[13] = "End. Serial:";

 TCLabel Label75 =
 {
 &ScreenAcessoNegado ,
 8 ,
 122 ,
 25 ,
 58 ,
 16 ,
 &Label75_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label75_Caption[10] = "Operando:";

 TBox_Round BoxRound1;
 TLabel Label76;
char Label76_Caption[7] = "Negado";

 TLabel Label77;
char Label77_Caption[7] = "Acesso";

 TLabel * const code Screen8_Labels[6]=
 {
 &Label67,
 &Label68,
 &Label69,
 &Label71,
 &Label76,
 &Label77
 };
 TCLabel * const code Screen8_CLabels[4]=
 {
 &Label72,
 &Label73,
 &Label74,
 &Label75
 };
 TCBox * const code Screen8_CBoxes[1]=
 {
 &Box11
 };
 TBox_Round * const code Screen8_Boxes_Round[1]=
 {
 &BoxRound1
 };

 TScreen ScreenMENU;
 TCButton_Round ButtonRound32 =
 {
 &ScreenMENU ,
 0 ,
 8 ,
 277 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound32_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0x8410 ,
 0 ,
 0 ,
 goScreenPrincipal ,
 0
 };
const char ButtonRound32_Caption[7] = "VOLTAR";

 TCBox Box12 =
 {
 &ScreenMENU ,
 1 ,
 0 ,
 1 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TLabel Label78;
char Label78_Caption[9] = "--------";

 TLabel Label79;
char Label79_Caption[9] = "--------";

 TLabel Label80;
char Label80_Caption[9] = "--------";

 TLabel Label81;
char Label81_Caption[9] = "--------";

 TCLabel Label82 =
 {
 &ScreenMENU ,
 6 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label82_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label82_Caption[7] = "Fonte:";

 TCLabel Label83 =
 {
 &ScreenMENU ,
 7 ,
 1 ,
 25 ,
 43 ,
 16 ,
 &Label83_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label83_Caption[8] = "Modelo:";

 TCLabel Label84 =
 {
 &ScreenMENU ,
 8 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label84_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label84_Caption[13] = "End. Serial:";

 TCLabel Label85 =
 {
 &ScreenMENU ,
 9 ,
 122 ,
 25 ,
 58 ,
 16 ,
 &Label85_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label85_Caption[10] = "Operando:";

 TCButton_Round * const code Screen9_CButtons_Round[1]=
 {
 &ButtonRound32
 };
 TLabel * const code Screen9_Labels[4]=
 {
 &Label78,
 &Label79,
 &Label80,
 &Label81
 };
 TCLabel * const code Screen9_CLabels[4]=
 {
 &Label82,
 &Label83,
 &Label84,
 &Label85
 };
 TCBox * const code Screen9_CBoxes[1]=
 {
 &Box12
 };

 TScreen ScreenEndSerial;
 TCBox Box13 =
 {
 &ScreenEndSerial ,
 0 ,
 0 ,
 0 ,
 239 ,
 47 ,
 1 ,
 0xFFFF ,
 1 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0xFFFF ,
 0xFFFF ,
 0xC618 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 0 ,
 0
 };
 TCLabel Label88 =
 {
 &ScreenEndSerial ,
 1 ,
 8 ,
 60 ,
 78 ,
 20 ,
 &Label88_Caption ,
 &Tahoma15x18_Regular ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label88_Caption[13] = "End. Serial:";

 TCButton_Round ButtonRound33 =
 {
 &ScreenEndSerial ,
 2 ,
 10 ,
 276 ,
 70 ,
 35 ,
 1 ,
 0x0000 ,
 1 ,
 1 ,
 1 ,
 &ButtonRound33_Caption,
 _taCenter ,
 _tavMiddle ,
 &Tahoma14x16_Bold ,
 0x0000 ,
 0 ,
 1 ,
 0 ,
 0xFFFF ,
 0xC618 ,
 0xC618 ,
 3 ,
 1 ,
 0xE71C ,
 0 ,
 0 ,
 goScreenPrincipal ,
 0
 };
const char ButtonRound33_Caption[7] = "VOLTAR";

 TLabel Label89;
char Label89_Caption[9] = "--------";

 TLabel Label90;
char Label90_Caption[9] = "--------";

 TLabel Label91;
char Label91_Caption[9] = "--------";

 TLabel Label92;
char Label92_Caption[9] = "--------";

 TCLabel Label93 =
 {
 &ScreenEndSerial ,
 7 ,
 1 ,
 4 ,
 35 ,
 16 ,
 &Label93_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label93_Caption[7] = "Fonte:";

 TCLabel Label94 =
 {
 &ScreenEndSerial ,
 8 ,
 1 ,
 24 ,
 43 ,
 16 ,
 &Label94_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label94_Caption[8] = "Modelo:";

 TCLabel Label95 =
 {
 &ScreenEndSerial ,
 9 ,
 122 ,
 4 ,
 63 ,
 16 ,
 &Label95_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label95_Caption[13] = "End. Serial:";

 TCLabel Label96 =
 {
 &ScreenEndSerial ,
 10 ,
 122 ,
 24 ,
 58 ,
 16 ,
 &Label96_Caption ,
 &Tahoma12x14_Regular ,
 0x0000 ,
 0 ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label96_Caption[10] = "Operando:";

 TCButton_Round * const code Screen10_CButtons_Round[1]=
 {
 &ButtonRound33
 };
 TLabel * const code Screen10_Labels[4]=
 {
 &Label89,
 &Label90,
 &Label91,
 &Label92
 };
 TCLabel * const code Screen10_CLabels[5]=
 {
 &Label88,
 &Label93,
 &Label94,
 &Label95,
 &Label96
 };
 TCBox * const code Screen10_CBoxes[1]=
 {
 &Box13
 };



static void InitializeObjects() {
 ScreenInicializacao.Color = 0xCE53;
 ScreenInicializacao.Width = 240;
 ScreenInicializacao.Height = 320;
 ScreenInicializacao.Buttons_RoundCount = 0;
 ScreenInicializacao.CButtons_RoundCount = 0;
 ScreenInicializacao.LabelsCount = 6;
 ScreenInicializacao.Labels = Screen1_Labels;
 ScreenInicializacao.CLabelsCount = 0;
 ScreenInicializacao.CBoxesCount = 1;
 ScreenInicializacao.CBoxes = Screen1_CBoxes;
 ScreenInicializacao.Boxes_RoundCount = 0;
 ScreenInicializacao.LinesCount = 1;
 ScreenInicializacao.Lines = Screen1_Lines;
 ScreenInicializacao.CLinesCount = 0;
 ScreenInicializacao.CheckBoxesCount = 0;
 ScreenInicializacao.ProgressBarsCount = 1;
 ScreenInicializacao.ProgressBars = Screen1_ProgressBars;
 ScreenInicializacao.ObjectsCount = 9;

 ScreenPrincipal.Color = 0xCE53;
 ScreenPrincipal.Width = 240;
 ScreenPrincipal.Height = 320;
 ScreenPrincipal.Buttons_RoundCount = 1;
 ScreenPrincipal.Buttons_Round = Screen2_Buttons_Round;
 ScreenPrincipal.CButtons_RoundCount = 1;
 ScreenPrincipal.CButtons_Round = Screen2_CButtons_Round;
 ScreenPrincipal.LabelsCount = 9;
 ScreenPrincipal.Labels = Screen2_Labels;
 ScreenPrincipal.CLabelsCount = 9;
 ScreenPrincipal.CLabels = Screen2_CLabels;
 ScreenPrincipal.CBoxesCount = 2;
 ScreenPrincipal.CBoxes = Screen2_CBoxes;
 ScreenPrincipal.Boxes_RoundCount = 0;
 ScreenPrincipal.LinesCount = 0;
 ScreenPrincipal.CLinesCount = 1;
 ScreenPrincipal.CLines = Screen2_CLines;
 ScreenPrincipal.CheckBoxesCount = 0;
 ScreenPrincipal.ProgressBarsCount = 0;
 ScreenPrincipal.ObjectsCount = 23;

 ScreenSenha.Color = 0xCE53;
 ScreenSenha.Width = 240;
 ScreenSenha.Height = 320;
 ScreenSenha.Buttons_RoundCount = 0;
 ScreenSenha.CButtons_RoundCount = 13;
 ScreenSenha.CButtons_Round = Screen3_CButtons_Round;
 ScreenSenha.LabelsCount = 5;
 ScreenSenha.Labels = Screen3_Labels;
 ScreenSenha.CLabelsCount = 5;
 ScreenSenha.CLabels = Screen3_CLabels;
 ScreenSenha.CBoxesCount = 2;
 ScreenSenha.CBoxes = Screen3_CBoxes;
 ScreenSenha.Boxes_RoundCount = 0;
 ScreenSenha.LinesCount = 0;
 ScreenSenha.CLinesCount = 0;
 ScreenSenha.CheckBoxesCount = 0;
 ScreenSenha.ProgressBarsCount = 0;
 ScreenSenha.ObjectsCount = 25;

 ScreenMalhaDeControle.Color = 0xCE53;
 ScreenMalhaDeControle.Width = 240;
 ScreenMalhaDeControle.Height = 320;
 ScreenMalhaDeControle.Buttons_RoundCount = 0;
 ScreenMalhaDeControle.CButtons_RoundCount = 1;
 ScreenMalhaDeControle.CButtons_Round = Screen4_CButtons_Round;
 ScreenMalhaDeControle.LabelsCount = 5;
 ScreenMalhaDeControle.Labels = Screen4_Labels;
 ScreenMalhaDeControle.CLabelsCount = 5;
 ScreenMalhaDeControle.CLabels = Screen4_CLabels;
 ScreenMalhaDeControle.CBoxesCount = 1;
 ScreenMalhaDeControle.CBoxes = Screen4_CBoxes;
 ScreenMalhaDeControle.Boxes_RoundCount = 0;
 ScreenMalhaDeControle.LinesCount = 0;
 ScreenMalhaDeControle.CLinesCount = 0;
 ScreenMalhaDeControle.CheckBoxesCount = 2;
 ScreenMalhaDeControle.CheckBoxes = Screen4_CheckBoxes;
 ScreenMalhaDeControle.ProgressBarsCount = 0;
 ScreenMalhaDeControle.ObjectsCount = 14;

 ScreenResetInterlock.Color = 0xCE53;
 ScreenResetInterlock.Width = 240;
 ScreenResetInterlock.Height = 320;
 ScreenResetInterlock.Buttons_RoundCount = 1;
 ScreenResetInterlock.Buttons_Round = Screen5_Buttons_Round;
 ScreenResetInterlock.CButtons_RoundCount = 1;
 ScreenResetInterlock.CButtons_Round = Screen5_CButtons_Round;
 ScreenResetInterlock.LabelsCount = 4;
 ScreenResetInterlock.Labels = Screen5_Labels;
 ScreenResetInterlock.CLabelsCount = 5;
 ScreenResetInterlock.CLabels = Screen5_CLabels;
 ScreenResetInterlock.CBoxesCount = 1;
 ScreenResetInterlock.CBoxes = Screen5_CBoxes;
 ScreenResetInterlock.Boxes_RoundCount = 0;
 ScreenResetInterlock.LinesCount = 0;
 ScreenResetInterlock.CLinesCount = 0;
 ScreenResetInterlock.CheckBoxesCount = 0;
 ScreenResetInterlock.ProgressBarsCount = 0;
 ScreenResetInterlock.ObjectsCount = 12;

 ScreenOperando.Color = 0xCE53;
 ScreenOperando.Width = 240;
 ScreenOperando.Height = 320;
 ScreenOperando.Buttons_RoundCount = 0;
 ScreenOperando.CButtons_RoundCount = 1;
 ScreenOperando.CButtons_Round = Screen6_CButtons_Round;
 ScreenOperando.LabelsCount = 5;
 ScreenOperando.Labels = Screen6_Labels;
 ScreenOperando.CLabelsCount = 5;
 ScreenOperando.CLabels = Screen6_CLabels;
 ScreenOperando.CBoxesCount = 1;
 ScreenOperando.CBoxes = Screen6_CBoxes;
 ScreenOperando.Boxes_RoundCount = 0;
 ScreenOperando.LinesCount = 0;
 ScreenOperando.CLinesCount = 0;
 ScreenOperando.CheckBoxesCount = 3;
 ScreenOperando.CheckBoxes = Screen6_CheckBoxes;
 ScreenOperando.ProgressBarsCount = 0;
 ScreenOperando.ObjectsCount = 15;

 ScreenTecladoNumerico.Color = 0xCE53;
 ScreenTecladoNumerico.Width = 240;
 ScreenTecladoNumerico.Height = 320;
 ScreenTecladoNumerico.Buttons_RoundCount = 0;
 ScreenTecladoNumerico.CButtons_RoundCount = 14;
 ScreenTecladoNumerico.CButtons_Round = Screen7_CButtons_Round;
 ScreenTecladoNumerico.LabelsCount = 4;
 ScreenTecladoNumerico.Labels = Screen7_Labels;
 ScreenTecladoNumerico.CLabelsCount = 2;
 ScreenTecladoNumerico.CLabels = Screen7_CLabels;
 ScreenTecladoNumerico.CBoxesCount = 2;
 ScreenTecladoNumerico.CBoxes = Screen7_CBoxes;
 ScreenTecladoNumerico.Boxes_RoundCount = 0;
 ScreenTecladoNumerico.LinesCount = 0;
 ScreenTecladoNumerico.CLinesCount = 0;
 ScreenTecladoNumerico.CheckBoxesCount = 0;
 ScreenTecladoNumerico.ProgressBarsCount = 0;
 ScreenTecladoNumerico.ObjectsCount = 22;

 ScreenAcessoNegado.Color = 0xCE53;
 ScreenAcessoNegado.Width = 240;
 ScreenAcessoNegado.Height = 320;
 ScreenAcessoNegado.Buttons_RoundCount = 0;
 ScreenAcessoNegado.CButtons_RoundCount = 0;
 ScreenAcessoNegado.LabelsCount = 6;
 ScreenAcessoNegado.Labels = Screen8_Labels;
 ScreenAcessoNegado.CLabelsCount = 4;
 ScreenAcessoNegado.CLabels = Screen8_CLabels;
 ScreenAcessoNegado.CBoxesCount = 1;
 ScreenAcessoNegado.CBoxes = Screen8_CBoxes;
 ScreenAcessoNegado.Boxes_RoundCount = 1;
 ScreenAcessoNegado.Boxes_Round = Screen8_Boxes_Round;
 ScreenAcessoNegado.LinesCount = 0;
 ScreenAcessoNegado.CLinesCount = 0;
 ScreenAcessoNegado.CheckBoxesCount = 0;
 ScreenAcessoNegado.ProgressBarsCount = 0;
 ScreenAcessoNegado.ObjectsCount = 12;

 ScreenMENU.Color = 0xCE53;
 ScreenMENU.Width = 240;
 ScreenMENU.Height = 320;
 ScreenMENU.Buttons_RoundCount = 0;
 ScreenMENU.CButtons_RoundCount = 1;
 ScreenMENU.CButtons_Round = Screen9_CButtons_Round;
 ScreenMENU.LabelsCount = 4;
 ScreenMENU.Labels = Screen9_Labels;
 ScreenMENU.CLabelsCount = 4;
 ScreenMENU.CLabels = Screen9_CLabels;
 ScreenMENU.CBoxesCount = 1;
 ScreenMENU.CBoxes = Screen9_CBoxes;
 ScreenMENU.Boxes_RoundCount = 0;
 ScreenMENU.LinesCount = 0;
 ScreenMENU.CLinesCount = 0;
 ScreenMENU.CheckBoxesCount = 0;
 ScreenMENU.ProgressBarsCount = 0;
 ScreenMENU.ObjectsCount = 10;

 ScreenEndSerial.Color = 0xCE53;
 ScreenEndSerial.Width = 240;
 ScreenEndSerial.Height = 320;
 ScreenEndSerial.Buttons_RoundCount = 0;
 ScreenEndSerial.CButtons_RoundCount = 1;
 ScreenEndSerial.CButtons_Round = Screen10_CButtons_Round;
 ScreenEndSerial.LabelsCount = 4;
 ScreenEndSerial.Labels = Screen10_Labels;
 ScreenEndSerial.CLabelsCount = 5;
 ScreenEndSerial.CLabels = Screen10_CLabels;
 ScreenEndSerial.CBoxesCount = 1;
 ScreenEndSerial.CBoxes = Screen10_CBoxes;
 ScreenEndSerial.Boxes_RoundCount = 0;
 ScreenEndSerial.LinesCount = 0;
 ScreenEndSerial.CLinesCount = 0;
 ScreenEndSerial.CheckBoxesCount = 0;
 ScreenEndSerial.ProgressBarsCount = 0;
 ScreenEndSerial.ObjectsCount = 11;


 ProgressBar1.OwnerScreen = &ScreenInicializacao;
 ProgressBar1.Order = 0;
 ProgressBar1.Left = 5;
 ProgressBar1.Top = 228;
 ProgressBar1.Width = 230;
 ProgressBar1.Height = 17;
 ProgressBar1.Pen_Width = 1;
 ProgressBar1.Pen_Color = 0x0000;
 ProgressBar1.Visible = 1;
 ProgressBar1.Transparent = 1;
 ProgressBar1.Caption = ProgressBar1_Caption;
 ProgressBar1.FontName = Tahoma11x13_Regular;
 ProgressBar1.Font_Color = 0x0000;
 ProgressBar1.Gradient = 1;
 ProgressBar1.Gradient_Orientation = 0;
 ProgressBar1.Gradient_Start_Color = 0xFFFF;
 ProgressBar1.Gradient_End_Color = 0x07E0;
 ProgressBar1.Color = 0xA65E;
 ProgressBar1.Background_Color = 0x8410;
 ProgressBar1.Min = 0;
 ProgressBar1.Max = 100;
 ProgressBar1.Position = 50;
 ProgressBar1.Prev_Position = 50;
 ProgressBar1.Show_Position = 1;
 ProgressBar1.Show_Percentage = 1;
 ProgressBar1.Smooth = 1;
 ProgressBar1.Rounded = 1;
 ProgressBar1.Corner_Radius = 1;

 Label32.OwnerScreen = &ScreenInicializacao;
 Label32.Order = 1;
 Label32.Left = 5;
 Label32.Top = 262;
 Label32.Width = 230;
 Label32.Height = 15;
 Label32.Visible = 1;
 Label32.Active = 1;
 Label32.Caption = Label32_Caption;
 Label32.FontName = Tahoma11x13_Regular;
 Label32.Font_Color = 0x0000;
 Label32.VerticalText = 0;
 Label32.OnUpPtr = 0;
 Label32.OnDownPtr = 0;
 Label32.OnClickPtr = 0;
 Label32.OnPressPtr = 0;

 Label33.OwnerScreen = &ScreenInicializacao;
 Label33.Order = 2;
 Label33.Left = 86;
 Label33.Top = 214;
 Label33.Width = 68;
 Label33.Height = 15;
 Label33.Visible = 1;
 Label33.Active = 1;
 Label33.Caption = Label33_Caption;
 Label33.FontName = Tahoma11x13_Regular;
 Label33.Font_Color = 0x0000;
 Label33.VerticalText = 0;
 Label33.OnUpPtr = 0;
 Label33.OnDownPtr = 0;
 Label33.OnClickPtr = 0;
 Label33.OnPressPtr = 0;

 Label34.OwnerScreen = &ScreenInicializacao;
 Label34.Order = 3;
 Label34.Left = 5;
 Label34.Top = 294;
 Label34.Width = 112;
 Label34.Height = 15;
 Label34.Visible = 1;
 Label34.Active = 1;
 Label34.Caption = Label34_Caption;
 Label34.FontName = Tahoma11x13_Regular;
 Label34.Font_Color = 0x0000;
 Label34.VerticalText = 0;
 Label34.OnUpPtr = 0;
 Label34.OnDownPtr = 0;
 Label34.OnClickPtr = 0;
 Label34.OnPressPtr = 0;

 Label35.OwnerScreen = &ScreenInicializacao;
 Label35.Order = 4;
 Label35.Left = 5;
 Label35.Top = 278;
 Label35.Width = 86;
 Label35.Height = 15;
 Label35.Visible = 1;
 Label35.Active = 1;
 Label35.Caption = Label35_Caption;
 Label35.FontName = Tahoma11x13_Regular;
 Label35.Font_Color = 0x0000;
 Label35.VerticalText = 0;
 Label35.OnUpPtr = 0;
 Label35.OnDownPtr = 0;
 Label35.OnClickPtr = 0;
 Label35.OnPressPtr = 0;

 Line2.OwnerScreen = &ScreenInicializacao;
 Line2.Order = 5;
 Line2.First_Point_X = 1;
 Line2.First_Point_Y = 30;
 Line2.Second_Point_X = 237;
 Line2.Second_Point_Y = 30;
 Line2.Visible = 1;
 Line2.Pen_Width = 1;
 Line2.Color = 0x0000;

 Label36.OwnerScreen = &ScreenInicializacao;
 Label36.Order = 6;
 Label36.Left = 7;
 Label36.Top = 16;
 Label36.Width = 88;
 Label36.Height = 15;
 Label36.Visible = 1;
 Label36.Active = 1;
 Label36.Caption = Label36_Caption;
 Label36.FontName = Tahoma11x13_Regular;
 Label36.Font_Color = 0x0000;
 Label36.VerticalText = 0;
 Label36.OnUpPtr = 0;
 Label36.OnDownPtr = 0;
 Label36.OnClickPtr = 0;
 Label36.OnPressPtr = 0;

 Label37.OwnerScreen = &ScreenInicializacao;
 Label37.Order = 7;
 Label37.Left = 118;
 Label37.Top = 294;
 Label37.Width = 41;
 Label37.Height = 15;
 Label37.Visible = 1;
 Label37.Active = 1;
 Label37.Caption = Label37_Caption;
 Label37.FontName = Tahoma11x13_Regular;
 Label37.Font_Color = 0x0000;
 Label37.VerticalText = 0;
 Label37.OnUpPtr = 0;
 Label37.OnDownPtr = 0;
 Label37.OnClickPtr = 0;
 Label37.OnPressPtr = 0;

 ButtonRound2.OwnerScreen = &ScreenPrincipal;
 ButtonRound2.Order = 11;
 ButtonRound2.Left = 160;
 ButtonRound2.Top = 276;
 ButtonRound2.Width = 70;
 ButtonRound2.Height = 35;
 ButtonRound2.Pen_Width = 1;
 ButtonRound2.Pen_Color = 0x0000;
 ButtonRound2.Visible = 1;
 ButtonRound2.Active = 1;
 ButtonRound2.Transparent = 1;
 ButtonRound2.Caption = ButtonRound2_Caption;
 ButtonRound2.TextAlign = _taCenter;
 ButtonRound2.TextAlignVertical= _tavMiddle;
 ButtonRound2.FontName = Tahoma14x16_Bold;
 ButtonRound2.PressColEnabled = 1;
 ButtonRound2.Font_Color = 0x0000;
 ButtonRound2.VerticalText = 0;
 ButtonRound2.Gradient = 1;
 ButtonRound2.Gradient_Orientation = 0;
 ButtonRound2.Gradient_Start_Color = 0xFFFF;
 ButtonRound2.Gradient_End_Color = 0xC618;
 ButtonRound2.Color = 0xC618;
 ButtonRound2.Press_Color = 0xE71C;
 ButtonRound2.Corner_Radius = 3;
 ButtonRound2.OnUpPtr = 0;
 ButtonRound2.OnDownPtr = 0;
 ButtonRound2.OnClickPtr = buttonMENU;
 ButtonRound2.OnPressPtr = 0;

 Label26.OwnerScreen = &ScreenPrincipal;
 Label26.Order = 14;
 Label26.Left = 158;
 Label26.Top = 147;
 Label26.Width = 60;
 Label26.Height = 23;
 Label26.Visible = 1;
 Label26.Active = 1;
 Label26.Caption = Label26_Caption;
 Label26.FontName = Tahoma20x21_Bold;
 Label26.Font_Color = 0xFFFF;
 Label26.VerticalText = 0;
 Label26.OnUpPtr = 0;
 Label26.OnDownPtr = 0;
 Label26.OnClickPtr = 0;
 Label26.OnPressPtr = 0;

 Label28.OwnerScreen = &ScreenPrincipal;
 Label28.Order = 15;
 Label28.Left = 158;
 Label28.Top = 56;
 Label28.Width = 60;
 Label28.Height = 23;
 Label28.Visible = 1;
 Label28.Active = 1;
 Label28.Caption = Label28_Caption;
 Label28.FontName = Tahoma20x21_Bold;
 Label28.Font_Color = 0xFFFF;
 Label28.VerticalText = 0;
 Label28.OnUpPtr = 0;
 Label28.OnDownPtr = 0;
 Label28.OnClickPtr = 0;
 Label28.OnPressPtr = 0;

 Label29.OwnerScreen = &ScreenPrincipal;
 Label29.Order = 16;
 Label29.Left = 98;
 Label29.Top = 193;
 Label29.Width = 60;
 Label29.Height = 23;
 Label29.Visible = 1;
 Label29.Active = 1;
 Label29.Caption = Label29_Caption;
 Label29.FontName = Tahoma20x21_Bold;
 Label29.Font_Color = 0xFFFF;
 Label29.VerticalText = 0;
 Label29.OnUpPtr = 0;
 Label29.OnDownPtr = 0;
 Label29.OnClickPtr = 0;
 Label29.OnPressPtr = 0;

 Label30.OwnerScreen = &ScreenPrincipal;
 Label30.Order = 17;
 Label30.Left = 158;
 Label30.Top = 102;
 Label30.Width = 60;
 Label30.Height = 23;
 Label30.Visible = 1;
 Label30.Active = 1;
 Label30.Caption = Label30_Caption;
 Label30.FontName = Tahoma20x21_Bold;
 Label30.Font_Color = 0xFFFF;
 Label30.VerticalText = 0;
 Label30.OnUpPtr = 0;
 Label30.OnDownPtr = 0;
 Label30.OnClickPtr = 0;
 Label30.OnPressPtr = 0;

 Label31.OwnerScreen = &ScreenPrincipal;
 Label31.Order = 18;
 Label31.Left = 158;
 Label31.Top = 238;
 Label31.Width = 60;
 Label31.Height = 23;
 Label31.Visible = 1;
 Label31.Active = 1;
 Label31.Caption = Label31_Caption;
 Label31.FontName = Tahoma20x21_Bold;
 Label31.Font_Color = 0xFFFF;
 Label31.VerticalText = 0;
 Label31.OnUpPtr = 0;
 Label31.OnDownPtr = 0;
 Label31.OnClickPtr = 0;
 Label31.OnPressPtr = 0;

 Label44.OwnerScreen = &ScreenPrincipal;
 Label44.Order = 19;
 Label44.Left = 185;
 Label44.Top = 23;
 Label44.Width = 39;
 Label44.Height = 17;
 Label44.Visible = 1;
 Label44.Active = 1;
 Label44.Caption = Label44_Caption;
 Label44.FontName = Tahoma12x16_Regular;
 Label44.Font_Color = 0x0000;
 Label44.VerticalText = 0;
 Label44.OnUpPtr = 0;
 Label44.OnDownPtr = 0;
 Label44.OnClickPtr = 0;
 Label44.OnPressPtr = 0;

 Label45.OwnerScreen = &ScreenPrincipal;
 Label45.Order = 20;
 Label45.Left = 185;
 Label45.Top = 2;
 Label45.Width = 39;
 Label45.Height = 17;
 Label45.Visible = 1;
 Label45.Active = 1;
 Label45.Caption = Label45_Caption;
 Label45.FontName = Tahoma12x16_Regular;
 Label45.Font_Color = 0x0000;
 Label45.VerticalText = 0;
 Label45.OnUpPtr = 0;
 Label45.OnDownPtr = 0;
 Label45.OnClickPtr = 0;
 Label45.OnPressPtr = 0;

 Label46.OwnerScreen = &ScreenPrincipal;
 Label46.Order = 21;
 Label46.Left = 45;
 Label46.Top = 2;
 Label46.Width = 39;
 Label46.Height = 17;
 Label46.Visible = 1;
 Label46.Active = 1;
 Label46.Caption = Label46_Caption;
 Label46.FontName = Tahoma12x16_Regular;
 Label46.Font_Color = 0x0000;
 Label46.VerticalText = 0;
 Label46.OnUpPtr = 0;
 Label46.OnDownPtr = 0;
 Label46.OnClickPtr = 0;
 Label46.OnPressPtr = 0;

 Label47.OwnerScreen = &ScreenPrincipal;
 Label47.Order = 22;
 Label47.Left = 45;
 Label47.Top = 23;
 Label47.Width = 39;
 Label47.Height = 17;
 Label47.Visible = 1;
 Label47.Active = 1;
 Label47.Caption = Label47_Caption;
 Label47.FontName = Tahoma12x16_Regular;
 Label47.Font_Color = 0x0000;
 Label47.VerticalText = 0;
 Label47.OnUpPtr = 0;
 Label47.OnDownPtr = 0;
 Label47.OnClickPtr = 0;
 Label47.OnPressPtr = 0;

 Label15.OwnerScreen = &ScreenSenha;
 Label15.Order = 15;
 Label15.Left = 62;
 Label15.Top = 58;
 Label15.Width = 0;
 Label15.Height = 23;
 Label15.Visible = 1;
 Label15.Active = 0;
 Label15.Caption = Label15_Caption;
 Label15.FontName = Tahoma20x21_Bold;
 Label15.Font_Color = 0xFFFF;
 Label15.VerticalText = 0;
 Label15.OnUpPtr = 0;
 Label15.OnDownPtr = 0;
 Label15.OnClickPtr = 0;
 Label15.OnPressPtr = 0;

 Label48.OwnerScreen = &ScreenSenha;
 Label48.Order = 17;
 Label48.Left = 185;
 Label48.Top = 23;
 Label48.Width = 39;
 Label48.Height = 17;
 Label48.Visible = 1;
 Label48.Active = 1;
 Label48.Caption = Label48_Caption;
 Label48.FontName = Tahoma12x16_Regular;
 Label48.Font_Color = 0x0000;
 Label48.VerticalText = 0;
 Label48.OnUpPtr = 0;
 Label48.OnDownPtr = 0;
 Label48.OnClickPtr = 0;
 Label48.OnPressPtr = 0;

 Label49.OwnerScreen = &ScreenSenha;
 Label49.Order = 18;
 Label49.Left = 185;
 Label49.Top = 3;
 Label49.Width = 39;
 Label49.Height = 17;
 Label49.Visible = 1;
 Label49.Active = 1;
 Label49.Caption = Label49_Caption;
 Label49.FontName = Tahoma12x16_Regular;
 Label49.Font_Color = 0x0000;
 Label49.VerticalText = 0;
 Label49.OnUpPtr = 0;
 Label49.OnDownPtr = 0;
 Label49.OnClickPtr = 0;
 Label49.OnPressPtr = 0;

 Label50.OwnerScreen = &ScreenSenha;
 Label50.Order = 19;
 Label50.Left = 45;
 Label50.Top = 3;
 Label50.Width = 39;
 Label50.Height = 17;
 Label50.Visible = 1;
 Label50.Active = 1;
 Label50.Caption = Label50_Caption;
 Label50.FontName = Tahoma12x16_Regular;
 Label50.Font_Color = 0x0000;
 Label50.VerticalText = 0;
 Label50.OnUpPtr = 0;
 Label50.OnDownPtr = 0;
 Label50.OnClickPtr = 0;
 Label50.OnPressPtr = 0;

 Label51.OwnerScreen = &ScreenSenha;
 Label51.Order = 20;
 Label51.Left = 45;
 Label51.Top = 23;
 Label51.Width = 39;
 Label51.Height = 17;
 Label51.Visible = 1;
 Label51.Active = 1;
 Label51.Caption = Label51_Caption;
 Label51.FontName = Tahoma12x16_Regular;
 Label51.Font_Color = 0x0000;
 Label51.VerticalText = 0;
 Label51.OnUpPtr = 0;
 Label51.OnDownPtr = 0;
 Label51.OnClickPtr = 0;
 Label51.OnPressPtr = 0;

 Label27.OwnerScreen = &ScreenMalhaDeControle;
 Label27.Order = 2;
 Label27.Left = 153;
 Label27.Top = 59;
 Label27.Width = 60;
 Label27.Height = 23;
 Label27.Visible = 1;
 Label27.Active = 1;
 Label27.Caption = Label27_Caption;
 Label27.FontName = Tahoma20x21_Bold;
 Label27.Font_Color = 0x0000;
 Label27.VerticalText = 0;
 Label27.OnUpPtr = 0;
 Label27.OnDownPtr = 0;
 Label27.OnClickPtr = 0;
 Label27.OnPressPtr = 0;

 CheckBox1.OwnerScreen = &ScreenMalhaDeControle;
 CheckBox1.Order = 4;
 CheckBox1.Left = 38;
 CheckBox1.Top = 127;
 CheckBox1.Width = 91;
 CheckBox1.Height = 28;
 CheckBox1.Pen_Width = 1;
 CheckBox1.Pen_Color = 0x0000;
 CheckBox1.Visible = 1;
 CheckBox1.Active = 1;
 CheckBox1.Checked = 0;
 CheckBox1.Transparent = 1;
 CheckBox1.Caption = CheckBox1_Caption;
 CheckBox1.TextAlign = _taLeft;
 CheckBox1.FontName = Tahoma20x21_Bold;
 CheckBox1.PressColEnabled = 1;
 CheckBox1.Font_Color = 0x0000;
 CheckBox1.Gradient = 1;
 CheckBox1.Gradient_Orientation = 0;
 CheckBox1.Gradient_Start_Color = 0xFFFF;
 CheckBox1.Gradient_End_Color = 0xC618;
 CheckBox1.Color = 0xC618;
 CheckBox1.Press_Color = 0xE71C;
 CheckBox1.Rounded = 1;
 CheckBox1.Corner_Radius = 3;
 CheckBox1.OnUpPtr = 0;
 CheckBox1.OnDownPtr = 0;
 CheckBox1.OnClickPtr = malhaAberta;
 CheckBox1.OnPressPtr = 0;

 CheckBox2.OwnerScreen = &ScreenMalhaDeControle;
 CheckBox2.Order = 5;
 CheckBox2.Left = 38;
 CheckBox2.Top = 201;
 CheckBox2.Width = 105;
 CheckBox2.Height = 28;
 CheckBox2.Pen_Width = 1;
 CheckBox2.Pen_Color = 0x0000;
 CheckBox2.Visible = 1;
 CheckBox2.Active = 1;
 CheckBox2.Checked = 0;
 CheckBox2.Transparent = 1;
 CheckBox2.Caption = CheckBox2_Caption;
 CheckBox2.TextAlign = _taLeft;
 CheckBox2.FontName = Tahoma20x21_Bold;
 CheckBox2.PressColEnabled = 1;
 CheckBox2.Font_Color = 0x0000;
 CheckBox2.Gradient = 1;
 CheckBox2.Gradient_Orientation = 0;
 CheckBox2.Gradient_Start_Color = 0xFFFF;
 CheckBox2.Gradient_End_Color = 0xC618;
 CheckBox2.Color = 0xC618;
 CheckBox2.Press_Color = 0xE71C;
 CheckBox2.Rounded = 1;
 CheckBox2.Corner_Radius = 3;
 CheckBox2.OnUpPtr = 0;
 CheckBox2.OnDownPtr = 0;
 CheckBox2.OnClickPtr = malhaFechada;
 CheckBox2.OnPressPtr = 0;

 Label52.OwnerScreen = &ScreenMalhaDeControle;
 Label52.Order = 6;
 Label52.Left = 185;
 Label52.Top = 23;
 Label52.Width = 39;
 Label52.Height = 17;
 Label52.Visible = 1;
 Label52.Active = 1;
 Label52.Caption = Label52_Caption;
 Label52.FontName = Tahoma12x16_Regular;
 Label52.Font_Color = 0x0000;
 Label52.VerticalText = 0;
 Label52.OnUpPtr = 0;
 Label52.OnDownPtr = 0;
 Label52.OnClickPtr = 0;
 Label52.OnPressPtr = 0;

 Label53.OwnerScreen = &ScreenMalhaDeControle;
 Label53.Order = 7;
 Label53.Left = 185;
 Label53.Top = 2;
 Label53.Width = 39;
 Label53.Height = 17;
 Label53.Visible = 1;
 Label53.Active = 1;
 Label53.Caption = Label53_Caption;
 Label53.FontName = Tahoma12x16_Regular;
 Label53.Font_Color = 0x0000;
 Label53.VerticalText = 0;
 Label53.OnUpPtr = 0;
 Label53.OnDownPtr = 0;
 Label53.OnClickPtr = 0;
 Label53.OnPressPtr = 0;

 Label54.OwnerScreen = &ScreenMalhaDeControle;
 Label54.Order = 8;
 Label54.Left = 45;
 Label54.Top = 2;
 Label54.Width = 39;
 Label54.Height = 17;
 Label54.Visible = 1;
 Label54.Active = 1;
 Label54.Caption = Label54_Caption;
 Label54.FontName = Tahoma12x16_Regular;
 Label54.Font_Color = 0x0000;
 Label54.VerticalText = 0;
 Label54.OnUpPtr = 0;
 Label54.OnDownPtr = 0;
 Label54.OnClickPtr = 0;
 Label54.OnPressPtr = 0;

 Label55.OwnerScreen = &ScreenMalhaDeControle;
 Label55.Order = 9;
 Label55.Left = 45;
 Label55.Top = 23;
 Label55.Width = 39;
 Label55.Height = 17;
 Label55.Visible = 1;
 Label55.Active = 1;
 Label55.Caption = Label55_Caption;
 Label55.FontName = Tahoma12x16_Regular;
 Label55.Font_Color = 0x0000;
 Label55.VerticalText = 0;
 Label55.OnUpPtr = 0;
 Label55.OnDownPtr = 0;
 Label55.OnClickPtr = 0;
 Label55.OnPressPtr = 0;

 ButtonRound6.OwnerScreen = &ScreenResetInterlock;
 ButtonRound6.Order = 3;
 ButtonRound6.Left = 160;
 ButtonRound6.Top = 276;
 ButtonRound6.Width = 70;
 ButtonRound6.Height = 35;
 ButtonRound6.Pen_Width = 1;
 ButtonRound6.Pen_Color = 0x0000;
 ButtonRound6.Visible = 1;
 ButtonRound6.Active = 1;
 ButtonRound6.Transparent = 1;
 ButtonRound6.Caption = ButtonRound6_Caption;
 ButtonRound6.TextAlign = _taCenter;
 ButtonRound6.TextAlignVertical= _tavMiddle;
 ButtonRound6.FontName = Tahoma14x16_Bold;
 ButtonRound6.PressColEnabled = 1;
 ButtonRound6.Font_Color = 0x0000;
 ButtonRound6.VerticalText = 0;
 ButtonRound6.Gradient = 1;
 ButtonRound6.Gradient_Orientation = 0;
 ButtonRound6.Gradient_Start_Color = 0xB000;
 ButtonRound6.Gradient_End_Color = 0xC618;
 ButtonRound6.Color = 0xC618;
 ButtonRound6.Press_Color = 0xE71C;
 ButtonRound6.Corner_Radius = 3;
 ButtonRound6.OnUpPtr = 0;
 ButtonRound6.OnDownPtr = 0;
 ButtonRound6.OnClickPtr = resetInterlock;
 ButtonRound6.OnPressPtr = 0;

 Label56.OwnerScreen = &ScreenResetInterlock;
 Label56.Order = 4;
 Label56.Left = 185;
 Label56.Top = 23;
 Label56.Width = 39;
 Label56.Height = 17;
 Label56.Visible = 1;
 Label56.Active = 1;
 Label56.Caption = Label56_Caption;
 Label56.FontName = Tahoma12x16_Regular;
 Label56.Font_Color = 0x0000;
 Label56.VerticalText = 0;
 Label56.OnUpPtr = 0;
 Label56.OnDownPtr = 0;
 Label56.OnClickPtr = 0;
 Label56.OnPressPtr = 0;

 Label57.OwnerScreen = &ScreenResetInterlock;
 Label57.Order = 5;
 Label57.Left = 185;
 Label57.Top = 2;
 Label57.Width = 39;
 Label57.Height = 17;
 Label57.Visible = 1;
 Label57.Active = 1;
 Label57.Caption = Label57_Caption;
 Label57.FontName = Tahoma12x16_Regular;
 Label57.Font_Color = 0x0000;
 Label57.VerticalText = 0;
 Label57.OnUpPtr = 0;
 Label57.OnDownPtr = 0;
 Label57.OnClickPtr = 0;
 Label57.OnPressPtr = 0;

 Label58.OwnerScreen = &ScreenResetInterlock;
 Label58.Order = 6;
 Label58.Left = 45;
 Label58.Top = 2;
 Label58.Width = 39;
 Label58.Height = 17;
 Label58.Visible = 1;
 Label58.Active = 1;
 Label58.Caption = Label58_Caption;
 Label58.FontName = Tahoma12x16_Regular;
 Label58.Font_Color = 0x0000;
 Label58.VerticalText = 0;
 Label58.OnUpPtr = 0;
 Label58.OnDownPtr = 0;
 Label58.OnClickPtr = 0;
 Label58.OnPressPtr = 0;

 Label59.OwnerScreen = &ScreenResetInterlock;
 Label59.Order = 7;
 Label59.Left = 45;
 Label59.Top = 23;
 Label59.Width = 39;
 Label59.Height = 17;
 Label59.Visible = 1;
 Label59.Active = 1;
 Label59.Caption = Label59_Caption;
 Label59.FontName = Tahoma12x16_Regular;
 Label59.Font_Color = 0x0000;
 Label59.VerticalText = 0;
 Label59.OnUpPtr = 0;
 Label59.OnDownPtr = 0;
 Label59.OnClickPtr = 0;
 Label59.OnPressPtr = 0;

 Label43.OwnerScreen = &ScreenOperando;
 Label43.Order = 2;
 Label43.Left = 153;
 Label43.Top = 59;
 Label43.Width = 60;
 Label43.Height = 23;
 Label43.Visible = 1;
 Label43.Active = 1;
 Label43.Caption = Label43_Caption;
 Label43.FontName = Tahoma20x21_Bold;
 Label43.Font_Color = 0x0000;
 Label43.VerticalText = 0;
 Label43.OnUpPtr = 0;
 Label43.OnDownPtr = 0;
 Label43.OnClickPtr = 0;
 Label43.OnPressPtr = 0;

 CheckBox3.OwnerScreen = &ScreenOperando;
 CheckBox3.Order = 4;
 CheckBox3.Left = 38;
 CheckBox3.Top = 108;
 CheckBox3.Width = 101;
 CheckBox3.Height = 28;
 CheckBox3.Pen_Width = 1;
 CheckBox3.Pen_Color = 0x0000;
 CheckBox3.Visible = 1;
 CheckBox3.Active = 1;
 CheckBox3.Checked = 0;
 CheckBox3.Transparent = 1;
 CheckBox3.Caption = CheckBox3_Caption;
 CheckBox3.TextAlign = _taLeft;
 CheckBox3.FontName = Tahoma20x21_Bold;
 CheckBox3.PressColEnabled = 1;
 CheckBox3.Font_Color = 0x0000;
 CheckBox3.Gradient = 1;
 CheckBox3.Gradient_Orientation = 0;
 CheckBox3.Gradient_Start_Color = 0xFFFF;
 CheckBox3.Gradient_End_Color = 0xC618;
 CheckBox3.Color = 0xC618;
 CheckBox3.Press_Color = 0xE71C;
 CheckBox3.Rounded = 1;
 CheckBox3.Corner_Radius = 3;
 CheckBox3.OnUpPtr = 0;
 CheckBox3.OnDownPtr = 0;
 CheckBox3.OnClickPtr = modoRemoto;
 CheckBox3.OnPressPtr = 0;

 CheckBox4.OwnerScreen = &ScreenOperando;
 CheckBox4.Order = 5;
 CheckBox4.Left = 38;
 CheckBox4.Top = 164;
 CheckBox4.Width = 78;
 CheckBox4.Height = 28;
 CheckBox4.Pen_Width = 1;
 CheckBox4.Pen_Color = 0x0000;
 CheckBox4.Visible = 1;
 CheckBox4.Active = 1;
 CheckBox4.Checked = 0;
 CheckBox4.Transparent = 1;
 CheckBox4.Caption = CheckBox4_Caption;
 CheckBox4.TextAlign = _taLeft;
 CheckBox4.FontName = Tahoma20x21_Bold;
 CheckBox4.PressColEnabled = 1;
 CheckBox4.Font_Color = 0x0000;
 CheckBox4.Gradient = 1;
 CheckBox4.Gradient_Orientation = 0;
 CheckBox4.Gradient_Start_Color = 0xFFFF;
 CheckBox4.Gradient_End_Color = 0xC618;
 CheckBox4.Color = 0xC618;
 CheckBox4.Press_Color = 0xE71C;
 CheckBox4.Rounded = 1;
 CheckBox4.Corner_Radius = 3;
 CheckBox4.OnUpPtr = 0;
 CheckBox4.OnDownPtr = 0;
 CheckBox4.OnClickPtr = modoLocal;
 CheckBox4.OnPressPtr = 0;

 CheckBox5.OwnerScreen = &ScreenOperando;
 CheckBox5.Order = 6;
 CheckBox5.Left = 38;
 CheckBox5.Top = 220;
 CheckBox5.Width = 101;
 CheckBox5.Height = 28;
 CheckBox5.Pen_Width = 1;
 CheckBox5.Pen_Color = 0x0000;
 CheckBox5.Visible = 1;
 CheckBox5.Active = 1;
 CheckBox5.Checked = 0;
 CheckBox5.Transparent = 1;
 CheckBox5.Caption = CheckBox5_Caption;
 CheckBox5.TextAlign = _taLeft;
 CheckBox5.FontName = Tahoma20x21_Bold;
 CheckBox5.PressColEnabled = 1;
 CheckBox5.Font_Color = 0x0000;
 CheckBox5.Gradient = 1;
 CheckBox5.Gradient_Orientation = 0;
 CheckBox5.Gradient_Start_Color = 0xFFFF;
 CheckBox5.Gradient_End_Color = 0xC618;
 CheckBox5.Color = 0xC618;
 CheckBox5.Press_Color = 0xE71C;
 CheckBox5.Rounded = 1;
 CheckBox5.Corner_Radius = 3;
 CheckBox5.OnUpPtr = 0;
 CheckBox5.OnDownPtr = 0;
 CheckBox5.OnClickPtr = modoPCHost;
 CheckBox5.OnPressPtr = 0;

 Label60.OwnerScreen = &ScreenOperando;
 Label60.Order = 7;
 Label60.Left = 185;
 Label60.Top = 23;
 Label60.Width = 39;
 Label60.Height = 17;
 Label60.Visible = 1;
 Label60.Active = 1;
 Label60.Caption = Label60_Caption;
 Label60.FontName = Tahoma12x16_Regular;
 Label60.Font_Color = 0x0000;
 Label60.VerticalText = 0;
 Label60.OnUpPtr = 0;
 Label60.OnDownPtr = 0;
 Label60.OnClickPtr = 0;
 Label60.OnPressPtr = 0;

 Label61.OwnerScreen = &ScreenOperando;
 Label61.Order = 8;
 Label61.Left = 185;
 Label61.Top = 2;
 Label61.Width = 39;
 Label61.Height = 17;
 Label61.Visible = 1;
 Label61.Active = 1;
 Label61.Caption = Label61_Caption;
 Label61.FontName = Tahoma12x16_Regular;
 Label61.Font_Color = 0x0000;
 Label61.VerticalText = 0;
 Label61.OnUpPtr = 0;
 Label61.OnDownPtr = 0;
 Label61.OnClickPtr = 0;
 Label61.OnPressPtr = 0;

 Label62.OwnerScreen = &ScreenOperando;
 Label62.Order = 9;
 Label62.Left = 45;
 Label62.Top = 2;
 Label62.Width = 39;
 Label62.Height = 17;
 Label62.Visible = 1;
 Label62.Active = 1;
 Label62.Caption = Label62_Caption;
 Label62.FontName = Tahoma12x16_Regular;
 Label62.Font_Color = 0x0000;
 Label62.VerticalText = 0;
 Label62.OnUpPtr = 0;
 Label62.OnDownPtr = 0;
 Label62.OnClickPtr = 0;
 Label62.OnPressPtr = 0;

 Label63.OwnerScreen = &ScreenOperando;
 Label63.Order = 10;
 Label63.Left = 45;
 Label63.Top = 23;
 Label63.Width = 39;
 Label63.Height = 17;
 Label63.Visible = 1;
 Label63.Active = 1;
 Label63.Caption = Label63_Caption;
 Label63.FontName = Tahoma12x16_Regular;
 Label63.Font_Color = 0x0000;
 Label63.VerticalText = 0;
 Label63.OnUpPtr = 0;
 Label63.OnDownPtr = 0;
 Label63.OnClickPtr = 0;
 Label63.OnPressPtr = 0;

 Label64.OwnerScreen = &ScreenTecladoNumerico;
 Label64.Order = 16;
 Label64.Left = 8;
 Label64.Top = 25;
 Label64.Width = 80;
 Label64.Height = 20;
 Label64.Visible = 1;
 Label64.Active = 1;
 Label64.Caption = Label64_Caption;
 Label64.FontName = Tahoma15x18_Regular;
 Label64.Font_Color = 0x0000;
 Label64.VerticalText = 0;
 Label64.OnUpPtr = 0;
 Label64.OnDownPtr = 0;
 Label64.OnClickPtr = 0;
 Label64.OnPressPtr = 0;

 Label66.OwnerScreen = &ScreenTecladoNumerico;
 Label66.Order = 19;
 Label66.Left = 62;
 Label66.Top = 58;
 Label66.Width = 0;
 Label66.Height = 23;
 Label66.Visible = 1;
 Label66.Active = 1;
 Label66.Caption = Label66_Caption;
 Label66.FontName = Tahoma20x21_Bold;
 Label66.Font_Color = 0xFFFF;
 Label66.VerticalText = 0;
 Label66.OnUpPtr = 0;
 Label66.OnDownPtr = 0;
 Label66.OnClickPtr = 0;
 Label66.OnPressPtr = 0;

 Label86.OwnerScreen = &ScreenTecladoNumerico;
 Label86.Order = 20;
 Label86.Left = 112;
 Label86.Top = 8;
 Label86.Width = 0;
 Label86.Height = 15;
 Label86.Visible = 1;
 Label86.Active = 1;
 Label86.Caption = Label86_Caption;
 Label86.FontName = Tahoma11x13_Regular;
 Label86.Font_Color = 0x0000;
 Label86.VerticalText = 0;
 Label86.OnUpPtr = 0;
 Label86.OnDownPtr = 0;
 Label86.OnClickPtr = 0;
 Label86.OnPressPtr = 0;

 Label87.OwnerScreen = &ScreenTecladoNumerico;
 Label87.Order = 21;
 Label87.Left = 112;
 Label87.Top = 30;
 Label87.Width = 0;
 Label87.Height = 15;
 Label87.Visible = 1;
 Label87.Active = 1;
 Label87.Caption = Label87_Caption;
 Label87.FontName = Tahoma11x13_Regular;
 Label87.Font_Color = 0x0000;
 Label87.VerticalText = 0;
 Label87.OnUpPtr = 0;
 Label87.OnDownPtr = 0;
 Label87.OnClickPtr = 0;
 Label87.OnPressPtr = 0;

 Label67.OwnerScreen = &ScreenAcessoNegado;
 Label67.Order = 1;
 Label67.Left = 185;
 Label67.Top = 23;
 Label67.Width = 39;
 Label67.Height = 17;
 Label67.Visible = 1;
 Label67.Active = 1;
 Label67.Caption = Label67_Caption;
 Label67.FontName = Tahoma12x16_Regular;
 Label67.Font_Color = 0x0000;
 Label67.VerticalText = 0;
 Label67.OnUpPtr = 0;
 Label67.OnDownPtr = 0;
 Label67.OnClickPtr = 0;
 Label67.OnPressPtr = 0;

 Label68.OwnerScreen = &ScreenAcessoNegado;
 Label68.Order = 2;
 Label68.Left = 185;
 Label68.Top = 3;
 Label68.Width = 39;
 Label68.Height = 17;
 Label68.Visible = 1;
 Label68.Active = 1;
 Label68.Caption = Label68_Caption;
 Label68.FontName = Tahoma12x16_Regular;
 Label68.Font_Color = 0x0000;
 Label68.VerticalText = 0;
 Label68.OnUpPtr = 0;
 Label68.OnDownPtr = 0;
 Label68.OnClickPtr = 0;
 Label68.OnPressPtr = 0;

 Label69.OwnerScreen = &ScreenAcessoNegado;
 Label69.Order = 3;
 Label69.Left = 45;
 Label69.Top = 3;
 Label69.Width = 39;
 Label69.Height = 17;
 Label69.Visible = 1;
 Label69.Active = 1;
 Label69.Caption = Label69_Caption;
 Label69.FontName = Tahoma12x16_Regular;
 Label69.Font_Color = 0x0000;
 Label69.VerticalText = 0;
 Label69.OnUpPtr = 0;
 Label69.OnDownPtr = 0;
 Label69.OnClickPtr = 0;
 Label69.OnPressPtr = 0;

 Label71.OwnerScreen = &ScreenAcessoNegado;
 Label71.Order = 4;
 Label71.Left = 45;
 Label71.Top = 23;
 Label71.Width = 39;
 Label71.Height = 17;
 Label71.Visible = 1;
 Label71.Active = 1;
 Label71.Caption = Label71_Caption;
 Label71.FontName = Tahoma12x16_Regular;
 Label71.Font_Color = 0x0000;
 Label71.VerticalText = 0;
 Label71.OnUpPtr = 0;
 Label71.OnDownPtr = 0;
 Label71.OnClickPtr = 0;
 Label71.OnPressPtr = 0;

 BoxRound1.OwnerScreen = &ScreenAcessoNegado;
 BoxRound1.Order = 9;
 BoxRound1.Left = 19;
 BoxRound1.Top = 70;
 BoxRound1.Width = 201;
 BoxRound1.Height = 159;
 BoxRound1.Pen_Width = 1;
 BoxRound1.Pen_Color = 0x0000;
 BoxRound1.Visible = 1;
 BoxRound1.Active = 0;
 BoxRound1.Transparent = 1;
 BoxRound1.Gradient = 1;
 BoxRound1.Gradient_Orientation = 0;
 BoxRound1.Gradient_Start_Color = 0x0000;
 BoxRound1.Gradient_End_Color = 0x0000;
 BoxRound1.Color = 0xC618;
 BoxRound1.PressColEnabled = 1;
 BoxRound1.Press_Color = 0xE71C;
 BoxRound1.Corner_Radius = 3;
 BoxRound1.OnUpPtr = 0;
 BoxRound1.OnDownPtr = 0;
 BoxRound1.OnClickPtr = 0;
 BoxRound1.OnPressPtr = 0;

 Label76.OwnerScreen = &ScreenAcessoNegado;
 Label76.Order = 10;
 Label76.Left = 73;
 Label76.Top = 132;
 Label76.Width = 94;
 Label76.Height = 36;
 Label76.Visible = 1;
 Label76.Active = 1;
 Label76.Caption = Label76_Caption;
 Label76.FontName = Tahoma26x33_Regular;
 Label76.Font_Color = 0xFFFF;
 Label76.VerticalText = 0;
 Label76.OnUpPtr = 0;
 Label76.OnDownPtr = 0;
 Label76.OnClickPtr = 0;
 Label76.OnPressPtr = 0;

 Label77.OwnerScreen = &ScreenAcessoNegado;
 Label77.Order = 11;
 Label77.Left = 93;
 Label77.Top = 104;
 Label77.Width = 53;
 Label77.Height = 23;
 Label77.Visible = 1;
 Label77.Active = 1;
 Label77.Caption = Label77_Caption;
 Label77.FontName = Tahoma17x21_Regular;
 Label77.Font_Color = 0xFFFF;
 Label77.VerticalText = 0;
 Label77.OnUpPtr = 0;
 Label77.OnDownPtr = 0;
 Label77.OnClickPtr = 0;
 Label77.OnPressPtr = 0;

 Label78.OwnerScreen = &ScreenMENU;
 Label78.Order = 2;
 Label78.Left = 185;
 Label78.Top = 23;
 Label78.Width = 39;
 Label78.Height = 17;
 Label78.Visible = 1;
 Label78.Active = 1;
 Label78.Caption = Label78_Caption;
 Label78.FontName = Tahoma12x16_Regular;
 Label78.Font_Color = 0x0000;
 Label78.VerticalText = 0;
 Label78.OnUpPtr = 0;
 Label78.OnDownPtr = 0;
 Label78.OnClickPtr = 0;
 Label78.OnPressPtr = 0;

 Label79.OwnerScreen = &ScreenMENU;
 Label79.Order = 3;
 Label79.Left = 185;
 Label79.Top = 3;
 Label79.Width = 39;
 Label79.Height = 17;
 Label79.Visible = 1;
 Label79.Active = 1;
 Label79.Caption = Label79_Caption;
 Label79.FontName = Tahoma12x16_Regular;
 Label79.Font_Color = 0x0000;
 Label79.VerticalText = 0;
 Label79.OnUpPtr = 0;
 Label79.OnDownPtr = 0;
 Label79.OnClickPtr = 0;
 Label79.OnPressPtr = 0;

 Label80.OwnerScreen = &ScreenMENU;
 Label80.Order = 4;
 Label80.Left = 45;
 Label80.Top = 3;
 Label80.Width = 39;
 Label80.Height = 17;
 Label80.Visible = 1;
 Label80.Active = 1;
 Label80.Caption = Label80_Caption;
 Label80.FontName = Tahoma12x16_Regular;
 Label80.Font_Color = 0x0000;
 Label80.VerticalText = 0;
 Label80.OnUpPtr = 0;
 Label80.OnDownPtr = 0;
 Label80.OnClickPtr = 0;
 Label80.OnPressPtr = 0;

 Label81.OwnerScreen = &ScreenMENU;
 Label81.Order = 5;
 Label81.Left = 45;
 Label81.Top = 23;
 Label81.Width = 39;
 Label81.Height = 17;
 Label81.Visible = 1;
 Label81.Active = 1;
 Label81.Caption = Label81_Caption;
 Label81.FontName = Tahoma12x16_Regular;
 Label81.Font_Color = 0x0000;
 Label81.VerticalText = 0;
 Label81.OnUpPtr = 0;
 Label81.OnDownPtr = 0;
 Label81.OnClickPtr = 0;
 Label81.OnPressPtr = 0;

 Label89.OwnerScreen = &ScreenEndSerial;
 Label89.Order = 3;
 Label89.Left = 185;
 Label89.Top = 23;
 Label89.Width = 39;
 Label89.Height = 17;
 Label89.Visible = 1;
 Label89.Active = 1;
 Label89.Caption = Label89_Caption;
 Label89.FontName = Tahoma12x16_Regular;
 Label89.Font_Color = 0x0000;
 Label89.VerticalText = 0;
 Label89.OnUpPtr = 0;
 Label89.OnDownPtr = 0;
 Label89.OnClickPtr = 0;
 Label89.OnPressPtr = 0;

 Label90.OwnerScreen = &ScreenEndSerial;
 Label90.Order = 4;
 Label90.Left = 185;
 Label90.Top = 2;
 Label90.Width = 39;
 Label90.Height = 17;
 Label90.Visible = 1;
 Label90.Active = 1;
 Label90.Caption = Label90_Caption;
 Label90.FontName = Tahoma12x16_Regular;
 Label90.Font_Color = 0x0000;
 Label90.VerticalText = 0;
 Label90.OnUpPtr = 0;
 Label90.OnDownPtr = 0;
 Label90.OnClickPtr = 0;
 Label90.OnPressPtr = 0;

 Label91.OwnerScreen = &ScreenEndSerial;
 Label91.Order = 5;
 Label91.Left = 45;
 Label91.Top = 2;
 Label91.Width = 39;
 Label91.Height = 17;
 Label91.Visible = 1;
 Label91.Active = 1;
 Label91.Caption = Label91_Caption;
 Label91.FontName = Tahoma12x16_Regular;
 Label91.Font_Color = 0x0000;
 Label91.VerticalText = 0;
 Label91.OnUpPtr = 0;
 Label91.OnDownPtr = 0;
 Label91.OnClickPtr = 0;
 Label91.OnPressPtr = 0;

 Label92.OwnerScreen = &ScreenEndSerial;
 Label92.Order = 6;
 Label92.Left = 45;
 Label92.Top = 23;
 Label92.Width = 39;
 Label92.Height = 17;
 Label92.Visible = 1;
 Label92.Active = 1;
 Label92.Caption = Label92_Caption;
 Label92.FontName = Tahoma12x16_Regular;
 Label92.Font_Color = 0x0000;
 Label92.VerticalText = 0;
 Label92.OnUpPtr = 0;
 Label92.OnDownPtr = 0;
 Label92.OnClickPtr = 0;
 Label92.OnPressPtr = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}
#line 4399 "C:/Users/paulo.santos/Desktop/Versões_2018 - Cópia/FirmwareIHM_v1_0/FirmwareIHM_v1_0_Code/mikroC PRO for PIC32/FirmwareIHM_v1_0_driver.c"
void DrawRoundButton(TButton_Round *Around_button) {
unsigned int ALeft, ATop;
 if (Around_button->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 if (Around_button->VerticalText != 0)
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 ALeft = Around_button->Left + 4;
 else if (Around_button->TextAlign == _taCenter)
 ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
 else if (Around_button->TextAlign == _taRight)
 ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

 if (Around_button->TextAlignVertical == _tavTop)
 ATop = Around_button->Top + 3;
 else if (Around_button->TextAlignVertical == _tavMiddle)
 ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
 else if (Around_button->TextAlignVertical == _tavBottom)
 ATop = Around_button->Top + Around_button->Height - caption_height - 4;

 TFT_Write_Text(Around_button->Caption, ALeft, ATop);
 }
}

void DrawCRoundButton(TCButton_Round *Around_button) {
unsigned int ALeft, ATop;
 if (Around_button->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 if (Around_button->VerticalText != 0)
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 ALeft = Around_button->Left + 4;
 else if (Around_button->TextAlign == _taCenter)
 ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
 else if (Around_button->TextAlign == _taRight)
 ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

 if (Around_button->TextAlignVertical == _tavTop)
 ATop = Around_button->Top + 3;
 else if (Around_button->TextAlignVertical == _tavMiddle)
 ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
 else if (Around_button->TextAlignVertical == _tavBottom)
 ATop = Around_button->Top + Around_button->Height - caption_height - 4;

 TFT_Write_Text(Around_button->Caption, ALeft, ATop);
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible != 0) {
 if (ALabel->VerticalText != 0)
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawCLabel(TCLabel *ALabel) {
 if (ALabel->Visible != 0) {
 if (ALabel->VerticalText != 0)
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawCBox(TCBox *ABox) {
 if (ABox->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
 }
 TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
 TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
 }
}

void DrawRoundBox(TBox_Round *Around_box) {
 if (Around_box->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
 Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
 Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_box->Pen_Color, Around_box->Pen_Width);
 TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
 Around_box->Left + Around_box->Width - 2,
 Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
 }
}

void DrawLine(TLine *Aline) {
 if (Aline->Visible != 0) {
 TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
 TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
 }
}

void DrawCLine(TCLine *Aline) {
 if (Aline->Visible != 0) {
 TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
 TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
 }
}

void DrawCheckBox(TCheckBox *ACheckBox) {
 if (ACheckBox->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Press_Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_End_Color, ACheckBox->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_Start_Color, ACheckBox->Gradient_End_Color);
 }
 TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Pen_Width);
 TFT_Set_Font(ACheckBox->FontName, ACheckBox->Font_Color, FO_HORIZONTAL);
 if (ACheckBox->TextAlign == _taLeft) {
 if (ACheckBox->Rounded != 0)
 TFT_Rectangle_Round_Edges(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
 else
 TFT_Rectangle(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1);
 if (ACheckBox->Checked != 0) {
 TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
 TFT_Line(ACheckBox->Left + ACheckBox->Height / 5 + 1,
 ACheckBox->Top + ACheckBox->Height / 2 + 1,
 ACheckBox->Left + ACheckBox->Height / 2 - 1,
 ACheckBox->Top + ACheckBox->Height - ACheckBox->Height / 5 - 1);
 TFT_Line(ACheckBox->Left + ACheckBox->Height / 2 - ACheckBox->Pen_Width + 1,
 ACheckBox->Top + ACheckBox->Height - ACheckBox->Height / 5 - 1,
 ACheckBox->Left + ACheckBox->Height - ACheckBox->Height / 5 - 1,
 ACheckBox->Top + ACheckBox->Height / 5 + 1);
 }
 TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Width / 4 + 3, ACheckBox->Top);
 TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Height + 3, (ACheckBox->Top + ((ACheckBox->Height - caption_height) / 2)));
 }
 else if (ACheckBox->TextAlign == _taRight) {
 if (ACheckBox->Rounded != 0)
 TFT_Rectangle_Round_Edges(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
 else
 TFT_Rectangle(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1);
 if (ACheckBox->Checked != 0) {
 TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
 TFT_Line(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height + ACheckBox->Height / 5 + 1,
 ACheckBox->Top + ACheckBox->Height / 2 + 1,
 ACheckBox->Left + ACheckBox->Width - ACheckBox->Height /2 - 1,
 ACheckBox->Top + ACheckBox->Height - ACheckBox->Height / 5 - 1);
 TFT_Line(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height /2 + 1,
 ACheckBox->Top + ACheckBox->Height - ACheckBox->Height / 5 - 1,
 ACheckBox->Left + ACheckBox->Width - ACheckBox->Height / 5 - 1,
 ACheckBox->Top + ACheckBox->Height / 5 + 1);
 }
 TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top);
 TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top + (ACheckBox->Height - caption_height) / 2);
 }
 }
}

unsigned int GetColorFromGradientRange(unsigned int start_color, unsigned int end_color,
 unsigned int distance, unsigned int range) {

 char red_start, red_end, red_current;
 char green_start, green_end, green_current;
 char blue_start, blue_end, blue_current;

 if (distance == 0)
 return start_color;
 else if (distance == range)
 return end_color;
 else {
 TFT_Color16bitToRGB(start_color, &red_start, &green_start, &blue_start);
 TFT_Color16bitToRGB(end_color, &red_end, &green_end, &blue_end);

 red_current = red_start + (long)distance * ((int)red_end - red_start) / range;
 green_current = green_start + (long)distance * ((int)green_end - green_start) / range;
 blue_current = blue_start + (long)distance * ((int)blue_end - blue_start) / range;
 return TFT_RGBToColor16bit(red_current, green_current, blue_current);
 }
}

void Update_Percentage(TProgressBar *AProgressBar, unsigned int locPosition) {
char tmpStr[8];

 if (AProgressBar->Show_Position != 0) {
 if (AProgressBar->Show_Percentage != 0) {
 WordToStr(locPosition , tmpStr);
 Ltrim(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 strcat(AProgressBar->Caption, "\%");
 } else {
 WordToStr(AProgressBar->Position , tmpStr);
 Ltrim(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 }
 TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
 }
}

void Update_Sector(TProgressBar *AProgressBar, unsigned int AStartPos, unsigned int AEndPos, TProgressBarSector ASectorAction) {
unsigned int tmpWidth = 0;
unsigned int tmpRound = 0;
unsigned cnt = 0;
unsigned int startcolor, endcolor;
int move_offset;
unsigned int locPosition = 0;

 if (AStartPos == AEndPos)
 return;


 if (AStartPos <= AProgressBar->Left) {
 if (AProgressBar->Rounded != 0)
 AStartPos = AProgressBar->Left + AProgressBar->Corner_Radius;
 else
 AStartPos = AProgressBar->Left + 1;
 }

 if (AEndPos >= AProgressBar->Left + AProgressBar->Width) {
 if (AProgressBar->Rounded != 0)
 AEndPos = AProgressBar->Left + AProgressBar->Width - (AProgressBar->Corner_Radius*2);
 else
 AEndPos = AProgressBar->Left + AProgressBar->Width - 1;
 }

 if (AProgressBar->Rounded != 0) {
 tmpRound = AProgressBar->Corner_Radius;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 }
 else {
 tmpRound = 0;
 tmpWidth = AProgressBar->Width;
 }


 TFT_Set_Pen(0, 0);
 if (ASectorAction == _pbsFillSector) {
 if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
 startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AStartPos, AProgressBar->Left + tmpWidth + tmpRound);
 endcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AEndPos, AProgressBar->Left + tmpWidth + tmpRound);
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, startcolor, endcolor);
 } else
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 } else {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 AEndPos += 1;
 }
 TFT_Rectangle(AStartPos, AProgressBar->Top + 1, AEndPos, AProgressBar->Top + 1 + AProgressBar->Height - 1);


 if ((AProgressBar->Smooth == 0) && (ASectorAction == _pbsFillSector)) {
 move_offset = 10;
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 locPosition = AStartPos;
 while (locPosition < AEndPos) {
 if (((locPosition - AProgressBar->Left - tmpRound)%(move_offset + 3) == 0) && (locPosition - 3 > AProgressBar->Left + tmpRound)) {
 if (locPosition + 3 >= AProgressBar->Left + tmpWidth + tmpRound)
 TFT_Rectangle(locPosition - 3, AProgressBar->Top, AProgressBar->Left + tmpWidth + tmpRound, AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(locPosition - 3, AProgressBar->Top, locPosition, AProgressBar->Top + AProgressBar->Height);
 locPosition += move_offset + 3;
 } else
 locPosition++;
 }
 }
}

void UpdatePBPosition(TProgressBar *AProgressBar) {
TProgressBarSector sector_action;
unsigned long locPosition = 0;
unsigned int _temp, _tempII;
unsigned int locStartPos = 0;
unsigned int locEndPos = 0;

 if (AProgressBar->Prev_Position == AProgressBar->Position)
 return;

 locPosition = (unsigned long)(AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
 if (AProgressBar->Visible != 0) {

 _temp = (AProgressBar->Position - AProgressBar->Min);
 _tempII = AProgressBar->Max - AProgressBar->Min;
 locEndPos = _temp * 100 / _tempII;
 _temp = (AProgressBar->Prev_Position - AProgressBar->Min);
 locStartPos = _temp * 100 / _tempII;
 if (AProgressBar->Rounded != 0) {
 _temp = AProgressBar->Width - (AProgressBar->Corner_Radius * 2);
 _tempII = AProgressBar->Left + AProgressBar->Corner_Radius;
 } else {
 _temp = (AProgressBar->Width - 2);
 _tempII = AProgressBar->Left + 1;
 }
 locStartPos = _tempII + locStartPos * _temp / 100;
 locEndPos = _tempII + locEndPos * _temp / 100;

 if (locStartPos < locEndPos)
 sector_action = _pbsFillSector;
 else {
 sector_action = _pbsClearSector;
 _temp = locStartPos;
 locStartPos = locEndPos;
 locEndPos = _temp;
 }
 Update_Sector(AProgressBar, locStartPos, locEndPos, sector_action);

 if (AProgressBar->Show_Position == 0) {
 AProgressBar->Prev_Position = AProgressBar->Position;
 return;
 }


 TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 if (caption_length > AProgressBar->Width)
 caption_length = AProgressBar->Width;
 _temp = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2;
 _tempII = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length;


 if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (locEndPos <= _temp))
 Update_Sector(AProgressBar, _temp, _tempII, _pbsClearSector);
 else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (_tempII <= locStartPos) && (_temp <= locEndPos))
 Update_Sector(AProgressBar, _temp, _tempII, _pbsFillSector);
 else if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (_temp <= locEndPos))
 Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
 else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos))
 Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
 else if ((locEndPos <= _tempII) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos)) {
 Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
 Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
 }


 Update_Percentage(AProgressBar, locPosition);
 AProgressBar->Prev_Position = AProgressBar->Position;
 }
}

void DrawProgressBar(TProgressBar *AProgressBar) {
unsigned long locPosition = 0;
int move_offset = 0;
unsigned cnt = 0;
unsigned int tmpWidth = 0;
unsigned int tmpRound = 0;
unsigned int startcolor, endcolor;
unsigned int _tmpI, _tmpII;
 move_offset = 10;
 _tmpI = AProgressBar->Position - AProgressBar->Min;
 _tmpII = AProgressBar->Max - AProgressBar->Min;
 locPosition = (unsigned long)_tmpI * 100 / _tmpII;
 if (AProgressBar->Visible != 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);

 if (AProgressBar->Rounded != 0) {
 tmpRound = AProgressBar->Corner_Radius;
 cnt = move_offset + tmpRound;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 } else {
 tmpRound = 0;
 cnt = move_offset;
 tmpWidth = AProgressBar->Width;
 }

 if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
 startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
 0, AProgressBar->Max - AProgressBar->Min);
 endcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
 AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
 } else {
 startcolor = AProgressBar->Gradient_Start_Color;
 endcolor = AProgressBar->Gradient_End_Color;
 }


 if (AProgressBar->Rounded != 0)
 TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
 AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
 else
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
 AProgressBar->Top + AProgressBar->Height);

 if (locPosition > 0) {
 if (AProgressBar->Rounded != 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
 AProgressBar->Gradient_Orientation, startcolor, endcolor);
 TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,
 AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100,
 AProgressBar->Top + AProgressBar->Height);
 } else {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
 AProgressBar->Gradient_Orientation, startcolor, endcolor);
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
 AProgressBar->Top + AProgressBar->Height);
 }

 if (AProgressBar->Smooth == 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
 if (cnt - tmpRound + 3 >= tmpWidth * locPosition)
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
 cnt = cnt + move_offset + 3;
 }
 }
 }

 Update_Percentage(AProgressBar, locPosition);
 AProgressBar->Prev_Position = AProgressBar->Position;
 }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 unsigned short round_button_idx;
 TButton_Round *local_round_button;
 unsigned short round_cbutton_idx;
 TCButton_Round *local_round_cbutton;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short clabel_idx;
 TCLabel *local_clabel;
 unsigned short cbox_idx;
 TCBox *local_cbox;
 unsigned short round_box_idx;
 TBox_Round *local_round_box;
 unsigned short line_idx;
 TLine *local_line;
 unsigned short cline_idx;
 TCLine *local_cline;
 unsigned short checkbox_idx;
 TCheckBox *local_checkbox;
 unsigned short progress_bar_idx;
 TProgressBar *local_progress_bar;
 char save_bled, save_bled_direction;

 object_pressed = 0;
 order = 0;
 round_button_idx = 0;
 round_cbutton_idx = 0;
 label_idx = 0;
 clabel_idx = 0;
 cbox_idx = 0;
 round_box_idx = 0;
 line_idx = 0;
 cline_idx = 0;
 checkbox_idx = 0;
 progress_bar_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 save_bled_direction = TFT_BLED_Direction;
 TFT_BLED_Direction = 0;
 TFT_BLED = 0;
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_ILI9341_8bit(CurrentScreen->Width, CurrentScreen->Height);
 TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 13, 12);
 TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);
 TFT_Fill_Screen(CurrentScreen->Color);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 TFT_BLED_Direction = save_bled_direction;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
 local_round_button =  CurrentScreen->Buttons_Round[round_button_idx] ;
 if (order == local_round_button->Order) {
 round_button_idx++;
 order++;
 DrawRoundButton(local_round_button);
 }
 }

 if (round_cbutton_idx < CurrentScreen->CButtons_RoundCount) {
 local_round_cbutton =  CurrentScreen->CButtons_Round[round_cbutton_idx] ;
 if (order == local_round_cbutton->Order) {
 round_cbutton_idx++;
 order++;
 DrawCRoundButton(local_round_cbutton);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (clabel_idx < CurrentScreen->CLabelsCount) {
 local_clabel =  CurrentScreen->CLabels[clabel_idx] ;
 if (order == local_clabel->Order) {
 clabel_idx++;
 order++;
 DrawCLabel(local_clabel);
 }
 }

 if (cbox_idx < CurrentScreen->CBoxesCount) {
 local_cbox =  CurrentScreen->CBoxes[cbox_idx] ;
 if (order == local_cbox->Order) {
 cbox_idx++;
 order++;
 DrawCBox(local_cbox);
 }
 }

 if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
 local_round_box =  CurrentScreen->Boxes_Round[round_box_idx] ;
 if (order == local_round_box->Order) {
 round_box_idx++;
 order++;
 DrawRoundBox(local_round_box);
 }
 }

 if (line_idx < CurrentScreen->LinesCount) {
 local_line =  CurrentScreen->Lines[line_idx] ;
 if (order == local_line->Order) {
 line_idx++;
 order++;
 DrawLine(local_line);
 }
 }

 if (cline_idx < CurrentScreen->CLinesCount) {
 local_cline =  CurrentScreen->CLines[cline_idx] ;
 if (order == local_cline->Order) {
 cline_idx++;
 order++;
 DrawCLine(local_cline);
 }
 }

 if (checkbox_idx < CurrentScreen->CheckBoxesCount) {
 local_checkbox =  CurrentScreen->CheckBoxes[checkbox_idx] ;
 if (order == local_checkbox->Order) {
 checkbox_idx++;
 order++;
 DrawCheckBox(local_checkbox);
 }
 }

 if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
 local_progress_bar =  CurrentScreen->ProgressBars[progress_bar_idx] ;
 if (order == local_progress_bar->Order) {
 progress_bar_idx++;
 order++;
 DrawProgressBar(local_progress_bar);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 round_button_order = -1;
 round_cbutton_order = -1;
 label_order = -1;
 clabel_order = -1;
 cbox_order = -1;
 box_round_order = -1;
 checkbox_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
 local_round_button =  CurrentScreen->Buttons_Round[_object_count] ;
 if (local_round_button->Active != 0) {
 if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
 local_round_button->Width, local_round_button->Height) == 1) {
 round_button_order = local_round_button->Order;
 exec_round_button = local_round_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CButtons_RoundCount ; _object_count++ ) {
 local_round_cbutton =  CurrentScreen->CButtons_Round[_object_count] ;
 if (local_round_cbutton->Active != 0) {
 if (IsInsideObject(X, Y, local_round_cbutton->Left, local_round_cbutton->Top,
 local_round_cbutton->Width, local_round_cbutton->Height) == 1) {
 round_cbutton_order = local_round_cbutton->Order;
 exec_round_cbutton = local_round_cbutton;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active != 0) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
 local_clabel =  CurrentScreen->CLabels[_object_count] ;
 if (local_clabel->Active != 0) {
 if (IsInsideObject(X, Y, local_clabel->Left, local_clabel->Top,
 local_clabel->Width, local_clabel->Height) == 1) {
 clabel_order = local_clabel->Order;
 exec_clabel = local_clabel;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
 local_cbox =  CurrentScreen->CBoxes[_object_count] ;
 if (local_cbox->Active != 0) {
 if (IsInsideObject(X, Y, local_cbox->Left, local_cbox->Top,
 local_cbox->Width, local_cbox->Height) == 1) {
 cbox_order = local_cbox->Order;
 exec_cbox = local_cbox;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
 local_round_box =  CurrentScreen->Boxes_Round[_object_count] ;
 if (local_round_box->Active != 0) {
 if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
 local_round_box->Width, local_round_box->Height) == 1) {
 box_round_order = local_round_box->Order;
 exec_round_box = local_round_box;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CheckBoxesCount ; _object_count++ ) {
 local_checkbox =  CurrentScreen->CheckBoxes[_object_count] ;
 if (local_checkbox->Active != 0) {
 if (IsInsideObject(X, Y, local_checkbox->Left, local_checkbox->Top,
 local_checkbox->Width, local_checkbox->Height) == 1) {
 checkbox_order = local_checkbox->Order;
 exec_checkbox = local_checkbox;
 }
 }
 }

 _object_count = -1;
 if (round_button_order > _object_count )
 _object_count = round_button_order;
 if (round_cbutton_order > _object_count )
 _object_count = round_cbutton_order;
 if (label_order > _object_count )
 _object_count = label_order;
 if (clabel_order > _object_count )
 _object_count = clabel_order;
 if (cbox_order > _object_count )
 _object_count = cbox_order;
 if (box_round_order > _object_count )
 _object_count = box_round_order;
 if (checkbox_order > _object_count )
 _object_count = checkbox_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_round_button = 0;
 exec_round_cbutton = 0;
 exec_label = 0;
 exec_clabel = 0;
 exec_cbox = 0;
 exec_round_box = 0;
 exec_checkbox = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnPressPtr != 0) {
 exec_round_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == round_cbutton_order) {
 if (exec_round_cbutton->Active != 0) {
 if (exec_round_cbutton->OnPressPtr != 0) {
 exec_round_cbutton->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == clabel_order) {
 if (exec_clabel->Active != 0) {
 if (exec_clabel->OnPressPtr != 0) {
 exec_clabel->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == cbox_order) {
 if (exec_cbox->Active != 0) {
 if (exec_cbox->OnPressPtr != 0) {
 exec_cbox->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == box_round_order) {
 if (exec_round_box->Active != 0) {
 if (exec_round_box->OnPressPtr != 0) {
 exec_round_box->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == checkbox_order) {
 if (exec_checkbox->Active != 0) {
 if (exec_checkbox->OnPressPtr != 0) {
 exec_checkbox->OnPressPtr();
 return;
 }
 }
 }

 }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 1: {
 if (PressedObject != 0) {
 exec_round_button = (TButton_Round*)PressedObject;
 if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
 DrawRoundButton(exec_round_button);
 }
 break;
 }
 break;
 }

 case 9: {
 if (PressedObject != 0) {
 exec_round_cbutton = (TCButton_Round*)PressedObject;
 if ((exec_round_cbutton->PressColEnabled != 0) && (exec_round_cbutton->OwnerScreen == CurrentScreen)) {
 DrawCRoundButton(exec_round_cbutton);
 }
 break;
 }
 break;
 }

 case 14: {
 if (PressedObject != 0) {
 exec_cbox = (TCBox*)PressedObject;
 if ((exec_cbox->PressColEnabled != 0) && (exec_cbox->OwnerScreen == CurrentScreen)) {
 DrawCBox(exec_cbox);
 }
 break;
 }
 break;
 }

 case 7: {
 if (PressedObject != 0) {
 exec_round_box = (TBox_Round*)PressedObject;
 if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
 DrawRoundBox(exec_round_box);
 }
 break;
 }
 break;
 }

 case 16: {
 if (PressedObject != 0) {
 exec_checkbox = (TCheckBox*)PressedObject;
 break;
 }
 break;
 }
 }

 exec_label = 0;
 exec_clabel = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnUpPtr != 0)
 exec_round_button->OnUpPtr();
 if (PressedObject == (TPointer)exec_round_button)
 if (exec_round_button->OnClickPtr != 0)
 exec_round_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == round_cbutton_order) {
 if (exec_round_cbutton->Active != 0) {
 if (exec_round_cbutton->OnUpPtr != 0)
 exec_round_cbutton->OnUpPtr();
 if (PressedObject == (TPointer)exec_round_cbutton)
 if (exec_round_cbutton->OnClickPtr != 0)
 exec_round_cbutton->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (TPointer)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == clabel_order) {
 if (exec_clabel->Active != 0) {
 if (exec_clabel->OnUpPtr != 0)
 exec_clabel->OnUpPtr();
 if (PressedObject == (TPointer)exec_clabel)
 if (exec_clabel->OnClickPtr != 0)
 exec_clabel->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == cbox_order) {
 if (exec_cbox->Active != 0) {
 if (exec_cbox->OnUpPtr != 0)
 exec_cbox->OnUpPtr();
 if (PressedObject == (TPointer)exec_cbox)
 if (exec_cbox->OnClickPtr != 0)
 exec_cbox->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == box_round_order) {
 if (exec_round_box->Active != 0) {
 if (exec_round_box->OnUpPtr != 0)
 exec_round_box->OnUpPtr();
 if (PressedObject == (TPointer)exec_round_box)
 if (exec_round_box->OnClickPtr != 0)
 exec_round_box->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == checkbox_order) {
 if (exec_checkbox->Active != 0) {
 if (exec_checkbox->OnUpPtr != 0)
 exec_checkbox->OnUpPtr();
 if (PressedObject == (TPointer)exec_checkbox) {
 if (exec_checkbox->Checked != 0)
 exec_checkbox->Checked = 0;
 else
 exec_checkbox->Checked = 1;
 DrawCheckBox(exec_checkbox);
 if (exec_checkbox->OnClickPtr != 0)
 exec_checkbox->OnClickPtr();
 }
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_round_button = 0;
 exec_round_cbutton = 0;
 exec_label = 0;
 exec_clabel = 0;
 exec_cbox = 0;
 exec_round_box = 0;
 exec_checkbox = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawRoundButton(exec_round_button);
 }
 PressedObject = (TPointer)exec_round_button;
 PressedObjectType = 1;
 if (exec_round_button->OnDownPtr != 0) {
 exec_round_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == round_cbutton_order) {
 if (exec_round_cbutton->Active != 0) {
 if (exec_round_cbutton->PressColEnabled != 0) {
 object_pressed = 1;
 DrawCRoundButton(exec_round_cbutton);
 }
 PressedObject = (TPointer)exec_round_cbutton;
 PressedObjectType = 9;
 if (exec_round_cbutton->OnDownPtr != 0) {
 exec_round_cbutton->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 PressedObject = (TPointer)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == clabel_order) {
 if (exec_clabel->Active != 0) {
 PressedObject = (TPointer)exec_clabel;
 PressedObjectType = 10;
 if (exec_clabel->OnDownPtr != 0) {
 exec_clabel->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == cbox_order) {
 if (exec_cbox->Active != 0) {
 if (exec_cbox->PressColEnabled != 0) {
 object_pressed = 1;
 DrawCBox(exec_cbox);
 }
 PressedObject = (TPointer)exec_cbox;
 PressedObjectType = 14;
 if (exec_cbox->OnDownPtr != 0) {
 exec_cbox->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == box_round_order) {
 if (exec_round_box->Active != 0) {
 if (exec_round_box->PressColEnabled != 0) {
 object_pressed = 1;
 DrawRoundBox(exec_round_box);
 }
 PressedObject = (TPointer)exec_round_box;
 PressedObjectType = 7;
 if (exec_round_box->OnDownPtr != 0) {
 exec_round_box->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == checkbox_order) {
 if (exec_checkbox->Active != 0) {
 if (exec_checkbox->PressColEnabled != 0) {
 object_pressed = 1;
 DrawCheckBox(exec_checkbox);
 }
 PressedObject = (TPointer)exec_checkbox;
 PressedObjectType = 16;
 if (exec_checkbox->OnDownPtr != 0) {
 exec_checkbox->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (TP_TFT_Press_Detect()) {
 if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {

 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU() {

 PMMODE = 0;
 PMAEN = 0;
 PMCON = 0;
 PMMODEbits.MODE = 2;
 PMMODEbits.WAITB = 0;
 PMMODEbits.WAITM = 1;
 PMMODEbits.WAITE = 0;
 PMMODEbits.MODE16 = 1;
 PMCONbits.CSF = 0;
 PMCONbits.PTRDEN = 1;
 PMCONbits.PTWREN = 1;
 PMCONbits.PMPEN = 1;
 TFT_Set_Default_Mode();
 TP_TFT_Set_Default_Mode();
 TFT_Set_Active(Set_Index,Write_Command,Write_Data);
}

void Start_TP() {
 Init_MCU();

 InitializeTouchPanel();

 TP_TFT_Set_Calibration_Consts(76, 907, 77, 915);

 InitializeObjects();
 display_width = ScreenInicializacao.Width;
 display_height = ScreenInicializacao.Height;
 DrawScreen(&ScreenInicializacao);
}
