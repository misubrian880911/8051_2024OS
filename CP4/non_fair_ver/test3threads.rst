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
      000000 02 01 5A         [24]  316 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  317 	reti
      000004                        318 	.ds	7
      00000B 02 01 61         [24]  319 	ljmp	_timer0_ISR
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
      00000E 02 01 34         [24]  345 	ljmp	_main
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
                                    369 ;	test3threads.c:46: while (1)
      000020                        370 00102$:
                                    371 ;	test3threads.c:52: SemaphoreWait(empty);
      000020                        372 		0$:
                                    373 ;; top of while-loop 
      000020 E5 3D            [12]  374 	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
      000022 20 E7 FB         [24]  375 	JB ACC.7, 0$ ;; conditionally jump(s) back to 0$ if ACC <= 0 
      000025 60 F9            [24]  376 	JZ 0$ 
                                    377 ;; fall-through to drop out of while-loop 
      000027 15 3D            [12]  378 	dec _empty 
                                    379 ;	test3threads.c:53: SemaphoreWait(mutex);
      000029                        380 		1$:
                                    381 ;; top of while-loop 
      000029 E5 3E            [12]  382 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      00002B 20 E7 FB         [24]  383 	JB ACC.7, 1$ ;; conditionally jump(s) back to 1$ if ACC <= 0 
      00002E 60 F9            [24]  384 	JZ 1$ 
                                    385 ;; fall-through to drop out of while-loop 
      000030 15 3E            [12]  386 	dec _mutex 
                                    387 ;	test3threads.c:57: }
      000032 D2 00            [12]  388 	setb	_Producer1_sloc0_1_0
      000034 10 AF 02         [24]  389 	jbc	ea,00116$
      000037 C2 00            [12]  390 	clr	_Producer1_sloc0_1_0
      000039                        391 00116$:
                                    392 ;	test3threads.c:55: buff[tail] = item1;
      000039 E5 76            [12]  393 	mov	a,_tail
      00003B 24 34            [12]  394 	add	a,#_buff
      00003D F8               [12]  395 	mov	r0,a
      00003E A6 3B            [24]  396 	mov	@r0,_item1
                                    397 ;	test3threads.c:56: tail = (tail + 1) % 3;
      000040 AE 76            [24]  398 	mov	r6,_tail
      000042 7F 00            [12]  399 	mov	r7,#0x00
      000044 8E 82            [24]  400 	mov	dpl,r6
      000046 8F 83            [24]  401 	mov	dph,r7
      000048 A3               [24]  402 	inc	dptr
      000049 75 08 03         [24]  403 	mov	__modsint_PARM_2,#0x03
                                    404 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      00004C 8F 09            [24]  405 	mov	(__modsint_PARM_2 + 1),r7
      00004E 12 03 70         [24]  406 	lcall	__modsint
      000051 AE 82            [24]  407 	mov	r6,dpl
      000053 AF 83            [24]  408 	mov	r7,dph
      000055 8E 76            [24]  409 	mov	_tail,r6
      000057 A2 00            [12]  410 	mov	c,_Producer1_sloc0_1_0
      000059 92 AF            [24]  411 	mov	ea,c
                                    412 ;	test3threads.c:58: SemaphoreSignal(mutex);
      00005B 05 3E            [12]  413 	INC _mutex 
                                    414 ;	test3threads.c:59: SemaphoreSignal(full);
      00005D 05 3C            [12]  415 	INC _full 
                                    416 ;	test3threads.c:60: item1 = (item1 != 'Z')? (item1 + 1) : 'A';
      00005F 74 5A            [12]  417 	mov	a,#0x5a
      000061 B5 3B 03         [24]  418 	cjne	a,_item1,00117$
      000064 D3               [12]  419 	setb	c
      000065 80 01            [24]  420 	sjmp	00118$
      000067                        421 00117$:
      000067 C3               [12]  422 	clr	c
      000068                        423 00118$:
      000068 92 00            [24]  424 	mov	_Producer1_sloc0_1_0,c
      00006A 40 0B            [24]  425 	jc	00106$
      00006C AF 3B            [24]  426 	mov	r7,_item1
      00006E 0F               [12]  427 	inc	r7
      00006F EF               [12]  428 	mov	a,r7
      000070 FE               [12]  429 	mov	r6,a
      000071 33               [12]  430 	rlc	a
      000072 95 E0            [12]  431 	subb	a,acc
      000074 FF               [12]  432 	mov	r7,a
      000075 80 04            [24]  433 	sjmp	00107$
      000077                        434 00106$:
      000077 7E 41            [12]  435 	mov	r6,#0x41
      000079 7F 00            [12]  436 	mov	r7,#0x00
      00007B                        437 00107$:
      00007B 8E 3B            [24]  438 	mov	_item1,r6
                                    439 ;	test3threads.c:67: }
      00007D 80 A1            [24]  440 	sjmp	00102$
                                    441 ;------------------------------------------------------------
                                    442 ;Allocation info for local variables in function 'Producer2'
                                    443 ;------------------------------------------------------------
                                    444 ;	test3threads.c:69: void Producer2(void)
                                    445 ;	-----------------------------------------
                                    446 ;	 function Producer2
                                    447 ;	-----------------------------------------
      00007F                        448 _Producer2:
                                    449 ;	test3threads.c:77: item2 = '0';
      00007F 75 3F 30         [24]  450 	mov	_item2,#0x30
                                    451 ;	test3threads.c:78: while (1)
      000082                        452 00102$:
                                    453 ;	test3threads.c:84: SemaphoreWait(empty);
      000082                        454 		2$:
                                    455 ;; top of while-loop 
      000082 E5 3D            [12]  456 	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
      000084 20 E7 FB         [24]  457 	JB ACC.7, 2$ ;; conditionally jump(s) back to 2$ if ACC <= 0 
      000087 60 F9            [24]  458 	JZ 2$ 
                                    459 ;; fall-through to drop out of while-loop 
      000089 15 3D            [12]  460 	dec _empty 
                                    461 ;	test3threads.c:85: SemaphoreWait(mutex);
      00008B                        462 		3$:
                                    463 ;; top of while-loop 
      00008B E5 3E            [12]  464 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      00008D 20 E7 FB         [24]  465 	JB ACC.7, 3$ ;; conditionally jump(s) back to 3$ if ACC <= 0 
      000090 60 F9            [24]  466 	JZ 3$ 
                                    467 ;; fall-through to drop out of while-loop 
      000092 15 3E            [12]  468 	dec _mutex 
                                    469 ;	test3threads.c:89: }
      000094 D2 01            [12]  470 	setb	_Producer2_sloc0_1_0
      000096 10 AF 02         [24]  471 	jbc	ea,00116$
      000099 C2 01            [12]  472 	clr	_Producer2_sloc0_1_0
      00009B                        473 00116$:
                                    474 ;	test3threads.c:87: buff[tail] = item2;
      00009B E5 76            [12]  475 	mov	a,_tail
      00009D 24 34            [12]  476 	add	a,#_buff
      00009F F8               [12]  477 	mov	r0,a
      0000A0 A6 3F            [24]  478 	mov	@r0,_item2
                                    479 ;	test3threads.c:88: tail = (tail + 1) % 3;
      0000A2 AE 76            [24]  480 	mov	r6,_tail
      0000A4 7F 00            [12]  481 	mov	r7,#0x00
      0000A6 8E 82            [24]  482 	mov	dpl,r6
      0000A8 8F 83            [24]  483 	mov	dph,r7
      0000AA A3               [24]  484 	inc	dptr
      0000AB 75 08 03         [24]  485 	mov	__modsint_PARM_2,#0x03
                                    486 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      0000AE 8F 09            [24]  487 	mov	(__modsint_PARM_2 + 1),r7
      0000B0 12 03 70         [24]  488 	lcall	__modsint
      0000B3 AE 82            [24]  489 	mov	r6,dpl
      0000B5 AF 83            [24]  490 	mov	r7,dph
      0000B7 8E 76            [24]  491 	mov	_tail,r6
      0000B9 A2 01            [12]  492 	mov	c,_Producer2_sloc0_1_0
      0000BB 92 AF            [24]  493 	mov	ea,c
                                    494 ;	test3threads.c:90: SemaphoreSignal(mutex);
      0000BD 05 3E            [12]  495 	INC _mutex 
                                    496 ;	test3threads.c:91: SemaphoreSignal(full);
      0000BF 05 3C            [12]  497 	INC _full 
                                    498 ;	test3threads.c:92: item2 = (item2 != '9')? (item2 + 1) : '0';
      0000C1 74 39            [12]  499 	mov	a,#0x39
      0000C3 B5 3F 03         [24]  500 	cjne	a,_item2,00117$
      0000C6 D3               [12]  501 	setb	c
      0000C7 80 01            [24]  502 	sjmp	00118$
      0000C9                        503 00117$:
      0000C9 C3               [12]  504 	clr	c
      0000CA                        505 00118$:
      0000CA 92 01            [24]  506 	mov	_Producer2_sloc0_1_0,c
      0000CC 40 0B            [24]  507 	jc	00106$
      0000CE AF 3F            [24]  508 	mov	r7,_item2
      0000D0 0F               [12]  509 	inc	r7
      0000D1 EF               [12]  510 	mov	a,r7
      0000D2 FE               [12]  511 	mov	r6,a
      0000D3 33               [12]  512 	rlc	a
      0000D4 95 E0            [12]  513 	subb	a,acc
      0000D6 FF               [12]  514 	mov	r7,a
      0000D7 80 04            [24]  515 	sjmp	00107$
      0000D9                        516 00106$:
      0000D9 7E 30            [12]  517 	mov	r6,#0x30
      0000DB 7F 00            [12]  518 	mov	r7,#0x00
      0000DD                        519 00107$:
      0000DD 8E 3F            [24]  520 	mov	_item2,r6
                                    521 ;	test3threads.c:98: }
      0000DF 80 A1            [24]  522 	sjmp	00102$
                                    523 ;------------------------------------------------------------
                                    524 ;Allocation info for local variables in function 'Consumer'
                                    525 ;------------------------------------------------------------
                                    526 ;	test3threads.c:105: void Consumer(void)
                                    527 ;	-----------------------------------------
                                    528 ;	 function Consumer
                                    529 ;	-----------------------------------------
      0000E1                        530 _Consumer:
                                    531 ;	test3threads.c:111: EA = 0;
                                    532 ;	assignBit
      0000E1 C2 AF            [12]  533 	clr	_EA
                                    534 ;	test3threads.c:112: TMOD |= 0x20;
      0000E3 43 89 20         [24]  535 	orl	_TMOD,#0x20
                                    536 ;	test3threads.c:113: TH1 = (char)-6;
      0000E6 75 8D FA         [24]  537 	mov	_TH1,#0xfa
                                    538 ;	test3threads.c:114: SCON = 0x50;
      0000E9 75 98 50         [24]  539 	mov	_SCON,#0x50
                                    540 ;	test3threads.c:115: TR1 = 1;
                                    541 ;	assignBit
      0000EC D2 8E            [12]  542 	setb	_TR1
                                    543 ;	test3threads.c:116: EA = 1;
                                    544 ;	assignBit
      0000EE D2 AF            [12]  545 	setb	_EA
                                    546 ;	test3threads.c:119: while (1)
      0000F0                        547 00105$:
                                    548 ;	test3threads.c:133: SemaphoreWait(full);
      0000F0                        549 		4$:
                                    550 ;; top of while-loop 
      0000F0 E5 3C            [12]  551 	MOV A, _full ;; read value of _S into ACC (where full is semaphore) 
      0000F2 20 E7 FB         [24]  552 	JB ACC.7, 4$ ;; conditionally jump(s) back to 4$ if ACC <= 0 
      0000F5 60 F9            [24]  553 	JZ 4$ 
                                    554 ;; fall-through to drop out of while-loop 
      0000F7 15 3C            [12]  555 	dec _full 
                                    556 ;	test3threads.c:134: SemaphoreWait(mutex);
      0000F9                        557 		5$:
                                    558 ;; top of while-loop 
      0000F9 E5 3E            [12]  559 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      0000FB 20 E7 FB         [24]  560 	JB ACC.7, 5$ ;; conditionally jump(s) back to 5$ if ACC <= 0 
      0000FE 60 F9            [24]  561 	JZ 5$ 
                                    562 ;; fall-through to drop out of while-loop 
      000100 15 3E            [12]  563 	dec _mutex 
                                    564 ;	test3threads.c:139: }
      000102 D2 02            [12]  565 	setb	_Consumer_sloc0_1_0
      000104 10 AF 02         [24]  566 	jbc	ea,00121$
      000107 C2 02            [12]  567 	clr	_Consumer_sloc0_1_0
      000109                        568 00121$:
                                    569 ;	test3threads.c:136: SBUF = buff[head];
      000109 E5 75            [12]  570 	mov	a,_head
      00010B 24 34            [12]  571 	add	a,#_buff
      00010D F9               [12]  572 	mov	r1,a
      00010E 87 99            [24]  573 	mov	_SBUF,@r1
                                    574 ;	test3threads.c:137: head = (head + 1) % 3;
      000110 AE 75            [24]  575 	mov	r6,_head
      000112 7F 00            [12]  576 	mov	r7,#0x00
      000114 8E 82            [24]  577 	mov	dpl,r6
      000116 8F 83            [24]  578 	mov	dph,r7
      000118 A3               [24]  579 	inc	dptr
      000119 75 08 03         [24]  580 	mov	__modsint_PARM_2,#0x03
                                    581 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      00011C 8F 09            [24]  582 	mov	(__modsint_PARM_2 + 1),r7
      00011E 12 03 70         [24]  583 	lcall	__modsint
      000121 AE 82            [24]  584 	mov	r6,dpl
      000123 AF 83            [24]  585 	mov	r7,dph
      000125 8E 75            [24]  586 	mov	_head,r6
      000127 A2 02            [12]  587 	mov	c,_Consumer_sloc0_1_0
      000129 92 AF            [24]  588 	mov	ea,c
                                    589 ;	test3threads.c:140: SemaphoreSignal(mutex);
      00012B 05 3E            [12]  590 	INC _mutex 
                                    591 ;	test3threads.c:141: SemaphoreSignal(empty);
      00012D 05 3D            [12]  592 	INC _empty 
                                    593 ;	test3threads.c:143: while (!TI){
      00012F                        594 00101$:
                                    595 ;	test3threads.c:146: TI = 0;
                                    596 ;	assignBit
      00012F 10 99 BE         [24]  597 	jbc	_TI,00105$
                                    598 ;	test3threads.c:148: }
      000132 80 FB            [24]  599 	sjmp	00101$
                                    600 ;------------------------------------------------------------
                                    601 ;Allocation info for local variables in function 'main'
                                    602 ;------------------------------------------------------------
                                    603 ;	test3threads.c:155: void main(void)
                                    604 ;	-----------------------------------------
                                    605 ;	 function main
                                    606 ;	-----------------------------------------
      000134                        607 _main:
                                    608 ;	test3threads.c:161: turn = 1;
      000134 75 77 01         [24]  609 	mov	_turn,#0x01
                                    610 ;	test3threads.c:166: }
      000137 D2 03            [12]  611 	setb	_main_sloc0_1_0
      000139 10 AF 02         [24]  612 	jbc	ea,00103$
      00013C C2 03            [12]  613 	clr	_main_sloc0_1_0
      00013E                        614 00103$:
                                    615 ;	test3threads.c:163: SemaphoreCreate(empty, 3);
      00013E 75 3D 03         [24]  616 	mov	_empty,#0x03
                                    617 ;	test3threads.c:164: SemaphoreCreate(full, 0);
      000141 75 3C 00         [24]  618 	mov	_full,#0x00
                                    619 ;	test3threads.c:165: SemaphoreCreate(mutex, 1);
      000144 75 3E 01         [24]  620 	mov	_mutex,#0x01
      000147 A2 03            [12]  621 	mov	c,_main_sloc0_1_0
      000149 92 AF            [24]  622 	mov	ea,c
                                    623 ;	test3threads.c:173: ThreadCreate(Producer2);
      00014B 90 00 7F         [24]  624 	mov	dptr,#_Producer2
      00014E 12 01 88         [24]  625 	lcall	_ThreadCreate
                                    626 ;	test3threads.c:174: ThreadCreate(Producer1);
      000151 90 00 1D         [24]  627 	mov	dptr,#_Producer1
      000154 12 01 88         [24]  628 	lcall	_ThreadCreate
                                    629 ;	test3threads.c:175: Consumer();
                                    630 ;	test3threads.c:176: }
      000157 02 00 E1         [24]  631 	ljmp	_Consumer
                                    632 ;------------------------------------------------------------
                                    633 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    634 ;------------------------------------------------------------
                                    635 ;	test3threads.c:178: void _sdcc_gsinit_startup(void)
                                    636 ;	-----------------------------------------
                                    637 ;	 function _sdcc_gsinit_startup
                                    638 ;	-----------------------------------------
      00015A                        639 __sdcc_gsinit_startup:
                                    640 ;	test3threads.c:182: __endasm;
      00015A 02 01 65         [24]  641 	LJMP	_Bootstrap
                                    642 ;	test3threads.c:183: }
      00015D 22               [24]  643 	ret
                                    644 ;------------------------------------------------------------
                                    645 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    646 ;------------------------------------------------------------
                                    647 ;	test3threads.c:185: void _mcs51_genRAMCLEAR(void) {
                                    648 ;	-----------------------------------------
                                    649 ;	 function _mcs51_genRAMCLEAR
                                    650 ;	-----------------------------------------
      00015E                        651 __mcs51_genRAMCLEAR:
                                    652 ;	test3threads.c:187: }
      00015E 22               [24]  653 	ret
                                    654 ;------------------------------------------------------------
                                    655 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    656 ;------------------------------------------------------------
                                    657 ;	test3threads.c:188: void _mcs51_genXINIT(void) {}
                                    658 ;	-----------------------------------------
                                    659 ;	 function _mcs51_genXINIT
                                    660 ;	-----------------------------------------
      00015F                        661 __mcs51_genXINIT:
      00015F 22               [24]  662 	ret
                                    663 ;------------------------------------------------------------
                                    664 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    665 ;------------------------------------------------------------
                                    666 ;	test3threads.c:189: void _mcs51_genXRAMCLEAR(void) {}
                                    667 ;	-----------------------------------------
                                    668 ;	 function _mcs51_genXRAMCLEAR
                                    669 ;	-----------------------------------------
      000160                        670 __mcs51_genXRAMCLEAR:
      000160 22               [24]  671 	ret
                                    672 ;------------------------------------------------------------
                                    673 ;Allocation info for local variables in function 'timer0_ISR'
                                    674 ;------------------------------------------------------------
                                    675 ;	test3threads.c:191: void timer0_ISR(void) __interrupt(1) {
                                    676 ;	-----------------------------------------
                                    677 ;	 function timer0_ISR
                                    678 ;	-----------------------------------------
      000161                        679 _timer0_ISR:
                                    680 ;	test3threads.c:194: __endasm;
      000161 02 02 83         [24]  681 	LJMP	_myTimer0Handler
                                    682 ;	test3threads.c:195: }
      000164 32               [24]  683 	reti
                                    684 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    685 ;	eliminated unneeded push/pop not_psw
                                    686 ;	eliminated unneeded push/pop dpl
                                    687 ;	eliminated unneeded push/pop dph
                                    688 ;	eliminated unneeded push/pop b
                                    689 ;	eliminated unneeded push/pop acc
                                    690 	.area CSEG    (CODE)
                                    691 	.area CONST   (CODE)
                                    692 	.area XINIT   (CODE)
                                    693 	.area CABS    (ABS,CODE)
