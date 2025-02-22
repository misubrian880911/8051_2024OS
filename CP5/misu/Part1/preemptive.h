
#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4 /* not including the scheduler */
/* the scheduler does not take up a thread of its own */
#define CNAME(S) _ ## S

#define SemaphoreCreate(S, n)\
{\
    S = n;\
}

#define SemaphoreSignal(S) \
{\
    __asm \
        INC CNAME(S)\
    __endasm;\
}

#define SemaphoreWaitBody(S, label) \
{\
    __asm \
        label: ;; top of while-loop \
        SETB EA \
        LCALL _ThreadYield \
        CLR EA \
        MOV A, CNAME(S)   ;; read value of _S into ACC (where S is semaphore) \
        JB ACC.7, label  ;; conditionally jump(s) back to label if ACC <= 0\
        JZ label\
        dec CNAME(S) \
        SETB EA \
    __endasm;\
}



typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);

#endif // __PREEMPTIVE_H__