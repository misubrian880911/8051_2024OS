                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _tail
                                    117 	.globl _head
                                    118 	.globl _mutex
                                    119 	.globl _empty
                                    120 	.globl _full
                                    121 	.globl _item
                                    122 	.globl _buff
                                    123 ;--------------------------------------------------------
                                    124 ; special function registers
                                    125 ;--------------------------------------------------------
                                    126 	.area RSEG    (ABS,DATA)
      000000                        127 	.org 0x0000
                           000080   128 _P0	=	0x0080
                           000081   129 _SP	=	0x0081
                           000082   130 _DPL	=	0x0082
                           000083   131 _DPH	=	0x0083
                           000087   132 _PCON	=	0x0087
                           000088   133 _TCON	=	0x0088
                           000089   134 _TMOD	=	0x0089
                           00008A   135 _TL0	=	0x008a
                           00008B   136 _TL1	=	0x008b
                           00008C   137 _TH0	=	0x008c
                           00008D   138 _TH1	=	0x008d
                           000090   139 _P1	=	0x0090
                           000098   140 _SCON	=	0x0098
                           000099   141 _SBUF	=	0x0099
                           0000A0   142 _P2	=	0x00a0
                           0000A8   143 _IE	=	0x00a8
                           0000B0   144 _P3	=	0x00b0
                           0000B8   145 _IP	=	0x00b8
                           0000D0   146 _PSW	=	0x00d0
                           0000E0   147 _ACC	=	0x00e0
                           0000F0   148 _B	=	0x00f0
                                    149 ;--------------------------------------------------------
                                    150 ; special function bits
                                    151 ;--------------------------------------------------------
                                    152 	.area RSEG    (ABS,DATA)
      000000                        153 	.org 0x0000
                           000080   154 _P0_0	=	0x0080
                           000081   155 _P0_1	=	0x0081
                           000082   156 _P0_2	=	0x0082
                           000083   157 _P0_3	=	0x0083
                           000084   158 _P0_4	=	0x0084
                           000085   159 _P0_5	=	0x0085
                           000086   160 _P0_6	=	0x0086
                           000087   161 _P0_7	=	0x0087
                           000088   162 _IT0	=	0x0088
                           000089   163 _IE0	=	0x0089
                           00008A   164 _IT1	=	0x008a
                           00008B   165 _IE1	=	0x008b
                           00008C   166 _TR0	=	0x008c
                           00008D   167 _TF0	=	0x008d
                           00008E   168 _TR1	=	0x008e
                           00008F   169 _TF1	=	0x008f
                           000090   170 _P1_0	=	0x0090
                           000091   171 _P1_1	=	0x0091
                           000092   172 _P1_2	=	0x0092
                           000093   173 _P1_3	=	0x0093
                           000094   174 _P1_4	=	0x0094
                           000095   175 _P1_5	=	0x0095
                           000096   176 _P1_6	=	0x0096
                           000097   177 _P1_7	=	0x0097
                           000098   178 _RI	=	0x0098
                           000099   179 _TI	=	0x0099
                           00009A   180 _RB8	=	0x009a
                           00009B   181 _TB8	=	0x009b
                           00009C   182 _REN	=	0x009c
                           00009D   183 _SM2	=	0x009d
                           00009E   184 _SM1	=	0x009e
                           00009F   185 _SM0	=	0x009f
                           0000A0   186 _P2_0	=	0x00a0
                           0000A1   187 _P2_1	=	0x00a1
                           0000A2   188 _P2_2	=	0x00a2
                           0000A3   189 _P2_3	=	0x00a3
                           0000A4   190 _P2_4	=	0x00a4
                           0000A5   191 _P2_5	=	0x00a5
                           0000A6   192 _P2_6	=	0x00a6
                           0000A7   193 _P2_7	=	0x00a7
                           0000A8   194 _EX0	=	0x00a8
                           0000A9   195 _ET0	=	0x00a9
                           0000AA   196 _EX1	=	0x00aa
                           0000AB   197 _ET1	=	0x00ab
                           0000AC   198 _ES	=	0x00ac
                           0000AF   199 _EA	=	0x00af
                           0000B0   200 _P3_0	=	0x00b0
                           0000B1   201 _P3_1	=	0x00b1
                           0000B2   202 _P3_2	=	0x00b2
                           0000B3   203 _P3_3	=	0x00b3
                           0000B4   204 _P3_4	=	0x00b4
                           0000B5   205 _P3_5	=	0x00b5
                           0000B6   206 _P3_6	=	0x00b6
                           0000B7   207 _P3_7	=	0x00b7
                           0000B0   208 _RXD	=	0x00b0
                           0000B1   209 _TXD	=	0x00b1
                           0000B2   210 _INT0	=	0x00b2
                           0000B3   211 _INT1	=	0x00b3
                           0000B4   212 _T0	=	0x00b4
                           0000B5   213 _T1	=	0x00b5
                           0000B6   214 _WR	=	0x00b6
                           0000B7   215 _RD	=	0x00b7
                           0000B8   216 _PX0	=	0x00b8
                           0000B9   217 _PT0	=	0x00b9
                           0000BA   218 _PX1	=	0x00ba
                           0000BB   219 _PT1	=	0x00bb
                           0000BC   220 _PS	=	0x00bc
                           0000D0   221 _P	=	0x00d0
                           0000D1   222 _F1	=	0x00d1
                           0000D2   223 _OV	=	0x00d2
                           0000D3   224 _RS0	=	0x00d3
                           0000D4   225 _RS1	=	0x00d4
                           0000D5   226 _F0	=	0x00d5
                           0000D6   227 _AC	=	0x00d6
                           0000D7   228 _CY	=	0x00d7
                                    229 ;--------------------------------------------------------
                                    230 ; overlayable register banks
                                    231 ;--------------------------------------------------------
                                    232 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        233 	.ds 8
                                    234 ;--------------------------------------------------------
                                    235 ; internal ram data
                                    236 ;--------------------------------------------------------
                                    237 	.area DSEG    (DATA)
                           000034   238 _buff	=	0x0034
                           00003B   239 _item	=	0x003b
                           00003C   240 _full	=	0x003c
                           00003D   241 _empty	=	0x003d
                           00003E   242 _mutex	=	0x003e
                                    243 ;--------------------------------------------------------
                                    244 ; overlayable items in internal ram
                                    245 ;--------------------------------------------------------
                                    246 ;--------------------------------------------------------
                                    247 ; Stack segment in internal ram
                                    248 ;--------------------------------------------------------
                                    249 	.area	SSEG
      000077                        250 __start__stack:
      000077                        251 	.ds	1
                                    252 
                                    253 ;--------------------------------------------------------
                                    254 ; indirectly addressable internal ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area ISEG    (DATA)
                                    257 ;--------------------------------------------------------
                                    258 ; absolute internal ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area IABS    (ABS,DATA)
      000075                        261 	.org 0x0075
      000075                        262 _head::
      000075                        263 	.ds 1
      000076                        264 	.org 0x0076
      000076                        265 _tail::
      000076                        266 	.ds 1
                                    267 	.area IABS    (ABS,DATA)
                                    268 ;--------------------------------------------------------
                                    269 ; bit data
                                    270 ;--------------------------------------------------------
                                    271 	.area BSEG    (BIT)
      000000                        272 _Producer_sloc0_1_0:
      000000                        273 	.ds 1
      000001                        274 _Consumer_sloc0_1_0:
      000001                        275 	.ds 1
      000002                        276 _main_sloc0_1_0:
      000002                        277 	.ds 1
                                    278 ;--------------------------------------------------------
                                    279 ; paged external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area PSEG    (PAG,XDATA)
                                    282 ;--------------------------------------------------------
                                    283 ; external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area XSEG    (XDATA)
                                    286 ;--------------------------------------------------------
                                    287 ; absolute external ram data
                                    288 ;--------------------------------------------------------
                                    289 	.area XABS    (ABS,XDATA)
                                    290 ;--------------------------------------------------------
                                    291 ; external initialized ram data
                                    292 ;--------------------------------------------------------
                                    293 	.area XISEG   (XDATA)
                                    294 	.area HOME    (CODE)
                                    295 	.area GSINIT0 (CODE)
                                    296 	.area GSINIT1 (CODE)
                                    297 	.area GSINIT2 (CODE)
                                    298 	.area GSINIT3 (CODE)
                                    299 	.area GSINIT4 (CODE)
                                    300 	.area GSINIT5 (CODE)
                                    301 	.area GSINIT  (CODE)
                                    302 	.area GSFINAL (CODE)
                                    303 	.area CSEG    (CODE)
                                    304 ;--------------------------------------------------------
                                    305 ; interrupt vector
                                    306 ;--------------------------------------------------------
                                    307 	.area HOME    (CODE)
      000000                        308 __interrupt_vect:
      000000 02 00 EF         [24]  309 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  310 	reti
      000004                        311 	.ds	7
      00000B 02 00 F6         [24]  312 	ljmp	_timer0_ISR
                                    313 ;--------------------------------------------------------
                                    314 ; global & static initialisations
                                    315 ;--------------------------------------------------------
                                    316 	.area HOME    (CODE)
                                    317 	.area GSINIT  (CODE)
                                    318 	.area GSFINAL (CODE)
                                    319 	.area GSINIT  (CODE)
                                    320 	.globl __sdcc_gsinit_startup
                                    321 	.globl __sdcc_program_startup
                                    322 	.globl __start__stack
                                    323 	.globl __mcs51_genXINIT
                                    324 	.globl __mcs51_genXRAMCLEAR
                                    325 	.globl __mcs51_genRAMCLEAR
                                    326 ;	testpreempt.c:23: __data __at (0x75) char head = 0;
      000011 75 75 00         [24]  327 	mov	_head,#0x00
                                    328 ;	testpreempt.c:24: __data __at (0x76) char tail = 0;
      000014 75 76 00         [24]  329 	mov	_tail,#0x00
                                    330 	.area GSFINAL (CODE)
      00001A 02 00 0E         [24]  331 	ljmp	__sdcc_program_startup
                                    332 ;--------------------------------------------------------
                                    333 ; Home
                                    334 ;--------------------------------------------------------
                                    335 	.area HOME    (CODE)
                                    336 	.area HOME    (CODE)
      00000E                        337 __sdcc_program_startup:
      00000E 02 00 D2         [24]  338 	ljmp	_main
                                    339 ;	return from main will return to caller
                                    340 ;--------------------------------------------------------
                                    341 ; code
                                    342 ;--------------------------------------------------------
                                    343 	.area CSEG    (CODE)
                                    344 ;------------------------------------------------------------
                                    345 ;Allocation info for local variables in function 'Producer'
                                    346 ;------------------------------------------------------------
                                    347 ;	testpreempt.c:36: void Producer(void)
                                    348 ;	-----------------------------------------
                                    349 ;	 function Producer
                                    350 ;	-----------------------------------------
      00001D                        351 _Producer:
                           000007   352 	ar7 = 0x07
                           000006   353 	ar6 = 0x06
                           000005   354 	ar5 = 0x05
                           000004   355 	ar4 = 0x04
                           000003   356 	ar3 = 0x03
                           000002   357 	ar2 = 0x02
                           000001   358 	ar1 = 0x01
                           000000   359 	ar0 = 0x00
                                    360 ;	testpreempt.c:43: item = 'A';
      00001D 75 3B 41         [24]  361 	mov	_item,#0x41
                                    362 ;	testpreempt.c:44: while (1)
      000020                        363 00102$:
                                    364 ;	testpreempt.c:49: SemaphoreWait(empty);
      000020                        365 		0$:
                                    366 ;; top of while-loop 
      000020 E5 3D            [12]  367 	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
      000022 20 E7 FB         [24]  368 	JB ACC.7, 0$ ;; conditionally jump(s) back to 0$ if ACC <= 0 
      000025 60 F9            [24]  369 	JZ 0$ 
                                    370 ;; fall-through to drop out of while-loop 
      000027 15 3D            [12]  371 	dec _empty 
                                    372 ;	testpreempt.c:50: SemaphoreWait(mutex);
      000029                        373 		1$:
                                    374 ;; top of while-loop 
      000029 E5 3E            [12]  375 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      00002B 20 E7 FB         [24]  376 	JB ACC.7, 1$ ;; conditionally jump(s) back to 1$ if ACC <= 0 
      00002E 60 F9            [24]  377 	JZ 1$ 
                                    378 ;; fall-through to drop out of while-loop 
      000030 15 3E            [12]  379 	dec _mutex 
                                    380 ;	testpreempt.c:54: }
      000032 D2 00            [12]  381 	setb	_Producer_sloc0_1_0
      000034 10 AF 02         [24]  382 	jbc	ea,00116$
      000037 C2 00            [12]  383 	clr	_Producer_sloc0_1_0
      000039                        384 00116$:
                                    385 ;	testpreempt.c:52: buff[tail] = item;
      000039 E5 76            [12]  386 	mov	a,_tail
      00003B 24 34            [12]  387 	add	a,#_buff
      00003D F8               [12]  388 	mov	r0,a
      00003E A6 3B            [24]  389 	mov	@r0,_item
                                    390 ;	testpreempt.c:53: tail = (tail + 1) % 3;
      000040 AE 76            [24]  391 	mov	r6,_tail
      000042 7F 00            [12]  392 	mov	r7,#0x00
      000044 8E 82            [24]  393 	mov	dpl,r6
      000046 8F 83            [24]  394 	mov	dph,r7
      000048 A3               [24]  395 	inc	dptr
      000049 75 08 03         [24]  396 	mov	__modsint_PARM_2,#0x03
                                    397 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      00004C 8F 09            [24]  398 	mov	(__modsint_PARM_2 + 1),r7
      00004E 12 03 22         [24]  399 	lcall	__modsint
      000051 AE 82            [24]  400 	mov	r6,dpl
      000053 AF 83            [24]  401 	mov	r7,dph
      000055 8E 76            [24]  402 	mov	_tail,r6
      000057 A2 00            [12]  403 	mov	c,_Producer_sloc0_1_0
      000059 92 AF            [24]  404 	mov	ea,c
                                    405 ;	testpreempt.c:55: SemaphoreSignal(mutex);
      00005B 05 3E            [12]  406 	INC _mutex 
                                    407 ;	testpreempt.c:56: SemaphoreSignal(full);
      00005D 05 3C            [12]  408 	INC _full 
                                    409 ;	testpreempt.c:57: item = (item != 'Z')? (item + 1) : 'A';
      00005F 74 5A            [12]  410 	mov	a,#0x5a
      000061 B5 3B 03         [24]  411 	cjne	a,_item,00117$
      000064 D3               [12]  412 	setb	c
      000065 80 01            [24]  413 	sjmp	00118$
      000067                        414 00117$:
      000067 C3               [12]  415 	clr	c
      000068                        416 00118$:
      000068 92 00            [24]  417 	mov	_Producer_sloc0_1_0,c
      00006A 40 0B            [24]  418 	jc	00106$
      00006C AF 3B            [24]  419 	mov	r7,_item
      00006E 0F               [12]  420 	inc	r7
      00006F EF               [12]  421 	mov	a,r7
      000070 FE               [12]  422 	mov	r6,a
      000071 33               [12]  423 	rlc	a
      000072 95 E0            [12]  424 	subb	a,acc
      000074 FF               [12]  425 	mov	r7,a
      000075 80 04            [24]  426 	sjmp	00107$
      000077                        427 00106$:
      000077 7E 41            [12]  428 	mov	r6,#0x41
      000079 7F 00            [12]  429 	mov	r7,#0x00
      00007B                        430 00107$:
      00007B 8E 3B            [24]  431 	mov	_item,r6
                                    432 ;	testpreempt.c:63: }
      00007D 80 A1            [24]  433 	sjmp	00102$
                                    434 ;------------------------------------------------------------
                                    435 ;Allocation info for local variables in function 'Consumer'
                                    436 ;------------------------------------------------------------
                                    437 ;	testpreempt.c:70: void Consumer(void)
                                    438 ;	-----------------------------------------
                                    439 ;	 function Consumer
                                    440 ;	-----------------------------------------
      00007F                        441 _Consumer:
                                    442 ;	testpreempt.c:76: EA = 0;
                                    443 ;	assignBit
      00007F C2 AF            [12]  444 	clr	_EA
                                    445 ;	testpreempt.c:77: TMOD |= 0x20;
      000081 43 89 20         [24]  446 	orl	_TMOD,#0x20
                                    447 ;	testpreempt.c:78: TH1 = (char)-6;
      000084 75 8D FA         [24]  448 	mov	_TH1,#0xfa
                                    449 ;	testpreempt.c:79: SCON = 0x50;
      000087 75 98 50         [24]  450 	mov	_SCON,#0x50
                                    451 ;	testpreempt.c:80: TR1 = 1;
                                    452 ;	assignBit
      00008A D2 8E            [12]  453 	setb	_TR1
                                    454 ;	testpreempt.c:81: EA = 1;
                                    455 ;	assignBit
      00008C D2 AF            [12]  456 	setb	_EA
                                    457 ;	testpreempt.c:84: while (1)
      00008E                        458 00105$:
                                    459 ;	testpreempt.c:98: SemaphoreWait(full);
      00008E                        460 		2$:
                                    461 ;; top of while-loop 
      00008E E5 3C            [12]  462 	MOV A, _full ;; read value of _S into ACC (where full is semaphore) 
      000090 20 E7 FB         [24]  463 	JB ACC.7, 2$ ;; conditionally jump(s) back to 2$ if ACC <= 0 
      000093 60 F9            [24]  464 	JZ 2$ 
                                    465 ;; fall-through to drop out of while-loop 
      000095 15 3C            [12]  466 	dec _full 
                                    467 ;	testpreempt.c:99: SemaphoreWait(mutex);
      000097                        468 		3$:
                                    469 ;; top of while-loop 
      000097 E5 3E            [12]  470 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      000099 20 E7 FB         [24]  471 	JB ACC.7, 3$ ;; conditionally jump(s) back to 3$ if ACC <= 0 
      00009C 60 F9            [24]  472 	JZ 3$ 
                                    473 ;; fall-through to drop out of while-loop 
      00009E 15 3E            [12]  474 	dec _mutex 
                                    475 ;	testpreempt.c:104: }
      0000A0 D2 01            [12]  476 	setb	_Consumer_sloc0_1_0
      0000A2 10 AF 02         [24]  477 	jbc	ea,00121$
      0000A5 C2 01            [12]  478 	clr	_Consumer_sloc0_1_0
      0000A7                        479 00121$:
                                    480 ;	testpreempt.c:101: SBUF = buff[head];
      0000A7 E5 75            [12]  481 	mov	a,_head
      0000A9 24 34            [12]  482 	add	a,#_buff
      0000AB F9               [12]  483 	mov	r1,a
      0000AC 87 99            [24]  484 	mov	_SBUF,@r1
                                    485 ;	testpreempt.c:102: head = (head + 1) % 3;
      0000AE AE 75            [24]  486 	mov	r6,_head
      0000B0 7F 00            [12]  487 	mov	r7,#0x00
      0000B2 8E 82            [24]  488 	mov	dpl,r6
      0000B4 8F 83            [24]  489 	mov	dph,r7
      0000B6 A3               [24]  490 	inc	dptr
      0000B7 75 08 03         [24]  491 	mov	__modsint_PARM_2,#0x03
                                    492 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      0000BA 8F 09            [24]  493 	mov	(__modsint_PARM_2 + 1),r7
      0000BC 12 03 22         [24]  494 	lcall	__modsint
      0000BF AE 82            [24]  495 	mov	r6,dpl
      0000C1 AF 83            [24]  496 	mov	r7,dph
      0000C3 8E 75            [24]  497 	mov	_head,r6
      0000C5 A2 01            [12]  498 	mov	c,_Consumer_sloc0_1_0
      0000C7 92 AF            [24]  499 	mov	ea,c
                                    500 ;	testpreempt.c:105: SemaphoreSignal(mutex);
      0000C9 05 3E            [12]  501 	INC _mutex 
                                    502 ;	testpreempt.c:106: SemaphoreSignal(empty);
      0000CB 05 3D            [12]  503 	INC _empty 
                                    504 ;	testpreempt.c:108: while (!TI){
      0000CD                        505 00101$:
                                    506 ;	testpreempt.c:111: TI = 0;
                                    507 ;	assignBit
      0000CD 10 99 BE         [24]  508 	jbc	_TI,00105$
                                    509 ;	testpreempt.c:113: }
      0000D0 80 FB            [24]  510 	sjmp	00101$
                                    511 ;------------------------------------------------------------
                                    512 ;Allocation info for local variables in function 'main'
                                    513 ;------------------------------------------------------------
                                    514 ;	testpreempt.c:120: void main(void)
                                    515 ;	-----------------------------------------
                                    516 ;	 function main
                                    517 ;	-----------------------------------------
      0000D2                        518 _main:
                                    519 ;	testpreempt.c:130: }
      0000D2 D2 02            [12]  520 	setb	_main_sloc0_1_0
      0000D4 10 AF 02         [24]  521 	jbc	ea,00103$
      0000D7 C2 02            [12]  522 	clr	_main_sloc0_1_0
      0000D9                        523 00103$:
                                    524 ;	testpreempt.c:127: SemaphoreCreate(empty, 3);
      0000D9 75 3D 03         [24]  525 	mov	_empty,#0x03
                                    526 ;	testpreempt.c:128: SemaphoreCreate(full, 0);
      0000DC 75 3C 00         [24]  527 	mov	_full,#0x00
                                    528 ;	testpreempt.c:129: SemaphoreCreate(mutex, 1);
      0000DF 75 3E 01         [24]  529 	mov	_mutex,#0x01
      0000E2 A2 02            [12]  530 	mov	c,_main_sloc0_1_0
      0000E4 92 AF            [24]  531 	mov	ea,c
                                    532 ;	testpreempt.c:137: ThreadCreate(Producer);
      0000E6 90 00 1D         [24]  533 	mov	dptr,#_Producer
      0000E9 12 01 1D         [24]  534 	lcall	_ThreadCreate
                                    535 ;	testpreempt.c:138: Consumer();
                                    536 ;	testpreempt.c:139: }
      0000EC 02 00 7F         [24]  537 	ljmp	_Consumer
                                    538 ;------------------------------------------------------------
                                    539 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    540 ;------------------------------------------------------------
                                    541 ;	testpreempt.c:141: void _sdcc_gsinit_startup(void)
                                    542 ;	-----------------------------------------
                                    543 ;	 function _sdcc_gsinit_startup
                                    544 ;	-----------------------------------------
      0000EF                        545 __sdcc_gsinit_startup:
                                    546 ;	testpreempt.c:145: __endasm;
      0000EF 02 00 FA         [24]  547 	LJMP	_Bootstrap
                                    548 ;	testpreempt.c:146: }
      0000F2 22               [24]  549 	ret
                                    550 ;------------------------------------------------------------
                                    551 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    552 ;------------------------------------------------------------
                                    553 ;	testpreempt.c:148: void _mcs51_genRAMCLEAR(void) {
                                    554 ;	-----------------------------------------
                                    555 ;	 function _mcs51_genRAMCLEAR
                                    556 ;	-----------------------------------------
      0000F3                        557 __mcs51_genRAMCLEAR:
                                    558 ;	testpreempt.c:150: }
      0000F3 22               [24]  559 	ret
                                    560 ;------------------------------------------------------------
                                    561 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    562 ;------------------------------------------------------------
                                    563 ;	testpreempt.c:151: void _mcs51_genXINIT(void) {}
                                    564 ;	-----------------------------------------
                                    565 ;	 function _mcs51_genXINIT
                                    566 ;	-----------------------------------------
      0000F4                        567 __mcs51_genXINIT:
      0000F4 22               [24]  568 	ret
                                    569 ;------------------------------------------------------------
                                    570 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    571 ;------------------------------------------------------------
                                    572 ;	testpreempt.c:152: void _mcs51_genXRAMCLEAR(void) {}
                                    573 ;	-----------------------------------------
                                    574 ;	 function _mcs51_genXRAMCLEAR
                                    575 ;	-----------------------------------------
      0000F5                        576 __mcs51_genXRAMCLEAR:
      0000F5 22               [24]  577 	ret
                                    578 ;------------------------------------------------------------
                                    579 ;Allocation info for local variables in function 'timer0_ISR'
                                    580 ;------------------------------------------------------------
                                    581 ;	testpreempt.c:154: void timer0_ISR(void) __interrupt(1) {
                                    582 ;	-----------------------------------------
                                    583 ;	 function timer0_ISR
                                    584 ;	-----------------------------------------
      0000F6                        585 _timer0_ISR:
                                    586 ;	testpreempt.c:157: __endasm;
      0000F6 02 02 1E         [24]  587 	LJMP	_myTimer0Handler
                                    588 ;	testpreempt.c:158: }
      0000F9 32               [24]  589 	reti
                                    590 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    591 ;	eliminated unneeded push/pop not_psw
                                    592 ;	eliminated unneeded push/pop dpl
                                    593 ;	eliminated unneeded push/pop dph
                                    594 ;	eliminated unneeded push/pop b
                                    595 ;	eliminated unneeded push/pop acc
                                    596 	.area CSEG    (CODE)
                                    597 	.area CONST   (CODE)
                                    598 	.area XINIT   (CODE)
                                    599 	.area CABS    (ABS,CODE)
