                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _next_thread
                                    110 	.globl _new_thread
                                    111 	.globl _sp_temp
                                    112 	.globl _i
                                    113 	.globl _cur_thread
                                    114 	.globl _mask
                                    115 	.globl _saved_sp
                                    116 	.globl _myTimer0Handler
                                    117 	.globl _ThreadCreate
                                    118 	.globl _ThreadYield
                                    119 	.globl _ThreadExit
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000081   126 _SP	=	0x0081
                           000082   127 _DPL	=	0x0082
                           000083   128 _DPH	=	0x0083
                           000087   129 _PCON	=	0x0087
                           000088   130 _TCON	=	0x0088
                           000089   131 _TMOD	=	0x0089
                           00008A   132 _TL0	=	0x008a
                           00008B   133 _TL1	=	0x008b
                           00008C   134 _TH0	=	0x008c
                           00008D   135 _TH1	=	0x008d
                           000090   136 _P1	=	0x0090
                           000098   137 _SCON	=	0x0098
                           000099   138 _SBUF	=	0x0099
                           0000A0   139 _P2	=	0x00a0
                           0000A8   140 _IE	=	0x00a8
                           0000B0   141 _P3	=	0x00b0
                           0000B8   142 _IP	=	0x00b8
                           0000D0   143 _PSW	=	0x00d0
                           0000E0   144 _ACC	=	0x00e0
                           0000F0   145 _B	=	0x00f0
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           000080   151 _P0_0	=	0x0080
                           000081   152 _P0_1	=	0x0081
                           000082   153 _P0_2	=	0x0082
                           000083   154 _P0_3	=	0x0083
                           000084   155 _P0_4	=	0x0084
                           000085   156 _P0_5	=	0x0085
                           000086   157 _P0_6	=	0x0086
                           000087   158 _P0_7	=	0x0087
                           000088   159 _IT0	=	0x0088
                           000089   160 _IE0	=	0x0089
                           00008A   161 _IT1	=	0x008a
                           00008B   162 _IE1	=	0x008b
                           00008C   163 _TR0	=	0x008c
                           00008D   164 _TF0	=	0x008d
                           00008E   165 _TR1	=	0x008e
                           00008F   166 _TF1	=	0x008f
                           000090   167 _P1_0	=	0x0090
                           000091   168 _P1_1	=	0x0091
                           000092   169 _P1_2	=	0x0092
                           000093   170 _P1_3	=	0x0093
                           000094   171 _P1_4	=	0x0094
                           000095   172 _P1_5	=	0x0095
                           000096   173 _P1_6	=	0x0096
                           000097   174 _P1_7	=	0x0097
                           000098   175 _RI	=	0x0098
                           000099   176 _TI	=	0x0099
                           00009A   177 _RB8	=	0x009a
                           00009B   178 _TB8	=	0x009b
                           00009C   179 _REN	=	0x009c
                           00009D   180 _SM2	=	0x009d
                           00009E   181 _SM1	=	0x009e
                           00009F   182 _SM0	=	0x009f
                           0000A0   183 _P2_0	=	0x00a0
                           0000A1   184 _P2_1	=	0x00a1
                           0000A2   185 _P2_2	=	0x00a2
                           0000A3   186 _P2_3	=	0x00a3
                           0000A4   187 _P2_4	=	0x00a4
                           0000A5   188 _P2_5	=	0x00a5
                           0000A6   189 _P2_6	=	0x00a6
                           0000A7   190 _P2_7	=	0x00a7
                           0000A8   191 _EX0	=	0x00a8
                           0000A9   192 _ET0	=	0x00a9
                           0000AA   193 _EX1	=	0x00aa
                           0000AB   194 _ET1	=	0x00ab
                           0000AC   195 _ES	=	0x00ac
                           0000AF   196 _EA	=	0x00af
                           0000B0   197 _P3_0	=	0x00b0
                           0000B1   198 _P3_1	=	0x00b1
                           0000B2   199 _P3_2	=	0x00b2
                           0000B3   200 _P3_3	=	0x00b3
                           0000B4   201 _P3_4	=	0x00b4
                           0000B5   202 _P3_5	=	0x00b5
                           0000B6   203 _P3_6	=	0x00b6
                           0000B7   204 _P3_7	=	0x00b7
                           0000B0   205 _RXD	=	0x00b0
                           0000B1   206 _TXD	=	0x00b1
                           0000B2   207 _INT0	=	0x00b2
                           0000B3   208 _INT1	=	0x00b3
                           0000B4   209 _T0	=	0x00b4
                           0000B5   210 _T1	=	0x00b5
                           0000B6   211 _WR	=	0x00b6
                           0000B7   212 _RD	=	0x00b7
                           0000B8   213 _PX0	=	0x00b8
                           0000B9   214 _PT0	=	0x00b9
                           0000BA   215 _PX1	=	0x00ba
                           0000BB   216 _PT1	=	0x00bb
                           0000BC   217 _PS	=	0x00bc
                           0000D0   218 _P	=	0x00d0
                           0000D1   219 _F1	=	0x00d1
                           0000D2   220 _OV	=	0x00d2
                           0000D3   221 _RS0	=	0x00d3
                           0000D4   222 _RS1	=	0x00d4
                           0000D5   223 _F0	=	0x00d5
                           0000D6   224 _AC	=	0x00d6
                           0000D7   225 _CY	=	0x00d7
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable register banks
                                    228 ;--------------------------------------------------------
                                    229 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        230 	.ds 8
                                    231 ;--------------------------------------------------------
                                    232 ; internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DSEG    (DATA)
                           000030   235 _saved_sp	=	0x0030
                           000034   236 _mask	=	0x0034
                           000035   237 _cur_thread	=	0x0035
                           000036   238 _i	=	0x0036
                           000037   239 _sp_temp	=	0x0037
                           000038   240 _new_thread	=	0x0038
                           000039   241 _next_thread	=	0x0039
                                    242 ;--------------------------------------------------------
                                    243 ; overlayable items in internal ram
                                    244 ;--------------------------------------------------------
                                    245 	.area	OSEG    (OVR,DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; indirectly addressable internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area ISEG    (DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; absolute internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area IABS    (ABS,DATA)
                                    254 	.area IABS    (ABS,DATA)
                                    255 ;--------------------------------------------------------
                                    256 ; bit data
                                    257 ;--------------------------------------------------------
                                    258 	.area BSEG    (BIT)
      000002                        259 _ThreadCreate_sloc0_1_0:
      000002                        260 	.ds 1
      000003                        261 _ThreadYield_sloc0_1_0:
      000003                        262 	.ds 1
      000004                        263 _ThreadExit_sloc0_1_0:
      000004                        264 	.ds 1
                                    265 ;--------------------------------------------------------
                                    266 ; paged external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area PSEG    (PAG,XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XSEG    (XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; absolute external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XABS    (ABS,XDATA)
                                    277 ;--------------------------------------------------------
                                    278 ; external initialized ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area XISEG   (XDATA)
                                    281 	.area HOME    (CODE)
                                    282 	.area GSINIT0 (CODE)
                                    283 	.area GSINIT1 (CODE)
                                    284 	.area GSINIT2 (CODE)
                                    285 	.area GSINIT3 (CODE)
                                    286 	.area GSINIT4 (CODE)
                                    287 	.area GSINIT5 (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 	.area GSFINAL (CODE)
                                    290 	.area CSEG    (CODE)
                                    291 ;--------------------------------------------------------
                                    292 ; global & static initialisations
                                    293 ;--------------------------------------------------------
                                    294 	.area HOME    (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 	.area GSFINAL (CODE)
                                    297 	.area GSINIT  (CODE)
                                    298 ;--------------------------------------------------------
                                    299 ; Home
                                    300 ;--------------------------------------------------------
                                    301 	.area HOME    (CODE)
                                    302 	.area HOME    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; code
                                    305 ;--------------------------------------------------------
                                    306 	.area CSEG    (CODE)
                                    307 ;------------------------------------------------------------
                                    308 ;Allocation info for local variables in function 'Bootstrap'
                                    309 ;------------------------------------------------------------
                                    310 ;	preemptive.c:57: void Bootstrap(void) {
                                    311 ;	-----------------------------------------
                                    312 ;	 function Bootstrap
                                    313 ;	-----------------------------------------
      0000A8                        314 _Bootstrap:
                           000007   315 	ar7 = 0x07
                           000006   316 	ar6 = 0x06
                           000005   317 	ar5 = 0x05
                           000004   318 	ar4 = 0x04
                           000003   319 	ar3 = 0x03
                           000002   320 	ar2 = 0x02
                           000001   321 	ar1 = 0x01
                           000000   322 	ar0 = 0x00
                                    323 ;	preemptive.c:58: mask = 0;
      0000A8 75 34 00         [24]  324 	mov	_mask,#0x00
                                    325 ;	preemptive.c:59: TMOD = 0;  // timer 0 mode 0
      0000AB 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:60: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      0000AE 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:62: TR0 = 1; // set bit TR0 to start running timer 0
                                    330 ;	assignBit
      0000B1 D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:63: cur_thread = ThreadCreate( main );
      0000B3 90 00 8B         [24]  333 	mov	dptr,#_main
      0000B6 12 01 68         [24]  334 	lcall	_ThreadCreate
      0000B9 85 82 35         [24]  335 	mov	_cur_thread,dpl
                                    336 ;	preemptive.c:64: RESTORESTATE;
      0000BC E5 35            [12]  337 	mov	a,_cur_thread
      0000BE 24 30            [12]  338 	add	a,#_saved_sp
      0000C0 F9               [12]  339 	mov	r1,a
      0000C1 87 81            [24]  340 	mov	_SP,@r1
      0000C3 D0 D0            [24]  341 	POP PSW 
      0000C5 D0 83            [24]  342 	POP DPH 
      0000C7 D0 82            [24]  343 	POP DPL 
      0000C9 D0 F0            [24]  344 	POP B 
      0000CB D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:66: }
      0000CD 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'myTimer0Handler'
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:67: void myTimer0Handler(){
                                    352 ;	-----------------------------------------
                                    353 ;	 function myTimer0Handler
                                    354 ;	-----------------------------------------
      0000CE                        355 _myTimer0Handler:
                                    356 ;	preemptive.c:68: EA = 0;
                                    357 ;	assignBit
      0000CE C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:69: SAVESTATE;
      0000D0 C0 E0            [24]  360 	PUSH ACC 
      0000D2 C0 F0            [24]  361 	PUSH B 
      0000D4 C0 82            [24]  362 	PUSH DPL 
      0000D6 C0 83            [24]  363 	PUSH DPH 
      0000D8 C0 D0            [24]  364 	PUSH PSW 
      0000DA E5 35            [12]  365 	mov	a,_cur_thread
      0000DC 24 30            [12]  366 	add	a,#_saved_sp
      0000DE F8               [12]  367 	mov	r0,a
      0000DF A6 81            [24]  368 	mov	@r0,_SP
                                    369 ;	preemptive.c:87: __endasm;
      0000E1 E8               [12]  370 	MOV	A, R0
      0000E2 C0 E0            [24]  371 	PUSH	ACC
      0000E4 E9               [12]  372 	MOV	A, R1
      0000E5 C0 E0            [24]  373 	PUSH	ACC
      0000E7 EA               [12]  374 	MOV	A, R2
      0000E8 C0 E0            [24]  375 	PUSH	ACC
      0000EA EB               [12]  376 	MOV	A, R3
      0000EB C0 E0            [24]  377 	PUSH	ACC
      0000ED EC               [12]  378 	MOV	A, R4
      0000EE C0 E0            [24]  379 	PUSH	ACC
      0000F0 ED               [12]  380 	MOV	A, R5
      0000F1 C0 E0            [24]  381 	PUSH	ACC
      0000F3 EE               [12]  382 	MOV	A, R6
      0000F4 C0 E0            [24]  383 	PUSH	ACC
      0000F6 EF               [12]  384 	MOV	A, R7
      0000F7 C0 E0            [24]  385 	PUSH	ACC
                                    386 ;	preemptive.c:89: do{
      0000F9                        387 00114$:
                                    388 ;	preemptive.c:90: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      0000F9 74 FD            [12]  389 	mov	a,#0x100 - 0x03
      0000FB 25 35            [12]  390 	add	a,_cur_thread
      0000FD 40 0B            [24]  391 	jc	00119$
      0000FF AF 35            [24]  392 	mov	r7,_cur_thread
      000101 0F               [12]  393 	inc	r7
      000102 EF               [12]  394 	mov	a,r7
      000103 FE               [12]  395 	mov	r6,a
      000104 33               [12]  396 	rlc	a
      000105 95 E0            [12]  397 	subb	a,acc
      000107 FF               [12]  398 	mov	r7,a
      000108 80 04            [24]  399 	sjmp	00120$
      00010A                        400 00119$:
      00010A 7E 00            [12]  401 	mov	r6,#0x00
      00010C 7F 00            [12]  402 	mov	r7,#0x00
      00010E                        403 00120$:
      00010E 8E 35            [24]  404 	mov	_cur_thread,r6
                                    405 ;	preemptive.c:91: if( cur_thread == 0 )next_thread = 1;
      000110 E5 35            [12]  406 	mov	a,_cur_thread
      000112 70 05            [24]  407 	jnz	00110$
      000114 75 39 01         [24]  408 	mov	_next_thread,#0x01
      000117 80 1C            [24]  409 	sjmp	00111$
      000119                        410 00110$:
                                    411 ;	preemptive.c:92: else if( cur_thread == 1 )next_thread = 2;
      000119 74 01            [12]  412 	mov	a,#0x01
      00011B B5 35 05         [24]  413 	cjne	a,_cur_thread,00107$
      00011E 75 39 02         [24]  414 	mov	_next_thread,#0x02
      000121 80 12            [24]  415 	sjmp	00111$
      000123                        416 00107$:
                                    417 ;	preemptive.c:93: else if( cur_thread == 2 )next_thread = 4;
      000123 74 02            [12]  418 	mov	a,#0x02
      000125 B5 35 05         [24]  419 	cjne	a,_cur_thread,00104$
      000128 75 39 04         [24]  420 	mov	_next_thread,#0x04
      00012B 80 08            [24]  421 	sjmp	00111$
      00012D                        422 00104$:
                                    423 ;	preemptive.c:94: else if( cur_thread == 3 )next_thread = 8;
      00012D 74 03            [12]  424 	mov	a,#0x03
      00012F B5 35 03         [24]  425 	cjne	a,_cur_thread,00111$
      000132 75 39 08         [24]  426 	mov	_next_thread,#0x08
      000135                        427 00111$:
                                    428 ;	preemptive.c:95: if( mask & next_thread ){
      000135 E5 39            [12]  429 	mov	a,_next_thread
      000137 55 34            [12]  430 	anl	a,_mask
      000139 60 BE            [24]  431 	jz	00114$
                                    432 ;	preemptive.c:116: __endasm;  
      00013B D0 E0            [24]  433 	POP	ACC
      00013D FF               [12]  434 	MOV	R7, A
      00013E D0 E0            [24]  435 	POP	ACC
      000140 FE               [12]  436 	MOV	R6, A
      000141 D0 E0            [24]  437 	POP	ACC
      000143 FD               [12]  438 	MOV	R5, A
      000144 D0 E0            [24]  439 	POP	ACC
      000146 FC               [12]  440 	MOV	R4, A
      000147 D0 E0            [24]  441 	POP	ACC
      000149 FB               [12]  442 	MOV	R3, A
      00014A D0 E0            [24]  443 	POP	ACC
      00014C FA               [12]  444 	MOV	R2, A
      00014D D0 E0            [24]  445 	POP	ACC
      00014F F9               [12]  446 	MOV	R1, A
      000150 D0 E0            [24]  447 	POP	ACC
      000152 F8               [12]  448 	MOV	R0, A
                                    449 ;	preemptive.c:117: RESTORESTATE;
      000153 E5 35            [12]  450 	mov	a,_cur_thread
      000155 24 30            [12]  451 	add	a,#_saved_sp
      000157 F9               [12]  452 	mov	r1,a
      000158 87 81            [24]  453 	mov	_SP,@r1
      00015A D0 D0            [24]  454 	POP PSW 
      00015C D0 83            [24]  455 	POP DPH 
      00015E D0 82            [24]  456 	POP DPL 
      000160 D0 F0            [24]  457 	POP B 
      000162 D0 E0            [24]  458 	POP ACC 
                                    459 ;	preemptive.c:118: EA = 1;
                                    460 ;	assignBit
      000164 D2 AF            [12]  461 	setb	_EA
                                    462 ;	preemptive.c:121: __endasm;
      000166 32               [24]  463 	RETI
                                    464 ;	preemptive.c:123: }
      000167 22               [24]  465 	ret
                                    466 ;------------------------------------------------------------
                                    467 ;Allocation info for local variables in function 'ThreadCreate'
                                    468 ;------------------------------------------------------------
                                    469 ;fp                        Allocated to registers 
                                    470 ;------------------------------------------------------------
                                    471 ;	preemptive.c:131: ThreadID ThreadCreate(FunctionPtr fp) {
                                    472 ;	-----------------------------------------
                                    473 ;	 function ThreadCreate
                                    474 ;	-----------------------------------------
      000168                        475 _ThreadCreate:
                                    476 ;	preemptive.c:134: if( mask == 15 ) //mask = 0b1111, four thread
      000168 74 0F            [12]  477 	mov	a,#0x0f
      00016A B5 34 04         [24]  478 	cjne	a,_mask,00102$
                                    479 ;	preemptive.c:135: return -1;
      00016D 75 82 FF         [24]  480 	mov	dpl,#0xff
      000170 22               [24]  481 	ret
      000171                        482 00102$:
                                    483 ;	preemptive.c:179: }
      000171 D2 02            [12]  484 	setb	_ThreadCreate_sloc0_1_0
      000173 10 AF 02         [24]  485 	jbc	ea,00129$
      000176 C2 02            [12]  486 	clr	_ThreadCreate_sloc0_1_0
      000178                        487 00129$:
                                    488 ;	preemptive.c:137: for(i = 0; i < 4 ; i++){
      000178 75 36 00         [24]  489 	mov	_i,#0x00
      00017B                        490 00107$:
      00017B 74 FC            [12]  491 	mov	a,#0x100 - 0x04
      00017D 25 36            [12]  492 	add	a,_i
      00017F 40 41            [24]  493 	jc	00105$
                                    494 ;	preemptive.c:138: if( !( mask & (1 << i) ) ){
      000181 AF 36            [24]  495 	mov	r7,_i
      000183 8F F0            [24]  496 	mov	b,r7
      000185 05 F0            [12]  497 	inc	b
      000187 7F 01            [12]  498 	mov	r7,#0x01
      000189 7E 00            [12]  499 	mov	r6,#0x00
      00018B 80 06            [24]  500 	sjmp	00132$
      00018D                        501 00131$:
      00018D EF               [12]  502 	mov	a,r7
      00018E 2F               [12]  503 	add	a,r7
      00018F FF               [12]  504 	mov	r7,a
      000190 EE               [12]  505 	mov	a,r6
      000191 33               [12]  506 	rlc	a
      000192 FE               [12]  507 	mov	r6,a
      000193                        508 00132$:
      000193 D5 F0 F7         [24]  509 	djnz	b,00131$
      000196 AC 34            [24]  510 	mov	r4,_mask
      000198 7D 00            [12]  511 	mov	r5,#0x00
      00019A EC               [12]  512 	mov	a,r4
      00019B 52 07            [12]  513 	anl	ar7,a
      00019D ED               [12]  514 	mov	a,r5
      00019E 52 06            [12]  515 	anl	ar6,a
      0001A0 EF               [12]  516 	mov	a,r7
      0001A1 4E               [12]  517 	orl	a,r6
      0001A2 70 17            [24]  518 	jnz	00108$
                                    519 ;	preemptive.c:139: mask |= (1 << i);
      0001A4 AF 36            [24]  520 	mov	r7,_i
      0001A6 8F F0            [24]  521 	mov	b,r7
      0001A8 05 F0            [12]  522 	inc	b
      0001AA 74 01            [12]  523 	mov	a,#0x01
      0001AC 80 02            [24]  524 	sjmp	00136$
      0001AE                        525 00134$:
      0001AE 25 E0            [12]  526 	add	a,acc
      0001B0                        527 00136$:
      0001B0 D5 F0 FB         [24]  528 	djnz	b,00134$
      0001B3 FF               [12]  529 	mov	r7,a
      0001B4 42 34            [12]  530 	orl	_mask,a
                                    531 ;	preemptive.c:140: new_thread = i;
      0001B6 85 36 38         [24]  532 	mov	_new_thread,_i
                                    533 ;	preemptive.c:141: break;
      0001B9 80 07            [24]  534 	sjmp	00105$
      0001BB                        535 00108$:
                                    536 ;	preemptive.c:137: for(i = 0; i < 4 ; i++){
      0001BB E5 36            [12]  537 	mov	a,_i
      0001BD 04               [12]  538 	inc	a
      0001BE F5 36            [12]  539 	mov	_i,a
      0001C0 80 B9            [24]  540 	sjmp	00107$
      0001C2                        541 00105$:
                                    542 ;	preemptive.c:145: sp_temp = SP;
      0001C2 85 81 37         [24]  543 	mov	_sp_temp,_SP
                                    544 ;	preemptive.c:146: SP = (0x3F) + (0x10) * new_thread;
      0001C5 E5 38            [12]  545 	mov	a,_new_thread
      0001C7 C4               [12]  546 	swap	a
      0001C8 54 F0            [12]  547 	anl	a,#0xf0
      0001CA FF               [12]  548 	mov	r7,a
      0001CB 24 3F            [12]  549 	add	a,#0x3f
      0001CD F5 81            [12]  550 	mov	_SP,a
                                    551 ;	preemptive.c:153: __endasm;
      0001CF C0 82            [24]  552 	PUSH	DPL
      0001D1 C0 83            [24]  553 	PUSH	DPH
                                    554 ;	preemptive.c:165: __endasm;
      0001D3 54 00            [12]  555 	ANL	A, #0
      0001D5 C0 E0            [24]  556 	PUSH	ACC
      0001D7 C0 E0            [24]  557 	PUSH	ACC
      0001D9 C0 E0            [24]  558 	PUSH	ACC
      0001DB C0 E0            [24]  559 	PUSH	ACC
                                    560 ;	preemptive.c:169: PSW = new_thread << 3;
      0001DD E5 38            [12]  561 	mov	a,_new_thread
      0001DF FF               [12]  562 	mov	r7,a
      0001E0 C4               [12]  563 	swap	a
      0001E1 03               [12]  564 	rr	a
      0001E2 54 F8            [12]  565 	anl	a,#0xf8
      0001E4 F5 D0            [12]  566 	mov	_PSW,a
                                    567 ;	preemptive.c:172: __endasm;
      0001E6 C0 D0            [24]  568 	PUSH	PSW
                                    569 ;	preemptive.c:175: saved_sp[new_thread] = SP;
      0001E8 E5 38            [12]  570 	mov	a,_new_thread
      0001EA 24 30            [12]  571 	add	a,#_saved_sp
      0001EC F8               [12]  572 	mov	r0,a
      0001ED A6 81            [24]  573 	mov	@r0,_SP
                                    574 ;	preemptive.c:177: SP = sp_temp;
      0001EF 85 37 81         [24]  575 	mov	_SP,_sp_temp
      0001F2 A2 02            [12]  576 	mov	c,_ThreadCreate_sloc0_1_0
      0001F4 92 AF            [24]  577 	mov	ea,c
                                    578 ;	preemptive.c:180: return new_thread;
      0001F6 85 38 82         [24]  579 	mov	dpl,_new_thread
                                    580 ;	preemptive.c:183: }
      0001F9 22               [24]  581 	ret
                                    582 ;------------------------------------------------------------
                                    583 ;Allocation info for local variables in function 'ThreadYield'
                                    584 ;------------------------------------------------------------
                                    585 ;	preemptive.c:194: void ThreadYield(void) {
                                    586 ;	-----------------------------------------
                                    587 ;	 function ThreadYield
                                    588 ;	-----------------------------------------
      0001FA                        589 _ThreadYield:
                                    590 ;	preemptive.c:204: }
      0001FA D2 03            [12]  591 	setb	_ThreadYield_sloc0_1_0
      0001FC 10 AF 02         [24]  592 	jbc	ea,00122$
      0001FF C2 03            [12]  593 	clr	_ThreadYield_sloc0_1_0
      000201                        594 00122$:
                                    595 ;	preemptive.c:196: SAVESTATE;
      000201 C0 E0            [24]  596 	PUSH ACC 
      000203 C0 F0            [24]  597 	PUSH B 
      000205 C0 82            [24]  598 	PUSH DPL 
      000207 C0 83            [24]  599 	PUSH DPH 
      000209 C0 D0            [24]  600 	PUSH PSW 
      00020B E5 35            [12]  601 	mov	a,_cur_thread
      00020D 24 30            [12]  602 	add	a,#_saved_sp
      00020F F8               [12]  603 	mov	r0,a
      000210 A6 81            [24]  604 	mov	@r0,_SP
                                    605 ;	preemptive.c:197: do{
      000212                        606 00103$:
                                    607 ;	preemptive.c:198: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      000212 74 FD            [12]  608 	mov	a,#0x100 - 0x03
      000214 25 35            [12]  609 	add	a,_cur_thread
      000216 40 0B            [24]  610 	jc	00108$
      000218 AF 35            [24]  611 	mov	r7,_cur_thread
      00021A 0F               [12]  612 	inc	r7
      00021B EF               [12]  613 	mov	a,r7
      00021C FE               [12]  614 	mov	r6,a
      00021D 33               [12]  615 	rlc	a
      00021E 95 E0            [12]  616 	subb	a,acc
      000220 FF               [12]  617 	mov	r7,a
      000221 80 04            [24]  618 	sjmp	00109$
      000223                        619 00108$:
      000223 7E 00            [12]  620 	mov	r6,#0x00
      000225 7F 00            [12]  621 	mov	r7,#0x00
      000227                        622 00109$:
      000227 8E 35            [24]  623 	mov	_cur_thread,r6
                                    624 ;	preemptive.c:199: if( mask & (1<<cur_thread) ){
      000229 AF 35            [24]  625 	mov	r7,_cur_thread
      00022B 8F F0            [24]  626 	mov	b,r7
      00022D 05 F0            [12]  627 	inc	b
      00022F 7F 01            [12]  628 	mov	r7,#0x01
      000231 7E 00            [12]  629 	mov	r6,#0x00
      000233 80 06            [24]  630 	sjmp	00125$
      000235                        631 00124$:
      000235 EF               [12]  632 	mov	a,r7
      000236 2F               [12]  633 	add	a,r7
      000237 FF               [12]  634 	mov	r7,a
      000238 EE               [12]  635 	mov	a,r6
      000239 33               [12]  636 	rlc	a
      00023A FE               [12]  637 	mov	r6,a
      00023B                        638 00125$:
      00023B D5 F0 F7         [24]  639 	djnz	b,00124$
      00023E AC 34            [24]  640 	mov	r4,_mask
      000240 7D 00            [12]  641 	mov	r5,#0x00
      000242 EC               [12]  642 	mov	a,r4
      000243 52 07            [12]  643 	anl	ar7,a
      000245 ED               [12]  644 	mov	a,r5
      000246 52 06            [12]  645 	anl	ar6,a
      000248 EF               [12]  646 	mov	a,r7
      000249 4E               [12]  647 	orl	a,r6
      00024A 60 C6            [24]  648 	jz	00103$
                                    649 ;	preemptive.c:203: RESTORESTATE;
      00024C E5 35            [12]  650 	mov	a,_cur_thread
      00024E 24 30            [12]  651 	add	a,#_saved_sp
      000250 F9               [12]  652 	mov	r1,a
      000251 87 81            [24]  653 	mov	_SP,@r1
      000253 D0 D0            [24]  654 	POP PSW 
      000255 D0 83            [24]  655 	POP DPH 
      000257 D0 82            [24]  656 	POP DPL 
      000259 D0 F0            [24]  657 	POP B 
      00025B D0 E0            [24]  658 	POP ACC 
      00025D A2 03            [12]  659 	mov	c,_ThreadYield_sloc0_1_0
      00025F 92 AF            [24]  660 	mov	ea,c
                                    661 ;	preemptive.c:205: }
      000261 22               [24]  662 	ret
                                    663 ;------------------------------------------------------------
                                    664 ;Allocation info for local variables in function 'ThreadExit'
                                    665 ;------------------------------------------------------------
                                    666 ;	preemptive.c:213: void ThreadExit(void) {
                                    667 ;	-----------------------------------------
                                    668 ;	 function ThreadExit
                                    669 ;	-----------------------------------------
      000262                        670 _ThreadExit:
                                    671 ;	preemptive.c:227: }
      000262 D2 04            [12]  672 	setb	_ThreadExit_sloc0_1_0
      000264 10 AF 02         [24]  673 	jbc	ea,00127$
      000267 C2 04            [12]  674 	clr	_ThreadExit_sloc0_1_0
      000269                        675 00127$:
                                    676 ;	preemptive.c:215: mask ^= (1<<cur_thread);
      000269 AF 35            [24]  677 	mov	r7,_cur_thread
      00026B 8F F0            [24]  678 	mov	b,r7
      00026D 05 F0            [12]  679 	inc	b
      00026F 74 01            [12]  680 	mov	a,#0x01
      000271 80 02            [24]  681 	sjmp	00130$
      000273                        682 00128$:
      000273 25 E0            [12]  683 	add	a,acc
      000275                        684 00130$:
      000275 D5 F0 FB         [24]  685 	djnz	b,00128$
      000278 FF               [12]  686 	mov	r7,a
      000279 62 34            [12]  687 	xrl	_mask,a
                                    688 ;	preemptive.c:216: for(i=0 ; i < 4 ; i++)
      00027B 75 36 00         [24]  689 	mov	_i,#0x00
      00027E                        690 00107$:
      00027E 74 FC            [12]  691 	mov	a,#0x100 - 0x04
      000280 25 36            [12]  692 	add	a,_i
      000282 40 2F            [24]  693 	jc	00103$
                                    694 ;	preemptive.c:217: if( mask & (1<<i) ){
      000284 AF 36            [24]  695 	mov	r7,_i
      000286 8F F0            [24]  696 	mov	b,r7
      000288 05 F0            [12]  697 	inc	b
      00028A 7F 01            [12]  698 	mov	r7,#0x01
      00028C 7E 00            [12]  699 	mov	r6,#0x00
      00028E 80 06            [24]  700 	sjmp	00133$
      000290                        701 00132$:
      000290 EF               [12]  702 	mov	a,r7
      000291 2F               [12]  703 	add	a,r7
      000292 FF               [12]  704 	mov	r7,a
      000293 EE               [12]  705 	mov	a,r6
      000294 33               [12]  706 	rlc	a
      000295 FE               [12]  707 	mov	r6,a
      000296                        708 00133$:
      000296 D5 F0 F7         [24]  709 	djnz	b,00132$
      000299 AC 34            [24]  710 	mov	r4,_mask
      00029B 7D 00            [12]  711 	mov	r5,#0x00
      00029D EC               [12]  712 	mov	a,r4
      00029E 52 07            [12]  713 	anl	ar7,a
      0002A0 ED               [12]  714 	mov	a,r5
      0002A1 52 06            [12]  715 	anl	ar6,a
      0002A3 EF               [12]  716 	mov	a,r7
      0002A4 4E               [12]  717 	orl	a,r6
      0002A5 60 05            [24]  718 	jz	00108$
                                    719 ;	preemptive.c:218: cur_thread = i;
      0002A7 85 36 35         [24]  720 	mov	_cur_thread,_i
                                    721 ;	preemptive.c:219: break;
      0002AA 80 07            [24]  722 	sjmp	00103$
      0002AC                        723 00108$:
                                    724 ;	preemptive.c:216: for(i=0 ; i < 4 ; i++)
      0002AC E5 36            [12]  725 	mov	a,_i
      0002AE 04               [12]  726 	inc	a
      0002AF F5 36            [12]  727 	mov	_i,a
      0002B1 80 CB            [24]  728 	sjmp	00107$
      0002B3                        729 00103$:
                                    730 ;	preemptive.c:222: if( i == 4 ) cur_thread = -1;
      0002B3 74 04            [12]  731 	mov	a,#0x04
      0002B5 B5 36 03         [24]  732 	cjne	a,_i,00105$
      0002B8 75 35 FF         [24]  733 	mov	_cur_thread,#0xff
      0002BB                        734 00105$:
                                    735 ;	preemptive.c:225: RESTORESTATE;
      0002BB E5 35            [12]  736 	mov	a,_cur_thread
      0002BD 24 30            [12]  737 	add	a,#_saved_sp
      0002BF F9               [12]  738 	mov	r1,a
      0002C0 87 81            [24]  739 	mov	_SP,@r1
      0002C2 D0 D0            [24]  740 	POP PSW 
      0002C4 D0 83            [24]  741 	POP DPH 
      0002C6 D0 82            [24]  742 	POP DPL 
      0002C8 D0 F0            [24]  743 	POP B 
      0002CA D0 E0            [24]  744 	POP ACC 
                                    745 ;	preemptive.c:226: EA = 1;
                                    746 ;	assignBit
      0002CC D2 AF            [12]  747 	setb	_EA
      0002CE A2 04            [12]  748 	mov	c,_ThreadExit_sloc0_1_0
      0002D0 92 AF            [24]  749 	mov	ea,c
                                    750 ;	preemptive.c:228: }
      0002D2 22               [24]  751 	ret
                                    752 	.area CSEG    (CODE)
                                    753 	.area CONST   (CODE)
                                    754 	.area XINIT   (CODE)
                                    755 	.area CABS    (ABS,CODE)
