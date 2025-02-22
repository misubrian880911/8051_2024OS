#include <8051.h>

#include "preemptive.h"

/*
 * [TODO]
 * declare the static globals here using
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread;
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */

__data __at (0x30) char bitmap = 0x00;
__data __at (0x31) ThreadID currID;
__data __at (0x32) ThreadID nextID;
__data __at (0x33) ThreadID newID;
__data __at (0x37) char savedSP[4];
__data __at (0x71) char temp_SP;
__data __at (0x72) char temp_PSW;
__data __at (0x73) char new_stk;
//__data __at (0x74) char i;

/*
 * [TODO]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly,
 *     while 2) can be written in either assembly or C
 */
#define SAVESTATE               \
    {                           \
        __asm                   \
        /*your code here*/      \
            PUSH ACC            \
            PUSH B              \
            PUSH DPL           \
            PUSH DPH           \
            PUSH PSW            \
        __endasm;               \
        savedSP[currID] = SP;   \
    }

/*
 * [TODO]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
#define RESTORESTATE            \
    {                           \
        SP = savedSP[currID];   \
        __asm                   \
        /*your code here*/      \
            POP PSW             \
            POP DPH            \
            POP DPL            \
            POP B               \
            POP ACC             \
        __endasm;               \
    }

/*
 * we declare main() as an extern so we can reference its symbol
 * when creating a thread for it.
 */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void)
{
    /*
     * [TODO]
     * initialize data structures for threads (e.g., mask)
     *
     * optional: move the stack pointer to some known location
     * only during bootstrapping. by default, SP is 0x07.
     *
     * [TODO]
     *     create a thread for main; be sure current thread is
     *     set to this thread ID, and restore its context,
     *     so that it starts running main().
     */
    //bitmap = 0x00;
    TMOD = 0; // timer 0 mode 0
    IE = 0x82;
    // enable timer 0 interrupt; keep consumer polling
    // EA - ET2 ES ET1 EX1 ET0 EX0
    TR0 = 1; // set bit TR0 to start running timer 0
    currID = ThreadCreate(main);
    RESTORESTATE;
    //main();
}

/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp)
__critical{
    /*
     * [TODO]
     * check to see we have not reached the max #threads.
     * if so, return -1, which is not a valid thread ID.
     */
    if (bitmap == 15)
        return -1;
    
    /*
    
     * [TODO]
     *     otherwise, find a thread ID that is not in use,
     *     and grab it. (can check the bit mask for threads),
     *
     * [TODO] below
     * a. update the bit mask
         (and increment thread count, if you use a thread count,
          but it is optional)
    */
    char i;
    for (i = 0;i < 4;i ++){
        if (!(bitmap & (1 << i))){
            //create i_th thread
            bitmap |= (1 << i);
            newID = i;
            break;
        }

    }
    /*
       b. calculate the starting stack location for new thread
    */
    new_stk = (0x3F) + (0x10)*newID;
    /*
       c. save the current SP in a temporary
          set SP to the starting location for the new thread
    */
    temp_SP = SP;
    SP = new_stk;
    /*
       d. push the return address fp (2-byte parameter to
          ThreadCreate) onto stack so it can be the return
          address to resume the thread. Note that in SDCC
          convention, 2-byte ptr is passed in DPTR.  but
          push instruction can only push it as two separate
          registers, DPL and DPH.
    */
    //DPL = (char)((int)(*fp) & (0x00FF));
    //DPH = (char)(((int)(*fp) & (0xFF00)) >> 8);
    __asm
        PUSH DPL
        PUSH DPH
    __endasm;
    /*
       e. we want to initialize the registers to 0, so we
          assign a register to 0 and push it four times
          for ACC, B, DPL, DPH.  Note: push #0 will not work
          because push takes only direct address as its operand,
          but it does not take an immediate (literal) operand.
    */
    __asm
        MOV A, #0
        PUSH ACC
        PUSH ACC
        PUSH ACC
        PUSH ACC
    __endasm;
    /*
       f. finally, we need to push PSW (processor status word)
          register, which consist of bits
           CY AC F0 RS1 RS0 OV UD P
          all bits can be initialized to zero, except <RS1:RS0>
          which selects the register bank.
          Thread 0 uses bank 0, Thread 1 uses bank 1, etc.
          Setting the bits to 00B, 01B, 10B, 11B will select
          the register bank so no need to push/pop registers
          R0-R7.  So, set PSW to
          00000000B for thread 0, 00001000B for thread 1,
          00010000B for thread 2, 00011000B for thread 3.
    */
    temp_PSW = PSW;
    PSW = newID << 3;
    __asm 
        PUSH PSW
    __endasm;
    PSW = temp_PSW;
    /*
       g. write the current stack pointer to the saved stack
          pointer array for this newly created thread ID
          */
    savedSP[newID] = SP;
    /*
       h. set SP to the saved SP in step c.
       */
    SP = temp_SP;
    /*
       i. finally, return the newly created thread ID.
     */
    return newID;
    
    
}

/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void)
__critical{
    SAVESTATE;
    
    do
    {
        /*
         * [TODO]
         * do round-robin policy for now.
         * find the next thread that can run and
         * set the current thread ID to it,
         * so that it can be restored (by the last line of
         * this function).
         * there should be at least one thread, so this loop
         * will always terminate.
         */
        currID = ((currID >= 3)? 0 : (currID + 1));
        if (bitmap & (1 << currID)){
            //legal id
            break;
        }
    } while (1);
    
    RESTORESTATE;
}

void myTimer0Handler(void){
    EA = 0;
    SAVESTATE;
    __asm
         MOV A, R0
         PUSH ACC
         MOV A, R1
         PUSH ACC
         MOV A, R2
         PUSH ACC
         MOV A, R3
         PUSH ACC
         MOV A, R4
         PUSH ACC
         MOV A, R5
         PUSH ACC
         MOV A, R6
         PUSH ACC
         MOV A, R7
         PUSH ACC
    __endasm;
    
    do{
        currID = (currID < 3 ) ?  currID+1 : 0;
        if( currID == 0 )nextID = 1;
        else if( currID == 1 )nextID = 2;
        else if( currID == 2 )nextID = 4;
        else if( currID == 3 )nextID = 8;
        if( bitmap & nextID ){
            break;
        }      
    } while (1);
    //currID = nextID;
    __asm
         POP ACC
         MOV R7, A
         POP ACC
         MOV R6, A
         POP ACC
         MOV R5, A
         POP ACC
         MOV R4, A
         POP ACC
         MOV R3, A
         POP ACC
         MOV R2, A
         POP ACC
         MOV R1, A
         POP ACC
         MOV R0, A
    __endasm;  
    
    RESTORESTATE;
    EA = 1;
    __asm
        RETI
    __endasm;
}

/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void)
__critical{
    /*
     * clear the bit for the current thread from the
     * bit mask, decrement thread count (if any),
     * and set current thread to another valid ID.
     * Q: What happens if there are no more valid threads?
     */
    
    RESTORESTATE;
}
