/*
Funções para IHM:
    *Firmware Versao IHM;
    *Inicializa Parâmetros;
    *Função Password.
*/

#include "FuncoesIHM.h"

#define _PASSWORD_IHM 123456  //Valor da Senha.
#define _SIZE_PASSWORD 6      //Número de dígitos da Senha.

//Função Versão do Firmware da IHM.
void FirmwareVersaoIHM(){
     strcpy(Label37.Caption,"v1.0");
     DrawScreen(&ScreenInicializacao);
}
//FIM.

//Função de Inicialização.
void InicializaParametros(){
    char count;
    
    for(count = 0; count < 101; count++){
            ProgressBar1.Position = count;
            UpdatePBPosition(&ProgressBar1);
            Delay_ms(10);
            if(count == 90){
                     //SendMessage(0x00); // pede o endereço da fonte
                     Delay_ms(500);
            }
            if(count == 91){
                     //SendMessage(0x02); // Sincroniza os RTCs
                     Delay_ms(500);
            }
            if(count == 92){
                     //SendMessage(0x01); // pede o modelo da fonte
                     Delay_ms(500);
            }
            if(count == 93){
                     //SendMessage(0x07); // pede a senha
                     Delay_ms(500);
            }
            if(count == 94){
                     //SendMessage(0x09); // pede o numero de série da placa
                     Delay_ms(500);
            }
            if(count == 95){
                     //SendMessage(0x70); // pede o numero do IP da placa
                     Delay_ms(500);
            }
    }
    //Delay_ms(100);
}
//FIM.

//Função Senha.
char _vetNum[_SIZE_PASSWORD]=" ";
int _cont=1;
int Password(int val){
    if(_cont<=_SIZE_PASSWORD){
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
        if (password_TESTE==_PASSWORD_IHM){
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
//FIM.
