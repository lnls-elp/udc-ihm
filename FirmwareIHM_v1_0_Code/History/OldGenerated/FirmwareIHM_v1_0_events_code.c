#include "FirmwareIHM_v1_0_objects.h"
#include "FirmwareIHM_v1_0_resources.h"

//--------------------- User code ---------------------//

#include "FuncoesIHM.h"
 
//----------------- End of User code ------------------//

// Event Handlers

void malhaAberta() {
     if ((CheckBox1.Checked == 0)&&(CheckBox2.Checked == 0)){
        strcpy(Label26.Caption,"----------");
        strcpy(Label27.Caption,"----------");
        DrawScreen(&ScreenMalhaDeControle);
     }
     else{
          if (CheckBox1.Checked == 0){
             strcpy(Label26.Caption,"Fechada");
             strcpy(Label27.Caption,"Fechada");
             DrawScreen(&ScreenMalhaDeControle);
          }
          if (CheckBox1.Checked == 1){
             CheckBox2.Checked = 0;  //DESMARCA o CheckBox2 quando o CheckBox1
                                     //estiver Marcado.
             strcpy(Label26.Caption,"Aberta");
             strcpy(Label27.Caption,"Aberta");
             DrawScreen(&ScreenMalhaDeControle);
          }
     }
}

void malhaFechada() { 
     if ((CheckBox1.Checked == 0)&&(CheckBox2.Checked == 0)){
        strcpy(Label26.Caption,"----------");
        strcpy(Label27.Caption,"----------");
        DrawScreen(&ScreenMalhaDeControle);
     }
     else{
          if (CheckBox2.Checked == 0){
             strcpy(Label26.Caption,"Aberta");
             strcpy(Label27.Caption,"Aberta");
             DrawScreen(&ScreenMalhaDeControle);
          }
          if (CheckBox2.Checked == 1){
             CheckBox1.Checked = 0;  //DESMARCA o CheckBox1 quando o CheckBox2
                                     //estiver Marcado.
             strcpy(Label26.Caption,"Fechada");
             strcpy(Label27.Caption,"Fechada");
             DrawScreen(&ScreenMalhaDeControle);
          }
     }
}

//Modo de Operação.
void modoRemoto() {
     if (CheckBox3.Checked == 0){
             strcpy(Label43.Caption," ");
             strcpy(Label44.Caption," ");
             strcpy(Label48.Caption," ");
             strcpy(Label52.Caption," ");
             strcpy(Label56.Caption," ");
             strcpy(Label60.Caption," ");
             
             //ButtonRound8.Visible=0;
             //DrawButton(&ButtonRound8);
             DrawScreen(&ScreenOperando);
          }
     if (CheckBox3.Checked == 1){
             CheckBox4.Checked = 0;
             CheckBox5.Checked = 0;
             
             strcpy(Label43.Caption,"Remoto");
             strcpy(Label44.Caption,"Remoto");
             strcpy(Label48.Caption,"Remoto");
             strcpy(Label52.Caption,"Remoto");
             strcpy(Label56.Caption,"Remoto");
             strcpy(Label60.Caption,"Remoto");
             
             //ButtonRound8.Visible = 1;
             DrawScreen(&ScreenOperando);
          }
}

void modoLocal() {
     if (CheckBox4.Checked == 0){
             strcpy(Label43.Caption," ");
             strcpy(Label44.Caption," ");
             strcpy(Label48.Caption," ");
             strcpy(Label52.Caption," ");
             strcpy(Label56.Caption," ");
             strcpy(Label60.Caption," ");
             
             //ButtonRound8.Transparent = 1;
             //DrawButton(&ButtonRound8);
             DrawScreen(&ScreenOperando);
          }
     if (CheckBox4.Checked == 1){
             CheckBox3.Checked = 0;
             CheckBox5.Checked = 0;
             
             strcpy(Label43.Caption,"Local");
             strcpy(Label44.Caption,"Local");
             strcpy(Label48.Caption,"Local");
             strcpy(Label52.Caption,"Local");
             strcpy(Label56.Caption,"Local");
             strcpy(Label60.Caption,"Local");
             
             //ButtonRound8.Transparent = 0;
             DrawScreen(&ScreenOperando);
          }

}

void modoPCHost() {
     if (CheckBox5.Checked == 0){
             strcpy(Label43.Caption," ");
             strcpy(Label44.Caption," ");
             strcpy(Label48.Caption," ");
             strcpy(Label52.Caption," ");
             strcpy(Label56.Caption," ");
             strcpy(Label60.Caption," ");
             
             //ButtonRound8.Transparent = 1;
             //DrawButton(&ButtonRound8);
             DrawScreen(&ScreenOperando);
          }
     if (CheckBox5.Checked == 1){
             CheckBox3.Checked = 0;
             CheckBox4.Checked = 0;
             
             strcpy(Label43.Caption,"PC Host");
             strcpy(Label44.Caption,"PC Host");
             strcpy(Label48.Caption,"PC Host");
             strcpy(Label52.Caption,"PC Host");
             strcpy(Label56.Caption,"PC Host");
             strcpy(Label60.Caption,"PC Host");
             
             //ButtonRound8.Transparent = 0;
             DrawScreen(&ScreenOperando);
          }

}
//FIM.

void resetInterlock() {
     DrawScreen(&ScreenPrincipal);
}

void goScreenOperando() {
     DrawScreen(&ScreenOperando);
}

void goScreenTecladoNumerico() {
     strcpy(Label86.Caption,Label29.Caption); //Copia a Label da Referência, da
                                              //tela inicial, na Label
                                              //Valor Anterior, da tela do tecla.
     strcpy(Label87.Caption,"");             //Limpa o campo Novo Valor.
     DrawScreen(&ScreenTecladoNumerico);
}

void goScreenResetInterlock() {
     DrawScreen(&ScreenResetInterlock);
}

void goScreenPrincipal() {
     DrawScreen(&ScreenPrincipal);
}

void goScreenMalhaDeControle() {
     DrawScreen(&ScreenMalhaDeControle);
}

//____Telas Bloqueadas____
int _screenLocked;
void buttonMENU() {
     _screenLocked=1;
     DrawScreen(&ScreenSenha);
}
void buttonEndSerial() {
     _screenLocked=2;
     DrawScreen(&ScreenSenha);
}
void buttonMalhaDeControle() {
     _screenLocked=3;
     DrawScreen(&ScreenSenha);
}
//FIM.

void buttonReferencia() {
    DrawScreen(&ScreenTecladoNumerico);
}

//____Teclado Senha____
#define SIZE_ASTERISK 6
int _contA=1;
void buttonSenha_0(){
     Password(0);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_1(){
     Password(1);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_2(){
     Password(2);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_3(){
     Password(3);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_4(){
     Password(4);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_5(){
     Password(5);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_6(){
     Password(6);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_7(){
     Password(7);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_8(){
     Password(8);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_9(){
     Password(9);
     if(_contA<=SIZE_ASTERISK){
        strcat(Label15.Caption,"*");
        DrawLabel(&Label15);
        _contA++;
     }
}
void buttonSenha_APAGAR(){
     Password(10);
     strcpy(Label15.Caption," ");
     DrawScreen(&ScreenSenha);
     _contA=1;
}
void buttonSenha_ENTER(){
     if(Password(11)==1){
          if(_screenLocked==1){
             strcpy(Label15.Caption," ");
             DrawScreen(&ScreenMENU);
          }
          if(_screenLocked==2){
             strcpy(Label15.Caption," ");
             DrawScreen(&ScreenEndSerial);
          }
          if(_screenLocked==3){
             strcpy(Label15.Caption," ");
             DrawScreen(&ScreenMalhaDeControle);
          }
     }
     else{
          strcpy(Label15.Caption," ");
          DrawScreen(&ScreenAcessoNegado);
          Delay_ms(2000);
          DrawScreen(&ScreenSenha);
     }
     _contA=1;
}
void buttonSenha_VOLTAR(){
     Password(12);
     strcpy(Label15.Caption," ");
     DrawScreen(&ScreenPrincipal);
     _contA=1;
}
//FIM.

//____Teclado de Valores____
#define _SIZE_NUMBER 15
char _vetNumTecl[_SIZE_NUMBER]=" ";
int _contB=1,_pontoTecl=1;
void buttonTeclado_0() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"0");
        strcat(_vetNumTecl,"0");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_1() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"1");
        strcat(_vetNumTecl,"1");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_2() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"2");
        strcat(_vetNumTecl,"2");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_3() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"3");
        strcat(_vetNumTecl,"3");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_4() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"4");
        strcat(_vetNumTecl,"4");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_5() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"5");
        strcat(_vetNumTecl,"5");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_6() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"6");
        strcat(_vetNumTecl,"6");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_7() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"7");
        strcat(_vetNumTecl,"7");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_8() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"8");
        strcat(_vetNumTecl,"8");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_9() {
     if(_contB<=_SIZE_NUMBER){
        strcat(Label66.Caption,"9");
        strcat(_vetNumTecl,"9");
        DrawLabel(&Label66);
        _contB++;
     }
}

void buttonTeclado_P() {
     if(_pontoTecl==1){
        strcat(Label66.Caption,".");
        strcat(_vetNumTecl,".");
        DrawLabel(&Label66);
        _pontoTecl=0;
        _contB++;
     }
}

void buttonTeclado_VOLTAR() {
     strcpy(Label87.Caption," ");  //ZERA Label Novo Valor.
     strcpy(Label66.Caption," ");  //ZERA Label do Visor Valor.
     DrawScreen(&ScreenPrincipal);
     _pontoTecl=1;
}

void buttonTeclado_APAGAR() {
     strcpy(Label66.Caption," ");
     strcpy(_vetNumTecl," ");
     DrawScreen(&ScreenTecladoNumerico);
     _contB=1;
     _pontoTecl=1;
}

void buttonTeclado_ENTER() {
     strcpy(Label87.Caption,_vetNumTecl);  //Label Novo Valor.
     DrawLabel(&Label87);
     strcpy(Label29.Caption,_vetNumTecl);  //Label Referencia.
     strcpy(Label66.Caption," ");  //Label do Visor Valor.
     DrawScreen(&ScreenTecladoNumerico);
     _contB=1;
     _pontoTecl=1;
}
//FIM.
