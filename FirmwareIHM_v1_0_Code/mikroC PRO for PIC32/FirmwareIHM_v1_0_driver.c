#include "FirmwareIHM_v1_0_objects.h"
#include "FirmwareIHM_v1_0_resources.h"
#include "built_in.h"


// TFT module connections
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
// End TFT module connections

// Touch Panel module connections
sbit DriveX_Left at LATB13_bit;
sbit DriveX_Right at LATB11_bit;
sbit DriveY_Up at LATB12_bit;
sbit DriveY_Down at LATB10_bit;
sbit DriveX_Left_Direction at TRISB13_bit;
sbit DriveX_Right_Direction at TRISB11_bit;
sbit DriveY_Up_Direction at TRISB12_bit;
sbit DriveY_Down_Direction at TRISB10_bit;
// End Touch Panel module connections

// Global variables
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

  TP_TFT_Init(240, 320, 13, 12);                                  // Initialize touch panel
  TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold

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

  TP_TFT_Calibrate_Min();                      // Calibration of TP minimum
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

  TP_TFT_Calibrate_Max();                       // Calibration of TP maximum
  Delay_ms(500);
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                ScreenInicializacao;
  TProgressBar                 ProgressBar1;
char ProgressBar1_Caption[5] = "50\%";

  TLabel                 Label32;
char Label32_Caption[46] = "LNLS - Laboratorio Nacional de Luz Sincrotron";

  TLabel                 Label33;
char Label33_Caption[14] = "Carregando...";

  TLabel                 Label34;
char Label34_Caption[21] = "Versao Firmware IHM:";

  TLabel                 Label35;
char Label35_Caption[15] = "GRUPO ELP 2018";

  TLine                  Line2;
  TLabel                 Label36;
char Label36_Caption[19] = "IHM, Inicializacao";

  TLabel                 Label37;
char Label37_Caption[11] = "----------";

  TCBox                Box7 = 
         {
         &ScreenInicializacao  , //   Box7.OwnerScreen
         8                     , //   Box7.Order           
         6                     , //   Box7.Left           
         42                    , //   Box7.Top             
         228                   , //   Box7.Width           
         161                   , //   Box7.Height          
         1                     , //   Box7.Pen_Width       
         0x0000                , //   Box7.Pen_Color       
         1                     , //   Box7.Visible         
         0                     , //   Box7.Active          
         1                     , //   Box7.Transparent     
         1                     , //   Box7.Gradient        
         0                     , //   Box7.Gradient_Orientation    
         0x0000                , //   Box7.Gradient_Start_Color    
         0x0000                , //   Box7.Gradient_End_Color      
         0xC618                , //   Box7.Color           
         1                     , //   Box7.PressColEnabled 
         0xE71C                , //   Box7.Press_Color     
         0                     , //   Box7.OnUpPtr
         0                     , //   Box7.OnDownPtr
         0                     , //   Box7.OnClickPtr
         0                       //   Box7.OnPressPtr
         };
  TLabel                 * const code Screen1_Labels[6]=
         {
         &Label32,             
         &Label33,             
         &Label34,             
         &Label35,             
         &Label36,             
         &Label37              
         };
  TCBox                  * const code Screen1_CBoxes[1]=
         {
         &Box7                 
         };
  TLine                  * const code Screen1_Lines[1]=
         {
         &Line2                
         };
  TProgressBar           * const code Screen1_ProgressBars[1]=
         {
         &ProgressBar1         
         };

  TScreen                ScreenPrincipal;
  TCBox                Box1 = 
         {
         &ScreenPrincipal      , //   Box1.OwnerScreen
         0                     , //   Box1.Order           
         0                     , //   Box1.Left           
         0                     , //   Box1.Top             
         239                   , //   Box1.Width           
         47                    , //   Box1.Height          
         1                     , //   Box1.Pen_Width       
         0xFFFF                , //   Box1.Pen_Color       
         1                     , //   Box1.Visible         
         0                     , //   Box1.Active          
         1                     , //   Box1.Transparent     
         1                     , //   Box1.Gradient        
         0                     , //   Box1.Gradient_Orientation    
         0xFFFF                , //   Box1.Gradient_Start_Color    
         0xFFFF                , //   Box1.Gradient_End_Color      
         0xC618                , //   Box1.Color           
         1                     , //   Box1.PressColEnabled 
         0xE71C                , //   Box1.Press_Color     
         0                     , //   Box1.OnUpPtr
         0                     , //   Box1.OnDownPtr
         0                     , //   Box1.OnClickPtr
         0                       //   Box1.OnPressPtr
         };
  TCBox                Box2 = 
         {
         &ScreenPrincipal      , //   Box2.OwnerScreen
         1                     , //   Box2.Order           
         6                     , //   Box2.Left           
         54                    , //   Box2.Top             
         228                   , //   Box2.Width           
         212                   , //   Box2.Height          
         1                     , //   Box2.Pen_Width       
         0x0000                , //   Box2.Pen_Color       
         1                     , //   Box2.Visible         
         0                     , //   Box2.Active          
         1                     , //   Box2.Transparent     
         1                     , //   Box2.Gradient        
         0                     , //   Box2.Gradient_Orientation    
         0x0000                , //   Box2.Gradient_Start_Color    
         0x0000                , //   Box2.Gradient_End_Color      
         0xC618                , //   Box2.Color           
         1                     , //   Box2.PressColEnabled 
         0xE71C                , //   Box2.Press_Color     
         0                     , //   Box2.OnUpPtr
         0                     , //   Box2.OnDownPtr
         0                     , //   Box2.OnClickPtr
         0                       //   Box2.OnPressPtr
         };
  TCLabel          Label1 = 
         {
         &ScreenPrincipal      , //   Label1.OwnerScreen
         2                     , //   Label1.Order          
         1                     , //   Label1.Left           
         4                     , //   Label1.Top             
         35                    , //   Label1.Width         
         16                    , //   Label1.Height       
         &Label1_Caption       , //   Label1.Caption        
         &Tahoma12x14_Regular  , //   Label1.FontName       
         0x0000                , //   Label1.Font_Color     
         0                     , //   Label1.VerticalText   
         1                     , //   Label1.Visible        
         1                     , //   Label1.Active        
         0                     , //   Label1.OnUpPtr
         0                     , //   Label1.OnDownPtr
         0                     , //   Label1.OnClickPtr
         0                       //   Label1.OnPressPtr
         };
const char Label1_Caption[7] = "Fonte:";

  TCLabel          Label2 = 
         {
         &ScreenPrincipal      , //   Label2.OwnerScreen
         3                     , //   Label2.Order          
         1                     , //   Label2.Left           
         24                    , //   Label2.Top             
         43                    , //   Label2.Width         
         16                    , //   Label2.Height       
         &Label2_Caption       , //   Label2.Caption        
         &Tahoma12x14_Regular  , //   Label2.FontName       
         0x0000                , //   Label2.Font_Color     
         0                     , //   Label2.VerticalText   
         1                     , //   Label2.Visible        
         1                     , //   Label2.Active        
         0                     , //   Label2.OnUpPtr
         0                     , //   Label2.OnDownPtr
         0                     , //   Label2.OnClickPtr
         0                       //   Label2.OnPressPtr
         };
const char Label2_Caption[8] = "Modelo:";

  TCLabel          Label3 = 
         {
         &ScreenPrincipal      , //   Label3.OwnerScreen
         4                     , //   Label3.Order          
         122                   , //   Label3.Left           
         4                     , //   Label3.Top             
         63                    , //   Label3.Width         
         16                    , //   Label3.Height       
         &Label3_Caption       , //   Label3.Caption        
         &Tahoma12x14_Regular  , //   Label3.FontName       
         0x0000                , //   Label3.Font_Color     
         0                     , //   Label3.VerticalText   
         1                     , //   Label3.Visible        
         1                     , //   Label3.Active        
         0                     , //   Label3.OnUpPtr
         0                     , //   Label3.OnDownPtr
         buttonEndSerial       , //   Label3.OnClickPtr
         0                       //   Label3.OnPressPtr
         };
const char Label3_Caption[13] = "End. Serial:";

  TCLabel          Label4 = 
         {
         &ScreenPrincipal      , //   Label4.OwnerScreen
         5                     , //   Label4.Order          
         10                    , //   Label4.Left           
         59                    , //   Label4.Top             
         116                   , //   Label4.Width         
         20                    , //   Label4.Height       
         &Label4_Caption       , //   Label4.Caption        
         &Tahoma15x18_Regular  , //   Label4.FontName       
         0xFFFF                , //   Label4.Font_Color     
         0                     , //   Label4.VerticalText   
         1                     , //   Label4.Visible        
         1                     , //   Label4.Active        
         0                     , //   Label4.OnUpPtr
         0                     , //   Label4.OnDownPtr
         0                     , //   Label4.OnClickPtr
         0                       //   Label4.OnPressPtr
         };
const char Label4_Caption[17] = "Estado da Fonte:";

  TCLabel          Label5 = 
         {
         &ScreenPrincipal      , //   Label5.OwnerScreen
         6                     , //   Label5.Order          
         10                    , //   Label5.Left           
         150                   , //   Label5.Top             
         129                   , //   Label5.Width         
         20                    , //   Label5.Height       
         &Label5_Caption       , //   Label5.Caption        
         &Tahoma15x18_Regular  , //   Label5.FontName       
         0xFFFF                , //   Label5.Font_Color     
         0                     , //   Label5.VerticalText   
         1                     , //   Label5.Visible        
         1                     , //   Label5.Active        
         0                     , //   Label5.OnUpPtr
         0                     , //   Label5.OnDownPtr
         buttonMalhaDeControle , //   Label5.OnClickPtr
         0                       //   Label5.OnPressPtr
         };
const char Label5_Caption[19] = "Malha de Controle:";

  TCLabel          Label6 = 
         {
         &ScreenPrincipal      , //   Label6.OwnerScreen
         7                     , //   Label6.Order          
         10                    , //   Label6.Left           
         195                   , //   Label6.Top             
         77                    , //   Label6.Width         
         20                    , //   Label6.Height       
         &Label6_Caption       , //   Label6.Caption        
         &Tahoma15x18_Regular  , //   Label6.FontName       
         0xFFFF                , //   Label6.Font_Color     
         0                     , //   Label6.VerticalText   
         1                     , //   Label6.Visible        
         1                     , //   Label6.Active        
         0                     , //   Label6.OnUpPtr
         0                     , //   Label6.OnDownPtr
         buttonReferencia      , //   Label6.OnClickPtr
         0                       //   Label6.OnPressPtr
         };
const char Label6_Caption[12] = "Referencia:";

  TCLabel          Label7 = 
         {
         &ScreenPrincipal      , //   Label7.OwnerScreen
         8                     , //   Label7.Order          
         122                   , //   Label7.Left           
         24                    , //   Label7.Top             
         58                    , //   Label7.Width         
         16                    , //   Label7.Height       
         &Label7_Caption       , //   Label7.Caption        
         &Tahoma12x14_Regular  , //   Label7.FontName       
         0x0000                , //   Label7.Font_Color     
         0                     , //   Label7.VerticalText   
         1                     , //   Label7.Visible        
         1                     , //   Label7.Active        
         0                     , //   Label7.OnUpPtr
         0                     , //   Label7.OnDownPtr
         goScreenOperando      , //   Label7.OnClickPtr
         0                       //   Label7.OnPressPtr
         };
const char Label7_Caption[10] = "Operando:";

  TCLabel          Label8 = 
         {
         &ScreenPrincipal      , //   Label8.OwnerScreen
         9                     , //   Label8.Order          
         10                    , //   Label8.Left           
         104                   , //   Label8.Top             
         135                   , //   Label8.Width         
         20                    , //   Label8.Height       
         &Label8_Caption       , //   Label8.Caption        
         &Tahoma15x18_Regular  , //   Label8.FontName       
         0xFFFF                , //   Label8.Font_Color     
         0                     , //   Label8.VerticalText   
         1                     , //   Label8.Visible        
         1                     , //   Label8.Active        
         0                     , //   Label8.OnUpPtr
         0                     , //   Label8.OnDownPtr
         0                     , //   Label8.OnClickPtr
         0                       //   Label8.OnPressPtr
         };
const char Label8_Caption[20] = "V/A (out) na Carga:";

  TCButton_Round          ButtonRound1 = 
         {
         &ScreenPrincipal      , //   ButtonRound1.OwnerScreen
         10                    , //   ButtonRound1.Order           
         10                    , //   ButtonRound1.Left            
         276                   , //   ButtonRound1.Top              
         70                    , //   ButtonRound1.Width            
         35                    , //   ButtonRound1.Height        
         1                     , //   ButtonRound1.Pen_Width          
         0x0000                , //   ButtonRound1.Pen_Color       
         1                     , //   ButtonRound1.Visible         
         1                     , //   ButtonRound1.Active           
         1                     , //   ButtonRound1.Transparent     
         &ButtonRound1_Caption , //   ButtonRound1.Caption        
         _taCenter             , //   ButtonRound1.TextAlign        
         _tavMiddle            , //   ButtonRound1.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound1.FontName        
         0x0000                , //   ButtonRound1.FontColor       
         0                     , //   ButtonRound1.VerticalText       
         1                     , //   ButtonRound1.Gradient        
         0                     , //   ButtonRound1.Gradient_Orientation    
         0xFFFF                , //   ButtonRound1.Gradient_Start_Color    
         0xC618                , //   ButtonRound1.Gradient_End_Color    
         0xC618                , //   ButtonRound1.Color           
         3                     , //   ButtonRound1.CornerRadius           
         1                     , //   ButtonRound1.PressColEnabled 
         0xE71C                , //   ButtonRound1.Press_Color     
         0                     , //   ButtonRound1.OnUpPtr
         0                     , //   ButtonRound1.OnDownPtr
         0                     , //   ButtonRound1.OnClickPtr
         0                       //   ButtonRound1.OnPressPtr
         };
const char ButtonRound1_Caption[7] = "ON/OFF";

  TButton_Round          ButtonRound2;
char ButtonRound2_Caption[5] = "MENU";

  TCLabel          Label9 = 
         {
         &ScreenPrincipal      , //   Label9.OwnerScreen
         12                    , //   Label9.Order          
         10                    , //   Label9.Left           
         241                   , //   Label9.Top             
         65                    , //   Label9.Width         
         20                    , //   Label9.Height       
         &Label9_Caption       , //   Label9.Caption        
         &Tahoma15x18_Regular  , //   Label9.FontName       
         0xFFFF                , //   Label9.Font_Color     
         0                     , //   Label9.VerticalText   
         1                     , //   Label9.Visible        
         1                     , //   Label9.Active        
         0                     , //   Label9.OnUpPtr
         0                     , //   Label9.OnDownPtr
         goScreenResetInterlock, //   Label9.OnClickPtr
         0                       //   Label9.OnPressPtr
         };
const char Label9_Caption[11] = "Interlock:";

  TCLine                  Line1 = 
         {
         &ScreenPrincipal      , //   Line1.OwnerScreen
         13                    , //   Line1.Order
         0                     , //   Line1.First_Point_X  
         140                   , //   Line1.First_Point_Y  
         240                   , //   Line1.Second_Point_X 
         140                   , //   Line1.Second_Point_Y 
         1                     , //   Line1.Pen_Width      
         1                     , //   Line1.Visible        
         0xCE53                  //   Line1.Color         
         };
  TLabel                 Label26;
char Label26_Caption[9] = "--------";

  TLabel                 Label28;
char Label28_Caption[9] = "--------";

  TLabel                 Label29;
char Label29_Caption[9] = "--------";

  TLabel                 Label30;
char Label30_Caption[9] = "--------";

  TLabel                 Label31;
char Label31_Caption[9] = "--------";

  TLabel                 Label44;
char Label44_Caption[9] = "--------";

  TLabel                 Label45;
char Label45_Caption[9] = "--------";

  TLabel                 Label46;
char Label46_Caption[9] = "--------";

  TLabel                 Label47;
char Label47_Caption[9] = "--------";

  TButton_Round          * const code Screen2_Buttons_Round[1]=
         {
         &ButtonRound2         
         };
  TCButton_Round         * const code Screen2_CButtons_Round[1]=
         {
         &ButtonRound1         
         };
  TLabel                 * const code Screen2_Labels[9]=
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
  TCLabel                * const code Screen2_CLabels[9]=
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
  TCBox                  * const code Screen2_CBoxes[2]=
         {
         &Box1,                
         &Box2                 
         };
  TCLine                 * const code Screen2_CLines[1]=
         {
         &Line1                
         };

  TScreen                ScreenSenha;
  TCButton_Round          ButtonRound4 = 
         {
         &ScreenSenha          , //   ButtonRound4.OwnerScreen
         0                     , //   ButtonRound4.Order           
         10                    , //   ButtonRound4.Left            
         91                    , //   ButtonRound4.Top              
         65                    , //   ButtonRound4.Width            
         39                    , //   ButtonRound4.Height        
         1                     , //   ButtonRound4.Pen_Width          
         0x0000                , //   ButtonRound4.Pen_Color       
         1                     , //   ButtonRound4.Visible         
         1                     , //   ButtonRound4.Active           
         1                     , //   ButtonRound4.Transparent     
         &ButtonRound4_Caption , //   ButtonRound4.Caption        
         _taCenter             , //   ButtonRound4.TextAlign        
         _tavMiddle            , //   ButtonRound4.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound4.FontName        
         0x0000                , //   ButtonRound4.FontColor       
         0                     , //   ButtonRound4.VerticalText       
         1                     , //   ButtonRound4.Gradient        
         0                     , //   ButtonRound4.Gradient_Orientation    
         0xFFFF                , //   ButtonRound4.Gradient_Start_Color    
         0xC618                , //   ButtonRound4.Gradient_End_Color    
         0xC618                , //   ButtonRound4.Color           
         3                     , //   ButtonRound4.CornerRadius           
         1                     , //   ButtonRound4.PressColEnabled 
         0x8410                , //   ButtonRound4.Press_Color     
         0                     , //   ButtonRound4.OnUpPtr
         0                     , //   ButtonRound4.OnDownPtr
         buttonSenha_1         , //   ButtonRound4.OnClickPtr
         0                       //   ButtonRound4.OnPressPtr
         };
const char ButtonRound4_Caption[2] = "1";

  TCButton_Round          ButtonRound11 = 
         {
         &ScreenSenha          , //   ButtonRound11.OwnerScreen
         1                     , //   ButtonRound11.Order           
         86                    , //   ButtonRound11.Left            
         277                   , //   ButtonRound11.Top              
         70                    , //   ButtonRound11.Width            
         35                    , //   ButtonRound11.Height        
         1                     , //   ButtonRound11.Pen_Width          
         0x0000                , //   ButtonRound11.Pen_Color       
         1                     , //   ButtonRound11.Visible         
         1                     , //   ButtonRound11.Active           
         1                     , //   ButtonRound11.Transparent     
         &ButtonRound11_Caption, //   ButtonRound11.Caption        
         _taCenter             , //   ButtonRound11.TextAlign        
         _tavMiddle            , //   ButtonRound11.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound11.FontName        
         0x0000                , //   ButtonRound11.FontColor       
         0                     , //   ButtonRound11.VerticalText       
         1                     , //   ButtonRound11.Gradient        
         0                     , //   ButtonRound11.Gradient_Orientation    
         0xB000                , //   ButtonRound11.Gradient_Start_Color    
         0xC618                , //   ButtonRound11.Gradient_End_Color    
         0xA800                , //   ButtonRound11.Color           
         3                     , //   ButtonRound11.CornerRadius           
         0                     , //   ButtonRound11.PressColEnabled 
         0xC618                , //   ButtonRound11.Press_Color     
         0                     , //   ButtonRound11.OnUpPtr
         0                     , //   ButtonRound11.OnDownPtr
         buttonSenha_APAGAR    , //   ButtonRound11.OnClickPtr
         0                       //   ButtonRound11.OnPressPtr
         };
const char ButtonRound11_Caption[7] = "APAGAR";

  TCButton_Round          ButtonRoundVoltarSenha = 
         {
         &ScreenSenha          , //   ButtonRoundVoltarSenha.OwnerScreen
         2                     , //   ButtonRoundVoltarSenha.Order           
         8                     , //   ButtonRoundVoltarSenha.Left            
         277                   , //   ButtonRoundVoltarSenha.Top              
         70                    , //   ButtonRoundVoltarSenha.Width            
         35                    , //   ButtonRoundVoltarSenha.Height        
         1                     , //   ButtonRoundVoltarSenha.Pen_Width          
         0x0000                , //   ButtonRoundVoltarSenha.Pen_Color       
         1                     , //   ButtonRoundVoltarSenha.Visible         
         1                     , //   ButtonRoundVoltarSenha.Active           
         1                     , //   ButtonRoundVoltarSenha.Transparent     
         &ButtonRoundVoltarSenha_Caption, //   ButtonRoundVoltarSenha.Caption        
         _taCenter             , //   ButtonRoundVoltarSenha.TextAlign        
         _tavMiddle            , //   ButtonRoundVoltarSenha.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRoundVoltarSenha.FontName        
         0x0000                , //   ButtonRoundVoltarSenha.FontColor       
         0                     , //   ButtonRoundVoltarSenha.VerticalText       
         1                     , //   ButtonRoundVoltarSenha.Gradient        
         0                     , //   ButtonRoundVoltarSenha.Gradient_Orientation    
         0xFFFF                , //   ButtonRoundVoltarSenha.Gradient_Start_Color    
         0xC618                , //   ButtonRoundVoltarSenha.Gradient_End_Color    
         0xC618                , //   ButtonRoundVoltarSenha.Color           
         3                     , //   ButtonRoundVoltarSenha.CornerRadius           
         1                     , //   ButtonRoundVoltarSenha.PressColEnabled 
         0x8410                , //   ButtonRoundVoltarSenha.Press_Color     
         0                     , //   ButtonRoundVoltarSenha.OnUpPtr
         0                     , //   ButtonRoundVoltarSenha.OnDownPtr
         buttonSenha_VOLTAR    , //   ButtonRoundVoltarSenha.OnClickPtr
         0                       //   ButtonRoundVoltarSenha.OnPressPtr
         };
const char ButtonRoundVoltarSenha_Caption[7] = "VOLTAR";

  TCButton_Round          ButtonRoundEnter1 = 
         {
         &ScreenSenha          , //   ButtonRoundEnter1.OwnerScreen
         3                     , //   ButtonRoundEnter1.Order           
         163                   , //   ButtonRoundEnter1.Left            
         277                   , //   ButtonRoundEnter1.Top              
         70                    , //   ButtonRoundEnter1.Width            
         35                    , //   ButtonRoundEnter1.Height        
         1                     , //   ButtonRoundEnter1.Pen_Width          
         0x0000                , //   ButtonRoundEnter1.Pen_Color       
         1                     , //   ButtonRoundEnter1.Visible         
         1                     , //   ButtonRoundEnter1.Active           
         1                     , //   ButtonRoundEnter1.Transparent     
         &ButtonRoundEnter1_Caption, //   ButtonRoundEnter1.Caption        
         _taCenter             , //   ButtonRoundEnter1.TextAlign        
         _tavMiddle            , //   ButtonRoundEnter1.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRoundEnter1.FontName        
         0x0000                , //   ButtonRoundEnter1.FontColor       
         0                     , //   ButtonRoundEnter1.VerticalText       
         1                     , //   ButtonRoundEnter1.Gradient        
         0                     , //   ButtonRoundEnter1.Gradient_Orientation    
         0x0400                , //   ButtonRoundEnter1.Gradient_Start_Color    
         0xC618                , //   ButtonRoundEnter1.Gradient_End_Color    
         0xC618                , //   ButtonRoundEnter1.Color           
         3                     , //   ButtonRoundEnter1.CornerRadius           
         1                     , //   ButtonRoundEnter1.PressColEnabled 
         0x8410                , //   ButtonRoundEnter1.Press_Color     
         0                     , //   ButtonRoundEnter1.OnUpPtr
         0                     , //   ButtonRoundEnter1.OnDownPtr
         buttonSenha_ENTER     , //   ButtonRoundEnter1.OnClickPtr
         0                       //   ButtonRoundEnter1.OnPressPtr
         };
const char ButtonRoundEnter1_Caption[6] = "ENTER";

  TCLabel          Label14 = 
         {
         &ScreenSenha          , //   Label14.OwnerScreen
         4                     , //   Label14.Order          
         8                     , //   Label14.Left           
         59                    , //   Label14.Top             
         48                    , //   Label14.Width         
         20                    , //   Label14.Height       
         &Label14_Caption      , //   Label14.Caption        
         &Tahoma15x18_Regular  , //   Label14.FontName       
         0x0000                , //   Label14.Font_Color     
         0                     , //   Label14.VerticalText   
         1                     , //   Label14.Visible        
         0                     , //   Label14.Active        
         0                     , //   Label14.OnUpPtr
         0                     , //   Label14.OnDownPtr
         0                     , //   Label14.OnClickPtr
         0                       //   Label14.OnPressPtr
         };
const char Label14_Caption[7] = "Senha:";

  TCButton_Round          ButtonRound5 = 
         {
         &ScreenSenha          , //   ButtonRound5.OwnerScreen
         5                     , //   ButtonRound5.Order           
         88                    , //   ButtonRound5.Left            
         92                    , //   ButtonRound5.Top              
         65                    , //   ButtonRound5.Width            
         39                    , //   ButtonRound5.Height        
         1                     , //   ButtonRound5.Pen_Width          
         0x0000                , //   ButtonRound5.Pen_Color       
         1                     , //   ButtonRound5.Visible         
         1                     , //   ButtonRound5.Active           
         1                     , //   ButtonRound5.Transparent     
         &ButtonRound5_Caption , //   ButtonRound5.Caption        
         _taCenter             , //   ButtonRound5.TextAlign        
         _tavMiddle            , //   ButtonRound5.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound5.FontName        
         0x0000                , //   ButtonRound5.FontColor       
         0                     , //   ButtonRound5.VerticalText       
         1                     , //   ButtonRound5.Gradient        
         0                     , //   ButtonRound5.Gradient_Orientation    
         0xFFFF                , //   ButtonRound5.Gradient_Start_Color    
         0xC618                , //   ButtonRound5.Gradient_End_Color    
         0xC618                , //   ButtonRound5.Color           
         3                     , //   ButtonRound5.CornerRadius           
         1                     , //   ButtonRound5.PressColEnabled 
         0x8410                , //   ButtonRound5.Press_Color     
         0                     , //   ButtonRound5.OnUpPtr
         0                     , //   ButtonRound5.OnDownPtr
         buttonSenha_2         , //   ButtonRound5.OnClickPtr
         0                       //   ButtonRound5.OnPressPtr
         };
const char ButtonRound5_Caption[2] = "2";

  TCButton_Round          ButtonRound12 = 
         {
         &ScreenSenha          , //   ButtonRound12.OwnerScreen
         6                     , //   ButtonRound12.Order           
         166                   , //   ButtonRound12.Left            
         92                    , //   ButtonRound12.Top              
         65                    , //   ButtonRound12.Width            
         39                    , //   ButtonRound12.Height        
         1                     , //   ButtonRound12.Pen_Width          
         0x0000                , //   ButtonRound12.Pen_Color       
         1                     , //   ButtonRound12.Visible         
         1                     , //   ButtonRound12.Active           
         1                     , //   ButtonRound12.Transparent     
         &ButtonRound12_Caption, //   ButtonRound12.Caption        
         _taCenter             , //   ButtonRound12.TextAlign        
         _tavMiddle            , //   ButtonRound12.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound12.FontName        
         0x0000                , //   ButtonRound12.FontColor       
         0                     , //   ButtonRound12.VerticalText       
         1                     , //   ButtonRound12.Gradient        
         0                     , //   ButtonRound12.Gradient_Orientation    
         0xFFFF                , //   ButtonRound12.Gradient_Start_Color    
         0xC618                , //   ButtonRound12.Gradient_End_Color    
         0xC618                , //   ButtonRound12.Color           
         3                     , //   ButtonRound12.CornerRadius           
         1                     , //   ButtonRound12.PressColEnabled 
         0x8410                , //   ButtonRound12.Press_Color     
         0                     , //   ButtonRound12.OnUpPtr
         0                     , //   ButtonRound12.OnDownPtr
         buttonSenha_3         , //   ButtonRound12.OnClickPtr
         0                       //   ButtonRound12.OnPressPtr
         };
const char ButtonRound12_Caption[2] = "3";

  TCButton_Round          ButtonRound15 = 
         {
         &ScreenSenha          , //   ButtonRound15.OwnerScreen
         7                     , //   ButtonRound15.Order           
         10                    , //   ButtonRound15.Left            
         135                   , //   ButtonRound15.Top              
         65                    , //   ButtonRound15.Width            
         39                    , //   ButtonRound15.Height        
         1                     , //   ButtonRound15.Pen_Width          
         0x0000                , //   ButtonRound15.Pen_Color       
         1                     , //   ButtonRound15.Visible         
         1                     , //   ButtonRound15.Active           
         1                     , //   ButtonRound15.Transparent     
         &ButtonRound15_Caption, //   ButtonRound15.Caption        
         _taCenter             , //   ButtonRound15.TextAlign        
         _tavMiddle            , //   ButtonRound15.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound15.FontName        
         0x0000                , //   ButtonRound15.FontColor       
         0                     , //   ButtonRound15.VerticalText       
         1                     , //   ButtonRound15.Gradient        
         0                     , //   ButtonRound15.Gradient_Orientation    
         0xFFFF                , //   ButtonRound15.Gradient_Start_Color    
         0xC618                , //   ButtonRound15.Gradient_End_Color    
         0xC618                , //   ButtonRound15.Color           
         3                     , //   ButtonRound15.CornerRadius           
         1                     , //   ButtonRound15.PressColEnabled 
         0x8410                , //   ButtonRound15.Press_Color     
         0                     , //   ButtonRound15.OnUpPtr
         0                     , //   ButtonRound15.OnDownPtr
         buttonSenha_4         , //   ButtonRound15.OnClickPtr
         0                       //   ButtonRound15.OnPressPtr
         };
const char ButtonRound15_Caption[2] = "4";

  TCButton_Round          ButtonRound16 = 
         {
         &ScreenSenha          , //   ButtonRound16.OwnerScreen
         8                     , //   ButtonRound16.Order           
         88                    , //   ButtonRound16.Left            
         135                   , //   ButtonRound16.Top              
         65                    , //   ButtonRound16.Width            
         39                    , //   ButtonRound16.Height        
         1                     , //   ButtonRound16.Pen_Width          
         0x0000                , //   ButtonRound16.Pen_Color       
         1                     , //   ButtonRound16.Visible         
         1                     , //   ButtonRound16.Active           
         1                     , //   ButtonRound16.Transparent     
         &ButtonRound16_Caption, //   ButtonRound16.Caption        
         _taCenter             , //   ButtonRound16.TextAlign        
         _tavMiddle            , //   ButtonRound16.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound16.FontName        
         0x0000                , //   ButtonRound16.FontColor       
         0                     , //   ButtonRound16.VerticalText       
         1                     , //   ButtonRound16.Gradient        
         0                     , //   ButtonRound16.Gradient_Orientation    
         0xFFFF                , //   ButtonRound16.Gradient_Start_Color    
         0xC618                , //   ButtonRound16.Gradient_End_Color    
         0xC618                , //   ButtonRound16.Color           
         3                     , //   ButtonRound16.CornerRadius           
         1                     , //   ButtonRound16.PressColEnabled 
         0x8410                , //   ButtonRound16.Press_Color     
         0                     , //   ButtonRound16.OnUpPtr
         0                     , //   ButtonRound16.OnDownPtr
         buttonSenha_5         , //   ButtonRound16.OnClickPtr
         0                       //   ButtonRound16.OnPressPtr
         };
const char ButtonRound16_Caption[2] = "5";

  TCButton_Round          ButtonRound17 = 
         {
         &ScreenSenha          , //   ButtonRound17.OwnerScreen
         9                     , //   ButtonRound17.Order           
         166                   , //   ButtonRound17.Left            
         135                   , //   ButtonRound17.Top              
         65                    , //   ButtonRound17.Width            
         39                    , //   ButtonRound17.Height        
         1                     , //   ButtonRound17.Pen_Width          
         0x0000                , //   ButtonRound17.Pen_Color       
         1                     , //   ButtonRound17.Visible         
         1                     , //   ButtonRound17.Active           
         1                     , //   ButtonRound17.Transparent     
         &ButtonRound17_Caption, //   ButtonRound17.Caption        
         _taCenter             , //   ButtonRound17.TextAlign        
         _tavMiddle            , //   ButtonRound17.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound17.FontName        
         0x0000                , //   ButtonRound17.FontColor       
         0                     , //   ButtonRound17.VerticalText       
         1                     , //   ButtonRound17.Gradient        
         0                     , //   ButtonRound17.Gradient_Orientation    
         0xFFFF                , //   ButtonRound17.Gradient_Start_Color    
         0xC618                , //   ButtonRound17.Gradient_End_Color    
         0xC618                , //   ButtonRound17.Color           
         3                     , //   ButtonRound17.CornerRadius           
         1                     , //   ButtonRound17.PressColEnabled 
         0x8410                , //   ButtonRound17.Press_Color     
         0                     , //   ButtonRound17.OnUpPtr
         0                     , //   ButtonRound17.OnDownPtr
         buttonSenha_6         , //   ButtonRound17.OnClickPtr
         0                       //   ButtonRound17.OnPressPtr
         };
const char ButtonRound17_Caption[2] = "6";

  TCButton_Round          ButtonRound18 = 
         {
         &ScreenSenha          , //   ButtonRound18.OwnerScreen
         10                    , //   ButtonRound18.Order           
         10                    , //   ButtonRound18.Left            
         179                   , //   ButtonRound18.Top              
         65                    , //   ButtonRound18.Width            
         39                    , //   ButtonRound18.Height        
         1                     , //   ButtonRound18.Pen_Width          
         0x0000                , //   ButtonRound18.Pen_Color       
         1                     , //   ButtonRound18.Visible         
         1                     , //   ButtonRound18.Active           
         1                     , //   ButtonRound18.Transparent     
         &ButtonRound18_Caption, //   ButtonRound18.Caption        
         _taCenter             , //   ButtonRound18.TextAlign        
         _tavMiddle            , //   ButtonRound18.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound18.FontName        
         0x0000                , //   ButtonRound18.FontColor       
         0                     , //   ButtonRound18.VerticalText       
         1                     , //   ButtonRound18.Gradient        
         0                     , //   ButtonRound18.Gradient_Orientation    
         0xFFFF                , //   ButtonRound18.Gradient_Start_Color    
         0xC618                , //   ButtonRound18.Gradient_End_Color    
         0xC618                , //   ButtonRound18.Color           
         3                     , //   ButtonRound18.CornerRadius           
         1                     , //   ButtonRound18.PressColEnabled 
         0x8410                , //   ButtonRound18.Press_Color     
         0                     , //   ButtonRound18.OnUpPtr
         0                     , //   ButtonRound18.OnDownPtr
         buttonSenha_7         , //   ButtonRound18.OnClickPtr
         0                       //   ButtonRound18.OnPressPtr
         };
const char ButtonRound18_Caption[2] = "7";

  TCButton_Round          ButtonRound19 = 
         {
         &ScreenSenha          , //   ButtonRound19.OwnerScreen
         11                    , //   ButtonRound19.Order           
         88                    , //   ButtonRound19.Left            
         179                   , //   ButtonRound19.Top              
         65                    , //   ButtonRound19.Width            
         39                    , //   ButtonRound19.Height        
         1                     , //   ButtonRound19.Pen_Width          
         0x0000                , //   ButtonRound19.Pen_Color       
         1                     , //   ButtonRound19.Visible         
         1                     , //   ButtonRound19.Active           
         1                     , //   ButtonRound19.Transparent     
         &ButtonRound19_Caption, //   ButtonRound19.Caption        
         _taCenter             , //   ButtonRound19.TextAlign        
         _tavMiddle            , //   ButtonRound19.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound19.FontName        
         0x0000                , //   ButtonRound19.FontColor       
         0                     , //   ButtonRound19.VerticalText       
         1                     , //   ButtonRound19.Gradient        
         0                     , //   ButtonRound19.Gradient_Orientation    
         0xFFFF                , //   ButtonRound19.Gradient_Start_Color    
         0xC618                , //   ButtonRound19.Gradient_End_Color    
         0xC618                , //   ButtonRound19.Color           
         3                     , //   ButtonRound19.CornerRadius           
         1                     , //   ButtonRound19.PressColEnabled 
         0x8410                , //   ButtonRound19.Press_Color     
         0                     , //   ButtonRound19.OnUpPtr
         0                     , //   ButtonRound19.OnDownPtr
         buttonSenha_8         , //   ButtonRound19.OnClickPtr
         0                       //   ButtonRound19.OnPressPtr
         };
const char ButtonRound19_Caption[2] = "8";

  TCButton_Round          ButtonRound20 = 
         {
         &ScreenSenha          , //   ButtonRound20.OwnerScreen
         12                    , //   ButtonRound20.Order           
         166                   , //   ButtonRound20.Left            
         179                   , //   ButtonRound20.Top              
         65                    , //   ButtonRound20.Width            
         39                    , //   ButtonRound20.Height        
         1                     , //   ButtonRound20.Pen_Width          
         0x0000                , //   ButtonRound20.Pen_Color       
         1                     , //   ButtonRound20.Visible         
         1                     , //   ButtonRound20.Active           
         1                     , //   ButtonRound20.Transparent     
         &ButtonRound20_Caption, //   ButtonRound20.Caption        
         _taCenter             , //   ButtonRound20.TextAlign        
         _tavMiddle            , //   ButtonRound20.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound20.FontName        
         0x0000                , //   ButtonRound20.FontColor       
         0                     , //   ButtonRound20.VerticalText       
         1                     , //   ButtonRound20.Gradient        
         0                     , //   ButtonRound20.Gradient_Orientation    
         0xFFFF                , //   ButtonRound20.Gradient_Start_Color    
         0xC618                , //   ButtonRound20.Gradient_End_Color    
         0xC618                , //   ButtonRound20.Color           
         3                     , //   ButtonRound20.CornerRadius           
         1                     , //   ButtonRound20.PressColEnabled 
         0x8410                , //   ButtonRound20.Press_Color     
         0                     , //   ButtonRound20.OnUpPtr
         0                     , //   ButtonRound20.OnDownPtr
         buttonSenha_9         , //   ButtonRound20.OnClickPtr
         0                       //   ButtonRound20.OnPressPtr
         };
const char ButtonRound20_Caption[2] = "9";

  TCButton_Round          ButtonRound21 = 
         {
         &ScreenSenha          , //   ButtonRound21.OwnerScreen
         13                    , //   ButtonRound21.Order           
         88                    , //   ButtonRound21.Left            
         223                   , //   ButtonRound21.Top              
         65                    , //   ButtonRound21.Width            
         39                    , //   ButtonRound21.Height        
         1                     , //   ButtonRound21.Pen_Width          
         0x0000                , //   ButtonRound21.Pen_Color       
         1                     , //   ButtonRound21.Visible         
         1                     , //   ButtonRound21.Active           
         1                     , //   ButtonRound21.Transparent     
         &ButtonRound21_Caption, //   ButtonRound21.Caption        
         _taCenter             , //   ButtonRound21.TextAlign        
         _tavMiddle            , //   ButtonRound21.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound21.FontName        
         0x0000                , //   ButtonRound21.FontColor       
         0                     , //   ButtonRound21.VerticalText       
         1                     , //   ButtonRound21.Gradient        
         0                     , //   ButtonRound21.Gradient_Orientation    
         0xFFFF                , //   ButtonRound21.Gradient_Start_Color    
         0xC618                , //   ButtonRound21.Gradient_End_Color    
         0xC618                , //   ButtonRound21.Color           
         3                     , //   ButtonRound21.CornerRadius           
         1                     , //   ButtonRound21.PressColEnabled 
         0x8410                , //   ButtonRound21.Press_Color     
         0                     , //   ButtonRound21.OnUpPtr
         0                     , //   ButtonRound21.OnDownPtr
         buttonSenha_0         , //   ButtonRound21.OnClickPtr
         0                       //   ButtonRound21.OnPressPtr
         };
const char ButtonRound21_Caption[2] = "0";

  TCBox                Box4 = 
         {
         &ScreenSenha          , //   Box4.OwnerScreen
         14                    , //   Box4.Order           
         59                    , //   Box4.Left           
         53                    , //   Box4.Top             
         171                   , //   Box4.Width           
         33                    , //   Box4.Height          
         1                     , //   Box4.Pen_Width       
         0x0000                , //   Box4.Pen_Color       
         1                     , //   Box4.Visible         
         0                     , //   Box4.Active          
         1                     , //   Box4.Transparent     
         0                     , //   Box4.Gradient        
         0                     , //   Box4.Gradient_Orientation    
         0x0000                , //   Box4.Gradient_Start_Color    
         0xC618                , //   Box4.Gradient_End_Color      
         0x0000                , //   Box4.Color           
         1                     , //   Box4.PressColEnabled 
         0x8410                , //   Box4.Press_Color     
         0                     , //   Box4.OnUpPtr
         0                     , //   Box4.OnDownPtr
         0                     , //   Box4.OnClickPtr
         0                       //   Box4.OnPressPtr
         };
  TLabel                 Label15;
char Label15_Caption[2] = " ";

  TCBox                Box3 = 
         {
         &ScreenSenha          , //   Box3.OwnerScreen
         16                    , //   Box3.Order           
         0                     , //   Box3.Left           
         1                     , //   Box3.Top             
         239                   , //   Box3.Width           
         47                    , //   Box3.Height          
         1                     , //   Box3.Pen_Width       
         0xFFFF                , //   Box3.Pen_Color       
         1                     , //   Box3.Visible         
         0                     , //   Box3.Active          
         1                     , //   Box3.Transparent     
         1                     , //   Box3.Gradient        
         0                     , //   Box3.Gradient_Orientation    
         0xFFFF                , //   Box3.Gradient_Start_Color    
         0xFFFF                , //   Box3.Gradient_End_Color      
         0xC618                , //   Box3.Color           
         1                     , //   Box3.PressColEnabled 
         0xE71C                , //   Box3.Press_Color     
         0                     , //   Box3.OnUpPtr
         0                     , //   Box3.OnDownPtr
         0                     , //   Box3.OnClickPtr
         0                       //   Box3.OnPressPtr
         };
  TLabel                 Label48;
char Label48_Caption[9] = "--------";

  TLabel                 Label49;
char Label49_Caption[9] = "--------";

  TLabel                 Label50;
char Label50_Caption[9] = "--------";

  TLabel                 Label51;
char Label51_Caption[9] = "--------";

  TCLabel          Label17 = 
         {
         &ScreenSenha          , //   Label17.OwnerScreen
         21                    , //   Label17.Order          
         1                     , //   Label17.Left           
         4                     , //   Label17.Top             
         35                    , //   Label17.Width         
         16                    , //   Label17.Height       
         &Label17_Caption      , //   Label17.Caption        
         &Tahoma12x14_Regular  , //   Label17.FontName       
         0x0000                , //   Label17.Font_Color     
         0                     , //   Label17.VerticalText   
         1                     , //   Label17.Visible        
         1                     , //   Label17.Active        
         0                     , //   Label17.OnUpPtr
         0                     , //   Label17.OnDownPtr
         0                     , //   Label17.OnClickPtr
         0                       //   Label17.OnPressPtr
         };
const char Label17_Caption[7] = "Fonte:";

  TCLabel          Label18 = 
         {
         &ScreenSenha          , //   Label18.OwnerScreen
         22                    , //   Label18.Order          
         1                     , //   Label18.Left           
         25                    , //   Label18.Top             
         43                    , //   Label18.Width         
         16                    , //   Label18.Height       
         &Label18_Caption      , //   Label18.Caption        
         &Tahoma12x14_Regular  , //   Label18.FontName       
         0x0000                , //   Label18.Font_Color     
         0                     , //   Label18.VerticalText   
         1                     , //   Label18.Visible        
         1                     , //   Label18.Active        
         0                     , //   Label18.OnUpPtr
         0                     , //   Label18.OnDownPtr
         0                     , //   Label18.OnClickPtr
         0                       //   Label18.OnPressPtr
         };
const char Label18_Caption[8] = "Modelo:";

  TCLabel          Label19 = 
         {
         &ScreenSenha          , //   Label19.OwnerScreen
         23                    , //   Label19.Order          
         122                   , //   Label19.Left           
         4                     , //   Label19.Top             
         63                    , //   Label19.Width         
         16                    , //   Label19.Height       
         &Label19_Caption      , //   Label19.Caption        
         &Tahoma12x14_Regular  , //   Label19.FontName       
         0x0000                , //   Label19.Font_Color     
         0                     , //   Label19.VerticalText   
         1                     , //   Label19.Visible        
         1                     , //   Label19.Active        
         0                     , //   Label19.OnUpPtr
         0                     , //   Label19.OnDownPtr
         0                     , //   Label19.OnClickPtr
         0                       //   Label19.OnPressPtr
         };
const char Label19_Caption[13] = "End. Serial:";

  TCLabel          Label20 = 
         {
         &ScreenSenha          , //   Label20.OwnerScreen
         24                    , //   Label20.Order          
         122                   , //   Label20.Left           
         25                    , //   Label20.Top             
         58                    , //   Label20.Width         
         16                    , //   Label20.Height       
         &Label20_Caption      , //   Label20.Caption        
         &Tahoma12x14_Regular  , //   Label20.FontName       
         0x0000                , //   Label20.Font_Color     
         0                     , //   Label20.VerticalText   
         1                     , //   Label20.Visible        
         1                     , //   Label20.Active        
         0                     , //   Label20.OnUpPtr
         0                     , //   Label20.OnDownPtr
         0                     , //   Label20.OnClickPtr
         0                       //   Label20.OnPressPtr
         };
const char Label20_Caption[10] = "Operando:";

  TCButton_Round         * const code Screen3_CButtons_Round[13]=
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
  TLabel                 * const code Screen3_Labels[5]=
         {
         &Label15,             
         &Label48,             
         &Label49,             
         &Label50,             
         &Label51              
         };
  TCLabel                * const code Screen3_CLabels[5]=
         {
         &Label14,             
         &Label17,             
         &Label18,             
         &Label19,             
         &Label20              
         };
  TCBox                  * const code Screen3_CBoxes[2]=
         {
         &Box4,                
         &Box3                 
         };

  TScreen                ScreenMalhaDeControle;
  TCBox                Box6 = 
         {
         &ScreenMalhaDeControle, //   Box6.OwnerScreen
         0                     , //   Box6.Order           
         0                     , //   Box6.Left           
         0                     , //   Box6.Top             
         239                   , //   Box6.Width           
         47                    , //   Box6.Height          
         1                     , //   Box6.Pen_Width       
         0xFFFF                , //   Box6.Pen_Color       
         1                     , //   Box6.Visible         
         0                     , //   Box6.Active          
         1                     , //   Box6.Transparent     
         1                     , //   Box6.Gradient        
         0                     , //   Box6.Gradient_Orientation    
         0xFFFF                , //   Box6.Gradient_Start_Color    
         0xFFFF                , //   Box6.Gradient_End_Color      
         0xC618                , //   Box6.Color           
         1                     , //   Box6.PressColEnabled 
         0xE71C                , //   Box6.Press_Color     
         0                     , //   Box6.OnUpPtr
         0                     , //   Box6.OnDownPtr
         0                     , //   Box6.OnClickPtr
         0                       //   Box6.OnPressPtr
         };
  TCLabel          Label25 = 
         {
         &ScreenMalhaDeControle, //   Label25.OwnerScreen
         1                     , //   Label25.Order          
         8                     , //   Label25.Left           
         60                    , //   Label25.Top             
         129                   , //   Label25.Width         
         20                    , //   Label25.Height       
         &Label25_Caption      , //   Label25.Caption        
         &Tahoma15x18_Regular  , //   Label25.FontName       
         0x0000                , //   Label25.Font_Color     
         0                     , //   Label25.VerticalText   
         1                     , //   Label25.Visible        
         0                     , //   Label25.Active        
         0                     , //   Label25.OnUpPtr
         0                     , //   Label25.OnDownPtr
         0                     , //   Label25.OnClickPtr
         0                       //   Label25.OnPressPtr
         };
const char Label25_Caption[19] = "Malha de Controle:";

  TLabel                 Label27;
char Label27_Caption[9] = "--------";

  TCButton_Round          ButtonRound7 = 
         {
         &ScreenMalhaDeControle, //   ButtonRound7.OwnerScreen
         3                     , //   ButtonRound7.Order           
         10                    , //   ButtonRound7.Left            
         276                   , //   ButtonRound7.Top              
         70                    , //   ButtonRound7.Width            
         35                    , //   ButtonRound7.Height        
         1                     , //   ButtonRound7.Pen_Width          
         0x0000                , //   ButtonRound7.Pen_Color       
         1                     , //   ButtonRound7.Visible         
         1                     , //   ButtonRound7.Active           
         1                     , //   ButtonRound7.Transparent     
         &ButtonRound7_Caption , //   ButtonRound7.Caption        
         _taCenter             , //   ButtonRound7.TextAlign        
         _tavMiddle            , //   ButtonRound7.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound7.FontName        
         0x0000                , //   ButtonRound7.FontColor       
         0                     , //   ButtonRound7.VerticalText       
         1                     , //   ButtonRound7.Gradient        
         0                     , //   ButtonRound7.Gradient_Orientation    
         0xFFFF                , //   ButtonRound7.Gradient_Start_Color    
         0xC618                , //   ButtonRound7.Gradient_End_Color    
         0xC618                , //   ButtonRound7.Color           
         3                     , //   ButtonRound7.CornerRadius           
         1                     , //   ButtonRound7.PressColEnabled 
         0xE71C                , //   ButtonRound7.Press_Color     
         0                     , //   ButtonRound7.OnUpPtr
         0                     , //   ButtonRound7.OnDownPtr
         goScreenPrincipal     , //   ButtonRound7.OnClickPtr
         0                       //   ButtonRound7.OnPressPtr
         };
const char ButtonRound7_Caption[7] = "VOLTAR";

  TCheckBox                 CheckBox1;
char CheckBox1_Caption[7] = "Aberta";

  TCheckBox                 CheckBox2;
char CheckBox2_Caption[8] = "Fechada";

  TLabel                 Label52;
char Label52_Caption[9] = "--------";

  TLabel                 Label53;
char Label53_Caption[9] = "--------";

  TLabel                 Label54;
char Label54_Caption[9] = "--------";

  TLabel                 Label55;
char Label55_Caption[9] = "--------";

  TCLabel          Label21 = 
         {
         &ScreenMalhaDeControle, //   Label21.OwnerScreen
         10                    , //   Label21.Order          
         1                     , //   Label21.Left           
         4                     , //   Label21.Top             
         35                    , //   Label21.Width         
         16                    , //   Label21.Height       
         &Label21_Caption      , //   Label21.Caption        
         &Tahoma12x14_Regular  , //   Label21.FontName       
         0x0000                , //   Label21.Font_Color     
         0                     , //   Label21.VerticalText   
         1                     , //   Label21.Visible        
         1                     , //   Label21.Active        
         0                     , //   Label21.OnUpPtr
         0                     , //   Label21.OnDownPtr
         0                     , //   Label21.OnClickPtr
         0                       //   Label21.OnPressPtr
         };
const char Label21_Caption[7] = "Fonte:";

  TCLabel          Label22 = 
         {
         &ScreenMalhaDeControle, //   Label22.OwnerScreen
         11                    , //   Label22.Order          
         1                     , //   Label22.Left           
         24                    , //   Label22.Top             
         43                    , //   Label22.Width         
         16                    , //   Label22.Height       
         &Label22_Caption      , //   Label22.Caption        
         &Tahoma12x14_Regular  , //   Label22.FontName       
         0x0000                , //   Label22.Font_Color     
         0                     , //   Label22.VerticalText   
         1                     , //   Label22.Visible        
         1                     , //   Label22.Active        
         0                     , //   Label22.OnUpPtr
         0                     , //   Label22.OnDownPtr
         0                     , //   Label22.OnClickPtr
         0                       //   Label22.OnPressPtr
         };
const char Label22_Caption[8] = "Modelo:";

  TCLabel          Label23 = 
         {
         &ScreenMalhaDeControle, //   Label23.OwnerScreen
         12                    , //   Label23.Order          
         122                   , //   Label23.Left           
         4                     , //   Label23.Top             
         63                    , //   Label23.Width         
         16                    , //   Label23.Height       
         &Label23_Caption      , //   Label23.Caption        
         &Tahoma12x14_Regular  , //   Label23.FontName       
         0x0000                , //   Label23.Font_Color     
         0                     , //   Label23.VerticalText   
         1                     , //   Label23.Visible        
         1                     , //   Label23.Active        
         0                     , //   Label23.OnUpPtr
         0                     , //   Label23.OnDownPtr
         0                     , //   Label23.OnClickPtr
         0                       //   Label23.OnPressPtr
         };
const char Label23_Caption[13] = "End. Serial:";

  TCLabel          Label24 = 
         {
         &ScreenMalhaDeControle, //   Label24.OwnerScreen
         13                    , //   Label24.Order          
         122                   , //   Label24.Left           
         24                    , //   Label24.Top             
         58                    , //   Label24.Width         
         16                    , //   Label24.Height       
         &Label24_Caption      , //   Label24.Caption        
         &Tahoma12x14_Regular  , //   Label24.FontName       
         0x0000                , //   Label24.Font_Color     
         0                     , //   Label24.VerticalText   
         1                     , //   Label24.Visible        
         1                     , //   Label24.Active        
         0                     , //   Label24.OnUpPtr
         0                     , //   Label24.OnDownPtr
         0                     , //   Label24.OnClickPtr
         0                       //   Label24.OnPressPtr
         };
const char Label24_Caption[10] = "Operando:";

  TCButton_Round         * const code Screen4_CButtons_Round[1]=
         {
         &ButtonRound7         
         };
  TLabel                 * const code Screen4_Labels[5]=
         {
         &Label27,             
         &Label52,             
         &Label53,             
         &Label54,             
         &Label55              
         };
  TCLabel                * const code Screen4_CLabels[5]=
         {
         &Label25,             
         &Label21,             
         &Label22,             
         &Label23,             
         &Label24              
         };
  TCBox                  * const code Screen4_CBoxes[1]=
         {
         &Box6                 
         };
  TCheckBox              * const code Screen4_CheckBoxes[2]=
         {
         &CheckBox1,           
         &CheckBox2            
         };

  TScreen                ScreenResetInterlock;
  TCBox                Box5 = 
         {
         &ScreenResetInterlock , //   Box5.OwnerScreen
         0                     , //   Box5.Order           
         0                     , //   Box5.Left           
         0                     , //   Box5.Top             
         239                   , //   Box5.Width           
         47                    , //   Box5.Height          
         1                     , //   Box5.Pen_Width       
         0xFFFF                , //   Box5.Pen_Color       
         1                     , //   Box5.Visible         
         0                     , //   Box5.Active          
         1                     , //   Box5.Transparent     
         1                     , //   Box5.Gradient        
         0                     , //   Box5.Gradient_Orientation    
         0xFFFF                , //   Box5.Gradient_Start_Color    
         0xFFFF                , //   Box5.Gradient_End_Color      
         0xC618                , //   Box5.Color           
         1                     , //   Box5.PressColEnabled 
         0xE71C                , //   Box5.Press_Color     
         0                     , //   Box5.OnUpPtr
         0                     , //   Box5.OnDownPtr
         0                     , //   Box5.OnClickPtr
         0                       //   Box5.OnPressPtr
         };
  TCLabel          Label10 = 
         {
         &ScreenResetInterlock , //   Label10.OwnerScreen
         1                     , //   Label10.Order          
         8                     , //   Label10.Left           
         60                    , //   Label10.Top             
         65                    , //   Label10.Width         
         20                    , //   Label10.Height       
         &Label10_Caption      , //   Label10.Caption        
         &Tahoma15x18_Regular  , //   Label10.FontName       
         0x0000                , //   Label10.Font_Color     
         0                     , //   Label10.VerticalText   
         1                     , //   Label10.Visible        
         0                     , //   Label10.Active        
         0                     , //   Label10.OnUpPtr
         0                     , //   Label10.OnDownPtr
         0                     , //   Label10.OnClickPtr
         0                       //   Label10.OnPressPtr
         };
const char Label10_Caption[11] = "Interlock:";

  TCButton_Round          ButtonRound3 = 
         {
         &ScreenResetInterlock , //   ButtonRound3.OwnerScreen
         2                     , //   ButtonRound3.Order           
         10                    , //   ButtonRound3.Left            
         276                   , //   ButtonRound3.Top              
         70                    , //   ButtonRound3.Width            
         35                    , //   ButtonRound3.Height        
         1                     , //   ButtonRound3.Pen_Width          
         0x0000                , //   ButtonRound3.Pen_Color       
         1                     , //   ButtonRound3.Visible         
         1                     , //   ButtonRound3.Active           
         1                     , //   ButtonRound3.Transparent     
         &ButtonRound3_Caption , //   ButtonRound3.Caption        
         _taCenter             , //   ButtonRound3.TextAlign        
         _tavMiddle            , //   ButtonRound3.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound3.FontName        
         0x0000                , //   ButtonRound3.FontColor       
         0                     , //   ButtonRound3.VerticalText       
         1                     , //   ButtonRound3.Gradient        
         0                     , //   ButtonRound3.Gradient_Orientation    
         0xFFFF                , //   ButtonRound3.Gradient_Start_Color    
         0xC618                , //   ButtonRound3.Gradient_End_Color    
         0xC618                , //   ButtonRound3.Color           
         3                     , //   ButtonRound3.CornerRadius           
         1                     , //   ButtonRound3.PressColEnabled 
         0xE71C                , //   ButtonRound3.Press_Color     
         0                     , //   ButtonRound3.OnUpPtr
         0                     , //   ButtonRound3.OnDownPtr
         goScreenPrincipal     , //   ButtonRound3.OnClickPtr
         0                       //   ButtonRound3.OnPressPtr
         };
const char ButtonRound3_Caption[7] = "VOLTAR";

  TButton_Round          ButtonRound6;
char ButtonRound6_Caption[6] = "RESET";

  TLabel                 Label56;
char Label56_Caption[9] = "--------";

  TLabel                 Label57;
char Label57_Caption[9] = "--------";

  TLabel                 Label58;
char Label58_Caption[9] = "--------";

  TLabel                 Label59;
char Label59_Caption[9] = "--------";

  TCLabel          Label11 = 
         {
         &ScreenResetInterlock , //   Label11.OwnerScreen
         8                     , //   Label11.Order          
         1                     , //   Label11.Left           
         4                     , //   Label11.Top             
         35                    , //   Label11.Width         
         16                    , //   Label11.Height       
         &Label11_Caption      , //   Label11.Caption        
         &Tahoma12x14_Regular  , //   Label11.FontName       
         0x0000                , //   Label11.Font_Color     
         0                     , //   Label11.VerticalText   
         1                     , //   Label11.Visible        
         1                     , //   Label11.Active        
         0                     , //   Label11.OnUpPtr
         0                     , //   Label11.OnDownPtr
         0                     , //   Label11.OnClickPtr
         0                       //   Label11.OnPressPtr
         };
const char Label11_Caption[7] = "Fonte:";

  TCLabel          Label12 = 
         {
         &ScreenResetInterlock , //   Label12.OwnerScreen
         9                     , //   Label12.Order          
         1                     , //   Label12.Left           
         24                    , //   Label12.Top             
         43                    , //   Label12.Width         
         16                    , //   Label12.Height       
         &Label12_Caption      , //   Label12.Caption        
         &Tahoma12x14_Regular  , //   Label12.FontName       
         0x0000                , //   Label12.Font_Color     
         0                     , //   Label12.VerticalText   
         1                     , //   Label12.Visible        
         1                     , //   Label12.Active        
         0                     , //   Label12.OnUpPtr
         0                     , //   Label12.OnDownPtr
         0                     , //   Label12.OnClickPtr
         0                       //   Label12.OnPressPtr
         };
const char Label12_Caption[8] = "Modelo:";

  TCLabel          Label13 = 
         {
         &ScreenResetInterlock , //   Label13.OwnerScreen
         10                    , //   Label13.Order          
         122                   , //   Label13.Left           
         4                     , //   Label13.Top             
         63                    , //   Label13.Width         
         16                    , //   Label13.Height       
         &Label13_Caption      , //   Label13.Caption        
         &Tahoma12x14_Regular  , //   Label13.FontName       
         0x0000                , //   Label13.Font_Color     
         0                     , //   Label13.VerticalText   
         1                     , //   Label13.Visible        
         1                     , //   Label13.Active        
         0                     , //   Label13.OnUpPtr
         0                     , //   Label13.OnDownPtr
         0                     , //   Label13.OnClickPtr
         0                       //   Label13.OnPressPtr
         };
const char Label13_Caption[13] = "End. Serial:";

  TCLabel          Label16 = 
         {
         &ScreenResetInterlock , //   Label16.OwnerScreen
         11                    , //   Label16.Order          
         122                   , //   Label16.Left           
         24                    , //   Label16.Top             
         58                    , //   Label16.Width         
         16                    , //   Label16.Height       
         &Label16_Caption      , //   Label16.Caption        
         &Tahoma12x14_Regular  , //   Label16.FontName       
         0x0000                , //   Label16.Font_Color     
         0                     , //   Label16.VerticalText   
         1                     , //   Label16.Visible        
         1                     , //   Label16.Active        
         0                     , //   Label16.OnUpPtr
         0                     , //   Label16.OnDownPtr
         0                     , //   Label16.OnClickPtr
         0                       //   Label16.OnPressPtr
         };
const char Label16_Caption[10] = "Operando:";

  TButton_Round          * const code Screen5_Buttons_Round[1]=
         {
         &ButtonRound6         
         };
  TCButton_Round         * const code Screen5_CButtons_Round[1]=
         {
         &ButtonRound3         
         };
  TLabel                 * const code Screen5_Labels[4]=
         {
         &Label56,             
         &Label57,             
         &Label58,             
         &Label59              
         };
  TCLabel                * const code Screen5_CLabels[5]=
         {
         &Label10,             
         &Label11,             
         &Label12,             
         &Label13,             
         &Label16              
         };
  TCBox                  * const code Screen5_CBoxes[1]=
         {
         &Box5                 
         };

  TScreen                ScreenOperando;
  TCBox                Box8 = 
         {
         &ScreenOperando       , //   Box8.OwnerScreen
         0                     , //   Box8.Order           
         0                     , //   Box8.Left           
         0                     , //   Box8.Top             
         239                   , //   Box8.Width           
         47                    , //   Box8.Height          
         1                     , //   Box8.Pen_Width       
         0xFFFF                , //   Box8.Pen_Color       
         1                     , //   Box8.Visible         
         0                     , //   Box8.Active          
         1                     , //   Box8.Transparent     
         1                     , //   Box8.Gradient        
         0                     , //   Box8.Gradient_Orientation    
         0xFFFF                , //   Box8.Gradient_Start_Color    
         0xFFFF                , //   Box8.Gradient_End_Color      
         0xC618                , //   Box8.Color           
         1                     , //   Box8.PressColEnabled 
         0xE71C                , //   Box8.Press_Color     
         0                     , //   Box8.OnUpPtr
         0                     , //   Box8.OnDownPtr
         0                     , //   Box8.OnClickPtr
         0                       //   Box8.OnPressPtr
         };
  TCLabel          Label42 = 
         {
         &ScreenOperando       , //   Label42.OwnerScreen
         1                     , //   Label42.Order          
         8                     , //   Label42.Left           
         60                    , //   Label42.Top             
         134                   , //   Label42.Width         
         20                    , //   Label42.Height       
         &Label42_Caption      , //   Label42.Caption        
         &Tahoma15x18_Regular  , //   Label42.FontName       
         0x0000                , //   Label42.Font_Color     
         0                     , //   Label42.VerticalText   
         1                     , //   Label42.Visible        
         0                     , //   Label42.Active        
         0                     , //   Label42.OnUpPtr
         0                     , //   Label42.OnDownPtr
         0                     , //   Label42.OnClickPtr
         0                       //   Label42.OnPressPtr
         };
const char Label42_Caption[18] = "Mado de Operacao:";

  TLabel                 Label43;
char Label43_Caption[9] = "--------";

  TCButton_Round          ButtonRound8 = 
         {
         &ScreenOperando       , //   ButtonRound8.OwnerScreen
         3                     , //   ButtonRound8.Order           
         10                    , //   ButtonRound8.Left            
         276                   , //   ButtonRound8.Top              
         70                    , //   ButtonRound8.Width            
         35                    , //   ButtonRound8.Height        
         1                     , //   ButtonRound8.Pen_Width          
         0x0000                , //   ButtonRound8.Pen_Color       
         1                     , //   ButtonRound8.Visible         
         1                     , //   ButtonRound8.Active           
         1                     , //   ButtonRound8.Transparent     
         &ButtonRound8_Caption , //   ButtonRound8.Caption        
         _taCenter             , //   ButtonRound8.TextAlign        
         _tavMiddle            , //   ButtonRound8.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound8.FontName        
         0x0000                , //   ButtonRound8.FontColor       
         0                     , //   ButtonRound8.VerticalText       
         1                     , //   ButtonRound8.Gradient        
         0                     , //   ButtonRound8.Gradient_Orientation    
         0xFFFF                , //   ButtonRound8.Gradient_Start_Color    
         0xC618                , //   ButtonRound8.Gradient_End_Color    
         0xC618                , //   ButtonRound8.Color           
         3                     , //   ButtonRound8.CornerRadius           
         1                     , //   ButtonRound8.PressColEnabled 
         0xE71C                , //   ButtonRound8.Press_Color     
         0                     , //   ButtonRound8.OnUpPtr
         0                     , //   ButtonRound8.OnDownPtr
         goScreenPrincipal     , //   ButtonRound8.OnClickPtr
         0                       //   ButtonRound8.OnPressPtr
         };
const char ButtonRound8_Caption[7] = "VOLTAR";

  TCheckBox                 CheckBox3;
char CheckBox3_Caption[7] = "Remoto";

  TCheckBox                 CheckBox4;
char CheckBox4_Caption[6] = "Local";

  TCheckBox                 CheckBox5;
char CheckBox5_Caption[8] = "PC Host";

  TLabel                 Label60;
char Label60_Caption[9] = "--------";

  TLabel                 Label61;
char Label61_Caption[9] = "--------";

  TLabel                 Label62;
char Label62_Caption[9] = "--------";

  TLabel                 Label63;
char Label63_Caption[9] = "--------";

  TCLabel          Label38 = 
         {
         &ScreenOperando       , //   Label38.OwnerScreen
         11                    , //   Label38.Order          
         1                     , //   Label38.Left           
         4                     , //   Label38.Top             
         35                    , //   Label38.Width         
         16                    , //   Label38.Height       
         &Label38_Caption      , //   Label38.Caption        
         &Tahoma12x14_Regular  , //   Label38.FontName       
         0x0000                , //   Label38.Font_Color     
         0                     , //   Label38.VerticalText   
         1                     , //   Label38.Visible        
         1                     , //   Label38.Active        
         0                     , //   Label38.OnUpPtr
         0                     , //   Label38.OnDownPtr
         0                     , //   Label38.OnClickPtr
         0                       //   Label38.OnPressPtr
         };
const char Label38_Caption[7] = "Fonte:";

  TCLabel          Label39 = 
         {
         &ScreenOperando       , //   Label39.OwnerScreen
         12                    , //   Label39.Order          
         1                     , //   Label39.Left           
         24                    , //   Label39.Top             
         43                    , //   Label39.Width         
         16                    , //   Label39.Height       
         &Label39_Caption      , //   Label39.Caption        
         &Tahoma12x14_Regular  , //   Label39.FontName       
         0x0000                , //   Label39.Font_Color     
         0                     , //   Label39.VerticalText   
         1                     , //   Label39.Visible        
         1                     , //   Label39.Active        
         0                     , //   Label39.OnUpPtr
         0                     , //   Label39.OnDownPtr
         0                     , //   Label39.OnClickPtr
         0                       //   Label39.OnPressPtr
         };
const char Label39_Caption[8] = "Modelo:";

  TCLabel          Label40 = 
         {
         &ScreenOperando       , //   Label40.OwnerScreen
         13                    , //   Label40.Order          
         122                   , //   Label40.Left           
         4                     , //   Label40.Top             
         63                    , //   Label40.Width         
         16                    , //   Label40.Height       
         &Label40_Caption      , //   Label40.Caption        
         &Tahoma12x14_Regular  , //   Label40.FontName       
         0x0000                , //   Label40.Font_Color     
         0                     , //   Label40.VerticalText   
         1                     , //   Label40.Visible        
         1                     , //   Label40.Active        
         0                     , //   Label40.OnUpPtr
         0                     , //   Label40.OnDownPtr
         0                     , //   Label40.OnClickPtr
         0                       //   Label40.OnPressPtr
         };
const char Label40_Caption[13] = "End. Serial:";

  TCLabel          Label41 = 
         {
         &ScreenOperando       , //   Label41.OwnerScreen
         14                    , //   Label41.Order          
         122                   , //   Label41.Left           
         24                    , //   Label41.Top             
         58                    , //   Label41.Width         
         16                    , //   Label41.Height       
         &Label41_Caption      , //   Label41.Caption        
         &Tahoma12x14_Regular  , //   Label41.FontName       
         0x0000                , //   Label41.Font_Color     
         0                     , //   Label41.VerticalText   
         1                     , //   Label41.Visible        
         1                     , //   Label41.Active        
         0                     , //   Label41.OnUpPtr
         0                     , //   Label41.OnDownPtr
         0                     , //   Label41.OnClickPtr
         0                       //   Label41.OnPressPtr
         };
const char Label41_Caption[10] = "Operando:";

  TCButton_Round         * const code Screen6_CButtons_Round[1]=
         {
         &ButtonRound8         
         };
  TLabel                 * const code Screen6_Labels[5]=
         {
         &Label43,             
         &Label60,             
         &Label61,             
         &Label62,             
         &Label63              
         };
  TCLabel                * const code Screen6_CLabels[5]=
         {
         &Label42,             
         &Label38,             
         &Label39,             
         &Label40,             
         &Label41              
         };
  TCBox                  * const code Screen6_CBoxes[1]=
         {
         &Box8                 
         };
  TCheckBox              * const code Screen6_CheckBoxes[3]=
         {
         &CheckBox3,           
         &CheckBox4,           
         &CheckBox5            
         };

  TScreen                ScreenTecladoNumerico;
  TCButton_Round          ButtonRound9 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound9.OwnerScreen
         0                     , //   ButtonRound9.Order           
         10                    , //   ButtonRound9.Left            
         91                    , //   ButtonRound9.Top              
         65                    , //   ButtonRound9.Width            
         39                    , //   ButtonRound9.Height        
         1                     , //   ButtonRound9.Pen_Width          
         0x0000                , //   ButtonRound9.Pen_Color       
         1                     , //   ButtonRound9.Visible         
         1                     , //   ButtonRound9.Active           
         1                     , //   ButtonRound9.Transparent     
         &ButtonRound9_Caption , //   ButtonRound9.Caption        
         _taCenter             , //   ButtonRound9.TextAlign        
         _tavMiddle            , //   ButtonRound9.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound9.FontName        
         0x0000                , //   ButtonRound9.FontColor       
         0                     , //   ButtonRound9.VerticalText       
         1                     , //   ButtonRound9.Gradient        
         0                     , //   ButtonRound9.Gradient_Orientation    
         0xFFFF                , //   ButtonRound9.Gradient_Start_Color    
         0xC618                , //   ButtonRound9.Gradient_End_Color    
         0xC618                , //   ButtonRound9.Color           
         3                     , //   ButtonRound9.CornerRadius           
         1                     , //   ButtonRound9.PressColEnabled 
         0x8410                , //   ButtonRound9.Press_Color     
         0                     , //   ButtonRound9.OnUpPtr
         0                     , //   ButtonRound9.OnDownPtr
         buttonTeclado_1       , //   ButtonRound9.OnClickPtr
         0                       //   ButtonRound9.OnPressPtr
         };
const char ButtonRound9_Caption[2] = "1";

  TCButton_Round          ButtonRound10 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound10.OwnerScreen
         1                     , //   ButtonRound10.Order           
         86                    , //   ButtonRound10.Left            
         277                   , //   ButtonRound10.Top              
         70                    , //   ButtonRound10.Width            
         35                    , //   ButtonRound10.Height        
         1                     , //   ButtonRound10.Pen_Width          
         0x0000                , //   ButtonRound10.Pen_Color       
         1                     , //   ButtonRound10.Visible         
         1                     , //   ButtonRound10.Active           
         1                     , //   ButtonRound10.Transparent     
         &ButtonRound10_Caption, //   ButtonRound10.Caption        
         _taCenter             , //   ButtonRound10.TextAlign        
         _tavMiddle            , //   ButtonRound10.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound10.FontName        
         0x0000                , //   ButtonRound10.FontColor       
         0                     , //   ButtonRound10.VerticalText       
         1                     , //   ButtonRound10.Gradient        
         0                     , //   ButtonRound10.Gradient_Orientation    
         0xB000                , //   ButtonRound10.Gradient_Start_Color    
         0xC618                , //   ButtonRound10.Gradient_End_Color    
         0xA800                , //   ButtonRound10.Color           
         3                     , //   ButtonRound10.CornerRadius           
         0                     , //   ButtonRound10.PressColEnabled 
         0xC618                , //   ButtonRound10.Press_Color     
         0                     , //   ButtonRound10.OnUpPtr
         0                     , //   ButtonRound10.OnDownPtr
         buttonTeclado_APAGAR  , //   ButtonRound10.OnClickPtr
         0                       //   ButtonRound10.OnPressPtr
         };
const char ButtonRound10_Caption[7] = "APAGAR";

  TCButton_Round          ButtonRound13 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound13.OwnerScreen
         2                     , //   ButtonRound13.Order           
         8                     , //   ButtonRound13.Left            
         277                   , //   ButtonRound13.Top              
         70                    , //   ButtonRound13.Width            
         35                    , //   ButtonRound13.Height        
         1                     , //   ButtonRound13.Pen_Width          
         0x0000                , //   ButtonRound13.Pen_Color       
         1                     , //   ButtonRound13.Visible         
         1                     , //   ButtonRound13.Active           
         1                     , //   ButtonRound13.Transparent     
         &ButtonRound13_Caption, //   ButtonRound13.Caption        
         _taCenter             , //   ButtonRound13.TextAlign        
         _tavMiddle            , //   ButtonRound13.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound13.FontName        
         0x0000                , //   ButtonRound13.FontColor       
         0                     , //   ButtonRound13.VerticalText       
         1                     , //   ButtonRound13.Gradient        
         0                     , //   ButtonRound13.Gradient_Orientation    
         0xFFFF                , //   ButtonRound13.Gradient_Start_Color    
         0xC618                , //   ButtonRound13.Gradient_End_Color    
         0xC618                , //   ButtonRound13.Color           
         3                     , //   ButtonRound13.CornerRadius           
         1                     , //   ButtonRound13.PressColEnabled 
         0x8410                , //   ButtonRound13.Press_Color     
         0                     , //   ButtonRound13.OnUpPtr
         0                     , //   ButtonRound13.OnDownPtr
         buttonTeclado_VOLTAR  , //   ButtonRound13.OnClickPtr
         0                       //   ButtonRound13.OnPressPtr
         };
const char ButtonRound13_Caption[7] = "VOLTAR";

  TCButton_Round          ButtonRound14 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound14.OwnerScreen
         3                     , //   ButtonRound14.Order           
         163                   , //   ButtonRound14.Left            
         277                   , //   ButtonRound14.Top              
         70                    , //   ButtonRound14.Width            
         35                    , //   ButtonRound14.Height        
         1                     , //   ButtonRound14.Pen_Width          
         0x0000                , //   ButtonRound14.Pen_Color       
         1                     , //   ButtonRound14.Visible         
         1                     , //   ButtonRound14.Active           
         1                     , //   ButtonRound14.Transparent     
         &ButtonRound14_Caption, //   ButtonRound14.Caption        
         _taCenter             , //   ButtonRound14.TextAlign        
         _tavMiddle            , //   ButtonRound14.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound14.FontName        
         0x0000                , //   ButtonRound14.FontColor       
         0                     , //   ButtonRound14.VerticalText       
         1                     , //   ButtonRound14.Gradient        
         0                     , //   ButtonRound14.Gradient_Orientation    
         0x0400                , //   ButtonRound14.Gradient_Start_Color    
         0xC618                , //   ButtonRound14.Gradient_End_Color    
         0xC618                , //   ButtonRound14.Color           
         3                     , //   ButtonRound14.CornerRadius           
         1                     , //   ButtonRound14.PressColEnabled 
         0x8410                , //   ButtonRound14.Press_Color     
         0                     , //   ButtonRound14.OnUpPtr
         0                     , //   ButtonRound14.OnDownPtr
         buttonTeclado_ENTER   , //   ButtonRound14.OnClickPtr
         0                       //   ButtonRound14.OnPressPtr
         };
const char ButtonRound14_Caption[6] = "ENTER";

  TCButton_Round          ButtonRound22 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound22.OwnerScreen
         4                     , //   ButtonRound22.Order           
         88                    , //   ButtonRound22.Left            
         92                    , //   ButtonRound22.Top              
         65                    , //   ButtonRound22.Width            
         39                    , //   ButtonRound22.Height        
         1                     , //   ButtonRound22.Pen_Width          
         0x0000                , //   ButtonRound22.Pen_Color       
         1                     , //   ButtonRound22.Visible         
         1                     , //   ButtonRound22.Active           
         1                     , //   ButtonRound22.Transparent     
         &ButtonRound22_Caption, //   ButtonRound22.Caption        
         _taCenter             , //   ButtonRound22.TextAlign        
         _tavMiddle            , //   ButtonRound22.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound22.FontName        
         0x0000                , //   ButtonRound22.FontColor       
         0                     , //   ButtonRound22.VerticalText       
         1                     , //   ButtonRound22.Gradient        
         0                     , //   ButtonRound22.Gradient_Orientation    
         0xFFFF                , //   ButtonRound22.Gradient_Start_Color    
         0xC618                , //   ButtonRound22.Gradient_End_Color    
         0xC618                , //   ButtonRound22.Color           
         3                     , //   ButtonRound22.CornerRadius           
         1                     , //   ButtonRound22.PressColEnabled 
         0x8410                , //   ButtonRound22.Press_Color     
         0                     , //   ButtonRound22.OnUpPtr
         0                     , //   ButtonRound22.OnDownPtr
         buttonTeclado_2       , //   ButtonRound22.OnClickPtr
         0                       //   ButtonRound22.OnPressPtr
         };
const char ButtonRound22_Caption[2] = "2";

  TCButton_Round          ButtonRound23 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound23.OwnerScreen
         5                     , //   ButtonRound23.Order           
         166                   , //   ButtonRound23.Left            
         92                    , //   ButtonRound23.Top              
         65                    , //   ButtonRound23.Width            
         39                    , //   ButtonRound23.Height        
         1                     , //   ButtonRound23.Pen_Width          
         0x0000                , //   ButtonRound23.Pen_Color       
         1                     , //   ButtonRound23.Visible         
         1                     , //   ButtonRound23.Active           
         1                     , //   ButtonRound23.Transparent     
         &ButtonRound23_Caption, //   ButtonRound23.Caption        
         _taCenter             , //   ButtonRound23.TextAlign        
         _tavMiddle            , //   ButtonRound23.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound23.FontName        
         0x0000                , //   ButtonRound23.FontColor       
         0                     , //   ButtonRound23.VerticalText       
         1                     , //   ButtonRound23.Gradient        
         0                     , //   ButtonRound23.Gradient_Orientation    
         0xFFFF                , //   ButtonRound23.Gradient_Start_Color    
         0xC618                , //   ButtonRound23.Gradient_End_Color    
         0xC618                , //   ButtonRound23.Color           
         3                     , //   ButtonRound23.CornerRadius           
         1                     , //   ButtonRound23.PressColEnabled 
         0x8410                , //   ButtonRound23.Press_Color     
         0                     , //   ButtonRound23.OnUpPtr
         0                     , //   ButtonRound23.OnDownPtr
         buttonTeclado_3       , //   ButtonRound23.OnClickPtr
         0                       //   ButtonRound23.OnPressPtr
         };
const char ButtonRound23_Caption[2] = "3";

  TCButton_Round          ButtonRound24 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound24.OwnerScreen
         6                     , //   ButtonRound24.Order           
         10                    , //   ButtonRound24.Left            
         135                   , //   ButtonRound24.Top              
         65                    , //   ButtonRound24.Width            
         39                    , //   ButtonRound24.Height        
         1                     , //   ButtonRound24.Pen_Width          
         0x0000                , //   ButtonRound24.Pen_Color       
         1                     , //   ButtonRound24.Visible         
         1                     , //   ButtonRound24.Active           
         1                     , //   ButtonRound24.Transparent     
         &ButtonRound24_Caption, //   ButtonRound24.Caption        
         _taCenter             , //   ButtonRound24.TextAlign        
         _tavMiddle            , //   ButtonRound24.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound24.FontName        
         0x0000                , //   ButtonRound24.FontColor       
         0                     , //   ButtonRound24.VerticalText       
         1                     , //   ButtonRound24.Gradient        
         0                     , //   ButtonRound24.Gradient_Orientation    
         0xFFFF                , //   ButtonRound24.Gradient_Start_Color    
         0xC618                , //   ButtonRound24.Gradient_End_Color    
         0xC618                , //   ButtonRound24.Color           
         3                     , //   ButtonRound24.CornerRadius           
         1                     , //   ButtonRound24.PressColEnabled 
         0x8410                , //   ButtonRound24.Press_Color     
         0                     , //   ButtonRound24.OnUpPtr
         0                     , //   ButtonRound24.OnDownPtr
         buttonTeclado_4       , //   ButtonRound24.OnClickPtr
         0                       //   ButtonRound24.OnPressPtr
         };
const char ButtonRound24_Caption[2] = "4";

  TCButton_Round          ButtonRound25 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound25.OwnerScreen
         7                     , //   ButtonRound25.Order           
         88                    , //   ButtonRound25.Left            
         135                   , //   ButtonRound25.Top              
         65                    , //   ButtonRound25.Width            
         39                    , //   ButtonRound25.Height        
         1                     , //   ButtonRound25.Pen_Width          
         0x0000                , //   ButtonRound25.Pen_Color       
         1                     , //   ButtonRound25.Visible         
         1                     , //   ButtonRound25.Active           
         1                     , //   ButtonRound25.Transparent     
         &ButtonRound25_Caption, //   ButtonRound25.Caption        
         _taCenter             , //   ButtonRound25.TextAlign        
         _tavMiddle            , //   ButtonRound25.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound25.FontName        
         0x0000                , //   ButtonRound25.FontColor       
         0                     , //   ButtonRound25.VerticalText       
         1                     , //   ButtonRound25.Gradient        
         0                     , //   ButtonRound25.Gradient_Orientation    
         0xFFFF                , //   ButtonRound25.Gradient_Start_Color    
         0xC618                , //   ButtonRound25.Gradient_End_Color    
         0xC618                , //   ButtonRound25.Color           
         3                     , //   ButtonRound25.CornerRadius           
         1                     , //   ButtonRound25.PressColEnabled 
         0x8410                , //   ButtonRound25.Press_Color     
         0                     , //   ButtonRound25.OnUpPtr
         0                     , //   ButtonRound25.OnDownPtr
         buttonTeclado_5       , //   ButtonRound25.OnClickPtr
         0                       //   ButtonRound25.OnPressPtr
         };
const char ButtonRound25_Caption[2] = "5";

  TCButton_Round          ButtonRound26 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound26.OwnerScreen
         8                     , //   ButtonRound26.Order           
         166                   , //   ButtonRound26.Left            
         135                   , //   ButtonRound26.Top              
         65                    , //   ButtonRound26.Width            
         39                    , //   ButtonRound26.Height        
         1                     , //   ButtonRound26.Pen_Width          
         0x0000                , //   ButtonRound26.Pen_Color       
         1                     , //   ButtonRound26.Visible         
         1                     , //   ButtonRound26.Active           
         1                     , //   ButtonRound26.Transparent     
         &ButtonRound26_Caption, //   ButtonRound26.Caption        
         _taCenter             , //   ButtonRound26.TextAlign        
         _tavMiddle            , //   ButtonRound26.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound26.FontName        
         0x0000                , //   ButtonRound26.FontColor       
         0                     , //   ButtonRound26.VerticalText       
         1                     , //   ButtonRound26.Gradient        
         0                     , //   ButtonRound26.Gradient_Orientation    
         0xFFFF                , //   ButtonRound26.Gradient_Start_Color    
         0xC618                , //   ButtonRound26.Gradient_End_Color    
         0xC618                , //   ButtonRound26.Color           
         3                     , //   ButtonRound26.CornerRadius           
         1                     , //   ButtonRound26.PressColEnabled 
         0x8410                , //   ButtonRound26.Press_Color     
         0                     , //   ButtonRound26.OnUpPtr
         0                     , //   ButtonRound26.OnDownPtr
         buttonTeclado_6       , //   ButtonRound26.OnClickPtr
         0                       //   ButtonRound26.OnPressPtr
         };
const char ButtonRound26_Caption[2] = "6";

  TCButton_Round          ButtonRound27 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound27.OwnerScreen
         9                     , //   ButtonRound27.Order           
         10                    , //   ButtonRound27.Left            
         179                   , //   ButtonRound27.Top              
         65                    , //   ButtonRound27.Width            
         39                    , //   ButtonRound27.Height        
         1                     , //   ButtonRound27.Pen_Width          
         0x0000                , //   ButtonRound27.Pen_Color       
         1                     , //   ButtonRound27.Visible         
         1                     , //   ButtonRound27.Active           
         1                     , //   ButtonRound27.Transparent     
         &ButtonRound27_Caption, //   ButtonRound27.Caption        
         _taCenter             , //   ButtonRound27.TextAlign        
         _tavMiddle            , //   ButtonRound27.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound27.FontName        
         0x0000                , //   ButtonRound27.FontColor       
         0                     , //   ButtonRound27.VerticalText       
         1                     , //   ButtonRound27.Gradient        
         0                     , //   ButtonRound27.Gradient_Orientation    
         0xFFFF                , //   ButtonRound27.Gradient_Start_Color    
         0xC618                , //   ButtonRound27.Gradient_End_Color    
         0xC618                , //   ButtonRound27.Color           
         3                     , //   ButtonRound27.CornerRadius           
         1                     , //   ButtonRound27.PressColEnabled 
         0x8410                , //   ButtonRound27.Press_Color     
         0                     , //   ButtonRound27.OnUpPtr
         0                     , //   ButtonRound27.OnDownPtr
         buttonTeclado_7       , //   ButtonRound27.OnClickPtr
         0                       //   ButtonRound27.OnPressPtr
         };
const char ButtonRound27_Caption[2] = "7";

  TCButton_Round          ButtonRound28 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound28.OwnerScreen
         10                    , //   ButtonRound28.Order           
         88                    , //   ButtonRound28.Left            
         179                   , //   ButtonRound28.Top              
         65                    , //   ButtonRound28.Width            
         39                    , //   ButtonRound28.Height        
         1                     , //   ButtonRound28.Pen_Width          
         0x0000                , //   ButtonRound28.Pen_Color       
         1                     , //   ButtonRound28.Visible         
         1                     , //   ButtonRound28.Active           
         1                     , //   ButtonRound28.Transparent     
         &ButtonRound28_Caption, //   ButtonRound28.Caption        
         _taCenter             , //   ButtonRound28.TextAlign        
         _tavMiddle            , //   ButtonRound28.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound28.FontName        
         0x0000                , //   ButtonRound28.FontColor       
         0                     , //   ButtonRound28.VerticalText       
         1                     , //   ButtonRound28.Gradient        
         0                     , //   ButtonRound28.Gradient_Orientation    
         0xFFFF                , //   ButtonRound28.Gradient_Start_Color    
         0xC618                , //   ButtonRound28.Gradient_End_Color    
         0xC618                , //   ButtonRound28.Color           
         3                     , //   ButtonRound28.CornerRadius           
         1                     , //   ButtonRound28.PressColEnabled 
         0x8410                , //   ButtonRound28.Press_Color     
         0                     , //   ButtonRound28.OnUpPtr
         0                     , //   ButtonRound28.OnDownPtr
         buttonTeclado_8       , //   ButtonRound28.OnClickPtr
         0                       //   ButtonRound28.OnPressPtr
         };
const char ButtonRound28_Caption[2] = "8";

  TCButton_Round          ButtonRound29 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound29.OwnerScreen
         11                    , //   ButtonRound29.Order           
         166                   , //   ButtonRound29.Left            
         179                   , //   ButtonRound29.Top              
         65                    , //   ButtonRound29.Width            
         39                    , //   ButtonRound29.Height        
         1                     , //   ButtonRound29.Pen_Width          
         0x0000                , //   ButtonRound29.Pen_Color       
         1                     , //   ButtonRound29.Visible         
         1                     , //   ButtonRound29.Active           
         1                     , //   ButtonRound29.Transparent     
         &ButtonRound29_Caption, //   ButtonRound29.Caption        
         _taCenter             , //   ButtonRound29.TextAlign        
         _tavMiddle            , //   ButtonRound29.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound29.FontName        
         0x0000                , //   ButtonRound29.FontColor       
         0                     , //   ButtonRound29.VerticalText       
         1                     , //   ButtonRound29.Gradient        
         0                     , //   ButtonRound29.Gradient_Orientation    
         0xFFFF                , //   ButtonRound29.Gradient_Start_Color    
         0xC618                , //   ButtonRound29.Gradient_End_Color    
         0xC618                , //   ButtonRound29.Color           
         3                     , //   ButtonRound29.CornerRadius           
         1                     , //   ButtonRound29.PressColEnabled 
         0x8410                , //   ButtonRound29.Press_Color     
         0                     , //   ButtonRound29.OnUpPtr
         0                     , //   ButtonRound29.OnDownPtr
         buttonTeclado_9       , //   ButtonRound29.OnClickPtr
         0                       //   ButtonRound29.OnPressPtr
         };
const char ButtonRound29_Caption[2] = "9";

  TCButton_Round          ButtonRound30 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound30.OwnerScreen
         12                    , //   ButtonRound30.Order           
         88                    , //   ButtonRound30.Left            
         223                   , //   ButtonRound30.Top              
         65                    , //   ButtonRound30.Width            
         39                    , //   ButtonRound30.Height        
         1                     , //   ButtonRound30.Pen_Width          
         0x0000                , //   ButtonRound30.Pen_Color       
         1                     , //   ButtonRound30.Visible         
         1                     , //   ButtonRound30.Active           
         1                     , //   ButtonRound30.Transparent     
         &ButtonRound30_Caption, //   ButtonRound30.Caption        
         _taCenter             , //   ButtonRound30.TextAlign        
         _tavMiddle            , //   ButtonRound30.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound30.FontName        
         0x0000                , //   ButtonRound30.FontColor       
         0                     , //   ButtonRound30.VerticalText       
         1                     , //   ButtonRound30.Gradient        
         0                     , //   ButtonRound30.Gradient_Orientation    
         0xFFFF                , //   ButtonRound30.Gradient_Start_Color    
         0xC618                , //   ButtonRound30.Gradient_End_Color    
         0xC618                , //   ButtonRound30.Color           
         3                     , //   ButtonRound30.CornerRadius           
         1                     , //   ButtonRound30.PressColEnabled 
         0x8410                , //   ButtonRound30.Press_Color     
         0                     , //   ButtonRound30.OnUpPtr
         0                     , //   ButtonRound30.OnDownPtr
         buttonTeclado_0       , //   ButtonRound30.OnClickPtr
         0                       //   ButtonRound30.OnPressPtr
         };
const char ButtonRound30_Caption[2] = "0";

  TCBox                Box10 = 
         {
         &ScreenTecladoNumerico, //   Box10.OwnerScreen
         13                    , //   Box10.Order           
         0                     , //   Box10.Left           
         1                     , //   Box10.Top             
         239                   , //   Box10.Width           
         47                    , //   Box10.Height          
         1                     , //   Box10.Pen_Width       
         0xFFFF                , //   Box10.Pen_Color       
         1                     , //   Box10.Visible         
         0                     , //   Box10.Active          
         1                     , //   Box10.Transparent     
         1                     , //   Box10.Gradient        
         0                     , //   Box10.Gradient_Orientation    
         0xFFFF                , //   Box10.Gradient_Start_Color    
         0xFFFF                , //   Box10.Gradient_End_Color      
         0xC618                , //   Box10.Color           
         1                     , //   Box10.PressColEnabled 
         0xE71C                , //   Box10.Press_Color     
         0                     , //   Box10.OnUpPtr
         0                     , //   Box10.OnDownPtr
         0                     , //   Box10.OnClickPtr
         0                       //   Box10.OnPressPtr
         };
  TCLabel          Label70 = 
         {
         &ScreenTecladoNumerico, //   Label70.OwnerScreen
         14                    , //   Label70.Order          
         8                     , //   Label70.Left           
         3                     , //   Label70.Top             
         99                    , //   Label70.Width         
         20                    , //   Label70.Height       
         &Label70_Caption      , //   Label70.Caption        
         &Tahoma15x18_Regular  , //   Label70.FontName       
         0x0000                , //   Label70.Font_Color     
         0                     , //   Label70.VerticalText   
         1                     , //   Label70.Visible        
         1                     , //   Label70.Active        
         0                     , //   Label70.OnUpPtr
         0                     , //   Label70.OnDownPtr
         0                     , //   Label70.OnClickPtr
         0                       //   Label70.OnPressPtr
         };
const char Label70_Caption[16] = "Valor Anterior:";

  TCButton_Round          ButtonRound31 = 
         {
         &ScreenTecladoNumerico, //   ButtonRound31.OwnerScreen
         15                    , //   ButtonRound31.Order           
         166                   , //   ButtonRound31.Left            
         223                   , //   ButtonRound31.Top              
         65                    , //   ButtonRound31.Width            
         39                    , //   ButtonRound31.Height        
         1                     , //   ButtonRound31.Pen_Width          
         0x0000                , //   ButtonRound31.Pen_Color       
         1                     , //   ButtonRound31.Visible         
         1                     , //   ButtonRound31.Active           
         1                     , //   ButtonRound31.Transparent     
         &ButtonRound31_Caption, //   ButtonRound31.Caption        
         _taCenter             , //   ButtonRound31.TextAlign        
         _tavMiddle            , //   ButtonRound31.TextAlignVertical        
         &Tahoma25x25_Bold     , //   ButtonRound31.FontName        
         0x0000                , //   ButtonRound31.FontColor       
         0                     , //   ButtonRound31.VerticalText       
         1                     , //   ButtonRound31.Gradient        
         0                     , //   ButtonRound31.Gradient_Orientation    
         0xFFFF                , //   ButtonRound31.Gradient_Start_Color    
         0xC618                , //   ButtonRound31.Gradient_End_Color    
         0xC618                , //   ButtonRound31.Color           
         3                     , //   ButtonRound31.CornerRadius           
         1                     , //   ButtonRound31.PressColEnabled 
         0x8410                , //   ButtonRound31.Press_Color     
         0                     , //   ButtonRound31.OnUpPtr
         0                     , //   ButtonRound31.OnDownPtr
         buttonTeclado_P       , //   ButtonRound31.OnClickPtr
         0                       //   ButtonRound31.OnPressPtr
         };
const char ButtonRound31_Caption[2] = ",";

  TLabel                 Label64;
char Label64_Caption[12] = "Novo Valor:";

  TCLabel          Label65 = 
         {
         &ScreenTecladoNumerico, //   Label65.OwnerScreen
         17                    , //   Label65.Order          
         8                     , //   Label65.Left           
         59                    , //   Label65.Top             
         40                    , //   Label65.Width         
         20                    , //   Label65.Height       
         &Label65_Caption      , //   Label65.Caption        
         &Tahoma15x18_Regular  , //   Label65.FontName       
         0x0000                , //   Label65.Font_Color     
         0                     , //   Label65.VerticalText   
         1                     , //   Label65.Visible        
         0                     , //   Label65.Active        
         0                     , //   Label65.OnUpPtr
         0                     , //   Label65.OnDownPtr
         0                     , //   Label65.OnClickPtr
         0                       //   Label65.OnPressPtr
         };
const char Label65_Caption[7] = "Valor:";

  TCBox                Box9 = 
         {
         &ScreenTecladoNumerico, //   Box9.OwnerScreen
         18                    , //   Box9.Order           
         59                    , //   Box9.Left           
         53                    , //   Box9.Top             
         171                   , //   Box9.Width           
         33                    , //   Box9.Height          
         1                     , //   Box9.Pen_Width       
         0x0000                , //   Box9.Pen_Color       
         1                     , //   Box9.Visible         
         0                     , //   Box9.Active          
         1                     , //   Box9.Transparent     
         0                     , //   Box9.Gradient        
         0                     , //   Box9.Gradient_Orientation    
         0x0000                , //   Box9.Gradient_Start_Color    
         0xC618                , //   Box9.Gradient_End_Color      
         0x0000                , //   Box9.Color           
         1                     , //   Box9.PressColEnabled 
         0x8410                , //   Box9.Press_Color     
         0                     , //   Box9.OnUpPtr
         0                     , //   Box9.OnDownPtr
         0                     , //   Box9.OnClickPtr
         0                       //   Box9.OnPressPtr
         };
  TLabel                 Label66;
char Label66_Caption[2] = " ";

  TLabel                 Label86;
char Label86_Caption[2] = " ";

  TLabel                 Label87;
char Label87_Caption[2] = " ";

  TCButton_Round         * const code Screen7_CButtons_Round[14]=
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
  TLabel                 * const code Screen7_Labels[4]=
         {
         &Label64,             
         &Label66,             
         &Label86,             
         &Label87              
         };
  TCLabel                * const code Screen7_CLabels[2]=
         {
         &Label70,             
         &Label65              
         };
  TCBox                  * const code Screen7_CBoxes[2]=
         {
         &Box10,               
         &Box9                 
         };

  TScreen                ScreenAcessoNegado;
  TCBox                Box11 = 
         {
         &ScreenAcessoNegado   , //   Box11.OwnerScreen
         0                     , //   Box11.Order           
         0                     , //   Box11.Left           
         1                     , //   Box11.Top             
         239                   , //   Box11.Width           
         47                    , //   Box11.Height          
         1                     , //   Box11.Pen_Width       
         0xFFFF                , //   Box11.Pen_Color       
         1                     , //   Box11.Visible         
         0                     , //   Box11.Active          
         1                     , //   Box11.Transparent     
         1                     , //   Box11.Gradient        
         0                     , //   Box11.Gradient_Orientation    
         0xFFFF                , //   Box11.Gradient_Start_Color    
         0xFFFF                , //   Box11.Gradient_End_Color      
         0xC618                , //   Box11.Color           
         1                     , //   Box11.PressColEnabled 
         0xE71C                , //   Box11.Press_Color     
         0                     , //   Box11.OnUpPtr
         0                     , //   Box11.OnDownPtr
         0                     , //   Box11.OnClickPtr
         0                       //   Box11.OnPressPtr
         };
  TLabel                 Label67;
char Label67_Caption[9] = "--------";

  TLabel                 Label68;
char Label68_Caption[9] = "--------";

  TLabel                 Label69;
char Label69_Caption[9] = "--------";

  TLabel                 Label71;
char Label71_Caption[9] = "--------";

  TCLabel          Label72 = 
         {
         &ScreenAcessoNegado   , //   Label72.OwnerScreen
         5                     , //   Label72.Order          
         1                     , //   Label72.Left           
         4                     , //   Label72.Top             
         35                    , //   Label72.Width         
         16                    , //   Label72.Height       
         &Label72_Caption      , //   Label72.Caption        
         &Tahoma12x14_Regular  , //   Label72.FontName       
         0x0000                , //   Label72.Font_Color     
         0                     , //   Label72.VerticalText   
         1                     , //   Label72.Visible        
         1                     , //   Label72.Active        
         0                     , //   Label72.OnUpPtr
         0                     , //   Label72.OnDownPtr
         0                     , //   Label72.OnClickPtr
         0                       //   Label72.OnPressPtr
         };
const char Label72_Caption[7] = "Fonte:";

  TCLabel          Label73 = 
         {
         &ScreenAcessoNegado   , //   Label73.OwnerScreen
         6                     , //   Label73.Order          
         1                     , //   Label73.Left           
         25                    , //   Label73.Top             
         43                    , //   Label73.Width         
         16                    , //   Label73.Height       
         &Label73_Caption      , //   Label73.Caption        
         &Tahoma12x14_Regular  , //   Label73.FontName       
         0x0000                , //   Label73.Font_Color     
         0                     , //   Label73.VerticalText   
         1                     , //   Label73.Visible        
         1                     , //   Label73.Active        
         0                     , //   Label73.OnUpPtr
         0                     , //   Label73.OnDownPtr
         0                     , //   Label73.OnClickPtr
         0                       //   Label73.OnPressPtr
         };
const char Label73_Caption[8] = "Modelo:";

  TCLabel          Label74 = 
         {
         &ScreenAcessoNegado   , //   Label74.OwnerScreen
         7                     , //   Label74.Order          
         122                   , //   Label74.Left           
         4                     , //   Label74.Top             
         63                    , //   Label74.Width         
         16                    , //   Label74.Height       
         &Label74_Caption      , //   Label74.Caption        
         &Tahoma12x14_Regular  , //   Label74.FontName       
         0x0000                , //   Label74.Font_Color     
         0                     , //   Label74.VerticalText   
         1                     , //   Label74.Visible        
         1                     , //   Label74.Active        
         0                     , //   Label74.OnUpPtr
         0                     , //   Label74.OnDownPtr
         0                     , //   Label74.OnClickPtr
         0                       //   Label74.OnPressPtr
         };
const char Label74_Caption[13] = "End. Serial:";

  TCLabel          Label75 = 
         {
         &ScreenAcessoNegado   , //   Label75.OwnerScreen
         8                     , //   Label75.Order          
         122                   , //   Label75.Left           
         25                    , //   Label75.Top             
         58                    , //   Label75.Width         
         16                    , //   Label75.Height       
         &Label75_Caption      , //   Label75.Caption        
         &Tahoma12x14_Regular  , //   Label75.FontName       
         0x0000                , //   Label75.Font_Color     
         0                     , //   Label75.VerticalText   
         1                     , //   Label75.Visible        
         1                     , //   Label75.Active        
         0                     , //   Label75.OnUpPtr
         0                     , //   Label75.OnDownPtr
         0                     , //   Label75.OnClickPtr
         0                       //   Label75.OnPressPtr
         };
const char Label75_Caption[10] = "Operando:";

  TBox_Round             BoxRound1;
  TLabel                 Label76;
char Label76_Caption[7] = "Negado";

  TLabel                 Label77;
char Label77_Caption[7] = "Acesso";

  TLabel                 * const code Screen8_Labels[6]=
         {
         &Label67,             
         &Label68,             
         &Label69,             
         &Label71,             
         &Label76,             
         &Label77              
         };
  TCLabel                * const code Screen8_CLabels[4]=
         {
         &Label72,             
         &Label73,             
         &Label74,             
         &Label75              
         };
  TCBox                  * const code Screen8_CBoxes[1]=
         {
         &Box11                
         };
  TBox_Round             * const code Screen8_Boxes_Round[1]=
         {
         &BoxRound1            
         };

  TScreen                ScreenMENU;
  TCButton_Round          ButtonRound32 = 
         {
         &ScreenMENU           , //   ButtonRound32.OwnerScreen
         0                     , //   ButtonRound32.Order           
         8                     , //   ButtonRound32.Left            
         277                   , //   ButtonRound32.Top              
         70                    , //   ButtonRound32.Width            
         35                    , //   ButtonRound32.Height        
         1                     , //   ButtonRound32.Pen_Width          
         0x0000                , //   ButtonRound32.Pen_Color       
         1                     , //   ButtonRound32.Visible         
         1                     , //   ButtonRound32.Active           
         1                     , //   ButtonRound32.Transparent     
         &ButtonRound32_Caption, //   ButtonRound32.Caption        
         _taCenter             , //   ButtonRound32.TextAlign        
         _tavMiddle            , //   ButtonRound32.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound32.FontName        
         0x0000                , //   ButtonRound32.FontColor       
         0                     , //   ButtonRound32.VerticalText       
         1                     , //   ButtonRound32.Gradient        
         0                     , //   ButtonRound32.Gradient_Orientation    
         0xFFFF                , //   ButtonRound32.Gradient_Start_Color    
         0xC618                , //   ButtonRound32.Gradient_End_Color    
         0xC618                , //   ButtonRound32.Color           
         3                     , //   ButtonRound32.CornerRadius           
         1                     , //   ButtonRound32.PressColEnabled 
         0x8410                , //   ButtonRound32.Press_Color     
         0                     , //   ButtonRound32.OnUpPtr
         0                     , //   ButtonRound32.OnDownPtr
         goScreenPrincipal     , //   ButtonRound32.OnClickPtr
         0                       //   ButtonRound32.OnPressPtr
         };
const char ButtonRound32_Caption[7] = "VOLTAR";

  TCBox                Box12 = 
         {
         &ScreenMENU           , //   Box12.OwnerScreen
         1                     , //   Box12.Order           
         0                     , //   Box12.Left           
         1                     , //   Box12.Top             
         239                   , //   Box12.Width           
         47                    , //   Box12.Height          
         1                     , //   Box12.Pen_Width       
         0xFFFF                , //   Box12.Pen_Color       
         1                     , //   Box12.Visible         
         0                     , //   Box12.Active          
         1                     , //   Box12.Transparent     
         1                     , //   Box12.Gradient        
         0                     , //   Box12.Gradient_Orientation    
         0xFFFF                , //   Box12.Gradient_Start_Color    
         0xFFFF                , //   Box12.Gradient_End_Color      
         0xC618                , //   Box12.Color           
         1                     , //   Box12.PressColEnabled 
         0xE71C                , //   Box12.Press_Color     
         0                     , //   Box12.OnUpPtr
         0                     , //   Box12.OnDownPtr
         0                     , //   Box12.OnClickPtr
         0                       //   Box12.OnPressPtr
         };
  TLabel                 Label78;
char Label78_Caption[9] = "--------";

  TLabel                 Label79;
char Label79_Caption[9] = "--------";

  TLabel                 Label80;
char Label80_Caption[9] = "--------";

  TLabel                 Label81;
char Label81_Caption[9] = "--------";

  TCLabel          Label82 = 
         {
         &ScreenMENU           , //   Label82.OwnerScreen
         6                     , //   Label82.Order          
         1                     , //   Label82.Left           
         4                     , //   Label82.Top             
         35                    , //   Label82.Width         
         16                    , //   Label82.Height       
         &Label82_Caption      , //   Label82.Caption        
         &Tahoma12x14_Regular  , //   Label82.FontName       
         0x0000                , //   Label82.Font_Color     
         0                     , //   Label82.VerticalText   
         1                     , //   Label82.Visible        
         1                     , //   Label82.Active        
         0                     , //   Label82.OnUpPtr
         0                     , //   Label82.OnDownPtr
         0                     , //   Label82.OnClickPtr
         0                       //   Label82.OnPressPtr
         };
const char Label82_Caption[7] = "Fonte:";

  TCLabel          Label83 = 
         {
         &ScreenMENU           , //   Label83.OwnerScreen
         7                     , //   Label83.Order          
         1                     , //   Label83.Left           
         25                    , //   Label83.Top             
         43                    , //   Label83.Width         
         16                    , //   Label83.Height       
         &Label83_Caption      , //   Label83.Caption        
         &Tahoma12x14_Regular  , //   Label83.FontName       
         0x0000                , //   Label83.Font_Color     
         0                     , //   Label83.VerticalText   
         1                     , //   Label83.Visible        
         1                     , //   Label83.Active        
         0                     , //   Label83.OnUpPtr
         0                     , //   Label83.OnDownPtr
         0                     , //   Label83.OnClickPtr
         0                       //   Label83.OnPressPtr
         };
const char Label83_Caption[8] = "Modelo:";

  TCLabel          Label84 = 
         {
         &ScreenMENU           , //   Label84.OwnerScreen
         8                     , //   Label84.Order          
         122                   , //   Label84.Left           
         4                     , //   Label84.Top             
         63                    , //   Label84.Width         
         16                    , //   Label84.Height       
         &Label84_Caption      , //   Label84.Caption        
         &Tahoma12x14_Regular  , //   Label84.FontName       
         0x0000                , //   Label84.Font_Color     
         0                     , //   Label84.VerticalText   
         1                     , //   Label84.Visible        
         1                     , //   Label84.Active        
         0                     , //   Label84.OnUpPtr
         0                     , //   Label84.OnDownPtr
         0                     , //   Label84.OnClickPtr
         0                       //   Label84.OnPressPtr
         };
const char Label84_Caption[13] = "End. Serial:";

  TCLabel          Label85 = 
         {
         &ScreenMENU           , //   Label85.OwnerScreen
         9                     , //   Label85.Order          
         122                   , //   Label85.Left           
         25                    , //   Label85.Top             
         58                    , //   Label85.Width         
         16                    , //   Label85.Height       
         &Label85_Caption      , //   Label85.Caption        
         &Tahoma12x14_Regular  , //   Label85.FontName       
         0x0000                , //   Label85.Font_Color     
         0                     , //   Label85.VerticalText   
         1                     , //   Label85.Visible        
         1                     , //   Label85.Active        
         0                     , //   Label85.OnUpPtr
         0                     , //   Label85.OnDownPtr
         0                     , //   Label85.OnClickPtr
         0                       //   Label85.OnPressPtr
         };
const char Label85_Caption[10] = "Operando:";

  TCButton_Round         * const code Screen9_CButtons_Round[1]=
         {
         &ButtonRound32        
         };
  TLabel                 * const code Screen9_Labels[4]=
         {
         &Label78,             
         &Label79,             
         &Label80,             
         &Label81              
         };
  TCLabel                * const code Screen9_CLabels[4]=
         {
         &Label82,             
         &Label83,             
         &Label84,             
         &Label85              
         };
  TCBox                  * const code Screen9_CBoxes[1]=
         {
         &Box12                
         };

  TScreen                ScreenEndSerial;
  TCBox                Box13 = 
         {
         &ScreenEndSerial      , //   Box13.OwnerScreen
         0                     , //   Box13.Order           
         0                     , //   Box13.Left           
         0                     , //   Box13.Top             
         239                   , //   Box13.Width           
         47                    , //   Box13.Height          
         1                     , //   Box13.Pen_Width       
         0xFFFF                , //   Box13.Pen_Color       
         1                     , //   Box13.Visible         
         0                     , //   Box13.Active          
         1                     , //   Box13.Transparent     
         1                     , //   Box13.Gradient        
         0                     , //   Box13.Gradient_Orientation    
         0xFFFF                , //   Box13.Gradient_Start_Color    
         0xFFFF                , //   Box13.Gradient_End_Color      
         0xC618                , //   Box13.Color           
         1                     , //   Box13.PressColEnabled 
         0xE71C                , //   Box13.Press_Color     
         0                     , //   Box13.OnUpPtr
         0                     , //   Box13.OnDownPtr
         0                     , //   Box13.OnClickPtr
         0                       //   Box13.OnPressPtr
         };
  TCLabel          Label88 = 
         {
         &ScreenEndSerial      , //   Label88.OwnerScreen
         1                     , //   Label88.Order          
         8                     , //   Label88.Left           
         60                    , //   Label88.Top             
         78                    , //   Label88.Width         
         20                    , //   Label88.Height       
         &Label88_Caption      , //   Label88.Caption        
         &Tahoma15x18_Regular  , //   Label88.FontName       
         0x0000                , //   Label88.Font_Color     
         0                     , //   Label88.VerticalText   
         1                     , //   Label88.Visible        
         0                     , //   Label88.Active        
         0                     , //   Label88.OnUpPtr
         0                     , //   Label88.OnDownPtr
         0                     , //   Label88.OnClickPtr
         0                       //   Label88.OnPressPtr
         };
const char Label88_Caption[13] = "End. Serial:";

  TCButton_Round          ButtonRound33 = 
         {
         &ScreenEndSerial      , //   ButtonRound33.OwnerScreen
         2                     , //   ButtonRound33.Order           
         10                    , //   ButtonRound33.Left            
         276                   , //   ButtonRound33.Top              
         70                    , //   ButtonRound33.Width            
         35                    , //   ButtonRound33.Height        
         1                     , //   ButtonRound33.Pen_Width          
         0x0000                , //   ButtonRound33.Pen_Color       
         1                     , //   ButtonRound33.Visible         
         1                     , //   ButtonRound33.Active           
         1                     , //   ButtonRound33.Transparent     
         &ButtonRound33_Caption, //   ButtonRound33.Caption        
         _taCenter             , //   ButtonRound33.TextAlign        
         _tavMiddle            , //   ButtonRound33.TextAlignVertical        
         &Tahoma14x16_Bold     , //   ButtonRound33.FontName        
         0x0000                , //   ButtonRound33.FontColor       
         0                     , //   ButtonRound33.VerticalText       
         1                     , //   ButtonRound33.Gradient        
         0                     , //   ButtonRound33.Gradient_Orientation    
         0xFFFF                , //   ButtonRound33.Gradient_Start_Color    
         0xC618                , //   ButtonRound33.Gradient_End_Color    
         0xC618                , //   ButtonRound33.Color           
         3                     , //   ButtonRound33.CornerRadius           
         1                     , //   ButtonRound33.PressColEnabled 
         0xE71C                , //   ButtonRound33.Press_Color     
         0                     , //   ButtonRound33.OnUpPtr
         0                     , //   ButtonRound33.OnDownPtr
         goScreenPrincipal     , //   ButtonRound33.OnClickPtr
         0                       //   ButtonRound33.OnPressPtr
         };
const char ButtonRound33_Caption[7] = "VOLTAR";

  TLabel                 Label89;
char Label89_Caption[9] = "--------";

  TLabel                 Label90;
char Label90_Caption[9] = "--------";

  TLabel                 Label91;
char Label91_Caption[9] = "--------";

  TLabel                 Label92;
char Label92_Caption[9] = "--------";

  TCLabel          Label93 = 
         {
         &ScreenEndSerial      , //   Label93.OwnerScreen
         7                     , //   Label93.Order          
         1                     , //   Label93.Left           
         4                     , //   Label93.Top             
         35                    , //   Label93.Width         
         16                    , //   Label93.Height       
         &Label93_Caption      , //   Label93.Caption        
         &Tahoma12x14_Regular  , //   Label93.FontName       
         0x0000                , //   Label93.Font_Color     
         0                     , //   Label93.VerticalText   
         1                     , //   Label93.Visible        
         1                     , //   Label93.Active        
         0                     , //   Label93.OnUpPtr
         0                     , //   Label93.OnDownPtr
         0                     , //   Label93.OnClickPtr
         0                       //   Label93.OnPressPtr
         };
const char Label93_Caption[7] = "Fonte:";

  TCLabel          Label94 = 
         {
         &ScreenEndSerial      , //   Label94.OwnerScreen
         8                     , //   Label94.Order          
         1                     , //   Label94.Left           
         24                    , //   Label94.Top             
         43                    , //   Label94.Width         
         16                    , //   Label94.Height       
         &Label94_Caption      , //   Label94.Caption        
         &Tahoma12x14_Regular  , //   Label94.FontName       
         0x0000                , //   Label94.Font_Color     
         0                     , //   Label94.VerticalText   
         1                     , //   Label94.Visible        
         1                     , //   Label94.Active        
         0                     , //   Label94.OnUpPtr
         0                     , //   Label94.OnDownPtr
         0                     , //   Label94.OnClickPtr
         0                       //   Label94.OnPressPtr
         };
const char Label94_Caption[8] = "Modelo:";

  TCLabel          Label95 = 
         {
         &ScreenEndSerial      , //   Label95.OwnerScreen
         9                     , //   Label95.Order          
         122                   , //   Label95.Left           
         4                     , //   Label95.Top             
         63                    , //   Label95.Width         
         16                    , //   Label95.Height       
         &Label95_Caption      , //   Label95.Caption        
         &Tahoma12x14_Regular  , //   Label95.FontName       
         0x0000                , //   Label95.Font_Color     
         0                     , //   Label95.VerticalText   
         1                     , //   Label95.Visible        
         1                     , //   Label95.Active        
         0                     , //   Label95.OnUpPtr
         0                     , //   Label95.OnDownPtr
         0                     , //   Label95.OnClickPtr
         0                       //   Label95.OnPressPtr
         };
const char Label95_Caption[13] = "End. Serial:";

  TCLabel          Label96 = 
         {
         &ScreenEndSerial      , //   Label96.OwnerScreen
         10                    , //   Label96.Order          
         122                   , //   Label96.Left           
         24                    , //   Label96.Top             
         58                    , //   Label96.Width         
         16                    , //   Label96.Height       
         &Label96_Caption      , //   Label96.Caption        
         &Tahoma12x14_Regular  , //   Label96.FontName       
         0x0000                , //   Label96.Font_Color     
         0                     , //   Label96.VerticalText   
         1                     , //   Label96.Visible        
         1                     , //   Label96.Active        
         0                     , //   Label96.OnUpPtr
         0                     , //   Label96.OnDownPtr
         0                     , //   Label96.OnClickPtr
         0                       //   Label96.OnPressPtr
         };
const char Label96_Caption[10] = "Operando:";

  TCButton_Round         * const code Screen10_CButtons_Round[1]=
         {
         &ButtonRound33        
         };
  TLabel                 * const code Screen10_Labels[4]=
         {
         &Label89,             
         &Label90,             
         &Label91,             
         &Label92              
         };
  TCLabel                * const code Screen10_CLabels[5]=
         {
         &Label88,             
         &Label93,             
         &Label94,             
         &Label95,             
         &Label96              
         };
  TCBox                  * const code Screen10_CBoxes[1]=
         {
         &Box13                
         };



static void InitializeObjects() {
  ScreenInicializacao.Color                     = 0xCE53;
  ScreenInicializacao.Width                     = 240;
  ScreenInicializacao.Height                    = 320;
  ScreenInicializacao.Buttons_RoundCount        = 0;
  ScreenInicializacao.CButtons_RoundCount       = 0;
  ScreenInicializacao.LabelsCount               = 6;
  ScreenInicializacao.Labels                    = Screen1_Labels;
  ScreenInicializacao.CLabelsCount              = 0;
  ScreenInicializacao.CBoxesCount               = 1;
  ScreenInicializacao.CBoxes                    = Screen1_CBoxes;
  ScreenInicializacao.Boxes_RoundCount          = 0;
  ScreenInicializacao.LinesCount                = 1;
  ScreenInicializacao.Lines                     = Screen1_Lines;
  ScreenInicializacao.CLinesCount               = 0;
  ScreenInicializacao.CheckBoxesCount           = 0;
  ScreenInicializacao.ProgressBarsCount         = 1;
  ScreenInicializacao.ProgressBars              = Screen1_ProgressBars;
  ScreenInicializacao.ObjectsCount              = 9;

  ScreenPrincipal.Color                     = 0xCE53;
  ScreenPrincipal.Width                     = 240;
  ScreenPrincipal.Height                    = 320;
  ScreenPrincipal.Buttons_RoundCount        = 1;
  ScreenPrincipal.Buttons_Round             = Screen2_Buttons_Round;
  ScreenPrincipal.CButtons_RoundCount       = 1;
  ScreenPrincipal.CButtons_Round            = Screen2_CButtons_Round;
  ScreenPrincipal.LabelsCount               = 9;
  ScreenPrincipal.Labels                    = Screen2_Labels;
  ScreenPrincipal.CLabelsCount              = 9;
  ScreenPrincipal.CLabels                   = Screen2_CLabels;
  ScreenPrincipal.CBoxesCount               = 2;
  ScreenPrincipal.CBoxes                    = Screen2_CBoxes;
  ScreenPrincipal.Boxes_RoundCount          = 0;
  ScreenPrincipal.LinesCount                = 0;
  ScreenPrincipal.CLinesCount               = 1;
  ScreenPrincipal.CLines                    = Screen2_CLines;
  ScreenPrincipal.CheckBoxesCount           = 0;
  ScreenPrincipal.ProgressBarsCount         = 0;
  ScreenPrincipal.ObjectsCount              = 23;

  ScreenSenha.Color                     = 0xCE53;
  ScreenSenha.Width                     = 240;
  ScreenSenha.Height                    = 320;
  ScreenSenha.Buttons_RoundCount        = 0;
  ScreenSenha.CButtons_RoundCount       = 13;
  ScreenSenha.CButtons_Round            = Screen3_CButtons_Round;
  ScreenSenha.LabelsCount               = 5;
  ScreenSenha.Labels                    = Screen3_Labels;
  ScreenSenha.CLabelsCount              = 5;
  ScreenSenha.CLabels                   = Screen3_CLabels;
  ScreenSenha.CBoxesCount               = 2;
  ScreenSenha.CBoxes                    = Screen3_CBoxes;
  ScreenSenha.Boxes_RoundCount          = 0;
  ScreenSenha.LinesCount                = 0;
  ScreenSenha.CLinesCount               = 0;
  ScreenSenha.CheckBoxesCount           = 0;
  ScreenSenha.ProgressBarsCount         = 0;
  ScreenSenha.ObjectsCount              = 25;

  ScreenMalhaDeControle.Color                     = 0xCE53;
  ScreenMalhaDeControle.Width                     = 240;
  ScreenMalhaDeControle.Height                    = 320;
  ScreenMalhaDeControle.Buttons_RoundCount        = 0;
  ScreenMalhaDeControle.CButtons_RoundCount       = 1;
  ScreenMalhaDeControle.CButtons_Round            = Screen4_CButtons_Round;
  ScreenMalhaDeControle.LabelsCount               = 5;
  ScreenMalhaDeControle.Labels                    = Screen4_Labels;
  ScreenMalhaDeControle.CLabelsCount              = 5;
  ScreenMalhaDeControle.CLabels                   = Screen4_CLabels;
  ScreenMalhaDeControle.CBoxesCount               = 1;
  ScreenMalhaDeControle.CBoxes                    = Screen4_CBoxes;
  ScreenMalhaDeControle.Boxes_RoundCount          = 0;
  ScreenMalhaDeControle.LinesCount                = 0;
  ScreenMalhaDeControle.CLinesCount               = 0;
  ScreenMalhaDeControle.CheckBoxesCount           = 2;
  ScreenMalhaDeControle.CheckBoxes                = Screen4_CheckBoxes;
  ScreenMalhaDeControle.ProgressBarsCount         = 0;
  ScreenMalhaDeControle.ObjectsCount              = 14;

  ScreenResetInterlock.Color                     = 0xCE53;
  ScreenResetInterlock.Width                     = 240;
  ScreenResetInterlock.Height                    = 320;
  ScreenResetInterlock.Buttons_RoundCount        = 1;
  ScreenResetInterlock.Buttons_Round             = Screen5_Buttons_Round;
  ScreenResetInterlock.CButtons_RoundCount       = 1;
  ScreenResetInterlock.CButtons_Round            = Screen5_CButtons_Round;
  ScreenResetInterlock.LabelsCount               = 4;
  ScreenResetInterlock.Labels                    = Screen5_Labels;
  ScreenResetInterlock.CLabelsCount              = 5;
  ScreenResetInterlock.CLabels                   = Screen5_CLabels;
  ScreenResetInterlock.CBoxesCount               = 1;
  ScreenResetInterlock.CBoxes                    = Screen5_CBoxes;
  ScreenResetInterlock.Boxes_RoundCount          = 0;
  ScreenResetInterlock.LinesCount                = 0;
  ScreenResetInterlock.CLinesCount               = 0;
  ScreenResetInterlock.CheckBoxesCount           = 0;
  ScreenResetInterlock.ProgressBarsCount         = 0;
  ScreenResetInterlock.ObjectsCount              = 12;

  ScreenOperando.Color                     = 0xCE53;
  ScreenOperando.Width                     = 240;
  ScreenOperando.Height                    = 320;
  ScreenOperando.Buttons_RoundCount        = 0;
  ScreenOperando.CButtons_RoundCount       = 1;
  ScreenOperando.CButtons_Round            = Screen6_CButtons_Round;
  ScreenOperando.LabelsCount               = 5;
  ScreenOperando.Labels                    = Screen6_Labels;
  ScreenOperando.CLabelsCount              = 5;
  ScreenOperando.CLabels                   = Screen6_CLabels;
  ScreenOperando.CBoxesCount               = 1;
  ScreenOperando.CBoxes                    = Screen6_CBoxes;
  ScreenOperando.Boxes_RoundCount          = 0;
  ScreenOperando.LinesCount                = 0;
  ScreenOperando.CLinesCount               = 0;
  ScreenOperando.CheckBoxesCount           = 3;
  ScreenOperando.CheckBoxes                = Screen6_CheckBoxes;
  ScreenOperando.ProgressBarsCount         = 0;
  ScreenOperando.ObjectsCount              = 15;

  ScreenTecladoNumerico.Color                     = 0xCE53;
  ScreenTecladoNumerico.Width                     = 240;
  ScreenTecladoNumerico.Height                    = 320;
  ScreenTecladoNumerico.Buttons_RoundCount        = 0;
  ScreenTecladoNumerico.CButtons_RoundCount       = 14;
  ScreenTecladoNumerico.CButtons_Round            = Screen7_CButtons_Round;
  ScreenTecladoNumerico.LabelsCount               = 4;
  ScreenTecladoNumerico.Labels                    = Screen7_Labels;
  ScreenTecladoNumerico.CLabelsCount              = 2;
  ScreenTecladoNumerico.CLabels                   = Screen7_CLabels;
  ScreenTecladoNumerico.CBoxesCount               = 2;
  ScreenTecladoNumerico.CBoxes                    = Screen7_CBoxes;
  ScreenTecladoNumerico.Boxes_RoundCount          = 0;
  ScreenTecladoNumerico.LinesCount                = 0;
  ScreenTecladoNumerico.CLinesCount               = 0;
  ScreenTecladoNumerico.CheckBoxesCount           = 0;
  ScreenTecladoNumerico.ProgressBarsCount         = 0;
  ScreenTecladoNumerico.ObjectsCount              = 22;

  ScreenAcessoNegado.Color                     = 0xCE53;
  ScreenAcessoNegado.Width                     = 240;
  ScreenAcessoNegado.Height                    = 320;
  ScreenAcessoNegado.Buttons_RoundCount        = 0;
  ScreenAcessoNegado.CButtons_RoundCount       = 0;
  ScreenAcessoNegado.LabelsCount               = 6;
  ScreenAcessoNegado.Labels                    = Screen8_Labels;
  ScreenAcessoNegado.CLabelsCount              = 4;
  ScreenAcessoNegado.CLabels                   = Screen8_CLabels;
  ScreenAcessoNegado.CBoxesCount               = 1;
  ScreenAcessoNegado.CBoxes                    = Screen8_CBoxes;
  ScreenAcessoNegado.Boxes_RoundCount          = 1;
  ScreenAcessoNegado.Boxes_Round               = Screen8_Boxes_Round;
  ScreenAcessoNegado.LinesCount                = 0;
  ScreenAcessoNegado.CLinesCount               = 0;
  ScreenAcessoNegado.CheckBoxesCount           = 0;
  ScreenAcessoNegado.ProgressBarsCount         = 0;
  ScreenAcessoNegado.ObjectsCount              = 12;

  ScreenMENU.Color                     = 0xCE53;
  ScreenMENU.Width                     = 240;
  ScreenMENU.Height                    = 320;
  ScreenMENU.Buttons_RoundCount        = 0;
  ScreenMENU.CButtons_RoundCount       = 1;
  ScreenMENU.CButtons_Round            = Screen9_CButtons_Round;
  ScreenMENU.LabelsCount               = 4;
  ScreenMENU.Labels                    = Screen9_Labels;
  ScreenMENU.CLabelsCount              = 4;
  ScreenMENU.CLabels                   = Screen9_CLabels;
  ScreenMENU.CBoxesCount               = 1;
  ScreenMENU.CBoxes                    = Screen9_CBoxes;
  ScreenMENU.Boxes_RoundCount          = 0;
  ScreenMENU.LinesCount                = 0;
  ScreenMENU.CLinesCount               = 0;
  ScreenMENU.CheckBoxesCount           = 0;
  ScreenMENU.ProgressBarsCount         = 0;
  ScreenMENU.ObjectsCount              = 10;

  ScreenEndSerial.Color                     = 0xCE53;
  ScreenEndSerial.Width                     = 240;
  ScreenEndSerial.Height                    = 320;
  ScreenEndSerial.Buttons_RoundCount        = 0;
  ScreenEndSerial.CButtons_RoundCount       = 1;
  ScreenEndSerial.CButtons_Round            = Screen10_CButtons_Round;
  ScreenEndSerial.LabelsCount               = 4;
  ScreenEndSerial.Labels                    = Screen10_Labels;
  ScreenEndSerial.CLabelsCount              = 5;
  ScreenEndSerial.CLabels                   = Screen10_CLabels;
  ScreenEndSerial.CBoxesCount               = 1;
  ScreenEndSerial.CBoxes                    = Screen10_CBoxes;
  ScreenEndSerial.Boxes_RoundCount          = 0;
  ScreenEndSerial.LinesCount                = 0;
  ScreenEndSerial.CLinesCount               = 0;
  ScreenEndSerial.CheckBoxesCount           = 0;
  ScreenEndSerial.ProgressBarsCount         = 0;
  ScreenEndSerial.ObjectsCount              = 11;


  ProgressBar1.OwnerScreen     = &ScreenInicializacao;
  ProgressBar1.Order           = 0;
  ProgressBar1.Left            = 5;
  ProgressBar1.Top             = 228;
  ProgressBar1.Width           = 230;
  ProgressBar1.Height          = 17;
  ProgressBar1.Pen_Width       = 1;
  ProgressBar1.Pen_Color       = 0x0000;
  ProgressBar1.Visible         = 1;
  ProgressBar1.Transparent     = 1;
  ProgressBar1.Caption         = ProgressBar1_Caption;
  ProgressBar1.FontName        = Tahoma11x13_Regular;
  ProgressBar1.Font_Color      = 0x0000;
  ProgressBar1.Gradient        = 1;
  ProgressBar1.Gradient_Orientation = 0;
  ProgressBar1.Gradient_Start_Color = 0xFFFF;
  ProgressBar1.Gradient_End_Color = 0x07E0;
  ProgressBar1.Color           = 0xA65E;
  ProgressBar1.Background_Color = 0x8410;
  ProgressBar1.Min             = 0;
  ProgressBar1.Max             = 100;
  ProgressBar1.Position        = 50;
  ProgressBar1.Prev_Position   = 50;
  ProgressBar1.Show_Position   = 1;
  ProgressBar1.Show_Percentage = 1;
  ProgressBar1.Smooth          = 1;
  ProgressBar1.Rounded         = 1;
  ProgressBar1.Corner_Radius   = 1;

  Label32.OwnerScreen     = &ScreenInicializacao;
  Label32.Order           = 1;
  Label32.Left            = 5;
  Label32.Top             = 262;
  Label32.Width           = 230;
  Label32.Height          = 15;
  Label32.Visible         = 1;
  Label32.Active          = 1;
  Label32.Caption         = Label32_Caption;
  Label32.FontName        = Tahoma11x13_Regular;
  Label32.Font_Color      = 0x0000;
  Label32.VerticalText    = 0;
  Label32.OnUpPtr         = 0;
  Label32.OnDownPtr       = 0;
  Label32.OnClickPtr      = 0;
  Label32.OnPressPtr      = 0;

  Label33.OwnerScreen     = &ScreenInicializacao;
  Label33.Order           = 2;
  Label33.Left            = 86;
  Label33.Top             = 214;
  Label33.Width           = 68;
  Label33.Height          = 15;
  Label33.Visible         = 1;
  Label33.Active          = 1;
  Label33.Caption         = Label33_Caption;
  Label33.FontName        = Tahoma11x13_Regular;
  Label33.Font_Color      = 0x0000;
  Label33.VerticalText    = 0;
  Label33.OnUpPtr         = 0;
  Label33.OnDownPtr       = 0;
  Label33.OnClickPtr      = 0;
  Label33.OnPressPtr      = 0;

  Label34.OwnerScreen     = &ScreenInicializacao;
  Label34.Order           = 3;
  Label34.Left            = 5;
  Label34.Top             = 294;
  Label34.Width           = 112;
  Label34.Height          = 15;
  Label34.Visible         = 1;
  Label34.Active          = 1;
  Label34.Caption         = Label34_Caption;
  Label34.FontName        = Tahoma11x13_Regular;
  Label34.Font_Color      = 0x0000;
  Label34.VerticalText    = 0;
  Label34.OnUpPtr         = 0;
  Label34.OnDownPtr       = 0;
  Label34.OnClickPtr      = 0;
  Label34.OnPressPtr      = 0;

  Label35.OwnerScreen     = &ScreenInicializacao;
  Label35.Order           = 4;
  Label35.Left            = 5;
  Label35.Top             = 278;
  Label35.Width           = 86;
  Label35.Height          = 15;
  Label35.Visible         = 1;
  Label35.Active          = 1;
  Label35.Caption         = Label35_Caption;
  Label35.FontName        = Tahoma11x13_Regular;
  Label35.Font_Color      = 0x0000;
  Label35.VerticalText    = 0;
  Label35.OnUpPtr         = 0;
  Label35.OnDownPtr       = 0;
  Label35.OnClickPtr      = 0;
  Label35.OnPressPtr      = 0;

  Line2.OwnerScreen     = &ScreenInicializacao;
  Line2.Order           = 5;
  Line2.First_Point_X   = 1;
  Line2.First_Point_Y   = 30;
  Line2.Second_Point_X  = 237;
  Line2.Second_Point_Y  = 30;
  Line2.Visible         = 1;
  Line2.Pen_Width       = 1;
  Line2.Color           = 0x0000;

  Label36.OwnerScreen     = &ScreenInicializacao;
  Label36.Order           = 6;
  Label36.Left            = 7;
  Label36.Top             = 16;
  Label36.Width           = 88;
  Label36.Height          = 15;
  Label36.Visible         = 1;
  Label36.Active          = 1;
  Label36.Caption         = Label36_Caption;
  Label36.FontName        = Tahoma11x13_Regular;
  Label36.Font_Color      = 0x0000;
  Label36.VerticalText    = 0;
  Label36.OnUpPtr         = 0;
  Label36.OnDownPtr       = 0;
  Label36.OnClickPtr      = 0;
  Label36.OnPressPtr      = 0;

  Label37.OwnerScreen     = &ScreenInicializacao;
  Label37.Order           = 7;
  Label37.Left            = 118;
  Label37.Top             = 294;
  Label37.Width           = 41;
  Label37.Height          = 15;
  Label37.Visible         = 1;
  Label37.Active          = 1;
  Label37.Caption         = Label37_Caption;
  Label37.FontName        = Tahoma11x13_Regular;
  Label37.Font_Color      = 0x0000;
  Label37.VerticalText    = 0;
  Label37.OnUpPtr         = 0;
  Label37.OnDownPtr       = 0;
  Label37.OnClickPtr      = 0;
  Label37.OnPressPtr      = 0;

  ButtonRound2.OwnerScreen     = &ScreenPrincipal;
  ButtonRound2.Order           = 11;
  ButtonRound2.Left            = 160;
  ButtonRound2.Top             = 276;
  ButtonRound2.Width           = 70;
  ButtonRound2.Height          = 35;
  ButtonRound2.Pen_Width       = 1;
  ButtonRound2.Pen_Color       = 0x0000;
  ButtonRound2.Visible         = 1;
  ButtonRound2.Active          = 1;
  ButtonRound2.Transparent     = 1;
  ButtonRound2.Caption         = ButtonRound2_Caption;
  ButtonRound2.TextAlign       = _taCenter;
  ButtonRound2.TextAlignVertical= _tavMiddle;
  ButtonRound2.FontName        = Tahoma14x16_Bold;
  ButtonRound2.PressColEnabled = 1;
  ButtonRound2.Font_Color      = 0x0000;
  ButtonRound2.VerticalText    = 0;
  ButtonRound2.Gradient        = 1;
  ButtonRound2.Gradient_Orientation = 0;
  ButtonRound2.Gradient_Start_Color = 0xFFFF;
  ButtonRound2.Gradient_End_Color = 0xC618;
  ButtonRound2.Color           = 0xC618;
  ButtonRound2.Press_Color     = 0xE71C;
  ButtonRound2.Corner_Radius   = 3;
  ButtonRound2.OnUpPtr         = 0;
  ButtonRound2.OnDownPtr       = 0;
  ButtonRound2.OnClickPtr      = buttonMENU;
  ButtonRound2.OnPressPtr      = 0;

  Label26.OwnerScreen     = &ScreenPrincipal;
  Label26.Order           = 14;
  Label26.Left            = 158;
  Label26.Top             = 147;
  Label26.Width           = 60;
  Label26.Height          = 23;
  Label26.Visible         = 1;
  Label26.Active          = 1;
  Label26.Caption         = Label26_Caption;
  Label26.FontName        = Tahoma20x21_Bold;
  Label26.Font_Color      = 0xFFFF;
  Label26.VerticalText    = 0;
  Label26.OnUpPtr         = 0;
  Label26.OnDownPtr       = 0;
  Label26.OnClickPtr      = 0;
  Label26.OnPressPtr      = 0;

  Label28.OwnerScreen     = &ScreenPrincipal;
  Label28.Order           = 15;
  Label28.Left            = 158;
  Label28.Top             = 56;
  Label28.Width           = 60;
  Label28.Height          = 23;
  Label28.Visible         = 1;
  Label28.Active          = 1;
  Label28.Caption         = Label28_Caption;
  Label28.FontName        = Tahoma20x21_Bold;
  Label28.Font_Color      = 0xFFFF;
  Label28.VerticalText    = 0;
  Label28.OnUpPtr         = 0;
  Label28.OnDownPtr       = 0;
  Label28.OnClickPtr      = 0;
  Label28.OnPressPtr      = 0;

  Label29.OwnerScreen     = &ScreenPrincipal;
  Label29.Order           = 16;
  Label29.Left            = 98;
  Label29.Top             = 193;
  Label29.Width           = 60;
  Label29.Height          = 23;
  Label29.Visible         = 1;
  Label29.Active          = 1;
  Label29.Caption         = Label29_Caption;
  Label29.FontName        = Tahoma20x21_Bold;
  Label29.Font_Color      = 0xFFFF;
  Label29.VerticalText    = 0;
  Label29.OnUpPtr         = 0;
  Label29.OnDownPtr       = 0;
  Label29.OnClickPtr      = 0;
  Label29.OnPressPtr      = 0;

  Label30.OwnerScreen     = &ScreenPrincipal;
  Label30.Order           = 17;
  Label30.Left            = 158;
  Label30.Top             = 102;
  Label30.Width           = 60;
  Label30.Height          = 23;
  Label30.Visible         = 1;
  Label30.Active          = 1;
  Label30.Caption         = Label30_Caption;
  Label30.FontName        = Tahoma20x21_Bold;
  Label30.Font_Color      = 0xFFFF;
  Label30.VerticalText    = 0;
  Label30.OnUpPtr         = 0;
  Label30.OnDownPtr       = 0;
  Label30.OnClickPtr      = 0;
  Label30.OnPressPtr      = 0;

  Label31.OwnerScreen     = &ScreenPrincipal;
  Label31.Order           = 18;
  Label31.Left            = 158;
  Label31.Top             = 238;
  Label31.Width           = 60;
  Label31.Height          = 23;
  Label31.Visible         = 1;
  Label31.Active          = 1;
  Label31.Caption         = Label31_Caption;
  Label31.FontName        = Tahoma20x21_Bold;
  Label31.Font_Color      = 0xFFFF;
  Label31.VerticalText    = 0;
  Label31.OnUpPtr         = 0;
  Label31.OnDownPtr       = 0;
  Label31.OnClickPtr      = 0;
  Label31.OnPressPtr      = 0;

  Label44.OwnerScreen     = &ScreenPrincipal;
  Label44.Order           = 19;
  Label44.Left            = 185;
  Label44.Top             = 23;
  Label44.Width           = 39;
  Label44.Height          = 17;
  Label44.Visible         = 1;
  Label44.Active          = 1;
  Label44.Caption         = Label44_Caption;
  Label44.FontName        = Tahoma12x16_Regular;
  Label44.Font_Color      = 0x0000;
  Label44.VerticalText    = 0;
  Label44.OnUpPtr         = 0;
  Label44.OnDownPtr       = 0;
  Label44.OnClickPtr      = 0;
  Label44.OnPressPtr      = 0;

  Label45.OwnerScreen     = &ScreenPrincipal;
  Label45.Order           = 20;
  Label45.Left            = 185;
  Label45.Top             = 2;
  Label45.Width           = 39;
  Label45.Height          = 17;
  Label45.Visible         = 1;
  Label45.Active          = 1;
  Label45.Caption         = Label45_Caption;
  Label45.FontName        = Tahoma12x16_Regular;
  Label45.Font_Color      = 0x0000;
  Label45.VerticalText    = 0;
  Label45.OnUpPtr         = 0;
  Label45.OnDownPtr       = 0;
  Label45.OnClickPtr      = 0;
  Label45.OnPressPtr      = 0;

  Label46.OwnerScreen     = &ScreenPrincipal;
  Label46.Order           = 21;
  Label46.Left            = 45;
  Label46.Top             = 2;
  Label46.Width           = 39;
  Label46.Height          = 17;
  Label46.Visible         = 1;
  Label46.Active          = 1;
  Label46.Caption         = Label46_Caption;
  Label46.FontName        = Tahoma12x16_Regular;
  Label46.Font_Color      = 0x0000;
  Label46.VerticalText    = 0;
  Label46.OnUpPtr         = 0;
  Label46.OnDownPtr       = 0;
  Label46.OnClickPtr      = 0;
  Label46.OnPressPtr      = 0;

  Label47.OwnerScreen     = &ScreenPrincipal;
  Label47.Order           = 22;
  Label47.Left            = 45;
  Label47.Top             = 23;
  Label47.Width           = 39;
  Label47.Height          = 17;
  Label47.Visible         = 1;
  Label47.Active          = 1;
  Label47.Caption         = Label47_Caption;
  Label47.FontName        = Tahoma12x16_Regular;
  Label47.Font_Color      = 0x0000;
  Label47.VerticalText    = 0;
  Label47.OnUpPtr         = 0;
  Label47.OnDownPtr       = 0;
  Label47.OnClickPtr      = 0;
  Label47.OnPressPtr      = 0;

  Label15.OwnerScreen     = &ScreenSenha;
  Label15.Order           = 15;
  Label15.Left            = 62;
  Label15.Top             = 58;
  Label15.Width           = 0;
  Label15.Height          = 23;
  Label15.Visible         = 1;
  Label15.Active          = 0;
  Label15.Caption         = Label15_Caption;
  Label15.FontName        = Tahoma20x21_Bold;
  Label15.Font_Color      = 0xFFFF;
  Label15.VerticalText    = 0;
  Label15.OnUpPtr         = 0;
  Label15.OnDownPtr       = 0;
  Label15.OnClickPtr      = 0;
  Label15.OnPressPtr      = 0;

  Label48.OwnerScreen     = &ScreenSenha;
  Label48.Order           = 17;
  Label48.Left            = 185;
  Label48.Top             = 23;
  Label48.Width           = 39;
  Label48.Height          = 17;
  Label48.Visible         = 1;
  Label48.Active          = 1;
  Label48.Caption         = Label48_Caption;
  Label48.FontName        = Tahoma12x16_Regular;
  Label48.Font_Color      = 0x0000;
  Label48.VerticalText    = 0;
  Label48.OnUpPtr         = 0;
  Label48.OnDownPtr       = 0;
  Label48.OnClickPtr      = 0;
  Label48.OnPressPtr      = 0;

  Label49.OwnerScreen     = &ScreenSenha;
  Label49.Order           = 18;
  Label49.Left            = 185;
  Label49.Top             = 3;
  Label49.Width           = 39;
  Label49.Height          = 17;
  Label49.Visible         = 1;
  Label49.Active          = 1;
  Label49.Caption         = Label49_Caption;
  Label49.FontName        = Tahoma12x16_Regular;
  Label49.Font_Color      = 0x0000;
  Label49.VerticalText    = 0;
  Label49.OnUpPtr         = 0;
  Label49.OnDownPtr       = 0;
  Label49.OnClickPtr      = 0;
  Label49.OnPressPtr      = 0;

  Label50.OwnerScreen     = &ScreenSenha;
  Label50.Order           = 19;
  Label50.Left            = 45;
  Label50.Top             = 3;
  Label50.Width           = 39;
  Label50.Height          = 17;
  Label50.Visible         = 1;
  Label50.Active          = 1;
  Label50.Caption         = Label50_Caption;
  Label50.FontName        = Tahoma12x16_Regular;
  Label50.Font_Color      = 0x0000;
  Label50.VerticalText    = 0;
  Label50.OnUpPtr         = 0;
  Label50.OnDownPtr       = 0;
  Label50.OnClickPtr      = 0;
  Label50.OnPressPtr      = 0;

  Label51.OwnerScreen     = &ScreenSenha;
  Label51.Order           = 20;
  Label51.Left            = 45;
  Label51.Top             = 23;
  Label51.Width           = 39;
  Label51.Height          = 17;
  Label51.Visible         = 1;
  Label51.Active          = 1;
  Label51.Caption         = Label51_Caption;
  Label51.FontName        = Tahoma12x16_Regular;
  Label51.Font_Color      = 0x0000;
  Label51.VerticalText    = 0;
  Label51.OnUpPtr         = 0;
  Label51.OnDownPtr       = 0;
  Label51.OnClickPtr      = 0;
  Label51.OnPressPtr      = 0;

  Label27.OwnerScreen     = &ScreenMalhaDeControle;
  Label27.Order           = 2;
  Label27.Left            = 153;
  Label27.Top             = 59;
  Label27.Width           = 60;
  Label27.Height          = 23;
  Label27.Visible         = 1;
  Label27.Active          = 1;
  Label27.Caption         = Label27_Caption;
  Label27.FontName        = Tahoma20x21_Bold;
  Label27.Font_Color      = 0x0000;
  Label27.VerticalText    = 0;
  Label27.OnUpPtr         = 0;
  Label27.OnDownPtr       = 0;
  Label27.OnClickPtr      = 0;
  Label27.OnPressPtr      = 0;

  CheckBox1.OwnerScreen     = &ScreenMalhaDeControle;
  CheckBox1.Order           = 4;
  CheckBox1.Left            = 38;
  CheckBox1.Top             = 127;
  CheckBox1.Width           = 91;
  CheckBox1.Height          = 28;
  CheckBox1.Pen_Width       = 1;
  CheckBox1.Pen_Color       = 0x0000;
  CheckBox1.Visible         = 1;
  CheckBox1.Active          = 1;
  CheckBox1.Checked         = 0;
  CheckBox1.Transparent     = 1;
  CheckBox1.Caption         = CheckBox1_Caption;
  CheckBox1.TextAlign       = _taLeft;
  CheckBox1.FontName        = Tahoma20x21_Bold;
  CheckBox1.PressColEnabled = 1;
  CheckBox1.Font_Color      = 0x0000;
  CheckBox1.Gradient        = 1;
  CheckBox1.Gradient_Orientation = 0;
  CheckBox1.Gradient_Start_Color = 0xFFFF;
  CheckBox1.Gradient_End_Color = 0xC618;
  CheckBox1.Color           = 0xC618;
  CheckBox1.Press_Color     = 0xE71C;
  CheckBox1.Rounded         = 1;
  CheckBox1.Corner_Radius   = 3;
  CheckBox1.OnUpPtr         = 0;
  CheckBox1.OnDownPtr       = 0;
  CheckBox1.OnClickPtr      = malhaAberta;
  CheckBox1.OnPressPtr      = 0;

  CheckBox2.OwnerScreen     = &ScreenMalhaDeControle;
  CheckBox2.Order           = 5;
  CheckBox2.Left            = 38;
  CheckBox2.Top             = 201;
  CheckBox2.Width           = 105;
  CheckBox2.Height          = 28;
  CheckBox2.Pen_Width       = 1;
  CheckBox2.Pen_Color       = 0x0000;
  CheckBox2.Visible         = 1;
  CheckBox2.Active          = 1;
  CheckBox2.Checked         = 0;
  CheckBox2.Transparent     = 1;
  CheckBox2.Caption         = CheckBox2_Caption;
  CheckBox2.TextAlign       = _taLeft;
  CheckBox2.FontName        = Tahoma20x21_Bold;
  CheckBox2.PressColEnabled = 1;
  CheckBox2.Font_Color      = 0x0000;
  CheckBox2.Gradient        = 1;
  CheckBox2.Gradient_Orientation = 0;
  CheckBox2.Gradient_Start_Color = 0xFFFF;
  CheckBox2.Gradient_End_Color = 0xC618;
  CheckBox2.Color           = 0xC618;
  CheckBox2.Press_Color     = 0xE71C;
  CheckBox2.Rounded         = 1;
  CheckBox2.Corner_Radius   = 3;
  CheckBox2.OnUpPtr         = 0;
  CheckBox2.OnDownPtr       = 0;
  CheckBox2.OnClickPtr      = malhaFechada;
  CheckBox2.OnPressPtr      = 0;

  Label52.OwnerScreen     = &ScreenMalhaDeControle;
  Label52.Order           = 6;
  Label52.Left            = 185;
  Label52.Top             = 23;
  Label52.Width           = 39;
  Label52.Height          = 17;
  Label52.Visible         = 1;
  Label52.Active          = 1;
  Label52.Caption         = Label52_Caption;
  Label52.FontName        = Tahoma12x16_Regular;
  Label52.Font_Color      = 0x0000;
  Label52.VerticalText    = 0;
  Label52.OnUpPtr         = 0;
  Label52.OnDownPtr       = 0;
  Label52.OnClickPtr      = 0;
  Label52.OnPressPtr      = 0;

  Label53.OwnerScreen     = &ScreenMalhaDeControle;
  Label53.Order           = 7;
  Label53.Left            = 185;
  Label53.Top             = 2;
  Label53.Width           = 39;
  Label53.Height          = 17;
  Label53.Visible         = 1;
  Label53.Active          = 1;
  Label53.Caption         = Label53_Caption;
  Label53.FontName        = Tahoma12x16_Regular;
  Label53.Font_Color      = 0x0000;
  Label53.VerticalText    = 0;
  Label53.OnUpPtr         = 0;
  Label53.OnDownPtr       = 0;
  Label53.OnClickPtr      = 0;
  Label53.OnPressPtr      = 0;

  Label54.OwnerScreen     = &ScreenMalhaDeControle;
  Label54.Order           = 8;
  Label54.Left            = 45;
  Label54.Top             = 2;
  Label54.Width           = 39;
  Label54.Height          = 17;
  Label54.Visible         = 1;
  Label54.Active          = 1;
  Label54.Caption         = Label54_Caption;
  Label54.FontName        = Tahoma12x16_Regular;
  Label54.Font_Color      = 0x0000;
  Label54.VerticalText    = 0;
  Label54.OnUpPtr         = 0;
  Label54.OnDownPtr       = 0;
  Label54.OnClickPtr      = 0;
  Label54.OnPressPtr      = 0;

  Label55.OwnerScreen     = &ScreenMalhaDeControle;
  Label55.Order           = 9;
  Label55.Left            = 45;
  Label55.Top             = 23;
  Label55.Width           = 39;
  Label55.Height          = 17;
  Label55.Visible         = 1;
  Label55.Active          = 1;
  Label55.Caption         = Label55_Caption;
  Label55.FontName        = Tahoma12x16_Regular;
  Label55.Font_Color      = 0x0000;
  Label55.VerticalText    = 0;
  Label55.OnUpPtr         = 0;
  Label55.OnDownPtr       = 0;
  Label55.OnClickPtr      = 0;
  Label55.OnPressPtr      = 0;

  ButtonRound6.OwnerScreen     = &ScreenResetInterlock;
  ButtonRound6.Order           = 3;
  ButtonRound6.Left            = 160;
  ButtonRound6.Top             = 276;
  ButtonRound6.Width           = 70;
  ButtonRound6.Height          = 35;
  ButtonRound6.Pen_Width       = 1;
  ButtonRound6.Pen_Color       = 0x0000;
  ButtonRound6.Visible         = 1;
  ButtonRound6.Active          = 1;
  ButtonRound6.Transparent     = 1;
  ButtonRound6.Caption         = ButtonRound6_Caption;
  ButtonRound6.TextAlign       = _taCenter;
  ButtonRound6.TextAlignVertical= _tavMiddle;
  ButtonRound6.FontName        = Tahoma14x16_Bold;
  ButtonRound6.PressColEnabled = 1;
  ButtonRound6.Font_Color      = 0x0000;
  ButtonRound6.VerticalText    = 0;
  ButtonRound6.Gradient        = 1;
  ButtonRound6.Gradient_Orientation = 0;
  ButtonRound6.Gradient_Start_Color = 0xB000;
  ButtonRound6.Gradient_End_Color = 0xC618;
  ButtonRound6.Color           = 0xC618;
  ButtonRound6.Press_Color     = 0xE71C;
  ButtonRound6.Corner_Radius   = 3;
  ButtonRound6.OnUpPtr         = 0;
  ButtonRound6.OnDownPtr       = 0;
  ButtonRound6.OnClickPtr      = resetInterlock;
  ButtonRound6.OnPressPtr      = 0;

  Label56.OwnerScreen     = &ScreenResetInterlock;
  Label56.Order           = 4;
  Label56.Left            = 185;
  Label56.Top             = 23;
  Label56.Width           = 39;
  Label56.Height          = 17;
  Label56.Visible         = 1;
  Label56.Active          = 1;
  Label56.Caption         = Label56_Caption;
  Label56.FontName        = Tahoma12x16_Regular;
  Label56.Font_Color      = 0x0000;
  Label56.VerticalText    = 0;
  Label56.OnUpPtr         = 0;
  Label56.OnDownPtr       = 0;
  Label56.OnClickPtr      = 0;
  Label56.OnPressPtr      = 0;

  Label57.OwnerScreen     = &ScreenResetInterlock;
  Label57.Order           = 5;
  Label57.Left            = 185;
  Label57.Top             = 2;
  Label57.Width           = 39;
  Label57.Height          = 17;
  Label57.Visible         = 1;
  Label57.Active          = 1;
  Label57.Caption         = Label57_Caption;
  Label57.FontName        = Tahoma12x16_Regular;
  Label57.Font_Color      = 0x0000;
  Label57.VerticalText    = 0;
  Label57.OnUpPtr         = 0;
  Label57.OnDownPtr       = 0;
  Label57.OnClickPtr      = 0;
  Label57.OnPressPtr      = 0;

  Label58.OwnerScreen     = &ScreenResetInterlock;
  Label58.Order           = 6;
  Label58.Left            = 45;
  Label58.Top             = 2;
  Label58.Width           = 39;
  Label58.Height          = 17;
  Label58.Visible         = 1;
  Label58.Active          = 1;
  Label58.Caption         = Label58_Caption;
  Label58.FontName        = Tahoma12x16_Regular;
  Label58.Font_Color      = 0x0000;
  Label58.VerticalText    = 0;
  Label58.OnUpPtr         = 0;
  Label58.OnDownPtr       = 0;
  Label58.OnClickPtr      = 0;
  Label58.OnPressPtr      = 0;

  Label59.OwnerScreen     = &ScreenResetInterlock;
  Label59.Order           = 7;
  Label59.Left            = 45;
  Label59.Top             = 23;
  Label59.Width           = 39;
  Label59.Height          = 17;
  Label59.Visible         = 1;
  Label59.Active          = 1;
  Label59.Caption         = Label59_Caption;
  Label59.FontName        = Tahoma12x16_Regular;
  Label59.Font_Color      = 0x0000;
  Label59.VerticalText    = 0;
  Label59.OnUpPtr         = 0;
  Label59.OnDownPtr       = 0;
  Label59.OnClickPtr      = 0;
  Label59.OnPressPtr      = 0;

  Label43.OwnerScreen     = &ScreenOperando;
  Label43.Order           = 2;
  Label43.Left            = 153;
  Label43.Top             = 59;
  Label43.Width           = 60;
  Label43.Height          = 23;
  Label43.Visible         = 1;
  Label43.Active          = 1;
  Label43.Caption         = Label43_Caption;
  Label43.FontName        = Tahoma20x21_Bold;
  Label43.Font_Color      = 0x0000;
  Label43.VerticalText    = 0;
  Label43.OnUpPtr         = 0;
  Label43.OnDownPtr       = 0;
  Label43.OnClickPtr      = 0;
  Label43.OnPressPtr      = 0;

  CheckBox3.OwnerScreen     = &ScreenOperando;
  CheckBox3.Order           = 4;
  CheckBox3.Left            = 38;
  CheckBox3.Top             = 108;
  CheckBox3.Width           = 101;
  CheckBox3.Height          = 28;
  CheckBox3.Pen_Width       = 1;
  CheckBox3.Pen_Color       = 0x0000;
  CheckBox3.Visible         = 1;
  CheckBox3.Active          = 1;
  CheckBox3.Checked         = 0;
  CheckBox3.Transparent     = 1;
  CheckBox3.Caption         = CheckBox3_Caption;
  CheckBox3.TextAlign       = _taLeft;
  CheckBox3.FontName        = Tahoma20x21_Bold;
  CheckBox3.PressColEnabled = 1;
  CheckBox3.Font_Color      = 0x0000;
  CheckBox3.Gradient        = 1;
  CheckBox3.Gradient_Orientation = 0;
  CheckBox3.Gradient_Start_Color = 0xFFFF;
  CheckBox3.Gradient_End_Color = 0xC618;
  CheckBox3.Color           = 0xC618;
  CheckBox3.Press_Color     = 0xE71C;
  CheckBox3.Rounded         = 1;
  CheckBox3.Corner_Radius   = 3;
  CheckBox3.OnUpPtr         = 0;
  CheckBox3.OnDownPtr       = 0;
  CheckBox3.OnClickPtr      = modoRemoto;
  CheckBox3.OnPressPtr      = 0;

  CheckBox4.OwnerScreen     = &ScreenOperando;
  CheckBox4.Order           = 5;
  CheckBox4.Left            = 38;
  CheckBox4.Top             = 164;
  CheckBox4.Width           = 78;
  CheckBox4.Height          = 28;
  CheckBox4.Pen_Width       = 1;
  CheckBox4.Pen_Color       = 0x0000;
  CheckBox4.Visible         = 1;
  CheckBox4.Active          = 1;
  CheckBox4.Checked         = 0;
  CheckBox4.Transparent     = 1;
  CheckBox4.Caption         = CheckBox4_Caption;
  CheckBox4.TextAlign       = _taLeft;
  CheckBox4.FontName        = Tahoma20x21_Bold;
  CheckBox4.PressColEnabled = 1;
  CheckBox4.Font_Color      = 0x0000;
  CheckBox4.Gradient        = 1;
  CheckBox4.Gradient_Orientation = 0;
  CheckBox4.Gradient_Start_Color = 0xFFFF;
  CheckBox4.Gradient_End_Color = 0xC618;
  CheckBox4.Color           = 0xC618;
  CheckBox4.Press_Color     = 0xE71C;
  CheckBox4.Rounded         = 1;
  CheckBox4.Corner_Radius   = 3;
  CheckBox4.OnUpPtr         = 0;
  CheckBox4.OnDownPtr       = 0;
  CheckBox4.OnClickPtr      = modoLocal;
  CheckBox4.OnPressPtr      = 0;

  CheckBox5.OwnerScreen     = &ScreenOperando;
  CheckBox5.Order           = 6;
  CheckBox5.Left            = 38;
  CheckBox5.Top             = 220;
  CheckBox5.Width           = 101;
  CheckBox5.Height          = 28;
  CheckBox5.Pen_Width       = 1;
  CheckBox5.Pen_Color       = 0x0000;
  CheckBox5.Visible         = 1;
  CheckBox5.Active          = 1;
  CheckBox5.Checked         = 0;
  CheckBox5.Transparent     = 1;
  CheckBox5.Caption         = CheckBox5_Caption;
  CheckBox5.TextAlign       = _taLeft;
  CheckBox5.FontName        = Tahoma20x21_Bold;
  CheckBox5.PressColEnabled = 1;
  CheckBox5.Font_Color      = 0x0000;
  CheckBox5.Gradient        = 1;
  CheckBox5.Gradient_Orientation = 0;
  CheckBox5.Gradient_Start_Color = 0xFFFF;
  CheckBox5.Gradient_End_Color = 0xC618;
  CheckBox5.Color           = 0xC618;
  CheckBox5.Press_Color     = 0xE71C;
  CheckBox5.Rounded         = 1;
  CheckBox5.Corner_Radius   = 3;
  CheckBox5.OnUpPtr         = 0;
  CheckBox5.OnDownPtr       = 0;
  CheckBox5.OnClickPtr      = modoPCHost;
  CheckBox5.OnPressPtr      = 0;

  Label60.OwnerScreen     = &ScreenOperando;
  Label60.Order           = 7;
  Label60.Left            = 185;
  Label60.Top             = 23;
  Label60.Width           = 39;
  Label60.Height          = 17;
  Label60.Visible         = 1;
  Label60.Active          = 1;
  Label60.Caption         = Label60_Caption;
  Label60.FontName        = Tahoma12x16_Regular;
  Label60.Font_Color      = 0x0000;
  Label60.VerticalText    = 0;
  Label60.OnUpPtr         = 0;
  Label60.OnDownPtr       = 0;
  Label60.OnClickPtr      = 0;
  Label60.OnPressPtr      = 0;

  Label61.OwnerScreen     = &ScreenOperando;
  Label61.Order           = 8;
  Label61.Left            = 185;
  Label61.Top             = 2;
  Label61.Width           = 39;
  Label61.Height          = 17;
  Label61.Visible         = 1;
  Label61.Active          = 1;
  Label61.Caption         = Label61_Caption;
  Label61.FontName        = Tahoma12x16_Regular;
  Label61.Font_Color      = 0x0000;
  Label61.VerticalText    = 0;
  Label61.OnUpPtr         = 0;
  Label61.OnDownPtr       = 0;
  Label61.OnClickPtr      = 0;
  Label61.OnPressPtr      = 0;

  Label62.OwnerScreen     = &ScreenOperando;
  Label62.Order           = 9;
  Label62.Left            = 45;
  Label62.Top             = 2;
  Label62.Width           = 39;
  Label62.Height          = 17;
  Label62.Visible         = 1;
  Label62.Active          = 1;
  Label62.Caption         = Label62_Caption;
  Label62.FontName        = Tahoma12x16_Regular;
  Label62.Font_Color      = 0x0000;
  Label62.VerticalText    = 0;
  Label62.OnUpPtr         = 0;
  Label62.OnDownPtr       = 0;
  Label62.OnClickPtr      = 0;
  Label62.OnPressPtr      = 0;

  Label63.OwnerScreen     = &ScreenOperando;
  Label63.Order           = 10;
  Label63.Left            = 45;
  Label63.Top             = 23;
  Label63.Width           = 39;
  Label63.Height          = 17;
  Label63.Visible         = 1;
  Label63.Active          = 1;
  Label63.Caption         = Label63_Caption;
  Label63.FontName        = Tahoma12x16_Regular;
  Label63.Font_Color      = 0x0000;
  Label63.VerticalText    = 0;
  Label63.OnUpPtr         = 0;
  Label63.OnDownPtr       = 0;
  Label63.OnClickPtr      = 0;
  Label63.OnPressPtr      = 0;

  Label64.OwnerScreen     = &ScreenTecladoNumerico;
  Label64.Order           = 16;
  Label64.Left            = 8;
  Label64.Top             = 25;
  Label64.Width           = 80;
  Label64.Height          = 20;
  Label64.Visible         = 1;
  Label64.Active          = 1;
  Label64.Caption         = Label64_Caption;
  Label64.FontName        = Tahoma15x18_Regular;
  Label64.Font_Color      = 0x0000;
  Label64.VerticalText    = 0;
  Label64.OnUpPtr         = 0;
  Label64.OnDownPtr       = 0;
  Label64.OnClickPtr      = 0;
  Label64.OnPressPtr      = 0;

  Label66.OwnerScreen     = &ScreenTecladoNumerico;
  Label66.Order           = 19;
  Label66.Left            = 62;
  Label66.Top             = 58;
  Label66.Width           = 0;
  Label66.Height          = 23;
  Label66.Visible         = 1;
  Label66.Active          = 1;
  Label66.Caption         = Label66_Caption;
  Label66.FontName        = Tahoma20x21_Bold;
  Label66.Font_Color      = 0xFFFF;
  Label66.VerticalText    = 0;
  Label66.OnUpPtr         = 0;
  Label66.OnDownPtr       = 0;
  Label66.OnClickPtr      = 0;
  Label66.OnPressPtr      = 0;

  Label86.OwnerScreen     = &ScreenTecladoNumerico;
  Label86.Order           = 20;
  Label86.Left            = 112;
  Label86.Top             = 8;
  Label86.Width           = 0;
  Label86.Height          = 15;
  Label86.Visible         = 1;
  Label86.Active          = 1;
  Label86.Caption         = Label86_Caption;
  Label86.FontName        = Tahoma11x13_Regular;
  Label86.Font_Color      = 0x0000;
  Label86.VerticalText    = 0;
  Label86.OnUpPtr         = 0;
  Label86.OnDownPtr       = 0;
  Label86.OnClickPtr      = 0;
  Label86.OnPressPtr      = 0;

  Label87.OwnerScreen     = &ScreenTecladoNumerico;
  Label87.Order           = 21;
  Label87.Left            = 112;
  Label87.Top             = 30;
  Label87.Width           = 0;
  Label87.Height          = 15;
  Label87.Visible         = 1;
  Label87.Active          = 1;
  Label87.Caption         = Label87_Caption;
  Label87.FontName        = Tahoma11x13_Regular;
  Label87.Font_Color      = 0x0000;
  Label87.VerticalText    = 0;
  Label87.OnUpPtr         = 0;
  Label87.OnDownPtr       = 0;
  Label87.OnClickPtr      = 0;
  Label87.OnPressPtr      = 0;

  Label67.OwnerScreen     = &ScreenAcessoNegado;
  Label67.Order           = 1;
  Label67.Left            = 185;
  Label67.Top             = 23;
  Label67.Width           = 39;
  Label67.Height          = 17;
  Label67.Visible         = 1;
  Label67.Active          = 1;
  Label67.Caption         = Label67_Caption;
  Label67.FontName        = Tahoma12x16_Regular;
  Label67.Font_Color      = 0x0000;
  Label67.VerticalText    = 0;
  Label67.OnUpPtr         = 0;
  Label67.OnDownPtr       = 0;
  Label67.OnClickPtr      = 0;
  Label67.OnPressPtr      = 0;

  Label68.OwnerScreen     = &ScreenAcessoNegado;
  Label68.Order           = 2;
  Label68.Left            = 185;
  Label68.Top             = 3;
  Label68.Width           = 39;
  Label68.Height          = 17;
  Label68.Visible         = 1;
  Label68.Active          = 1;
  Label68.Caption         = Label68_Caption;
  Label68.FontName        = Tahoma12x16_Regular;
  Label68.Font_Color      = 0x0000;
  Label68.VerticalText    = 0;
  Label68.OnUpPtr         = 0;
  Label68.OnDownPtr       = 0;
  Label68.OnClickPtr      = 0;
  Label68.OnPressPtr      = 0;

  Label69.OwnerScreen     = &ScreenAcessoNegado;
  Label69.Order           = 3;
  Label69.Left            = 45;
  Label69.Top             = 3;
  Label69.Width           = 39;
  Label69.Height          = 17;
  Label69.Visible         = 1;
  Label69.Active          = 1;
  Label69.Caption         = Label69_Caption;
  Label69.FontName        = Tahoma12x16_Regular;
  Label69.Font_Color      = 0x0000;
  Label69.VerticalText    = 0;
  Label69.OnUpPtr         = 0;
  Label69.OnDownPtr       = 0;
  Label69.OnClickPtr      = 0;
  Label69.OnPressPtr      = 0;

  Label71.OwnerScreen     = &ScreenAcessoNegado;
  Label71.Order           = 4;
  Label71.Left            = 45;
  Label71.Top             = 23;
  Label71.Width           = 39;
  Label71.Height          = 17;
  Label71.Visible         = 1;
  Label71.Active          = 1;
  Label71.Caption         = Label71_Caption;
  Label71.FontName        = Tahoma12x16_Regular;
  Label71.Font_Color      = 0x0000;
  Label71.VerticalText    = 0;
  Label71.OnUpPtr         = 0;
  Label71.OnDownPtr       = 0;
  Label71.OnClickPtr      = 0;
  Label71.OnPressPtr      = 0;

  BoxRound1.OwnerScreen     = &ScreenAcessoNegado;
  BoxRound1.Order           = 9;
  BoxRound1.Left            = 19;
  BoxRound1.Top             = 70;
  BoxRound1.Width           = 201;
  BoxRound1.Height          = 159;
  BoxRound1.Pen_Width       = 1;
  BoxRound1.Pen_Color       = 0x0000;
  BoxRound1.Visible         = 1;
  BoxRound1.Active          = 0;
  BoxRound1.Transparent     = 1;
  BoxRound1.Gradient        = 1;
  BoxRound1.Gradient_Orientation = 0;
  BoxRound1.Gradient_Start_Color = 0x0000;
  BoxRound1.Gradient_End_Color = 0x0000;
  BoxRound1.Color           = 0xC618;
  BoxRound1.PressColEnabled = 1;
  BoxRound1.Press_Color     = 0xE71C;
  BoxRound1.Corner_Radius   = 3;
  BoxRound1.OnUpPtr         = 0;
  BoxRound1.OnDownPtr       = 0;
  BoxRound1.OnClickPtr      = 0;
  BoxRound1.OnPressPtr      = 0;

  Label76.OwnerScreen     = &ScreenAcessoNegado;
  Label76.Order           = 10;
  Label76.Left            = 73;
  Label76.Top             = 132;
  Label76.Width           = 94;
  Label76.Height          = 36;
  Label76.Visible         = 1;
  Label76.Active          = 1;
  Label76.Caption         = Label76_Caption;
  Label76.FontName        = Tahoma26x33_Regular;
  Label76.Font_Color      = 0xFFFF;
  Label76.VerticalText    = 0;
  Label76.OnUpPtr         = 0;
  Label76.OnDownPtr       = 0;
  Label76.OnClickPtr      = 0;
  Label76.OnPressPtr      = 0;

  Label77.OwnerScreen     = &ScreenAcessoNegado;
  Label77.Order           = 11;
  Label77.Left            = 93;
  Label77.Top             = 104;
  Label77.Width           = 53;
  Label77.Height          = 23;
  Label77.Visible         = 1;
  Label77.Active          = 1;
  Label77.Caption         = Label77_Caption;
  Label77.FontName        = Tahoma17x21_Regular;
  Label77.Font_Color      = 0xFFFF;
  Label77.VerticalText    = 0;
  Label77.OnUpPtr         = 0;
  Label77.OnDownPtr       = 0;
  Label77.OnClickPtr      = 0;
  Label77.OnPressPtr      = 0;

  Label78.OwnerScreen     = &ScreenMENU;
  Label78.Order           = 2;
  Label78.Left            = 185;
  Label78.Top             = 23;
  Label78.Width           = 39;
  Label78.Height          = 17;
  Label78.Visible         = 1;
  Label78.Active          = 1;
  Label78.Caption         = Label78_Caption;
  Label78.FontName        = Tahoma12x16_Regular;
  Label78.Font_Color      = 0x0000;
  Label78.VerticalText    = 0;
  Label78.OnUpPtr         = 0;
  Label78.OnDownPtr       = 0;
  Label78.OnClickPtr      = 0;
  Label78.OnPressPtr      = 0;

  Label79.OwnerScreen     = &ScreenMENU;
  Label79.Order           = 3;
  Label79.Left            = 185;
  Label79.Top             = 3;
  Label79.Width           = 39;
  Label79.Height          = 17;
  Label79.Visible         = 1;
  Label79.Active          = 1;
  Label79.Caption         = Label79_Caption;
  Label79.FontName        = Tahoma12x16_Regular;
  Label79.Font_Color      = 0x0000;
  Label79.VerticalText    = 0;
  Label79.OnUpPtr         = 0;
  Label79.OnDownPtr       = 0;
  Label79.OnClickPtr      = 0;
  Label79.OnPressPtr      = 0;

  Label80.OwnerScreen     = &ScreenMENU;
  Label80.Order           = 4;
  Label80.Left            = 45;
  Label80.Top             = 3;
  Label80.Width           = 39;
  Label80.Height          = 17;
  Label80.Visible         = 1;
  Label80.Active          = 1;
  Label80.Caption         = Label80_Caption;
  Label80.FontName        = Tahoma12x16_Regular;
  Label80.Font_Color      = 0x0000;
  Label80.VerticalText    = 0;
  Label80.OnUpPtr         = 0;
  Label80.OnDownPtr       = 0;
  Label80.OnClickPtr      = 0;
  Label80.OnPressPtr      = 0;

  Label81.OwnerScreen     = &ScreenMENU;
  Label81.Order           = 5;
  Label81.Left            = 45;
  Label81.Top             = 23;
  Label81.Width           = 39;
  Label81.Height          = 17;
  Label81.Visible         = 1;
  Label81.Active          = 1;
  Label81.Caption         = Label81_Caption;
  Label81.FontName        = Tahoma12x16_Regular;
  Label81.Font_Color      = 0x0000;
  Label81.VerticalText    = 0;
  Label81.OnUpPtr         = 0;
  Label81.OnDownPtr       = 0;
  Label81.OnClickPtr      = 0;
  Label81.OnPressPtr      = 0;

  Label89.OwnerScreen     = &ScreenEndSerial;
  Label89.Order           = 3;
  Label89.Left            = 185;
  Label89.Top             = 23;
  Label89.Width           = 39;
  Label89.Height          = 17;
  Label89.Visible         = 1;
  Label89.Active          = 1;
  Label89.Caption         = Label89_Caption;
  Label89.FontName        = Tahoma12x16_Regular;
  Label89.Font_Color      = 0x0000;
  Label89.VerticalText    = 0;
  Label89.OnUpPtr         = 0;
  Label89.OnDownPtr       = 0;
  Label89.OnClickPtr      = 0;
  Label89.OnPressPtr      = 0;

  Label90.OwnerScreen     = &ScreenEndSerial;
  Label90.Order           = 4;
  Label90.Left            = 185;
  Label90.Top             = 2;
  Label90.Width           = 39;
  Label90.Height          = 17;
  Label90.Visible         = 1;
  Label90.Active          = 1;
  Label90.Caption         = Label90_Caption;
  Label90.FontName        = Tahoma12x16_Regular;
  Label90.Font_Color      = 0x0000;
  Label90.VerticalText    = 0;
  Label90.OnUpPtr         = 0;
  Label90.OnDownPtr       = 0;
  Label90.OnClickPtr      = 0;
  Label90.OnPressPtr      = 0;

  Label91.OwnerScreen     = &ScreenEndSerial;
  Label91.Order           = 5;
  Label91.Left            = 45;
  Label91.Top             = 2;
  Label91.Width           = 39;
  Label91.Height          = 17;
  Label91.Visible         = 1;
  Label91.Active          = 1;
  Label91.Caption         = Label91_Caption;
  Label91.FontName        = Tahoma12x16_Regular;
  Label91.Font_Color      = 0x0000;
  Label91.VerticalText    = 0;
  Label91.OnUpPtr         = 0;
  Label91.OnDownPtr       = 0;
  Label91.OnClickPtr      = 0;
  Label91.OnPressPtr      = 0;

  Label92.OwnerScreen     = &ScreenEndSerial;
  Label92.Order           = 6;
  Label92.Left            = 45;
  Label92.Top             = 23;
  Label92.Width           = 39;
  Label92.Height          = 17;
  Label92.Visible         = 1;
  Label92.Active          = 1;
  Label92.Caption         = Label92_Caption;
  Label92.FontName        = Tahoma12x16_Regular;
  Label92.Font_Color      = 0x0000;
  Label92.VerticalText    = 0;
  Label92.OnUpPtr         = 0;
  Label92.OnDownPtr       = 0;
  Label92.OnClickPtr      = 0;
  Label92.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetRoundButton(index)         CurrentScreen->Buttons_Round[index]
#define GetCRoundButton(index)        CurrentScreen->CButtons_Round[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetCLabel(index)              CurrentScreen->CLabels[index]
#define GetCBox(index)                CurrentScreen->CBoxes[index]
#define GetBox_Round(index)           CurrentScreen->Boxes_Round[index]
#define GetLine(index)                CurrentScreen->Lines[index]
#define GetCLine(index)               CurrentScreen->CLines[index]
#define GetCheckBox(index)            CurrentScreen->CheckBoxes[index]
#define GetProgressBar(index)         CurrentScreen->ProgressBars[index]


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
      ATop  = Around_button->Top + Around_button->Height - caption_height - 4;

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
      ATop  = Around_button->Top + Around_button->Height - caption_height - 4;

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
        TFT_Line(ACheckBox->Left  + ACheckBox->Height / 5 + 1,
                               ACheckBox->Top   + ACheckBox->Height / 2 + 1,
                               ACheckBox->Left  + ACheckBox->Height / 2 - 1,
                               ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
        TFT_Line(ACheckBox->Left  + ACheckBox->Height / 2 - ACheckBox->Pen_Width + 1,
                               ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
                               ACheckBox->Left  + ACheckBox->Height - ACheckBox->Height / 5 - 1,
                               ACheckBox->Top   + ACheckBox->Height / 5 + 1);
      }
      TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Width / 4 + 3, ACheckBox->Top);
      TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Height + 3, (ACheckBox->Top + ((ACheckBox->Height - caption_height) / 2)));
    }
    else if (ACheckBox->TextAlign == _taRight) {
      if (ACheckBox->Rounded != 0)
        TFT_Rectangle_Round_Edges(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
      else
        TFT_Rectangle(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1);
      if (ACheckBox->Checked != 0) {
        TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
        TFT_Line(ACheckBox->Left  + ACheckBox->Width - ACheckBox->Height + ACheckBox->Height / 5 + 1,
                               ACheckBox->Top +  ACheckBox->Height / 2 + 1,
                               ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 - 1,
                               ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
        TFT_Line(ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 + 1,
                               ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
                               ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height / 5 - 1,
                               ACheckBox->Top   + ACheckBox->Height / 5 + 1);
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

    red_current   = red_start   + (long)distance * ((int)red_end   - red_start)   / range;
    green_current = green_start + (long)distance * ((int)green_end - green_start) / range;
    blue_current  = blue_start  + (long)distance * ((int)blue_end  - blue_start)  / range;
    return TFT_RGBToColor16bit(red_current, green_current, blue_current);
  }
}

void Update_Percentage(TProgressBar *AProgressBar, unsigned int locPosition) {
char tmpStr[8];
  // Clear caption first
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
  // Update sector range is 0, nothing to update
  if (AStartPos == AEndPos)
    return;

  // Counting in corner radius offset, if any
  if (AStartPos <= AProgressBar->Left) {
    if (AProgressBar->Rounded != 0)
      AStartPos = AProgressBar->Left + AProgressBar->Corner_Radius;
    else
      AStartPos = AProgressBar->Left + 1;
  }
  // Counting in corner radius offset, if any
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

  // If gradient progression is horizontal, calculate the correct start and end color values for sector
  TFT_Set_Pen(0, 0);
  if (ASectorAction == _pbsFillSector) {
    if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
      startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AStartPos, AProgressBar->Left + tmpWidth + tmpRound);
      endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AEndPos, AProgressBar->Left + tmpWidth + tmpRound);
      TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, startcolor, endcolor);
    } else
      TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
  } else {
    TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
    AEndPos += 1;
  }
  TFT_Rectangle(AStartPos, AProgressBar->Top + 1, AEndPos, AProgressBar->Top + 1 + AProgressBar->Height - 1);

  // Draw not smoothed position rect
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
unsigned int locEndPos   = 0;
  // Previous current position are the same, nothing to update
  if (AProgressBar->Prev_Position == AProgressBar->Position)
    return;

  locPosition = (unsigned long)(AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
  if (AProgressBar->Visible != 0) {
    // Calculate start and end position of update sector
    _temp = (AProgressBar->Position - AProgressBar->Min);
    _tempII = AProgressBar->Max - AProgressBar->Min;
    locEndPos = _temp * 100 / _tempII;
    _temp = (AProgressBar->Prev_Position - AProgressBar->Min);
    locStartPos =  _temp * 100 / _tempII;
    if (AProgressBar->Rounded != 0) {
      _temp = AProgressBar->Width - (AProgressBar->Corner_Radius * 2);
      _tempII = AProgressBar->Left + AProgressBar->Corner_Radius;
    } else {
      _temp = (AProgressBar->Width - 2);
      _tempII = AProgressBar->Left + 1;
    }
    locStartPos = _tempII + locStartPos * _temp / 100;
    locEndPos   = _tempII + locEndPos * _temp / 100;
    // We are incrementing position, fill sector
    if (locStartPos < locEndPos)
      sector_action = _pbsFillSector;
    else {     // We are decrementing position, clearing sector
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

    // Calculate update sector range around percentage text
    TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
    if (caption_length >  AProgressBar->Width)
      caption_length =  AProgressBar->Width;
    _temp   = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2;
    _tempII = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length;

    // Cover sectors overlapping possibilities
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

    // Update percentage text
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
      endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
                                             AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
    } else {
      startcolor = AProgressBar->Gradient_Start_Color;
      endcolor   = AProgressBar->Gradient_End_Color;
    }

    // First draw background
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
        TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
                      AProgressBar->Top + AProgressBar->Height);
      }
      // Draw not smooth position rect
      if (AProgressBar->Smooth == 0) {
        TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
        while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
          if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
            TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
          else
            TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
          cnt = cnt + move_offset + 3;
        }
      }
    }
    // Update percentage text
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
    TFT_BLED           = 0;
    TFT_Set_Active(Set_Index, Write_Command, Write_Data);
    TFT_Init_ILI9341_8bit(CurrentScreen->Width, CurrentScreen->Height);
    TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 13, 12);                                  // Initialize touch panel
    TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
    TFT_Fill_Screen(CurrentScreen->Color);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
    TFT_BLED_Direction = save_bled_direction;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
      local_round_button = GetRoundButton(round_button_idx);
      if (order == local_round_button->Order) {
        round_button_idx++;
        order++;
        DrawRoundButton(local_round_button);
      }
    }

    if (round_cbutton_idx < CurrentScreen->CButtons_RoundCount) {
      local_round_cbutton = GetCRoundButton(round_cbutton_idx);
      if (order == local_round_cbutton->Order) {
        round_cbutton_idx++;
        order++;
        DrawCRoundButton(local_round_cbutton);
      }
    }

    if (label_idx < CurrentScreen->LabelsCount) {
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (clabel_idx < CurrentScreen->CLabelsCount) {
      local_clabel = GetCLabel(clabel_idx);
      if (order == local_clabel->Order) {
        clabel_idx++;
        order++;
        DrawCLabel(local_clabel);
      }
    }

    if (cbox_idx < CurrentScreen->CBoxesCount) {
      local_cbox = GetCBox(cbox_idx);
      if (order == local_cbox->Order) {
        cbox_idx++;
        order++;
        DrawCBox(local_cbox);
      }
    }

    if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
      local_round_box = GetBox_Round(round_box_idx);
      if (order == local_round_box->Order) {
        round_box_idx++;
        order++;
        DrawRoundBox(local_round_box);
      }
    }

    if (line_idx < CurrentScreen->LinesCount) {
      local_line = GetLine(line_idx);
      if (order == local_line->Order) {
        line_idx++;
        order++;
        DrawLine(local_line);
      }
    }

    if (cline_idx < CurrentScreen->CLinesCount) {
      local_cline = GetCLine(cline_idx);
      if (order == local_cline->Order) {
        cline_idx++;
        order++;
        DrawCLine(local_cline);
      }
    }

    if (checkbox_idx < CurrentScreen->CheckBoxesCount) {
      local_checkbox = GetCheckBox(checkbox_idx);
      if (order == local_checkbox->Order) {
        checkbox_idx++;
        order++;
        DrawCheckBox(local_checkbox);
      }
    }

    if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
      local_progress_bar = GetProgressBar(progress_bar_idx);
      if (order == local_progress_bar->Order) {
        progress_bar_idx++;
        order++;
        DrawProgressBar(local_progress_bar);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  round_button_order  = -1;
  round_cbutton_order = -1;
  label_order         = -1;
  clabel_order        = -1;
  cbox_order          = -1;
  box_round_order     = -1;
  checkbox_order      = -1;
  //  Buttons with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
    local_round_button = GetRoundButton(_object_count);
    if (local_round_button->Active != 0) {
      if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
                         local_round_button->Width, local_round_button->Height) == 1) {
        round_button_order = local_round_button->Order;
        exec_round_button = local_round_button;
      }
    }
  }

  //  CButtons with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->CButtons_RoundCount ; _object_count++ ) {
    local_round_cbutton = GetCRoundButton(_object_count);
    if (local_round_cbutton->Active != 0) {
      if (IsInsideObject(X, Y, local_round_cbutton->Left, local_round_cbutton->Top,
                         local_round_cbutton->Width, local_round_cbutton->Height) == 1) {
        round_cbutton_order = local_round_cbutton->Order;
        exec_round_cbutton = local_round_cbutton;
      }
    }
  }

  //  Labels
  for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
    local_label = GetLabel(_object_count);
    if (local_label->Active != 0) {
      if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
                         local_label->Width, local_label->Height) == 1) {
        label_order = local_label->Order;
        exec_label = local_label;
      }
    }
  }

  //  CLabels
  for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
    local_clabel = GetCLabel(_object_count);
    if (local_clabel->Active != 0) {
      if (IsInsideObject(X, Y, local_clabel->Left, local_clabel->Top,
                         local_clabel->Width, local_clabel->Height) == 1) {
        clabel_order = local_clabel->Order;
        exec_clabel = local_clabel;
      }
    }
  }

  //  CBoxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
    local_cbox = GetCBox(_object_count);
    if (local_cbox->Active != 0) {
      if (IsInsideObject(X, Y, local_cbox->Left, local_cbox->Top,
                         local_cbox->Width, local_cbox->Height) == 1) {
        cbox_order = local_cbox->Order;
        exec_cbox = local_cbox;
      }
    }
  }

  //  Boxes with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
    local_round_box = GetBox_Round(_object_count);
    if (local_round_box->Active != 0) {
      if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
                         local_round_box->Width, local_round_box->Height) == 1) {
        box_round_order = local_round_box->Order;
        exec_round_box = local_round_box;
      }
    }
  }

  // CheckBoxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->CheckBoxesCount ; _object_count++ ) {
    local_checkbox = GetCheckBox(_object_count);
    if (local_checkbox->Active != 0) {
      if (IsInsideObject(X, Y, local_checkbox->Left, local_checkbox->Top,
                         local_checkbox->Width, local_checkbox->Height) == 1) {
        checkbox_order = local_checkbox->Order;
        exec_checkbox = local_checkbox;
      }
    }
  }

  _object_count = -1;
  if (round_button_order >  _object_count )
    _object_count = round_button_order;
  if (round_cbutton_order >  _object_count )
    _object_count = round_cbutton_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (clabel_order >  _object_count )
    _object_count = clabel_order;
  if (cbox_order >  _object_count )
    _object_count = cbox_order;
  if (box_round_order >  _object_count )
    _object_count = box_round_order;
  if (checkbox_order >  _object_count )
    _object_count = checkbox_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_round_button   = 0;
  exec_round_cbutton  = 0;
  exec_label          = 0;
  exec_clabel         = 0;
  exec_cbox           = 0;
  exec_round_box      = 0;
  exec_checkbox       = 0;

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
    // Round Button
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
    // Round CButton
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
    // CBox
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
    // Round Box
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
    // Check Box
    case 16: {
      if (PressedObject != 0) {
        exec_checkbox = (TCheckBox*)PressedObject;
        break;
      }
      break;
    }
  }

  exec_label          = 0;
  exec_clabel          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons with Round Edges
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

  // CButtons with Round Edges
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

  // Labels
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

  // CLabels
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

  // CBoxes
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

  // Boxes with Round Edges
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

  // CheckBoxes
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

  object_pressed      = 0;
  exec_round_button   = 0;
  exec_round_cbutton  = 0;
  exec_label          = 0;
  exec_clabel         = 0;
  exec_cbox           = 0;
  exec_round_box      = 0;
  exec_checkbox       = 0;

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
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
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
  // PMP setup
  PMMODE = 0;
  PMAEN  = 0;
  PMCON  = 0;  // WRSP: Write Strobe Polarity bit
  PMMODEbits.MODE = 2;     // Master 2
  PMMODEbits.WAITB = 0;
  PMMODEbits.WAITM = 1;
  PMMODEbits.WAITE = 0;
  PMMODEbits.MODE16 = 1;   // 16 bit mode
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

  TP_TFT_Set_Calibration_Consts(76, 907, 77, 915);    // Set calibration constants

  InitializeObjects();
  display_width = ScreenInicializacao.Width;
  display_height = ScreenInicializacao.Height;
  DrawScreen(&ScreenInicializacao);
}