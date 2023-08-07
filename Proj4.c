/*===================================CPEG222====================================
 * Program:      Project 4
 * Authors:     Lilia Henkel & Joshua Martinez
 * Date:        11/15/2022
 * 
==============================================================================*/
/*-------------- Board system settings. PLEASE DO NOT MODIFY THIS PART ----------*/
#ifndef _SUPPRESS_PLIB_WARNING          //suppress the plib warning during compiling
#define _SUPPRESS_PLIB_WARNING
#endif
#pragma config FPLLIDIV = DIV_2         // PLL Input Divider (2x Divider)
#pragma config FPLLMUL = MUL_20         // PLL Multiplier (20x Multiplier)
#pragma config FPLLODIV = DIV_1         // System PLL Output Clock Divider (PLL Divide by 1)
#pragma config FNOSC = PRIPLL           // Oscillator Selection Bits (Primary Osc w/PLL (XT+,HS+,EC+PLL))
#pragma config FSOSCEN = OFF            // Secondary Oscillator Enable (Disabled)
#pragma config POSCMOD = XT             // Primary Oscillator Configuration (XT osc mode)
#pragma config FPBDIV = DIV_8           // Peripheral Clock Divisor (Pb_Clk is Sys_Clk/8)

#define SYS_FREQ (80000000L) // 80MHz system clock
#define _80Mhz_ (80000000L)
#define LOOPS_NEEDED_TO_DELAY_ONE_MS_AT_80MHz 1426
#define LOOPS_NEEDED_TO_DELAY_ONE_MS (LOOPS_NEEDED_TO_DELAY_ONE_MS_AT_80MHz * (SYS_FREQ / _80Mhz_))
/*----------------------------------------------------------------------------*/

#include <xc.h>   //Microchip XC processor header which links to the PIC32MX370512L header
#include <stdio.h>  // need this for sprintf
#include <sys/attribs.h>
#include "config.h" // Basys MX3 configuration header
#include "lcd.h"    // Digilent Library for using the on-board LCD
#include "acl.h"    // Digilent Library for using the on-board accelerometer
#include "ssd.h"
#include "mic.h"
#include "adc.h"
#include "led.h"
#include "srv.h"
#include "pmods.h"

#define TRUE 1
#define FALSE 0

#define SW6 PORTBbits.RB10
#define SW7 PORTBbits.RB9
#define SW0 PORTFbits.RF3
#define SW1 PORTFbits.RF5

#define BtnC PORTFbits.RF0

enum ModeL{StopL, ForwardL, BackL};
enum ModeL currModeL = StopL;

enum ModeR{StopR, ForwardR, BackR};
enum ModeR currModeR = StopR;

void change_state();
void Timer3Setup();
//void fill_arr(int va11,int val2,int val3, int val4);
void handle_button_presses();

int t = 0;
int timer[4] = {0, 0, 17, 17}; 
int mem[20] = {9999, 9999, 9999, 9999, 9999,9999,9999,9999,9999,9999,9999, 9999, 9999, 9999, 9999,9999,9999,9999,9999,9999};

int flag1 = 1;
int flag2 = 1;
int count = 0;
int snr_val1;
int snr_val2;
int snr_val3;
int snr_val4;
int stop_counter = 0;
int speedL;
int speedR;
int delayF = 0;
int stop_flag = 0;
int stop_flag1 = 0;
char dir = 'F';
int started = 0;
int num = 0;
char buttonsLockedC = FALSE;
char pressedUnlockedBtnC = FALSE;
int stop_flag2 = 1;
char hard_dir = 'F';

// subrountines

int main(void) {

    /* Initialization of LED, LCD, SSD, etc */
    DDPCONbits.JTAGEN = 0; // Required to use Pin RA0 (connected to LED 0) as IO
    LCD_Init();
    ACL_Init();
    SSD_Init();
    LED_Init();
    SRV_Init();
    
    TRISFbits.TRISF3 = 1;  // RF3 (SW0) configured as input 
    TRISFbits.TRISF5 = 1;  // RF5 (SW1) configured as input
    TRISBbits.TRISB10 = 1; // RB10 (SW6) configured as input 
    ANSELBbits.ANSB10 = 0; // RB10 (SW6) disabled analog 
    TRISBbits.TRISB9 = 1;  // RB9 (SW7) configured as input 
    ANSELBbits.ANSB9 = 0;  // RB9 (SW7) disabled analog 
    
    TRISFbits.TRISF0 = 1; //BTNC
    
    PMODS_InitPin(1,1,1,0,0);
    PMODS_InitPin(1,2,1,0,0);
    PMODS_InitPin(1,3,1,0,0);
    PMODS_InitPin(1,4,1,0,0);
    
    MIC_Init();
    Timer3Setup();
    
    SSD_WriteDigits(timer[0],timer[1],timer[2],timer[3],0,1,0,0);

    while (TRUE) 
    {     
        
        char str2[20];
        sprintf(str2,"%d", count);
        LCD_WriteStringAtPos(str2,1,6);
        SSD_WriteDigits(timer[0],timer[1],timer[2],timer[3],0,1,0,0);
        handle_button_presses();
        LCD_WriteStringAtPos("Group 3",0,0);
        LCD_WriteStringAtPos("BeepBeep",0,8);
        char str[20];
        sprintf(str,"%d", count);
        LCD_WriteStringAtPos(str,1,4);
        
        if(count == 1){
            num++;
            if(num > 125){
                count = 0;
                num = 0;
            }
        }
        if(MIC_Val() > 670){
            count++;
            for(int j = 0; j < 100000; j++){
            }
            if(count == 2 && !started){
                count = 0;
                stop_flag1 = 1;
                started = 1;
            }
        }
        if(BtnC == 1){
            count = 0;
            stop_flag1 = 1;
            started = 1;
        }
        
        
        snr_val1 = PMODS_GetValue(1, 1);
        snr_val2 = PMODS_GetValue(1, 2);
        snr_val3 = PMODS_GetValue(1, 3);
        snr_val4 = PMODS_GetValue(1, 4);
        
        
        if (stop_flag1){
            change_state();
        }
        
        if(((snr_val1 == 1 && snr_val4 == 1 && snr_val2 == 0 && snr_val3 == 0) || 
           (snr_val1 == 1 && snr_val2 == 0 && snr_val3 == 0 && snr_val4 == 0) ||
           (snr_val1 == 0 && snr_val2 == 0 && snr_val3 == 0 && snr_val4 == 1)) && started && stop_flag2 == 1){
            stop_flag1 = 1;
        }

        switch(currModeL){
            case StopL:
                SSD_WriteDigits(timer[0],timer[1],timer[2],timer[3],0,1,0,0);
                LCD_WriteStringAtPos("STP",1,0);
                LED_SetGroupValue(0x00);
                OC4RS = PR2/(40/3);
                if(currModeR == StopR){
                   IEC0bits.T3IE = 0;
                }
                break;
            case ForwardL:
                
                IEC0bits.T3IE = 1;
                LCD_WriteStringAtPos("FWD",1,0);
                LED_SetGroupValue(0x30 | 0x00);
                OC4RS = PR2/speedL; //38/3
                break;
            case BackL:
                IEC0bits.T3IE = 1;
                LCD_WriteStringAtPos("REV",1,0);
                LED_SetGroupValue(0xC0 | 0x00);
                OC4RS = PR2/20;
                break;
        }
        
        switch(currModeR){
            case StopR:
                LCD_WriteStringAtPos("STP",1,13);
                LED_SetGroupValue(0x00);
                OC5RS = PR2/(40/3);
                if(currModeL == StopL){
                   IEC0bits.T3IE = 0;
                }
                break;
            case ForwardR:
                IEC0bits.T3IE = 1;
                LCD_WriteStringAtPos("FWD",1,13);
                LED_SetGroupValue(0x0C | 0x00);
                OC5RS = PR2/speedR;
                break;
            case BackR:
                IEC0bits.T3IE = 1;
                LCD_WriteStringAtPos("REV",1,13);
                LED_SetGroupValue(0x03 | 0x00);
                OC5RS = PR2/10;
                break;
        }

    }
} 

void change_state(){    
    if(snr_val1 == 0 && snr_val2 == 0 && snr_val3 == 0 && snr_val4 == 0){ //Stop
        currModeL = ForwardL;
        currModeR = ForwardR;
        delayF = 0;
        speedL = 10;
        speedR = 20;
        stop_counter++;
        
        if(hard_dir == 'L'){
            dir = 'R';
        }
        else if(hard_dir == 'R'){
            dir = 'L';
        }
        
        if((stop_counter > 17 && stop_flag)){
            stop_counter = 0;
            stop_flag = 0;
            currModeL = StopL;
            currModeR = StopR;
            stop_flag1 = 0;
            stop_flag2 = 0;
        }
    }
    else if(snr_val1 == 1 && snr_val4 == 1 && snr_val2 == 0 && snr_val3 == 0){ //Forward
        currModeL = ForwardL;
        currModeR = ForwardR;
        delayF++;
        speedL = 10;
        speedR = 20;
        stop_counter = 0;
        hard_dir = 'F';
    }
    else if(snr_val1 == 1 && snr_val4 == 1 && snr_val2 == 1 && snr_val3 == 1){ //Reverse
        stop_flag1 = 0;
        if(dir == 'L'){
            speedL = 20;
            speedR = 20;
        }
        else if(dir == 'R'){
            speedL = 10;
            speedR = 10;
        }
        stop_counter = 0;
    }
    else if(snr_val4 == 0 && snr_val3 == 0 && snr_val2 == 0 && snr_val1 == 1){ //Slow Left
        currModeR = ForwardR;
        dir = 'L';
        if (delayF > 50){ //if start of turn turn hard
            currModeL = StopL;
            speedR = 20;
        }
        else { //if not keep going gradually
            currModeL = ForwardL;
            speedL = 38/3;
            speedR = 20;
            delayF = 0;
        }
        stop_counter = 0;
    }
    else if((snr_val4 == 0 && snr_val3 == 0 && snr_val2 == 1 && snr_val1 == 1) ||
            (snr_val4 == 0 && snr_val3 == 0 && snr_val2 == 1 && snr_val1 == 0)){ //Fast Left
        hard_dir = 'L';
        currModeL = ForwardL;
        currModeR = ForwardR;
        delayF = 0;
        speedL = 39/3;
        speedR = 20;
        stop_counter = 0;
    }
    else if(snr_val4 == 1 && snr_val3 == 0 && snr_val2 == 0 && snr_val1 == 0){ //Slow Right
        dir = 'R';
        currModeL = ForwardL;
        if (delayF > 50){ //if start of turn turn hard
            speedL = 10;
            currModeR = StopR;
        }
        else { //if not keep going gradually
            currModeR = ForwardR;
            speedL = 10;
            speedR = 42/3;
            delayF = 0;
        }
        stop_counter = 0;
    }
    else if((snr_val4 == 1 && snr_val3 == 1 && snr_val2 == 0 && snr_val1 == 0) || 
            (snr_val4 == 0 && snr_val3 == 1 && snr_val2 == 0 && snr_val1 == 0)){ //Fast Right
        hard_dir = 'R';
        currModeL = ForwardL;
        currModeR = ForwardR;
        delayF = 0;
        speedL = 10;
        speedR = 41/3;
        stop_counter = 0;
    }
}

void Timer3Setup(){
    PR3 = 3905.25;
    TMR3 = 0;
    T3CONbits.TCKPS = 7;
    T3CONbits.TGATE = 0;
    T3CONbits.TCS = 0;
    T3CONbits.ON = 1;
    IPC3bits.T3IP = 6;
    IPC3bits.T3IS = 3;
    IFS0bits.T3IF = 0;
    macro_enable_interrupts();
}


void __ISR(_TIMER_3_VECTOR) Timer3ISR(void){
    t++;
    if (t){
        t = 0;
        timer[0]++;
        if (timer[0] > 9){
            timer[0] = 0;
            timer[1]++;
        }
        if (timer[1] > 9){
            timer[1] = 0;
            if (flag1){
                timer[2] = 0;
                flag1 = 0;
            }
            timer[2]++;
        }
        if (timer[2] > 9 && timer[2] < 17){
            timer[2] = 0;
            if (flag2){
                timer[3] = 0;
                flag2 = 0;
            }
            timer[3]++;
        }
        if (timer[3] > 9 && timer[3] < 17){
            timer[3] = timer[2] = 17;
            timer[1] = timer[0] = 0;
        }
    }
    if((timer[2] > 1) && (timer[2] < 17) && (timer [1] > 6)){
        stop_flag = 1;
    }
    
    IFS0bits.T3IF = 0;
}

/*void fill_arr(int val1,int val2,int val3, int val4){
    for(int i = 18; i >= 0 ; i--){
        mem[i+1] = mem[i];
    }
    int newval = 0;
    newval += val1;
    newval += val2*10;
    newval += val3*100;
    newval += val4*1000;
    mem[0] = newval;
    
    
}*/

void handle_button_presses()
{
    pressedUnlockedBtnC = 0;
    if (BtnC && !buttonsLockedC)
    {
        for(int j = 0; j < 100000; j++){} // debounce
        buttonsLockedC = 1;
        pressedUnlockedBtnC = 1;
    }
    else if (!BtnC && buttonsLockedC)
    {
        for(int j = 0; j < 100000; j++){} // debounce
        buttonsLockedC = 0;
    }
}
