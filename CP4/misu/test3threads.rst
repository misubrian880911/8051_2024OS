                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
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
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _tail
                                    118 	.globl _head
                                    119 	.globl _turn
                                    120 	.globl _mutex
                                    121 	.globl _empty
                                    122 	.globl _full
                                    123 	.globl _item2
                                    124 	.globl _item1
                                    125 	.globl _buff
                                    126 ;--------------------------------------------------------
                                    127 ; special function registers
                                    128 ;--------------------------------------------------------
                                    129 	.area RSEG    (ABS,DATA)
      000000                        130 	.org 0x0000
                           000080   131 _P0	=	0x0080
                           000081   132 _SP	=	0x0081
                           000082   133 _DPL	=	0x0082
                           000083   134 _DPH	=	0x0083
                           000087   135 _PCON	=	0x0087
                           000088   136 _TCON	=	0x0088
                           000089   137 _TMOD	=	0x0089
                           00008A   138 _TL0	=	0x008a
                           00008B   139 _TL1	=	0x008b
                           00008C   140 _TH0	=	0x008c
                           00008D   141 _TH1	=	0x008d
                           000090   142 _P1	=	0x0090
                           000098   143 _SCON	=	0x0098
                           000099   144 _SBUF	=	0x0099
                           0000A0   145 _P2	=	0x00a0
                           0000A8   146 _IE	=	0x00a8
                           0000B0   147 _P3	=	0x00b0
                           0000B8   148 _IP	=	0x00b8
                           0000D0   149 _PSW	=	0x00d0
                           0000E0   150 _ACC	=	0x00e0
                           0000F0   151 _B	=	0x00f0
                                    152 ;--------------------------------------------------------
                                    153 ; special function bits
                                    154 ;--------------------------------------------------------
                                    155 	.area RSEG    (ABS,DATA)
      000000                        156 	.org 0x0000
                           000080   157 _P0_0	=	0x0080
                           000081   158 _P0_1	=	0x0081
                           000082   159 _P0_2	=	0x0082
                           000083   160 _P0_3	=	0x0083
                           000084   161 _P0_4	=	0x0084
                           000085   162 _P0_5	=	0x0085
                           000086   163 _P0_6	=	0x0086
                           000087   164 _P0_7	=	0x0087
                           000088   165 _IT0	=	0x0088
                           000089   166 _IE0	=	0x0089
                           00008A   167 _IT1	=	0x008a
                           00008B   168 _IE1	=	0x008b
                           00008C   169 _TR0	=	0x008c
                           00008D   170 _TF0	=	0x008d
                           00008E   171 _TR1	=	0x008e
                           00008F   172 _TF1	=	0x008f
                           000090   173 _P1_0	=	0x0090
                           000091   174 _P1_1	=	0x0091
                           000092   175 _P1_2	=	0x0092
                           000093   176 _P1_3	=	0x0093
                           000094   177 _P1_4	=	0x0094
                           000095   178 _P1_5	=	0x0095
                           000096   179 _P1_6	=	0x0096
                           000097   180 _P1_7	=	0x0097
                           000098   181 _RI	=	0x0098
                           000099   182 _TI	=	0x0099
                           00009A   183 _RB8	=	0x009a
                           00009B   184 _TB8	=	0x009b
                           00009C   185 _REN	=	0x009c
                           00009D   186 _SM2	=	0x009d
                           00009E   187 _SM1	=	0x009e
                           00009F   188 _SM0	=	0x009f
                           0000A0   189 _P2_0	=	0x00a0
                           0000A1   190 _P2_1	=	0x00a1
                           0000A2   191 _P2_2	=	0x00a2
                           0000A3   192 _P2_3	=	0x00a3
                           0000A4   193 _P2_4	=	0x00a4
                           0000A5   194 _P2_5	=	0x00a5
                           0000A6   195 _P2_6	=	0x00a6
                           0000A7   196 _P2_7	=	0x00a7
                           0000A8   197 _EX0	=	0x00a8
                           0000A9   198 _ET0	=	0x00a9
                           0000AA   199 _EX1	=	0x00aa
                           0000AB   200 _ET1	=	0x00ab
                           0000AC   201 _ES	=	0x00ac
                           0000AF   202 _EA	=	0x00af
                           0000B0   203 _P3_0	=	0x00b0
                           0000B1   204 _P3_1	=	0x00b1
                           0000B2   205 _P3_2	=	0x00b2
                           0000B3   206 _P3_3	=	0x00b3
                           0000B4   207 _P3_4	=	0x00b4
                           0000B5   208 _P3_5	=	0x00b5
                           0000B6   209 _P3_6	=	0x00b6
                           0000B7   210 _P3_7	=	0x00b7
                           0000B0   211 _RXD	=	0x00b0
                           0000B1   212 _TXD	=	0x00b1
                           0000B2   213 _INT0	=	0x00b2
                           0000B3   214 _INT1	=	0x00b3
                           0000B4   215 _T0	=	0x00b4
                           0000B5   216 _T1	=	0x00b5
                           0000B6   217 _WR	=	0x00b6
                           0000B7   218 _RD	=	0x00b7
                           0000B8   219 _PX0	=	0x00b8
                           0000B9   220 _PT0	=	0x00b9
                           0000BA   221 _PX1	=	0x00ba
                           0000BB   222 _PT1	=	0x00bb
                           0000BC   223 _PS	=	0x00bc
                           0000D0   224 _P	=	0x00d0
                           0000D1   225 _F1	=	0x00d1
                           0000D2   226 _OV	=	0x00d2
                           0000D3   227 _RS0	=	0x00d3
                           0000D4   228 _RS1	=	0x00d4
                           0000D5   229 _F0	=	0x00d5
                           0000D6   230 _AC	=	0x00d6
                           0000D7   231 _CY	=	0x00d7
                                    232 ;--------------------------------------------------------
                                    233 ; overlayable register banks
                                    234 ;--------------------------------------------------------
                                    235 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        236 	.ds 8
                                    237 ;--------------------------------------------------------
                                    238 ; internal ram data
                                    239 ;--------------------------------------------------------
                                    240 	.area DSEG    (DATA)
                           000034   241 _buff	=	0x0034
                           00003B   242 _item1	=	0x003b
                           00003F   243 _item2	=	0x003f
                           00003C   244 _full	=	0x003c
                           00003D   245 _empty	=	0x003d
                           00003E   246 _mutex	=	0x003e
                           000077   247 _turn	=	0x0077
                                    248 ;--------------------------------------------------------
                                    249 ; overlayable items in internal ram
                                    250 ;--------------------------------------------------------
                                    251 ;--------------------------------------------------------
                                    252 ; Stack segment in internal ram
                                    253 ;--------------------------------------------------------
                                    254 	.area	SSEG
      000077                        255 __start__stack:
      000077                        256 	.ds	1
                                    257 
                                    258 ;--------------------------------------------------------
                                    259 ; indirectly addressable internal ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area ISEG    (DATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute internal ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area IABS    (ABS,DATA)
      000075                        266 	.org 0x0075
      000075                        267 _head::
      000075                        268 	.ds 1
      000076                        269 	.org 0x0076
      000076                        270 _tail::
      000076                        271 	.ds 1
                                    272 	.area IABS    (ABS,DATA)
                                    273 ;--------------------------------------------------------
                                    274 ; bit data
                                    275 ;--------------------------------------------------------
                                    276 	.area BSEG    (BIT)
      000000                        277 _Producer1_sloc0_1_0:
      000000                        278 	.ds 1
      000001                        279 _Producer2_sloc0_1_0:
      000001                        280 	.ds 1
      000002                        281 _Consumer_sloc0_1_0:
      000002                        282 	.ds 1
      000003                        283 _main_sloc0_1_0:
      000003                        284 	.ds 1
                                    285 ;--------------------------------------------------------
                                    286 ; paged external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area PSEG    (PAG,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; external ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XSEG    (XDATA)
                                    293 ;--------------------------------------------------------
                                    294 ; absolute external ram data
                                    295 ;--------------------------------------------------------
                                    296 	.area XABS    (ABS,XDATA)
                                    297 ;--------------------------------------------------------
                                    298 ; external initialized ram data
                                    299 ;--------------------------------------------------------
                                    300 	.area XISEG   (XDATA)
                                    301 	.area HOME    (CODE)
                                    302 	.area GSINIT0 (CODE)
                                    303 	.area GSINIT1 (CODE)
                                    304 	.area GSINIT2 (CODE)
                                    305 	.area GSINIT3 (CODE)
                                    306 	.area GSINIT4 (CODE)
                                    307 	.area GSINIT5 (CODE)
                                    308 	.area GSINIT  (CODE)
                                    309 	.area GSFINAL (CODE)
                                    310 	.area CSEG    (CODE)
                                    311 ;--------------------------------------------------------
                                    312 ; interrupt vector
                                    313 ;--------------------------------------------------------
                                    314 	.area HOME    (CODE)
      000000                        315 __interrupt_vect:
      000000 02 01 80         [24]  316 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  317 	reti
      000004                        318 	.ds	7
      00000B 02 01 87         [24]  319 	ljmp	_timer0_ISR
                                    320 ;--------------------------------------------------------
                                    321 ; global & static initialisations
                                    322 ;--------------------------------------------------------
                                    323 	.area HOME    (CODE)
                                    324 	.area GSINIT  (CODE)
                                    325 	.area GSFINAL (CODE)
                                    326 	.area GSINIT  (CODE)
                                    327 	.globl __sdcc_gsinit_startup
                                    328 	.globl __sdcc_program_startup
                                    329 	.globl __start__stack
                                    330 	.globl __mcs51_genXINIT
                                    331 	.globl __mcs51_genXRAMCLEAR
                                    332 	.globl __mcs51_genRAMCLEAR
                                    333 ;	test3threads.c:24: __data __at (0x75) char head = 0;
      000011 75 75 00         [24]  334 	mov	_head,#0x00
                                    335 ;	test3threads.c:25: __data __at (0x76) char tail = 0;
      000014 75 76 00         [24]  336 	mov	_tail,#0x00
                                    337 	.area GSFINAL (CODE)
      00001A 02 00 0E         [24]  338 	ljmp	__sdcc_program_startup
                                    339 ;--------------------------------------------------------
                                    340 ; Home
                                    341 ;--------------------------------------------------------
                                    342 	.area HOME    (CODE)
                                    343 	.area HOME    (CODE)
      00000E                        344 __sdcc_program_startup:
      00000E 02 01 5A         [24]  345 	ljmp	_main
                                    346 ;	return from main will return to caller
                                    347 ;--------------------------------------------------------
                                    348 ; code
                                    349 ;--------------------------------------------------------
                                    350 	.area CSEG    (CODE)
                                    351 ;------------------------------------------------------------
                                    352 ;Allocation info for local variables in function 'Producer1'
                                    353 ;------------------------------------------------------------
                                    354 ;	test3threads.c:38: void Producer1(void)
                                    355 ;	-----------------------------------------
                                    356 ;	 function Producer1
                                    357 ;	-----------------------------------------
      00001D                        358 _Producer1:
                           000007   359 	ar7 = 0x07
                           000006   360 	ar6 = 0x06
                           000005   361 	ar5 = 0x05
                           000004   362 	ar4 = 0x04
                           000003   363 	ar3 = 0x03
                           000002   364 	ar2 = 0x02
                           000001   365 	ar1 = 0x01
                           000000   366 	ar0 = 0x00
                                    367 ;	test3threads.c:45: item1 = 'A';
      00001D 75 3B 41         [24]  368 	mov	_item1,#0x41
                                    369 ;	test3threads.c:48: while(turn != 1){}
      000020                        370 00101$:
      000020 74 01            [12]  371 	mov	a,#0x01
      000022 B5 77 FB         [24]  372 	cjne	a,_turn,00101$
                                    373 ;	test3threads.c:52: SemaphoreWait(empty);
      000025                        374 		0$:
                                    375 ;; top of while-loop 
      000025 E5 3D            [12]  376 	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
      000027 20 E7 FB         [24]  377 	JB ACC.7, 0$ ;; conditionally jump(s) back to 0$ if ACC <= 0 
      00002A 60 F9            [24]  378 	JZ 0$ 
                                    379 ;; fall-through to drop out of while-loop 
      00002C 15 3D            [12]  380 	dec _empty 
                                    381 ;	test3threads.c:53: SemaphoreWait(mutex);
      00002E                        382 		1$:
                                    383 ;; top of while-loop 
      00002E E5 3E            [12]  384 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      000030 20 E7 FB         [24]  385 	JB ACC.7, 1$ ;; conditionally jump(s) back to 1$ if ACC <= 0 
      000033 60 F9            [24]  386 	JZ 1$ 
                                    387 ;; fall-through to drop out of while-loop 
      000035 15 3E            [12]  388 	dec _mutex 
                                    389 ;	test3threads.c:57: }
      000037 D2 00            [12]  390 	setb	_Producer1_sloc0_1_0
      000039 10 AF 02         [24]  391 	jbc	ea,00125$
      00003C C2 00            [12]  392 	clr	_Producer1_sloc0_1_0
      00003E                        393 00125$:
                                    394 ;	test3threads.c:55: buff[tail] = item1;
      00003E E5 76            [12]  395 	mov	a,_tail
      000040 24 34            [12]  396 	add	a,#_buff
      000042 F8               [12]  397 	mov	r0,a
      000043 A6 3B            [24]  398 	mov	@r0,_item1
                                    399 ;	test3threads.c:56: tail = (tail + 1) % 3;
      000045 AE 76            [24]  400 	mov	r6,_tail
      000047 7F 00            [12]  401 	mov	r7,#0x00
      000049 8E 82            [24]  402 	mov	dpl,r6
      00004B 8F 83            [24]  403 	mov	dph,r7
      00004D A3               [24]  404 	inc	dptr
      00004E 75 08 03         [24]  405 	mov	__modsint_PARM_2,#0x03
                                    406 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000051 8F 09            [24]  407 	mov	(__modsint_PARM_2 + 1),r7
      000053 12 03 96         [24]  408 	lcall	__modsint
      000056 AE 82            [24]  409 	mov	r6,dpl
      000058 AF 83            [24]  410 	mov	r7,dph
      00005A 8E 76            [24]  411 	mov	_tail,r6
      00005C A2 00            [12]  412 	mov	c,_Producer1_sloc0_1_0
      00005E 92 AF            [24]  413 	mov	ea,c
                                    414 ;	test3threads.c:58: SemaphoreSignal(mutex);
      000060 05 3E            [12]  415 	INC _mutex 
                                    416 ;	test3threads.c:59: SemaphoreSignal(full);
      000062 05 3C            [12]  417 	INC _full 
                                    418 ;	test3threads.c:60: item1 = (item1 != 'Z')? (item1 + 1) : 'A';
      000064 74 5A            [12]  419 	mov	a,#0x5a
      000066 B5 3B 03         [24]  420 	cjne	a,_item1,00126$
      000069 D3               [12]  421 	setb	c
      00006A 80 01            [24]  422 	sjmp	00127$
      00006C                        423 00126$:
      00006C C3               [12]  424 	clr	c
      00006D                        425 00127$:
      00006D 92 00            [24]  426 	mov	_Producer1_sloc0_1_0,c
      00006F 40 0B            [24]  427 	jc	00109$
      000071 AF 3B            [24]  428 	mov	r7,_item1
      000073 0F               [12]  429 	inc	r7
      000074 EF               [12]  430 	mov	a,r7
      000075 FE               [12]  431 	mov	r6,a
      000076 33               [12]  432 	rlc	a
      000077 95 E0            [12]  433 	subb	a,acc
      000079 FF               [12]  434 	mov	r7,a
      00007A 80 04            [24]  435 	sjmp	00110$
      00007C                        436 00109$:
      00007C 7E 41            [12]  437 	mov	r6,#0x41
      00007E 7F 00            [12]  438 	mov	r7,#0x00
      000080                        439 00110$:
      000080 8E 3B            [24]  440 	mov	_item1,r6
                                    441 ;	test3threads.c:64: }
      000082 D2 00            [12]  442 	setb	_Producer1_sloc0_1_0
      000084 10 AF 02         [24]  443 	jbc	ea,00129$
      000087 C2 00            [12]  444 	clr	_Producer1_sloc0_1_0
      000089                        445 00129$:
                                    446 ;	test3threads.c:63: turn = 2;
      000089 75 77 02         [24]  447 	mov	_turn,#0x02
      00008C A2 00            [12]  448 	mov	c,_Producer1_sloc0_1_0
      00008E 92 AF            [24]  449 	mov	ea,c
                                    450 ;	test3threads.c:69: }
      000090 80 8E            [24]  451 	sjmp	00101$
                                    452 ;------------------------------------------------------------
                                    453 ;Allocation info for local variables in function 'Producer2'
                                    454 ;------------------------------------------------------------
                                    455 ;	test3threads.c:71: void Producer2(void)
                                    456 ;	-----------------------------------------
                                    457 ;	 function Producer2
                                    458 ;	-----------------------------------------
      000092                        459 _Producer2:
                                    460 ;	test3threads.c:79: item2 = '0';
      000092 75 3F 30         [24]  461 	mov	_item2,#0x30
                                    462 ;	test3threads.c:82: while(turn != 2){}
      000095                        463 00101$:
      000095 74 02            [12]  464 	mov	a,#0x02
      000097 B5 77 FB         [24]  465 	cjne	a,_turn,00101$
                                    466 ;	test3threads.c:86: SemaphoreWait(empty);
      00009A                        467 		2$:
                                    468 ;; top of while-loop 
      00009A E5 3D            [12]  469 	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
      00009C 20 E7 FB         [24]  470 	JB ACC.7, 2$ ;; conditionally jump(s) back to 2$ if ACC <= 0 
      00009F 60 F9            [24]  471 	JZ 2$ 
                                    472 ;; fall-through to drop out of while-loop 
      0000A1 15 3D            [12]  473 	dec _empty 
                                    474 ;	test3threads.c:87: SemaphoreWait(mutex);
      0000A3                        475 		3$:
                                    476 ;; top of while-loop 
      0000A3 E5 3E            [12]  477 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      0000A5 20 E7 FB         [24]  478 	JB ACC.7, 3$ ;; conditionally jump(s) back to 3$ if ACC <= 0 
      0000A8 60 F9            [24]  479 	JZ 3$ 
                                    480 ;; fall-through to drop out of while-loop 
      0000AA 15 3E            [12]  481 	dec _mutex 
                                    482 ;	test3threads.c:91: }
      0000AC D2 01            [12]  483 	setb	_Producer2_sloc0_1_0
      0000AE 10 AF 02         [24]  484 	jbc	ea,00125$
      0000B1 C2 01            [12]  485 	clr	_Producer2_sloc0_1_0
      0000B3                        486 00125$:
                                    487 ;	test3threads.c:89: buff[tail] = item2;
      0000B3 E5 76            [12]  488 	mov	a,_tail
      0000B5 24 34            [12]  489 	add	a,#_buff
      0000B7 F8               [12]  490 	mov	r0,a
      0000B8 A6 3F            [24]  491 	mov	@r0,_item2
                                    492 ;	test3threads.c:90: tail = (tail + 1) % 3;
      0000BA AE 76            [24]  493 	mov	r6,_tail
      0000BC 7F 00            [12]  494 	mov	r7,#0x00
      0000BE 8E 82            [24]  495 	mov	dpl,r6
      0000C0 8F 83            [24]  496 	mov	dph,r7
      0000C2 A3               [24]  497 	inc	dptr
      0000C3 75 08 03         [24]  498 	mov	__modsint_PARM_2,#0x03
                                    499 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      0000C6 8F 09            [24]  500 	mov	(__modsint_PARM_2 + 1),r7
      0000C8 12 03 96         [24]  501 	lcall	__modsint
      0000CB AE 82            [24]  502 	mov	r6,dpl
      0000CD AF 83            [24]  503 	mov	r7,dph
      0000CF 8E 76            [24]  504 	mov	_tail,r6
      0000D1 A2 01            [12]  505 	mov	c,_Producer2_sloc0_1_0
      0000D3 92 AF            [24]  506 	mov	ea,c
                                    507 ;	test3threads.c:92: SemaphoreSignal(mutex);
      0000D5 05 3E            [12]  508 	INC _mutex 
                                    509 ;	test3threads.c:93: SemaphoreSignal(full);
      0000D7 05 3C            [12]  510 	INC _full 
                                    511 ;	test3threads.c:94: item2 = (item2 != '9')? (item2 + 1) : '0';
      0000D9 74 39            [12]  512 	mov	a,#0x39
      0000DB B5 3F 03         [24]  513 	cjne	a,_item2,00126$
      0000DE D3               [12]  514 	setb	c
      0000DF 80 01            [24]  515 	sjmp	00127$
      0000E1                        516 00126$:
      0000E1 C3               [12]  517 	clr	c
      0000E2                        518 00127$:
      0000E2 92 01            [24]  519 	mov	_Producer2_sloc0_1_0,c
      0000E4 40 0B            [24]  520 	jc	00109$
      0000E6 AF 3F            [24]  521 	mov	r7,_item2
      0000E8 0F               [12]  522 	inc	r7
      0000E9 EF               [12]  523 	mov	a,r7
      0000EA FE               [12]  524 	mov	r6,a
      0000EB 33               [12]  525 	rlc	a
      0000EC 95 E0            [12]  526 	subb	a,acc
      0000EE FF               [12]  527 	mov	r7,a
      0000EF 80 04            [24]  528 	sjmp	00110$
      0000F1                        529 00109$:
      0000F1 7E 30            [12]  530 	mov	r6,#0x30
      0000F3 7F 00            [12]  531 	mov	r7,#0x00
      0000F5                        532 00110$:
      0000F5 8E 3F            [24]  533 	mov	_item2,r6
                                    534 ;	test3threads.c:98: }
      0000F7 D2 01            [12]  535 	setb	_Producer2_sloc0_1_0
      0000F9 10 AF 02         [24]  536 	jbc	ea,00129$
      0000FC C2 01            [12]  537 	clr	_Producer2_sloc0_1_0
      0000FE                        538 00129$:
                                    539 ;	test3threads.c:97: turn = 1;
      0000FE 75 77 01         [24]  540 	mov	_turn,#0x01
      000101 A2 01            [12]  541 	mov	c,_Producer2_sloc0_1_0
      000103 92 AF            [24]  542 	mov	ea,c
                                    543 ;	test3threads.c:102: }
      000105 80 8E            [24]  544 	sjmp	00101$
                                    545 ;------------------------------------------------------------
                                    546 ;Allocation info for local variables in function 'Consumer'
                                    547 ;------------------------------------------------------------
                                    548 ;	test3threads.c:109: void Consumer(void)
                                    549 ;	-----------------------------------------
                                    550 ;	 function Consumer
                                    551 ;	-----------------------------------------
      000107                        552 _Consumer:
                                    553 ;	test3threads.c:115: EA = 0;
                                    554 ;	assignBit
      000107 C2 AF            [12]  555 	clr	_EA
                                    556 ;	test3threads.c:116: TMOD |= 0x20;
      000109 43 89 20         [24]  557 	orl	_TMOD,#0x20
                                    558 ;	test3threads.c:117: TH1 = (char)-6;
      00010C 75 8D FA         [24]  559 	mov	_TH1,#0xfa
                                    560 ;	test3threads.c:118: SCON = 0x50;
      00010F 75 98 50         [24]  561 	mov	_SCON,#0x50
                                    562 ;	test3threads.c:119: TR1 = 1;
                                    563 ;	assignBit
      000112 D2 8E            [12]  564 	setb	_TR1
                                    565 ;	test3threads.c:120: EA = 1;
                                    566 ;	assignBit
      000114 D2 AF            [12]  567 	setb	_EA
                                    568 ;	test3threads.c:123: while (1)
      000116                        569 00105$:
                                    570 ;	test3threads.c:137: SemaphoreWait(full);
      000116                        571 		4$:
                                    572 ;; top of while-loop 
      000116 E5 3C            [12]  573 	MOV A, _full ;; read value of _S into ACC (where full is semaphore) 
      000118 20 E7 FB         [24]  574 	JB ACC.7, 4$ ;; conditionally jump(s) back to 4$ if ACC <= 0 
      00011B 60 F9            [24]  575 	JZ 4$ 
                                    576 ;; fall-through to drop out of while-loop 
      00011D 15 3C            [12]  577 	dec _full 
                                    578 ;	test3threads.c:138: SemaphoreWait(mutex);
      00011F                        579 		5$:
                                    580 ;; top of while-loop 
      00011F E5 3E            [12]  581 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      000121 20 E7 FB         [24]  582 	JB ACC.7, 5$ ;; conditionally jump(s) back to 5$ if ACC <= 0 
      000124 60 F9            [24]  583 	JZ 5$ 
                                    584 ;; fall-through to drop out of while-loop 
      000126 15 3E            [12]  585 	dec _mutex 
                                    586 ;	test3threads.c:143: }
      000128 D2 02            [12]  587 	setb	_Consumer_sloc0_1_0
      00012A 10 AF 02         [24]  588 	jbc	ea,00121$
      00012D C2 02            [12]  589 	clr	_Consumer_sloc0_1_0
      00012F                        590 00121$:
                                    591 ;	test3threads.c:140: SBUF = buff[head];
      00012F E5 75            [12]  592 	mov	a,_head
      000131 24 34            [12]  593 	add	a,#_buff
      000133 F9               [12]  594 	mov	r1,a
      000134 87 99            [24]  595 	mov	_SBUF,@r1
                                    596 ;	test3threads.c:141: head = (head + 1) % 3;
      000136 AE 75            [24]  597 	mov	r6,_head
      000138 7F 00            [12]  598 	mov	r7,#0x00
      00013A 8E 82            [24]  599 	mov	dpl,r6
      00013C 8F 83            [24]  600 	mov	dph,r7
      00013E A3               [24]  601 	inc	dptr
      00013F 75 08 03         [24]  602 	mov	__modsint_PARM_2,#0x03
                                    603 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000142 8F 09            [24]  604 	mov	(__modsint_PARM_2 + 1),r7
      000144 12 03 96         [24]  605 	lcall	__modsint
      000147 AE 82            [24]  606 	mov	r6,dpl
      000149 AF 83            [24]  607 	mov	r7,dph
      00014B 8E 75            [24]  608 	mov	_head,r6
      00014D A2 02            [12]  609 	mov	c,_Consumer_sloc0_1_0
      00014F 92 AF            [24]  610 	mov	ea,c
                                    611 ;	test3threads.c:144: SemaphoreSignal(mutex);
      000151 05 3E            [12]  612 	INC _mutex 
                                    613 ;	test3threads.c:145: SemaphoreSignal(empty);
      000153 05 3D            [12]  614 	INC _empty 
                                    615 ;	test3threads.c:147: while (!TI){
      000155                        616 00101$:
                                    617 ;	test3threads.c:150: TI = 0;
                                    618 ;	assignBit
      000155 10 99 BE         [24]  619 	jbc	_TI,00105$
                                    620 ;	test3threads.c:152: }
      000158 80 FB            [24]  621 	sjmp	00101$
                                    622 ;------------------------------------------------------------
                                    623 ;Allocation info for local variables in function 'main'
                                    624 ;------------------------------------------------------------
                                    625 ;	test3threads.c:159: void main(void)
                                    626 ;	-----------------------------------------
                                    627 ;	 function main
                                    628 ;	-----------------------------------------
      00015A                        629 _main:
                                    630 ;	test3threads.c:165: turn = 1;
      00015A 75 77 01         [24]  631 	mov	_turn,#0x01
                                    632 ;	test3threads.c:170: }
      00015D D2 03            [12]  633 	setb	_main_sloc0_1_0
      00015F 10 AF 02         [24]  634 	jbc	ea,00103$
      000162 C2 03            [12]  635 	clr	_main_sloc0_1_0
      000164                        636 00103$:
                                    637 ;	test3threads.c:167: SemaphoreCreate(empty, 3);
      000164 75 3D 03         [24]  638 	mov	_empty,#0x03
                                    639 ;	test3threads.c:168: SemaphoreCreate(full, 0);
      000167 75 3C 00         [24]  640 	mov	_full,#0x00
                                    641 ;	test3threads.c:169: SemaphoreCreate(mutex, 1);
      00016A 75 3E 01         [24]  642 	mov	_mutex,#0x01
      00016D A2 03            [12]  643 	mov	c,_main_sloc0_1_0
      00016F 92 AF            [24]  644 	mov	ea,c
                                    645 ;	test3threads.c:177: ThreadCreate(Producer1);
      000171 90 00 1D         [24]  646 	mov	dptr,#_Producer1
      000174 12 01 AE         [24]  647 	lcall	_ThreadCreate
                                    648 ;	test3threads.c:178: ThreadCreate(Producer2);
      000177 90 00 92         [24]  649 	mov	dptr,#_Producer2
      00017A 12 01 AE         [24]  650 	lcall	_ThreadCreate
                                    651 ;	test3threads.c:179: Consumer();
                                    652 ;	test3threads.c:180: }
      00017D 02 01 07         [24]  653 	ljmp	_Consumer
                                    654 ;------------------------------------------------------------
                                    655 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    656 ;------------------------------------------------------------
                                    657 ;	test3threads.c:182: void _sdcc_gsinit_startup(void)
                                    658 ;	-----------------------------------------
                                    659 ;	 function _sdcc_gsinit_startup
                                    660 ;	-----------------------------------------
      000180                        661 __sdcc_gsinit_startup:
                                    662 ;	test3threads.c:186: __endasm;
      000180 02 01 8B         [24]  663 	LJMP	_Bootstrap
                                    664 ;	test3threads.c:187: }
      000183 22               [24]  665 	ret
                                    666 ;------------------------------------------------------------
                                    667 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    668 ;------------------------------------------------------------
                                    669 ;	test3threads.c:189: void _mcs51_genRAMCLEAR(void) {
                                    670 ;	-----------------------------------------
                                    671 ;	 function _mcs51_genRAMCLEAR
                                    672 ;	-----------------------------------------
      000184                        673 __mcs51_genRAMCLEAR:
                                    674 ;	test3threads.c:191: }
      000184 22               [24]  675 	ret
                                    676 ;------------------------------------------------------------
                                    677 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    678 ;------------------------------------------------------------
                                    679 ;	test3threads.c:192: void _mcs51_genXINIT(void) {}
                                    680 ;	-----------------------------------------
                                    681 ;	 function _mcs51_genXINIT
                                    682 ;	-----------------------------------------
      000185                        683 __mcs51_genXINIT:
      000185 22               [24]  684 	ret
                                    685 ;------------------------------------------------------------
                                    686 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    687 ;------------------------------------------------------------
                                    688 ;	test3threads.c:193: void _mcs51_genXRAMCLEAR(void) {}
                                    689 ;	-----------------------------------------
                                    690 ;	 function _mcs51_genXRAMCLEAR
                                    691 ;	-----------------------------------------
      000186                        692 __mcs51_genXRAMCLEAR:
      000186 22               [24]  693 	ret
                                    694 ;------------------------------------------------------------
                                    695 ;Allocation info for local variables in function 'timer0_ISR'
                                    696 ;------------------------------------------------------------
                                    697 ;	test3threads.c:195: void timer0_ISR(void) __interrupt(1) {
                                    698 ;	-----------------------------------------
                                    699 ;	 function timer0_ISR
                                    700 ;	-----------------------------------------
      000187                        701 _timer0_ISR:
                                    702 ;	test3threads.c:198: __endasm;
      000187 02 02 A9         [24]  703 	LJMP	_myTimer0Handler
                                    704 ;	test3threads.c:199: }
      00018A 32               [24]  705 	reti
                                    706 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    707 ;	eliminated unneeded push/pop not_psw
                                    708 ;	eliminated unneeded push/pop dpl
                                    709 ;	eliminated unneeded push/pop dph
                                    710 ;	eliminated unneeded push/pop b
                                    711 ;	eliminated unneeded push/pop acc
                                    712 	.area CSEG    (CODE)
                                    713 	.area CONST   (CODE)
                                    714 	.area XINIT   (CODE)
                                    715 	.area CABS    (ABS,CODE)
