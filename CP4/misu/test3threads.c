/*
 * file: testpreempt.c
 */
#include <8051.h>
#include "preemptive.h"


/*
 * [TODO]
 * declare your global variables here, for the shared buffer
 * between the producer and consumer.
 * Hint: you may want to manually designate the location for the
 * variable.  you can use
 *        __data __at (0x30) type var;
 * to declare a variable var of the type
 */

__data __at (0x34) char buff[3];
__data __at (0x3B) char item1;
__data __at (0x3F) char item2;
__data __at (0x3C) char full;
__data __at (0x3D) char empty;
__data __at (0x3E) char mutex;
__data __at (0x75) char head = 0;
__data __at (0x76) char tail = 0;
__data __at (0x77) char turn; // 1 for producer1, 2 for producer2


#define L(x) LABEL(x)
#define LABEL(x) x##$
#define SemaphoreWait(S) {SemaphoreWaitBody(S, L(__COUNTER__));}

/* [TODO for this function]
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */
void Producer1(void)
{
    /*
     * [TODO]
     * initialize producer data structure, and then enter
     * an infinite loop (does not return)
     */
    item1 = 'A';
    while (1)
    {
        while(turn != 1){}
        /* [TODO]
         * wait for the buffer to be available,
         * and then write the new data into the buffer */
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        __critical{
            buff[tail] = item1;
            tail = (tail + 1) % 3;
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        item1 = (item1 != 'Z')? (item1 + 1) : 'A';

        __critical{
            turn = 2;
        }
        
        //printf("producing %c\n", item);
        
    }
}

void Producer2(void)
{
    
    /*
     * [TODO]
     * initialize producer data structure, and then enter
     * an infinite loop (does not return)
     */
    item2 = '0';
    while (1)
    {   
        while(turn != 2){}
        /* [TODO]
         * wait for the buffer to be available,
         * and then write the new data into the buffer */
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        __critical{
            buff[tail] = item2;
            tail = (tail + 1) % 3;
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        item2 = (item2 != '9')? (item2 + 1) : '0';
        
        __critical{
            turn = 1;
        }
        //printf("producing %c\n", item);
        
    }
}

/* [TODO for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */
void Consumer(void)
{
    /*
     * [TODO]
     * initialize Tx for polling
     */
    EA = 0;
    TMOD |= 0x20;
    TH1 = (char)-6;
    SCON = 0x50;
    TR1 = 1;
    EA = 1;

    
    while (1)
    {
        /*
         * [TODO]
         * wait for new data from producer
         */
        
        /*
         * [TODO]
         * write data to serial port Tx,
         * poll for Tx to finish writing (TI),
         * then clear the flag
         */
    
        SemaphoreWait(full);
        SemaphoreWait(mutex);
        __critical{
            SBUF = buff[head];
            head = (head + 1) % 3;
            
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);
        
        while (!TI){
            //ThreadYield();
        }
        TI = 0;
    }
}

/* [TODO for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can act as producer and another as consumer.
 */
void main(void)
{
    /*
     * [TODO]
     * initialize globals
     */
    turn = 1;
    __critical{
        SemaphoreCreate(empty, 3);
        SemaphoreCreate(full, 0);
        SemaphoreCreate(mutex, 1);
    }
    /*
     * [TODO]
     * set up Producer and Consumer.
     * Because both are infinite loops, there is no loop
     * in this function and no return.
     */
    ThreadCreate(Producer1);
    ThreadCreate(Producer2);
    Consumer();
}

void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {
    
}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1) {
    __asm
        LJMP _myTimer0Handler
    __endasm;
}
