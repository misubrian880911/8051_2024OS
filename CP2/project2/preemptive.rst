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
      000084                        314 _Bootstrap:
                           000007   315 	ar7 = 0x07
                           000006   316 	ar6 = 0x06
                           000005   317 	ar5 = 0x05
                           000004   318 	ar4 = 0x04
                           000003   319 	ar3 = 0x03
                           000002   320 	ar2 = 0x02
                           000001   321 	ar1 = 0x01
                           000000   322 	ar0 = 0x00
                                    323 ;	preemptive.c:58: mask = 0;
      000084 75 34 00         [24]  324 	mov	_mask,#0x00
                                    325 ;	preemptive.c:59: TMOD = 0;  // timer 0 mode 0
      000087 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:60: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      00008A 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:62: TR0 = 1; // set bit TR0 to start running timer 0
                                    330 ;	assignBit
      00008D D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:63: cur_thread = ThreadCreate( main );
      00008F 90 00 6D         [24]  333 	mov	dptr,#_main
      000092 12 01 44         [24]  334 	lcall	_ThreadCreate
      000095 85 82 35         [24]  335 	mov	_cur_thread,dpl
                                    336 ;	preemptive.c:64: RESTORESTATE;
      000098 E5 35            [12]  337 	mov	a,_cur_thread
      00009A 24 30            [12]  338 	add	a,#_saved_sp
      00009C F9               [12]  339 	mov	r1,a
      00009D 87 81            [24]  340 	mov	_SP,@r1
      00009F D0 D0            [24]  341 	POP PSW 
      0000A1 D0 83            [24]  342 	POP DPH 
      0000A3 D0 82            [24]  343 	POP DPL 
      0000A5 D0 F0            [24]  344 	POP B 
      0000A7 D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:66: }
      0000A9 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'myTimer0Handler'
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:67: void myTimer0Handler(){
                                    352 ;	-----------------------------------------
                                    353 ;	 function myTimer0Handler
                                    354 ;	-----------------------------------------
      0000AA                        355 _myTimer0Handler:
                                    356 ;	preemptive.c:68: EA = 0;
                                    357 ;	assignBit
      0000AA C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:69: SAVESTATE;
      0000AC C0 E0            [24]  360 	PUSH ACC 
      0000AE C0 F0            [24]  361 	PUSH B 
      0000B0 C0 82            [24]  362 	PUSH DPL 
      0000B2 C0 83            [24]  363 	PUSH DPH 
      0000B4 C0 D0            [24]  364 	PUSH PSW 
      0000B6 E5 35            [12]  365 	mov	a,_cur_thread
      0000B8 24 30            [12]  366 	add	a,#_saved_sp
      0000BA F8               [12]  367 	mov	r0,a
      0000BB A6 81            [24]  368 	mov	@r0,_SP
                                    369 ;	preemptive.c:87: __endasm;
      0000BD E8               [12]  370 	MOV	A, R0
      0000BE C0 E0            [24]  371 	PUSH	ACC
      0000C0 E9               [12]  372 	MOV	A, R1
      0000C1 C0 E0            [24]  373 	PUSH	ACC
      0000C3 EA               [12]  374 	MOV	A, R2
      0000C4 C0 E0            [24]  375 	PUSH	ACC
      0000C6 EB               [12]  376 	MOV	A, R3
      0000C7 C0 E0            [24]  377 	PUSH	ACC
      0000C9 EC               [12]  378 	MOV	A, R4
      0000CA C0 E0            [24]  379 	PUSH	ACC
      0000CC ED               [12]  380 	MOV	A, R5
      0000CD C0 E0            [24]  381 	PUSH	ACC
      0000CF EE               [12]  382 	MOV	A, R6
      0000D0 C0 E0            [24]  383 	PUSH	ACC
      0000D2 EF               [12]  384 	MOV	A, R7
      0000D3 C0 E0            [24]  385 	PUSH	ACC
                                    386 ;	preemptive.c:89: do{
      0000D5                        387 00114$:
                                    388 ;	preemptive.c:90: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      0000D5 74 FD            [12]  389 	mov	a,#0x100 - 0x03
      0000D7 25 35            [12]  390 	add	a,_cur_thread
      0000D9 40 0B            [24]  391 	jc	00119$
      0000DB AF 35            [24]  392 	mov	r7,_cur_thread
      0000DD 0F               [12]  393 	inc	r7
      0000DE EF               [12]  394 	mov	a,r7
      0000DF FE               [12]  395 	mov	r6,a
      0000E0 33               [12]  396 	rlc	a
      0000E1 95 E0            [12]  397 	subb	a,acc
      0000E3 FF               [12]  398 	mov	r7,a
      0000E4 80 04            [24]  399 	sjmp	00120$
      0000E6                        400 00119$:
      0000E6 7E 00            [12]  401 	mov	r6,#0x00
      0000E8 7F 00            [12]  402 	mov	r7,#0x00
      0000EA                        403 00120$:
      0000EA 8E 35            [24]  404 	mov	_cur_thread,r6
                                    405 ;	preemptive.c:91: if( cur_thread == 0 )next_thread = 1;
      0000EC E5 35            [12]  406 	mov	a,_cur_thread
      0000EE 70 05            [24]  407 	jnz	00110$
      0000F0 75 39 01         [24]  408 	mov	_next_thread,#0x01
      0000F3 80 1C            [24]  409 	sjmp	00111$
      0000F5                        410 00110$:
                                    411 ;	preemptive.c:92: else if( cur_thread == 1 )next_thread = 2;
      0000F5 74 01            [12]  412 	mov	a,#0x01
      0000F7 B5 35 05         [24]  413 	cjne	a,_cur_thread,00107$
      0000FA 75 39 02         [24]  414 	mov	_next_thread,#0x02
      0000FD 80 12            [24]  415 	sjmp	00111$
      0000FF                        416 00107$:
                                    417 ;	preemptive.c:93: else if( cur_thread == 2 )next_thread = 4;
      0000FF 74 02            [12]  418 	mov	a,#0x02
      000101 B5 35 05         [24]  419 	cjne	a,_cur_thread,00104$
      000104 75 39 04         [24]  420 	mov	_next_thread,#0x04
      000107 80 08            [24]  421 	sjmp	00111$
      000109                        422 00104$:
                                    423 ;	preemptive.c:94: else if( cur_thread == 3 )next_thread = 8;
      000109 74 03            [12]  424 	mov	a,#0x03
      00010B B5 35 03         [24]  425 	cjne	a,_cur_thread,00111$
      00010E 75 39 08         [24]  426 	mov	_next_thread,#0x08
      000111                        427 00111$:
                                    428 ;	preemptive.c:95: if( mask & next_thread ){
      000111 E5 39            [12]  429 	mov	a,_next_thread
      000113 55 34            [12]  430 	anl	a,_mask
      000115 60 BE            [24]  431 	jz	00114$
                                    432 ;	preemptive.c:116: __endasm;  
      000117 D0 E0            [24]  433 	POP	ACC
      000119 FF               [12]  434 	MOV	R7, A
      00011A D0 E0            [24]  435 	POP	ACC
      00011C FE               [12]  436 	MOV	R6, A
      00011D D0 E0            [24]  437 	POP	ACC
      00011F FD               [12]  438 	MOV	R5, A
      000120 D0 E0            [24]  439 	POP	ACC
      000122 FC               [12]  440 	MOV	R4, A
      000123 D0 E0            [24]  441 	POP	ACC
      000125 FB               [12]  442 	MOV	R3, A
      000126 D0 E0            [24]  443 	POP	ACC
      000128 FA               [12]  444 	MOV	R2, A
      000129 D0 E0            [24]  445 	POP	ACC
      00012B F9               [12]  446 	MOV	R1, A
      00012C D0 E0            [24]  447 	POP	ACC
      00012E F8               [12]  448 	MOV	R0, A
                                    449 ;	preemptive.c:117: RESTORESTATE;
      00012F E5 35            [12]  450 	mov	a,_cur_thread
      000131 24 30            [12]  451 	add	a,#_saved_sp
      000133 F9               [12]  452 	mov	r1,a
      000134 87 81            [24]  453 	mov	_SP,@r1
      000136 D0 D0            [24]  454 	POP PSW 
      000138 D0 83            [24]  455 	POP DPH 
      00013A D0 82            [24]  456 	POP DPL 
      00013C D0 F0            [24]  457 	POP B 
      00013E D0 E0            [24]  458 	POP ACC 
                                    459 ;	preemptive.c:118: EA = 1;
                                    460 ;	assignBit
      000140 D2 AF            [12]  461 	setb	_EA
                                    462 ;	preemptive.c:121: __endasm;
      000142 32               [24]  463 	RETI
                                    464 ;	preemptive.c:123: }
      000143 22               [24]  465 	ret
                                    466 ;------------------------------------------------------------
                                    467 ;Allocation info for local variables in function 'ThreadCreate'
                                    468 ;------------------------------------------------------------
                                    469 ;fp                        Allocated to registers 
                                    470 ;------------------------------------------------------------
                                    471 ;	preemptive.c:131: ThreadID ThreadCreate(FunctionPtr fp) {
                                    472 ;	-----------------------------------------
                                    473 ;	 function ThreadCreate
                                    474 ;	-----------------------------------------
      000144                        475 _ThreadCreate:
                                    476 ;	preemptive.c:134: if( mask == 15 ) //mask = 0b1111, four thread
      000144 74 0F            [12]  477 	mov	a,#0x0f
      000146 B5 34 04         [24]  478 	cjne	a,_mask,00102$
                                    479 ;	preemptive.c:135: return -1;
      000149 75 82 FF         [24]  480 	mov	dpl,#0xff
      00014C 22               [24]  481 	ret
      00014D                        482 00102$:
                                    483 ;	preemptive.c:179: }
      00014D D2 02            [12]  484 	setb	_ThreadCreate_sloc0_1_0
      00014F 10 AF 02         [24]  485 	jbc	ea,00129$
      000152 C2 02            [12]  486 	clr	_ThreadCreate_sloc0_1_0
      000154                        487 00129$:
                                    488 ;	preemptive.c:137: for(i = 0; i < 4 ; i++){
      000154 75 36 00         [24]  489 	mov	_i,#0x00
      000157                        490 00107$:
      000157 74 FC            [12]  491 	mov	a,#0x100 - 0x04
      000159 25 36            [12]  492 	add	a,_i
      00015B 40 41            [24]  493 	jc	00105$
                                    494 ;	preemptive.c:138: if( !( mask & (1 << i) ) ){
      00015D AF 36            [24]  495 	mov	r7,_i
      00015F 8F F0            [24]  496 	mov	b,r7
      000161 05 F0            [12]  497 	inc	b
      000163 7F 01            [12]  498 	mov	r7,#0x01
      000165 7E 00            [12]  499 	mov	r6,#0x00
      000167 80 06            [24]  500 	sjmp	00132$
      000169                        501 00131$:
      000169 EF               [12]  502 	mov	a,r7
      00016A 2F               [12]  503 	add	a,r7
      00016B FF               [12]  504 	mov	r7,a
      00016C EE               [12]  505 	mov	a,r6
      00016D 33               [12]  506 	rlc	a
      00016E FE               [12]  507 	mov	r6,a
      00016F                        508 00132$:
      00016F D5 F0 F7         [24]  509 	djnz	b,00131$
      000172 AC 34            [24]  510 	mov	r4,_mask
      000174 7D 00            [12]  511 	mov	r5,#0x00
      000176 EC               [12]  512 	mov	a,r4
      000177 52 07            [12]  513 	anl	ar7,a
      000179 ED               [12]  514 	mov	a,r5
      00017A 52 06            [12]  515 	anl	ar6,a
      00017C EF               [12]  516 	mov	a,r7
      00017D 4E               [12]  517 	orl	a,r6
      00017E 70 17            [24]  518 	jnz	00108$
                                    519 ;	preemptive.c:139: mask |= (1 << i);
      000180 AF 36            [24]  520 	mov	r7,_i
      000182 8F F0            [24]  521 	mov	b,r7
      000184 05 F0            [12]  522 	inc	b
      000186 74 01            [12]  523 	mov	a,#0x01
      000188 80 02            [24]  524 	sjmp	00136$
      00018A                        525 00134$:
      00018A 25 E0            [12]  526 	add	a,acc
      00018C                        527 00136$:
      00018C D5 F0 FB         [24]  528 	djnz	b,00134$
      00018F FF               [12]  529 	mov	r7,a
      000190 42 34            [12]  530 	orl	_mask,a
                                    531 ;	preemptive.c:140: new_thread = i;
      000192 85 36 38         [24]  532 	mov	_new_thread,_i
                                    533 ;	preemptive.c:141: break;
      000195 80 07            [24]  534 	sjmp	00105$
      000197                        535 00108$:
                                    536 ;	preemptive.c:137: for(i = 0; i < 4 ; i++){
      000197 E5 36            [12]  537 	mov	a,_i
      000199 04               [12]  538 	inc	a
      00019A F5 36            [12]  539 	mov	_i,a
      00019C 80 B9            [24]  540 	sjmp	00107$
      00019E                        541 00105$:
                                    542 ;	preemptive.c:145: sp_temp = SP;
      00019E 85 81 37         [24]  543 	mov	_sp_temp,_SP
                                    544 ;	preemptive.c:146: SP = (0x3F) + (0x10) * new_thread;
      0001A1 E5 38            [12]  545 	mov	a,_new_thread
      0001A3 C4               [12]  546 	swap	a
      0001A4 54 F0            [12]  547 	anl	a,#0xf0
      0001A6 FF               [12]  548 	mov	r7,a
      0001A7 24 3F            [12]  549 	add	a,#0x3f
      0001A9 F5 81            [12]  550 	mov	_SP,a
                                    551 ;	preemptive.c:153: __endasm;
      0001AB C0 82            [24]  552 	PUSH	DPL
      0001AD C0 83            [24]  553 	PUSH	DPH
                                    554 ;	preemptive.c:165: __endasm;
      0001AF 54 00            [12]  555 	ANL	A, #0
      0001B1 C0 E0            [24]  556 	PUSH	ACC
      0001B3 C0 E0            [24]  557 	PUSH	ACC
      0001B5 C0 E0            [24]  558 	PUSH	ACC
      0001B7 C0 E0            [24]  559 	PUSH	ACC
                                    560 ;	preemptive.c:169: PSW = new_thread << 3;
      0001B9 E5 38            [12]  561 	mov	a,_new_thread
      0001BB FF               [12]  562 	mov	r7,a
      0001BC C4               [12]  563 	swap	a
      0001BD 03               [12]  564 	rr	a
      0001BE 54 F8            [12]  565 	anl	a,#0xf8
      0001C0 F5 D0            [12]  566 	mov	_PSW,a
                                    567 ;	preemptive.c:172: __endasm;
      0001C2 C0 D0            [24]  568 	PUSH	PSW
                                    569 ;	preemptive.c:175: saved_sp[new_thread] = SP;
      0001C4 E5 38            [12]  570 	mov	a,_new_thread
      0001C6 24 30            [12]  571 	add	a,#_saved_sp
      0001C8 F8               [12]  572 	mov	r0,a
      0001C9 A6 81            [24]  573 	mov	@r0,_SP
                                    574 ;	preemptive.c:177: SP = sp_temp;
      0001CB 85 37 81         [24]  575 	mov	_SP,_sp_temp
      0001CE A2 02            [12]  576 	mov	c,_ThreadCreate_sloc0_1_0
      0001D0 92 AF            [24]  577 	mov	ea,c
                                    578 ;	preemptive.c:180: return new_thread;
      0001D2 85 38 82         [24]  579 	mov	dpl,_new_thread
                                    580 ;	preemptive.c:183: }
      0001D5 22               [24]  581 	ret
                                    582 ;------------------------------------------------------------
                                    583 ;Allocation info for local variables in function 'ThreadYield'
                                    584 ;------------------------------------------------------------
                                    585 ;	preemptive.c:194: void ThreadYield(void) {
                                    586 ;	-----------------------------------------
                                    587 ;	 function ThreadYield
                                    588 ;	-----------------------------------------
      0001D6                        589 _ThreadYield:
                                    590 ;	preemptive.c:204: }
      0001D6 D2 03            [12]  591 	setb	_ThreadYield_sloc0_1_0
      0001D8 10 AF 02         [24]  592 	jbc	ea,00122$
      0001DB C2 03            [12]  593 	clr	_ThreadYield_sloc0_1_0
      0001DD                        594 00122$:
                                    595 ;	preemptive.c:196: SAVESTATE;
      0001DD C0 E0            [24]  596 	PUSH ACC 
      0001DF C0 F0            [24]  597 	PUSH B 
      0001E1 C0 82            [24]  598 	PUSH DPL 
      0001E3 C0 83            [24]  599 	PUSH DPH 
      0001E5 C0 D0            [24]  600 	PUSH PSW 
      0001E7 E5 35            [12]  601 	mov	a,_cur_thread
      0001E9 24 30            [12]  602 	add	a,#_saved_sp
      0001EB F8               [12]  603 	mov	r0,a
      0001EC A6 81            [24]  604 	mov	@r0,_SP
                                    605 ;	preemptive.c:197: do{
      0001EE                        606 00103$:
                                    607 ;	preemptive.c:198: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      0001EE 74 FD            [12]  608 	mov	a,#0x100 - 0x03
      0001F0 25 35            [12]  609 	add	a,_cur_thread
      0001F2 40 0B            [24]  610 	jc	00108$
      0001F4 AF 35            [24]  611 	mov	r7,_cur_thread
      0001F6 0F               [12]  612 	inc	r7
      0001F7 EF               [12]  613 	mov	a,r7
      0001F8 FE               [12]  614 	mov	r6,a
      0001F9 33               [12]  615 	rlc	a
      0001FA 95 E0            [12]  616 	subb	a,acc
      0001FC FF               [12]  617 	mov	r7,a
      0001FD 80 04            [24]  618 	sjmp	00109$
      0001FF                        619 00108$:
      0001FF 7E 00            [12]  620 	mov	r6,#0x00
      000201 7F 00            [12]  621 	mov	r7,#0x00
      000203                        622 00109$:
      000203 8E 35            [24]  623 	mov	_cur_thread,r6
                                    624 ;	preemptive.c:199: if( mask & (1<<cur_thread) ){
      000205 AF 35            [24]  625 	mov	r7,_cur_thread
      000207 8F F0            [24]  626 	mov	b,r7
      000209 05 F0            [12]  627 	inc	b
      00020B 7F 01            [12]  628 	mov	r7,#0x01
      00020D 7E 00            [12]  629 	mov	r6,#0x00
      00020F 80 06            [24]  630 	sjmp	00125$
      000211                        631 00124$:
      000211 EF               [12]  632 	mov	a,r7
      000212 2F               [12]  633 	add	a,r7
      000213 FF               [12]  634 	mov	r7,a
      000214 EE               [12]  635 	mov	a,r6
      000215 33               [12]  636 	rlc	a
      000216 FE               [12]  637 	mov	r6,a
      000217                        638 00125$:
      000217 D5 F0 F7         [24]  639 	djnz	b,00124$
      00021A AC 34            [24]  640 	mov	r4,_mask
      00021C 7D 00            [12]  641 	mov	r5,#0x00
      00021E EC               [12]  642 	mov	a,r4
      00021F 52 07            [12]  643 	anl	ar7,a
      000221 ED               [12]  644 	mov	a,r5
      000222 52 06            [12]  645 	anl	ar6,a
      000224 EF               [12]  646 	mov	a,r7
      000225 4E               [12]  647 	orl	a,r6
      000226 60 C6            [24]  648 	jz	00103$
                                    649 ;	preemptive.c:203: RESTORESTATE;
      000228 E5 35            [12]  650 	mov	a,_cur_thread
      00022A 24 30            [12]  651 	add	a,#_saved_sp
      00022C F9               [12]  652 	mov	r1,a
      00022D 87 81            [24]  653 	mov	_SP,@r1
      00022F D0 D0            [24]  654 	POP PSW 
      000231 D0 83            [24]  655 	POP DPH 
      000233 D0 82            [24]  656 	POP DPL 
      000235 D0 F0            [24]  657 	POP B 
      000237 D0 E0            [24]  658 	POP ACC 
      000239 A2 03            [12]  659 	mov	c,_ThreadYield_sloc0_1_0
      00023B 92 AF            [24]  660 	mov	ea,c
                                    661 ;	preemptive.c:205: }
      00023D 22               [24]  662 	ret
                                    663 ;------------------------------------------------------------
                                    664 ;Allocation info for local variables in function 'ThreadExit'
                                    665 ;------------------------------------------------------------
                                    666 ;	preemptive.c:213: void ThreadExit(void) {
                                    667 ;	-----------------------------------------
                                    668 ;	 function ThreadExit
                                    669 ;	-----------------------------------------
      00023E                        670 _ThreadExit:
                                    671 ;	preemptive.c:227: }
      00023E D2 04            [12]  672 	setb	_ThreadExit_sloc0_1_0
      000240 10 AF 02         [24]  673 	jbc	ea,00127$
      000243 C2 04            [12]  674 	clr	_ThreadExit_sloc0_1_0
      000245                        675 00127$:
                                    676 ;	preemptive.c:215: mask ^= (1<<cur_thread);
      000245 AF 35            [24]  677 	mov	r7,_cur_thread
      000247 8F F0            [24]  678 	mov	b,r7
      000249 05 F0            [12]  679 	inc	b
      00024B 74 01            [12]  680 	mov	a,#0x01
      00024D 80 02            [24]  681 	sjmp	00130$
      00024F                        682 00128$:
      00024F 25 E0            [12]  683 	add	a,acc
      000251                        684 00130$:
      000251 D5 F0 FB         [24]  685 	djnz	b,00128$
      000254 FF               [12]  686 	mov	r7,a
      000255 62 34            [12]  687 	xrl	_mask,a
                                    688 ;	preemptive.c:216: for(i=0 ; i < 4 ; i++)
      000257 75 36 00         [24]  689 	mov	_i,#0x00
      00025A                        690 00107$:
      00025A 74 FC            [12]  691 	mov	a,#0x100 - 0x04
      00025C 25 36            [12]  692 	add	a,_i
      00025E 40 2F            [24]  693 	jc	00103$
                                    694 ;	preemptive.c:217: if( mask & (1<<i) ){
      000260 AF 36            [24]  695 	mov	r7,_i
      000262 8F F0            [24]  696 	mov	b,r7
      000264 05 F0            [12]  697 	inc	b
      000266 7F 01            [12]  698 	mov	r7,#0x01
      000268 7E 00            [12]  699 	mov	r6,#0x00
      00026A 80 06            [24]  700 	sjmp	00133$
      00026C                        701 00132$:
      00026C EF               [12]  702 	mov	a,r7
      00026D 2F               [12]  703 	add	a,r7
      00026E FF               [12]  704 	mov	r7,a
      00026F EE               [12]  705 	mov	a,r6
      000270 33               [12]  706 	rlc	a
      000271 FE               [12]  707 	mov	r6,a
      000272                        708 00133$:
      000272 D5 F0 F7         [24]  709 	djnz	b,00132$
      000275 AC 34            [24]  710 	mov	r4,_mask
      000277 7D 00            [12]  711 	mov	r5,#0x00
      000279 EC               [12]  712 	mov	a,r4
      00027A 52 07            [12]  713 	anl	ar7,a
      00027C ED               [12]  714 	mov	a,r5
      00027D 52 06            [12]  715 	anl	ar6,a
      00027F EF               [12]  716 	mov	a,r7
      000280 4E               [12]  717 	orl	a,r6
      000281 60 05            [24]  718 	jz	00108$
                                    719 ;	preemptive.c:218: cur_thread = i;
      000283 85 36 35         [24]  720 	mov	_cur_thread,_i
                                    721 ;	preemptive.c:219: break;
      000286 80 07            [24]  722 	sjmp	00103$
      000288                        723 00108$:
                                    724 ;	preemptive.c:216: for(i=0 ; i < 4 ; i++)
      000288 E5 36            [12]  725 	mov	a,_i
      00028A 04               [12]  726 	inc	a
      00028B F5 36            [12]  727 	mov	_i,a
      00028D 80 CB            [24]  728 	sjmp	00107$
      00028F                        729 00103$:
                                    730 ;	preemptive.c:222: if( i == 4 ) cur_thread = -1;
      00028F 74 04            [12]  731 	mov	a,#0x04
      000291 B5 36 03         [24]  732 	cjne	a,_i,00105$
      000294 75 35 FF         [24]  733 	mov	_cur_thread,#0xff
      000297                        734 00105$:
                                    735 ;	preemptive.c:225: RESTORESTATE;
      000297 E5 35            [12]  736 	mov	a,_cur_thread
      000299 24 30            [12]  737 	add	a,#_saved_sp
      00029B F9               [12]  738 	mov	r1,a
      00029C 87 81            [24]  739 	mov	_SP,@r1
      00029E D0 D0            [24]  740 	POP PSW 
      0002A0 D0 83            [24]  741 	POP DPH 
      0002A2 D0 82            [24]  742 	POP DPL 
      0002A4 D0 F0            [24]  743 	POP B 
      0002A6 D0 E0            [24]  744 	POP ACC 
                                    745 ;	preemptive.c:226: EA = 1;
                                    746 ;	assignBit
      0002A8 D2 AF            [12]  747 	setb	_EA
      0002AA A2 04            [12]  748 	mov	c,_ThreadExit_sloc0_1_0
      0002AC 92 AF            [24]  749 	mov	ea,c
                                    750 ;	preemptive.c:228: }
      0002AE 22               [24]  751 	ret
                                    752 	.area CSEG    (CODE)
                                    753 	.area CONST   (CODE)
                                    754 	.area XINIT   (CODE)
                                    755 	.area CABS    (ABS,CODE)
