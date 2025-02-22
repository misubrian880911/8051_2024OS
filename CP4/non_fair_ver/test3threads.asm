;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module test3threads
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _tail
	.globl _head
	.globl _turn
	.globl _mutex
	.globl _empty
	.globl _full
	.globl _item2
	.globl _item1
	.globl _buff
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_buff	=	0x0034
_item1	=	0x003b
_item2	=	0x003f
_full	=	0x003c
_empty	=	0x003d
_mutex	=	0x003e
_turn	=	0x0077
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.org 0x0075
_head::
	.ds 1
	.org 0x0076
_tail::
	.ds 1
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_Producer1_sloc0_1_0:
	.ds 1
_Producer2_sloc0_1_0:
	.ds 1
_Consumer_sloc0_1_0:
	.ds 1
_main_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	test3threads.c:24: __data __at (0x75) char head = 0;
	mov	_head,#0x00
;	test3threads.c:25: __data __at (0x76) char tail = 0;
	mov	_tail,#0x00
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	test3threads.c:38: void Producer1(void)
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	test3threads.c:45: item1 = 'A';
	mov	_item1,#0x41
;	test3threads.c:46: while (1)
00102$:
;	test3threads.c:52: SemaphoreWait(empty);
		0$:
;; top of while-loop 
	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
	JB ACC.7, 0$ ;; conditionally jump(s) back to 0$ if ACC <= 0 
	JZ 0$ 
;; fall-through to drop out of while-loop 
	dec _empty 
;	test3threads.c:53: SemaphoreWait(mutex);
		1$:
;; top of while-loop 
	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
	JB ACC.7, 1$ ;; conditionally jump(s) back to 1$ if ACC <= 0 
	JZ 1$ 
;; fall-through to drop out of while-loop 
	dec _mutex 
;	test3threads.c:57: }
	setb	_Producer1_sloc0_1_0
	jbc	ea,00116$
	clr	_Producer1_sloc0_1_0
00116$:
;	test3threads.c:55: buff[tail] = item1;
	mov	a,_tail
	add	a,#_buff
	mov	r0,a
	mov	@r0,_item1
;	test3threads.c:56: tail = (tail + 1) % 3;
	mov	r6,_tail
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x03
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	mov	_tail,r6
	mov	c,_Producer1_sloc0_1_0
	mov	ea,c
;	test3threads.c:58: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:59: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:60: item1 = (item1 != 'Z')? (item1 + 1) : 'A';
	mov	a,#0x5a
	cjne	a,_item1,00117$
	setb	c
	sjmp	00118$
00117$:
	clr	c
00118$:
	mov	_Producer1_sloc0_1_0,c
	jc	00106$
	mov	r7,_item1
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00107$
00106$:
	mov	r6,#0x41
	mov	r7,#0x00
00107$:
	mov	_item1,r6
;	test3threads.c:67: }
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	test3threads.c:69: void Producer2(void)
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	test3threads.c:77: item2 = '0';
	mov	_item2,#0x30
;	test3threads.c:78: while (1)
00102$:
;	test3threads.c:84: SemaphoreWait(empty);
		2$:
;; top of while-loop 
	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
	JB ACC.7, 2$ ;; conditionally jump(s) back to 2$ if ACC <= 0 
	JZ 2$ 
;; fall-through to drop out of while-loop 
	dec _empty 
;	test3threads.c:85: SemaphoreWait(mutex);
		3$:
;; top of while-loop 
	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
	JB ACC.7, 3$ ;; conditionally jump(s) back to 3$ if ACC <= 0 
	JZ 3$ 
;; fall-through to drop out of while-loop 
	dec _mutex 
;	test3threads.c:89: }
	setb	_Producer2_sloc0_1_0
	jbc	ea,00116$
	clr	_Producer2_sloc0_1_0
00116$:
;	test3threads.c:87: buff[tail] = item2;
	mov	a,_tail
	add	a,#_buff
	mov	r0,a
	mov	@r0,_item2
;	test3threads.c:88: tail = (tail + 1) % 3;
	mov	r6,_tail
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x03
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	mov	_tail,r6
	mov	c,_Producer2_sloc0_1_0
	mov	ea,c
;	test3threads.c:90: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:91: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:92: item2 = (item2 != '9')? (item2 + 1) : '0';
	mov	a,#0x39
	cjne	a,_item2,00117$
	setb	c
	sjmp	00118$
00117$:
	clr	c
00118$:
	mov	_Producer2_sloc0_1_0,c
	jc	00106$
	mov	r7,_item2
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00107$
00106$:
	mov	r6,#0x30
	mov	r7,#0x00
00107$:
	mov	_item2,r6
;	test3threads.c:98: }
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	test3threads.c:105: void Consumer(void)
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	test3threads.c:111: EA = 0;
;	assignBit
	clr	_EA
;	test3threads.c:112: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	test3threads.c:113: TH1 = (char)-6;
	mov	_TH1,#0xfa
;	test3threads.c:114: SCON = 0x50;
	mov	_SCON,#0x50
;	test3threads.c:115: TR1 = 1;
;	assignBit
	setb	_TR1
;	test3threads.c:116: EA = 1;
;	assignBit
	setb	_EA
;	test3threads.c:119: while (1)
00105$:
;	test3threads.c:133: SemaphoreWait(full);
		4$:
;; top of while-loop 
	MOV A, _full ;; read value of _S into ACC (where full is semaphore) 
	JB ACC.7, 4$ ;; conditionally jump(s) back to 4$ if ACC <= 0 
	JZ 4$ 
;; fall-through to drop out of while-loop 
	dec _full 
;	test3threads.c:134: SemaphoreWait(mutex);
		5$:
;; top of while-loop 
	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
	JB ACC.7, 5$ ;; conditionally jump(s) back to 5$ if ACC <= 0 
	JZ 5$ 
;; fall-through to drop out of while-loop 
	dec _mutex 
;	test3threads.c:139: }
	setb	_Consumer_sloc0_1_0
	jbc	ea,00121$
	clr	_Consumer_sloc0_1_0
00121$:
;	test3threads.c:136: SBUF = buff[head];
	mov	a,_head
	add	a,#_buff
	mov	r1,a
	mov	_SBUF,@r1
;	test3threads.c:137: head = (head + 1) % 3;
	mov	r6,_head
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x03
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	mov	_head,r6
	mov	c,_Consumer_sloc0_1_0
	mov	ea,c
;	test3threads.c:140: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:141: SemaphoreSignal(empty);
	INC _empty 
;	test3threads.c:143: while (!TI){
00101$:
;	test3threads.c:146: TI = 0;
;	assignBit
	jbc	_TI,00105$
;	test3threads.c:148: }
	sjmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3threads.c:155: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3threads.c:161: turn = 1;
	mov	_turn,#0x01
;	test3threads.c:166: }
	setb	_main_sloc0_1_0
	jbc	ea,00103$
	clr	_main_sloc0_1_0
00103$:
;	test3threads.c:163: SemaphoreCreate(empty, 3);
	mov	_empty,#0x03
;	test3threads.c:164: SemaphoreCreate(full, 0);
	mov	_full,#0x00
;	test3threads.c:165: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
	mov	c,_main_sloc0_1_0
	mov	ea,c
;	test3threads.c:173: ThreadCreate(Producer2);
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
;	test3threads.c:174: ThreadCreate(Producer1);
	mov	dptr,#_Producer1
	lcall	_ThreadCreate
;	test3threads.c:175: Consumer();
;	test3threads.c:176: }
	ljmp	_Consumer
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3threads.c:178: void _sdcc_gsinit_startup(void)
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3threads.c:182: __endasm;
	LJMP	_Bootstrap
;	test3threads.c:183: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:185: void _mcs51_genRAMCLEAR(void) {
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
;	test3threads.c:187: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3threads.c:188: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:189: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3threads.c:191: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3threads.c:194: __endasm;
	LJMP	_myTimer0Handler
;	test3threads.c:195: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
