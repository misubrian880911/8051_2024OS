;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module cooperative
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Bootstrap
	.globl _main
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
	.globl _new_thread
	.globl _sp_temp
	.globl _i
	.globl _cur_thread
	.globl _mask
	.globl _saved_sp
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
_saved_sp	=	0x0030
_mask	=	0x0034
_cur_thread	=	0x0035
_i	=	0x0036
_sp_temp	=	0x0037
_new_thread	=	0x0038
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	cooperative.c:81: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	cooperative.c:95: mask = 0;
	mov	_mask,#0x00
;	cooperative.c:96: cur_thread = ThreadCreate( main );
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_cur_thread,dpl
;	cooperative.c:97: RESTORESTATE;
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	cooperative.c:103: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	cooperative.c:111: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	cooperative.c:118: if( mask == 15 ) //mask = 0b1111, four thread
	mov	a,#0x0f
	cjne	a,_mask,00102$
;	cooperative.c:119: return -1;
	mov	dpl,#0xff
	ret
00102$:
;	cooperative.c:120: for(i = 0; i < 4 ; i++){
	mov	_i,#0x00
00107$:
	mov	a,#0x100 - 0x04
	add	a,_i
	jc	00105$
;	cooperative.c:121: if( !( mask & (1 << i) ) ){
	mov	r7,_i
	mov	b,r7
	inc	b
	mov	r7,#0x01
	mov	r6,#0x00
	sjmp	00131$
00130$:
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
00131$:
	djnz	b,00130$
	mov	r4,_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar7,a
	mov	a,r5
	anl	ar6,a
	mov	a,r7
	orl	a,r6
	jnz	00108$
;	cooperative.c:122: mask |= (1 << i);
	mov	r7,_i
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00135$
00133$:
	add	a,acc
00135$:
	djnz	b,00133$
	mov	r7,a
	orl	_mask,a
;	cooperative.c:123: new_thread = i;
	mov	_new_thread,_i
;	cooperative.c:124: break;
	sjmp	00105$
00108$:
;	cooperative.c:120: for(i = 0; i < 4 ; i++){
	mov	a,_i
	inc	a
	mov	_i,a
	sjmp	00107$
00105$:
;	cooperative.c:128: sp_temp = SP;
	mov	_sp_temp,_SP
;	cooperative.c:129: SP = (0x3F) + (0x10) * new_thread;
	mov	a,_new_thread
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	cooperative.c:136: __endasm;
	PUSH	DPL
	PUSH	DPH
;	cooperative.c:148: __endasm;
	ANL	A, #0
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	cooperative.c:152: PSW = new_thread << 3;
	mov	a,_new_thread
	mov	r7,a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	cooperative.c:155: __endasm;
	PUSH	PSW
;	cooperative.c:158: saved_sp[new_thread] = SP;
	mov	a,_new_thread
	add	a,#_saved_sp
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:160: SP = sp_temp;
	mov	_SP,_sp_temp
;	cooperative.c:162: return new_thread;
	mov	dpl,_new_thread
;	cooperative.c:203: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	cooperative.c:214: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	cooperative.c:215: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:216: do {
00103$:
;	cooperative.c:227: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
	mov	a,#0x100 - 0x03
	add	a,_cur_thread
	jc	00108$
	mov	r7,_cur_thread
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00109$
00108$:
	mov	r6,#0x00
	mov	r7,#0x00
00109$:
	mov	_cur_thread,r6
;	cooperative.c:228: if( mask & (1<<cur_thread) ){
	mov	r7,_cur_thread
	mov	b,r7
	inc	b
	mov	r7,#0x01
	mov	r6,#0x00
	sjmp	00124$
00123$:
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
00124$:
	djnz	b,00123$
	mov	r4,_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar7,a
	mov	a,r5
	anl	ar6,a
	mov	a,r7
	orl	a,r6
	jz	00103$
;	cooperative.c:233: RESTORESTATE;
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	cooperative.c:234: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	cooperative.c:242: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	cooperative.c:249: mask ^= (1<<cur_thread);
	mov	r7,_cur_thread
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00129$
00127$:
	add	a,acc
00129$:
	djnz	b,00127$
	mov	r7,a
	xrl	_mask,a
;	cooperative.c:250: for(i=0 ; i < 4 ; i++)
	mov	_i,#0x00
00107$:
	mov	a,#0x100 - 0x04
	add	a,_i
	jc	00103$
;	cooperative.c:251: if( mask & (1<<i) ){
	mov	r7,_i
	mov	b,r7
	inc	b
	mov	r7,#0x01
	mov	r6,#0x00
	sjmp	00132$
00131$:
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
00132$:
	djnz	b,00131$
	mov	r4,_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar7,a
	mov	a,r5
	anl	ar6,a
	mov	a,r7
	orl	a,r6
	jz	00108$
;	cooperative.c:252: cur_thread = i;
	mov	_cur_thread,_i
;	cooperative.c:253: break;
	sjmp	00103$
00108$:
;	cooperative.c:250: for(i=0 ; i < 4 ; i++)
	mov	a,_i
	inc	a
	mov	_i,a
	sjmp	00107$
00103$:
;	cooperative.c:256: if( i == 4 ) cur_thread = -1;
	mov	a,#0x04
	cjne	a,_i,00105$
	mov	_cur_thread,#0xff
00105$:
;	cooperative.c:259: RESTORESTATE;
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	cooperative.c:260: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
