                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module testlcd
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
                                     20 	.globl _LCD_ready
                                     21 	.globl _LCD_write_char
                                     22 	.globl _LCD_Init
                                     23 	.globl _AnyKeyPressed
                                     24 	.globl _KeyToChar
                                     25 	.globl _Init_Keypad
                                     26 	.globl _ButtonToChar
                                     27 	.globl _AnyButtonPressed
                                     28 	.globl _ThreadCreate
                                     29 	.globl _CY
                                     30 	.globl _AC
                                     31 	.globl _F0
                                     32 	.globl _RS1
                                     33 	.globl _RS0
                                     34 	.globl _OV
                                     35 	.globl _F1
                                     36 	.globl _P
                                     37 	.globl _PS
                                     38 	.globl _PT1
                                     39 	.globl _PX1
                                     40 	.globl _PT0
                                     41 	.globl _PX0
                                     42 	.globl _RD
                                     43 	.globl _WR
                                     44 	.globl _T1
                                     45 	.globl _T0
                                     46 	.globl _INT1
                                     47 	.globl _INT0
                                     48 	.globl _TXD
                                     49 	.globl _RXD
                                     50 	.globl _P3_7
                                     51 	.globl _P3_6
                                     52 	.globl _P3_5
                                     53 	.globl _P3_4
                                     54 	.globl _P3_3
                                     55 	.globl _P3_2
                                     56 	.globl _P3_1
                                     57 	.globl _P3_0
                                     58 	.globl _EA
                                     59 	.globl _ES
                                     60 	.globl _ET1
                                     61 	.globl _EX1
                                     62 	.globl _ET0
                                     63 	.globl _EX0
                                     64 	.globl _P2_7
                                     65 	.globl _P2_6
                                     66 	.globl _P2_5
                                     67 	.globl _P2_4
                                     68 	.globl _P2_3
                                     69 	.globl _P2_2
                                     70 	.globl _P2_1
                                     71 	.globl _P2_0
                                     72 	.globl _SM0
                                     73 	.globl _SM1
                                     74 	.globl _SM2
                                     75 	.globl _REN
                                     76 	.globl _TB8
                                     77 	.globl _RB8
                                     78 	.globl _TI
                                     79 	.globl _RI
                                     80 	.globl _P1_7
                                     81 	.globl _P1_6
                                     82 	.globl _P1_5
                                     83 	.globl _P1_4
                                     84 	.globl _P1_3
                                     85 	.globl _P1_2
                                     86 	.globl _P1_1
                                     87 	.globl _P1_0
                                     88 	.globl _TF1
                                     89 	.globl _TR1
                                     90 	.globl _TF0
                                     91 	.globl _TR0
                                     92 	.globl _IE1
                                     93 	.globl _IT1
                                     94 	.globl _IE0
                                     95 	.globl _IT0
                                     96 	.globl _P0_7
                                     97 	.globl _P0_6
                                     98 	.globl _P0_5
                                     99 	.globl _P0_4
                                    100 	.globl _P0_3
                                    101 	.globl _P0_2
                                    102 	.globl _P0_1
                                    103 	.globl _P0_0
                                    104 	.globl _B
                                    105 	.globl _ACC
                                    106 	.globl _PSW
                                    107 	.globl _IP
                                    108 	.globl _P3
                                    109 	.globl _IE
                                    110 	.globl _P2
                                    111 	.globl _SBUF
                                    112 	.globl _SCON
                                    113 	.globl _P1
                                    114 	.globl _TH1
                                    115 	.globl _TH0
                                    116 	.globl _TL1
                                    117 	.globl _TL0
                                    118 	.globl _TMOD
                                    119 	.globl _TCON
                                    120 	.globl _PCON
                                    121 	.globl _DPH
                                    122 	.globl _DPL
                                    123 	.globl _SP
                                    124 	.globl _P0
                                    125 	.globl _tail
                                    126 	.globl _head
                                    127 	.globl _turn
                                    128 	.globl _mutex
                                    129 	.globl _empty
                                    130 	.globl _full
                                    131 	.globl _item2
                                    132 	.globl _item1
                                    133 	.globl _buff
                                    134 ;--------------------------------------------------------
                                    135 ; special function registers
                                    136 ;--------------------------------------------------------
                                    137 	.area RSEG    (ABS,DATA)
      000000                        138 	.org 0x0000
                           000080   139 _P0	=	0x0080
                           000081   140 _SP	=	0x0081
                           000082   141 _DPL	=	0x0082
                           000083   142 _DPH	=	0x0083
                           000087   143 _PCON	=	0x0087
                           000088   144 _TCON	=	0x0088
                           000089   145 _TMOD	=	0x0089
                           00008A   146 _TL0	=	0x008a
                           00008B   147 _TL1	=	0x008b
                           00008C   148 _TH0	=	0x008c
                           00008D   149 _TH1	=	0x008d
                           000090   150 _P1	=	0x0090
                           000098   151 _SCON	=	0x0098
                           000099   152 _SBUF	=	0x0099
                           0000A0   153 _P2	=	0x00a0
                           0000A8   154 _IE	=	0x00a8
                           0000B0   155 _P3	=	0x00b0
                           0000B8   156 _IP	=	0x00b8
                           0000D0   157 _PSW	=	0x00d0
                           0000E0   158 _ACC	=	0x00e0
                           0000F0   159 _B	=	0x00f0
                                    160 ;--------------------------------------------------------
                                    161 ; special function bits
                                    162 ;--------------------------------------------------------
                                    163 	.area RSEG    (ABS,DATA)
      000000                        164 	.org 0x0000
                           000080   165 _P0_0	=	0x0080
                           000081   166 _P0_1	=	0x0081
                           000082   167 _P0_2	=	0x0082
                           000083   168 _P0_3	=	0x0083
                           000084   169 _P0_4	=	0x0084
                           000085   170 _P0_5	=	0x0085
                           000086   171 _P0_6	=	0x0086
                           000087   172 _P0_7	=	0x0087
                           000088   173 _IT0	=	0x0088
                           000089   174 _IE0	=	0x0089
                           00008A   175 _IT1	=	0x008a
                           00008B   176 _IE1	=	0x008b
                           00008C   177 _TR0	=	0x008c
                           00008D   178 _TF0	=	0x008d
                           00008E   179 _TR1	=	0x008e
                           00008F   180 _TF1	=	0x008f
                           000090   181 _P1_0	=	0x0090
                           000091   182 _P1_1	=	0x0091
                           000092   183 _P1_2	=	0x0092
                           000093   184 _P1_3	=	0x0093
                           000094   185 _P1_4	=	0x0094
                           000095   186 _P1_5	=	0x0095
                           000096   187 _P1_6	=	0x0096
                           000097   188 _P1_7	=	0x0097
                           000098   189 _RI	=	0x0098
                           000099   190 _TI	=	0x0099
                           00009A   191 _RB8	=	0x009a
                           00009B   192 _TB8	=	0x009b
                           00009C   193 _REN	=	0x009c
                           00009D   194 _SM2	=	0x009d
                           00009E   195 _SM1	=	0x009e
                           00009F   196 _SM0	=	0x009f
                           0000A0   197 _P2_0	=	0x00a0
                           0000A1   198 _P2_1	=	0x00a1
                           0000A2   199 _P2_2	=	0x00a2
                           0000A3   200 _P2_3	=	0x00a3
                           0000A4   201 _P2_4	=	0x00a4
                           0000A5   202 _P2_5	=	0x00a5
                           0000A6   203 _P2_6	=	0x00a6
                           0000A7   204 _P2_7	=	0x00a7
                           0000A8   205 _EX0	=	0x00a8
                           0000A9   206 _ET0	=	0x00a9
                           0000AA   207 _EX1	=	0x00aa
                           0000AB   208 _ET1	=	0x00ab
                           0000AC   209 _ES	=	0x00ac
                           0000AF   210 _EA	=	0x00af
                           0000B0   211 _P3_0	=	0x00b0
                           0000B1   212 _P3_1	=	0x00b1
                           0000B2   213 _P3_2	=	0x00b2
                           0000B3   214 _P3_3	=	0x00b3
                           0000B4   215 _P3_4	=	0x00b4
                           0000B5   216 _P3_5	=	0x00b5
                           0000B6   217 _P3_6	=	0x00b6
                           0000B7   218 _P3_7	=	0x00b7
                           0000B0   219 _RXD	=	0x00b0
                           0000B1   220 _TXD	=	0x00b1
                           0000B2   221 _INT0	=	0x00b2
                           0000B3   222 _INT1	=	0x00b3
                           0000B4   223 _T0	=	0x00b4
                           0000B5   224 _T1	=	0x00b5
                           0000B6   225 _WR	=	0x00b6
                           0000B7   226 _RD	=	0x00b7
                           0000B8   227 _PX0	=	0x00b8
                           0000B9   228 _PT0	=	0x00b9
                           0000BA   229 _PX1	=	0x00ba
                           0000BB   230 _PT1	=	0x00bb
                           0000BC   231 _PS	=	0x00bc
                           0000D0   232 _P	=	0x00d0
                           0000D1   233 _F1	=	0x00d1
                           0000D2   234 _OV	=	0x00d2
                           0000D3   235 _RS0	=	0x00d3
                           0000D4   236 _RS1	=	0x00d4
                           0000D5   237 _F0	=	0x00d5
                           0000D6   238 _AC	=	0x00d6
                           0000D7   239 _CY	=	0x00d7
                                    240 ;--------------------------------------------------------
                                    241 ; overlayable register banks
                                    242 ;--------------------------------------------------------
                                    243 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        244 	.ds 8
                                    245 ;--------------------------------------------------------
                                    246 ; internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area DSEG    (DATA)
                           000034   249 _buff	=	0x0034
                           00003B   250 _item1	=	0x003b
                           00003F   251 _item2	=	0x003f
                           00003C   252 _full	=	0x003c
                           00003D   253 _empty	=	0x003d
                           00003E   254 _mutex	=	0x003e
                           000027   255 _turn	=	0x0027
                                    256 ;--------------------------------------------------------
                                    257 ; overlayable items in internal ram
                                    258 ;--------------------------------------------------------
                                    259 ;--------------------------------------------------------
                                    260 ; Stack segment in internal ram
                                    261 ;--------------------------------------------------------
                                    262 	.area	SSEG
      000031                        263 __start__stack:
      000031                        264 	.ds	1
                                    265 
                                    266 ;--------------------------------------------------------
                                    267 ; indirectly addressable internal ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area ISEG    (DATA)
                                    270 ;--------------------------------------------------------
                                    271 ; absolute internal ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area IABS    (ABS,DATA)
      000025                        274 	.org 0x0025
      000025                        275 _head::
      000025                        276 	.ds 1
      000026                        277 	.org 0x0026
      000026                        278 _tail::
      000026                        279 	.ds 1
                                    280 	.area IABS    (ABS,DATA)
                                    281 ;--------------------------------------------------------
                                    282 ; bit data
                                    283 ;--------------------------------------------------------
                                    284 	.area BSEG    (BIT)
      000000                        285 _Producer1_sloc0_1_0:
      000000                        286 	.ds 1
      000001                        287 _Producer2_sloc0_1_0:
      000001                        288 	.ds 1
      000002                        289 _Consumer_sloc0_1_0:
      000002                        290 	.ds 1
      000003                        291 _main_sloc0_1_0:
      000003                        292 	.ds 1
                                    293 ;--------------------------------------------------------
                                    294 ; paged external ram data
                                    295 ;--------------------------------------------------------
                                    296 	.area PSEG    (PAG,XDATA)
                                    297 ;--------------------------------------------------------
                                    298 ; external ram data
                                    299 ;--------------------------------------------------------
                                    300 	.area XSEG    (XDATA)
                                    301 ;--------------------------------------------------------
                                    302 ; absolute external ram data
                                    303 ;--------------------------------------------------------
                                    304 	.area XABS    (ABS,XDATA)
                                    305 ;--------------------------------------------------------
                                    306 ; external initialized ram data
                                    307 ;--------------------------------------------------------
                                    308 	.area XISEG   (XDATA)
                                    309 	.area HOME    (CODE)
                                    310 	.area GSINIT0 (CODE)
                                    311 	.area GSINIT1 (CODE)
                                    312 	.area GSINIT2 (CODE)
                                    313 	.area GSINIT3 (CODE)
                                    314 	.area GSINIT4 (CODE)
                                    315 	.area GSINIT5 (CODE)
                                    316 	.area GSINIT  (CODE)
                                    317 	.area GSFINAL (CODE)
                                    318 	.area CSEG    (CODE)
                                    319 ;--------------------------------------------------------
                                    320 ; interrupt vector
                                    321 ;--------------------------------------------------------
                                    322 	.area HOME    (CODE)
      000000                        323 __interrupt_vect:
      000000 02 01 71         [24]  324 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  325 	reti
      000004                        326 	.ds	7
      00000B 02 01 78         [24]  327 	ljmp	_timer0_ISR
                                    328 ;--------------------------------------------------------
                                    329 ; global & static initialisations
                                    330 ;--------------------------------------------------------
                                    331 	.area HOME    (CODE)
                                    332 	.area GSINIT  (CODE)
                                    333 	.area GSFINAL (CODE)
                                    334 	.area GSINIT  (CODE)
                                    335 	.globl __sdcc_gsinit_startup
                                    336 	.globl __sdcc_program_startup
                                    337 	.globl __start__stack
                                    338 	.globl __mcs51_genXINIT
                                    339 	.globl __mcs51_genXRAMCLEAR
                                    340 	.globl __mcs51_genRAMCLEAR
                                    341 ;	testlcd.c:26: __data __at (0x25) char head = 0;
      000011 75 25 00         [24]  342 	mov	_head,#0x00
                                    343 ;	testlcd.c:27: __data __at (0x26) char tail = 0;
      000014 75 26 00         [24]  344 	mov	_tail,#0x00
                                    345 	.area GSFINAL (CODE)
      00001A 02 00 0E         [24]  346 	ljmp	__sdcc_program_startup
                                    347 ;--------------------------------------------------------
                                    348 ; Home
                                    349 ;--------------------------------------------------------
                                    350 	.area HOME    (CODE)
                                    351 	.area HOME    (CODE)
      00000E                        352 __sdcc_program_startup:
      00000E 02 01 4E         [24]  353 	ljmp	_main
                                    354 ;	return from main will return to caller
                                    355 ;--------------------------------------------------------
                                    356 ; code
                                    357 ;--------------------------------------------------------
                                    358 	.area CSEG    (CODE)
                                    359 ;------------------------------------------------------------
                                    360 ;Allocation info for local variables in function 'Producer1'
                                    361 ;------------------------------------------------------------
                                    362 ;	testlcd.c:40: void Producer1(void)
                                    363 ;	-----------------------------------------
                                    364 ;	 function Producer1
                                    365 ;	-----------------------------------------
      00001D                        366 _Producer1:
                           000007   367 	ar7 = 0x07
                           000006   368 	ar6 = 0x06
                           000005   369 	ar5 = 0x05
                           000004   370 	ar4 = 0x04
                           000003   371 	ar3 = 0x03
                           000002   372 	ar2 = 0x02
                           000001   373 	ar1 = 0x01
                           000000   374 	ar0 = 0x00
                                    375 ;	testlcd.c:50: while (!AnyButtonPressed()){}
      00001D                        376 00101$:
      00001D 12 04 2F         [24]  377 	lcall	_AnyButtonPressed
      000020 E5 82            [12]  378 	mov	a,dpl
      000022 60 F9            [24]  379 	jz	00101$
                                    380 ;	testlcd.c:51: item1 = ButtonToChar();
      000024 12 04 41         [24]  381 	lcall	_ButtonToChar
      000027 85 82 3B         [24]  382 	mov	_item1,dpl
                                    383 ;	testlcd.c:57: SemaphoreWait(empty);
      00002A                        384 		0$:
                                    385 ;; top of while-loop 
      00002A D2 AF            [12]  386 	SETB EA 
      00002C 12 02 3A         [24]  387 	LCALL _ThreadYield 
      00002F C2 AF            [12]  388 	CLR EA 
      000031 E5 3D            [12]  389 	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
      000033 20 E7 F4         [24]  390 	JB ACC.7, 0$ ;; conditionally jump(s) back to 0$ if ACC <= 0 
      000036 60 F2            [24]  391 	JZ 0$ 
      000038 15 3D            [12]  392 	dec _empty 
      00003A D2 AF            [12]  393 	SETB EA 
                                    394 ;	testlcd.c:58: SemaphoreWait(mutex);
      00003C                        395 		1$:
                                    396 ;; top of while-loop 
      00003C D2 AF            [12]  397 	SETB EA 
      00003E 12 02 3A         [24]  398 	LCALL _ThreadYield 
      000041 C2 AF            [12]  399 	CLR EA 
      000043 E5 3E            [12]  400 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      000045 20 E7 F4         [24]  401 	JB ACC.7, 1$ ;; conditionally jump(s) back to 1$ if ACC <= 0 
      000048 60 F2            [24]  402 	JZ 1$ 
      00004A 15 3E            [12]  403 	dec _mutex 
      00004C D2 AF            [12]  404 	SETB EA 
                                    405 ;	testlcd.c:62: }
      00004E D2 00            [12]  406 	setb	_Producer1_sloc0_1_0
      000050 10 AF 02         [24]  407 	jbc	ea,00129$
      000053 C2 00            [12]  408 	clr	_Producer1_sloc0_1_0
      000055                        409 00129$:
                                    410 ;	testlcd.c:60: buff[tail] = item1;
      000055 E5 26            [12]  411 	mov	a,_tail
      000057 24 34            [12]  412 	add	a,#_buff
      000059 F8               [12]  413 	mov	r0,a
      00005A A6 3B            [24]  414 	mov	@r0,_item1
                                    415 ;	testlcd.c:61: tail = (tail + 1) % 3;
      00005C AE 26            [24]  416 	mov	r6,_tail
      00005E 7F 00            [12]  417 	mov	r7,#0x00
      000060 8E 82            [24]  418 	mov	dpl,r6
      000062 8F 83            [24]  419 	mov	dph,r7
      000064 A3               [24]  420 	inc	dptr
      000065 75 08 03         [24]  421 	mov	__modsint_PARM_2,#0x03
                                    422 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000068 8F 09            [24]  423 	mov	(__modsint_PARM_2 + 1),r7
      00006A 12 05 C5         [24]  424 	lcall	__modsint
      00006D AE 82            [24]  425 	mov	r6,dpl
      00006F AF 83            [24]  426 	mov	r7,dph
      000071 8E 26            [24]  427 	mov	_tail,r6
      000073 A2 00            [12]  428 	mov	c,_Producer1_sloc0_1_0
      000075 92 AF            [24]  429 	mov	ea,c
                                    430 ;	testlcd.c:63: SemaphoreSignal(mutex);
      000077 05 3E            [12]  431 	INC _mutex 
                                    432 ;	testlcd.c:64: SemaphoreSignal(full);
      000079 05 3C            [12]  433 	INC _full 
                                    434 ;	testlcd.c:70: while(AnyButtonPressed()){}
      00007B                        435 00104$:
      00007B 12 04 2F         [24]  436 	lcall	_AnyButtonPressed
      00007E E5 82            [12]  437 	mov	a,dpl
      000080 60 9B            [24]  438 	jz	00101$
                                    439 ;	testlcd.c:74: }
      000082 80 F7            [24]  440 	sjmp	00104$
                                    441 ;------------------------------------------------------------
                                    442 ;Allocation info for local variables in function 'Producer2'
                                    443 ;------------------------------------------------------------
                                    444 ;	testlcd.c:76: void Producer2(void)
                                    445 ;	-----------------------------------------
                                    446 ;	 function Producer2
                                    447 ;	-----------------------------------------
      000084                        448 _Producer2:
                                    449 ;	testlcd.c:84: Init_Keypad();
      000084 12 04 CD         [24]  450 	lcall	_Init_Keypad
                                    451 ;	testlcd.c:87: while(!AnyKeyPressed()){}
      000087                        452 00101$:
      000087 12 04 D3         [24]  453 	lcall	_AnyKeyPressed
      00008A E5 82            [12]  454 	mov	a,dpl
      00008C 60 F9            [24]  455 	jz	00101$
                                    456 ;	testlcd.c:88: item2 = KeyToChar();
      00008E 12 04 E0         [24]  457 	lcall	_KeyToChar
      000091 85 82 3F         [24]  458 	mov	_item2,dpl
                                    459 ;	testlcd.c:94: SemaphoreWait(empty);
      000094                        460 		2$:
                                    461 ;; top of while-loop 
      000094 D2 AF            [12]  462 	SETB EA 
      000096 12 02 3A         [24]  463 	LCALL _ThreadYield 
      000099 C2 AF            [12]  464 	CLR EA 
      00009B E5 3D            [12]  465 	MOV A, _empty ;; read value of _S into ACC (where empty is semaphore) 
      00009D 20 E7 F4         [24]  466 	JB ACC.7, 2$ ;; conditionally jump(s) back to 2$ if ACC <= 0 
      0000A0 60 F2            [24]  467 	JZ 2$ 
      0000A2 15 3D            [12]  468 	dec _empty 
      0000A4 D2 AF            [12]  469 	SETB EA 
                                    470 ;	testlcd.c:95: SemaphoreWait(mutex);
      0000A6                        471 		3$:
                                    472 ;; top of while-loop 
      0000A6 D2 AF            [12]  473 	SETB EA 
      0000A8 12 02 3A         [24]  474 	LCALL _ThreadYield 
      0000AB C2 AF            [12]  475 	CLR EA 
      0000AD E5 3E            [12]  476 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      0000AF 20 E7 F4         [24]  477 	JB ACC.7, 3$ ;; conditionally jump(s) back to 3$ if ACC <= 0 
      0000B2 60 F2            [24]  478 	JZ 3$ 
      0000B4 15 3E            [12]  479 	dec _mutex 
      0000B6 D2 AF            [12]  480 	SETB EA 
                                    481 ;	testlcd.c:99: }
      0000B8 D2 01            [12]  482 	setb	_Producer2_sloc0_1_0
      0000BA 10 AF 02         [24]  483 	jbc	ea,00129$
      0000BD C2 01            [12]  484 	clr	_Producer2_sloc0_1_0
      0000BF                        485 00129$:
                                    486 ;	testlcd.c:97: buff[tail] = item2;
      0000BF E5 26            [12]  487 	mov	a,_tail
      0000C1 24 34            [12]  488 	add	a,#_buff
      0000C3 F8               [12]  489 	mov	r0,a
      0000C4 A6 3F            [24]  490 	mov	@r0,_item2
                                    491 ;	testlcd.c:98: tail = (tail + 1) % 3;
      0000C6 AE 26            [24]  492 	mov	r6,_tail
      0000C8 7F 00            [12]  493 	mov	r7,#0x00
      0000CA 8E 82            [24]  494 	mov	dpl,r6
      0000CC 8F 83            [24]  495 	mov	dph,r7
      0000CE A3               [24]  496 	inc	dptr
      0000CF 75 08 03         [24]  497 	mov	__modsint_PARM_2,#0x03
                                    498 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      0000D2 8F 09            [24]  499 	mov	(__modsint_PARM_2 + 1),r7
      0000D4 12 05 C5         [24]  500 	lcall	__modsint
      0000D7 AE 82            [24]  501 	mov	r6,dpl
      0000D9 AF 83            [24]  502 	mov	r7,dph
      0000DB 8E 26            [24]  503 	mov	_tail,r6
      0000DD A2 01            [12]  504 	mov	c,_Producer2_sloc0_1_0
      0000DF 92 AF            [24]  505 	mov	ea,c
                                    506 ;	testlcd.c:100: SemaphoreSignal(mutex);
      0000E1 05 3E            [12]  507 	INC _mutex 
                                    508 ;	testlcd.c:101: SemaphoreSignal(full);
      0000E3 05 3C            [12]  509 	INC _full 
                                    510 ;	testlcd.c:108: while(AnyKeyPressed()){}
      0000E5                        511 00104$:
      0000E5 12 04 D3         [24]  512 	lcall	_AnyKeyPressed
      0000E8 E5 82            [12]  513 	mov	a,dpl
      0000EA 60 9B            [24]  514 	jz	00101$
                                    515 ;	testlcd.c:110: }
      0000EC 80 F7            [24]  516 	sjmp	00104$
                                    517 ;------------------------------------------------------------
                                    518 ;Allocation info for local variables in function 'Consumer'
                                    519 ;------------------------------------------------------------
                                    520 ;	testlcd.c:117: void Consumer(void)
                                    521 ;	-----------------------------------------
                                    522 ;	 function Consumer
                                    523 ;	-----------------------------------------
      0000EE                        524 _Consumer:
                                    525 ;	testlcd.c:123: LCD_Init();
      0000EE 12 03 6D         [24]  526 	lcall	_LCD_Init
                                    527 ;	testlcd.c:138: while(!LCD_ready()){}
      0000F1                        528 00101$:
      0000F1 12 03 69         [24]  529 	lcall	_LCD_ready
      0000F4 E5 82            [12]  530 	mov	a,dpl
      0000F6 60 F9            [24]  531 	jz	00101$
                                    532 ;	testlcd.c:139: SemaphoreWait(full);
      0000F8                        533 		4$:
                                    534 ;; top of while-loop 
      0000F8 D2 AF            [12]  535 	SETB EA 
      0000FA 12 02 3A         [24]  536 	LCALL _ThreadYield 
      0000FD C2 AF            [12]  537 	CLR EA 
      0000FF E5 3C            [12]  538 	MOV A, _full ;; read value of _S into ACC (where full is semaphore) 
      000101 20 E7 F4         [24]  539 	JB ACC.7, 4$ ;; conditionally jump(s) back to 4$ if ACC <= 0 
      000104 60 F2            [24]  540 	JZ 4$ 
      000106 15 3C            [12]  541 	dec _full 
      000108 D2 AF            [12]  542 	SETB EA 
                                    543 ;	testlcd.c:140: SemaphoreWait(mutex);
      00010A                        544 		5$:
                                    545 ;; top of while-loop 
      00010A D2 AF            [12]  546 	SETB EA 
      00010C 12 02 3A         [24]  547 	LCALL _ThreadYield 
      00010F C2 AF            [12]  548 	CLR EA 
      000111 E5 3E            [12]  549 	MOV A, _mutex ;; read value of _S into ACC (where mutex is semaphore) 
      000113 20 E7 F4         [24]  550 	JB ACC.7, 5$ ;; conditionally jump(s) back to 5$ if ACC <= 0 
      000116 60 F2            [24]  551 	JZ 5$ 
      000118 15 3E            [12]  552 	dec _mutex 
      00011A D2 AF            [12]  553 	SETB EA 
                                    554 ;	testlcd.c:146: }
      00011C D2 02            [12]  555 	setb	_Consumer_sloc0_1_0
      00011E 10 AF 02         [24]  556 	jbc	ea,00118$
      000121 C2 02            [12]  557 	clr	_Consumer_sloc0_1_0
      000123                        558 00118$:
                                    559 ;	testlcd.c:143: LCD_write_char(buff[head]);
      000123 E5 25            [12]  560 	mov	a,_head
      000125 24 34            [12]  561 	add	a,#_buff
      000127 F9               [12]  562 	mov	r1,a
      000128 87 82            [24]  563 	mov	dpl,@r1
      00012A 12 03 CC         [24]  564 	lcall	_LCD_write_char
                                    565 ;	testlcd.c:144: head = (head + 1) % 3;
      00012D AE 25            [24]  566 	mov	r6,_head
      00012F 7F 00            [12]  567 	mov	r7,#0x00
      000131 8E 82            [24]  568 	mov	dpl,r6
      000133 8F 83            [24]  569 	mov	dph,r7
      000135 A3               [24]  570 	inc	dptr
      000136 75 08 03         [24]  571 	mov	__modsint_PARM_2,#0x03
                                    572 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000139 8F 09            [24]  573 	mov	(__modsint_PARM_2 + 1),r7
      00013B 12 05 C5         [24]  574 	lcall	__modsint
      00013E AE 82            [24]  575 	mov	r6,dpl
      000140 AF 83            [24]  576 	mov	r7,dph
      000142 8E 25            [24]  577 	mov	_head,r6
      000144 A2 02            [12]  578 	mov	c,_Consumer_sloc0_1_0
      000146 92 AF            [24]  579 	mov	ea,c
                                    580 ;	testlcd.c:147: SemaphoreSignal(mutex);
      000148 05 3E            [12]  581 	INC _mutex 
                                    582 ;	testlcd.c:148: SemaphoreSignal(empty);
      00014A 05 3D            [12]  583 	INC _empty 
                                    584 ;	testlcd.c:152: }
      00014C 80 A3            [24]  585 	sjmp	00101$
                                    586 ;------------------------------------------------------------
                                    587 ;Allocation info for local variables in function 'main'
                                    588 ;------------------------------------------------------------
                                    589 ;	testlcd.c:159: void main(void)
                                    590 ;	-----------------------------------------
                                    591 ;	 function main
                                    592 ;	-----------------------------------------
      00014E                        593 _main:
                                    594 ;	testlcd.c:170: }
      00014E D2 03            [12]  595 	setb	_main_sloc0_1_0
      000150 10 AF 02         [24]  596 	jbc	ea,00103$
      000153 C2 03            [12]  597 	clr	_main_sloc0_1_0
      000155                        598 00103$:
                                    599 ;	testlcd.c:167: SemaphoreCreate(empty, 3);
      000155 75 3D 03         [24]  600 	mov	_empty,#0x03
                                    601 ;	testlcd.c:168: SemaphoreCreate(full, 0);
      000158 75 3C 00         [24]  602 	mov	_full,#0x00
                                    603 ;	testlcd.c:169: SemaphoreCreate(mutex, 1);
      00015B 75 3E 01         [24]  604 	mov	_mutex,#0x01
      00015E A2 03            [12]  605 	mov	c,_main_sloc0_1_0
      000160 92 AF            [24]  606 	mov	ea,c
                                    607 ;	testlcd.c:177: ThreadCreate(Producer1);
      000162 90 00 1D         [24]  608 	mov	dptr,#_Producer1
      000165 12 01 A3         [24]  609 	lcall	_ThreadCreate
                                    610 ;	testlcd.c:178: ThreadCreate(Producer2);
      000168 90 00 84         [24]  611 	mov	dptr,#_Producer2
      00016B 12 01 A3         [24]  612 	lcall	_ThreadCreate
                                    613 ;	testlcd.c:179: Consumer();
                                    614 ;	testlcd.c:180: }
      00016E 02 00 EE         [24]  615 	ljmp	_Consumer
                                    616 ;------------------------------------------------------------
                                    617 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    618 ;------------------------------------------------------------
                                    619 ;	testlcd.c:182: void _sdcc_gsinit_startup(void)
                                    620 ;	-----------------------------------------
                                    621 ;	 function _sdcc_gsinit_startup
                                    622 ;	-----------------------------------------
      000171                        623 __sdcc_gsinit_startup:
                                    624 ;	testlcd.c:186: __endasm;
      000171 02 01 7C         [24]  625 	LJMP	_Bootstrap
                                    626 ;	testlcd.c:187: }
      000174 22               [24]  627 	ret
                                    628 ;------------------------------------------------------------
                                    629 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    630 ;------------------------------------------------------------
                                    631 ;	testlcd.c:189: void _mcs51_genRAMCLEAR(void) {
                                    632 ;	-----------------------------------------
                                    633 ;	 function _mcs51_genRAMCLEAR
                                    634 ;	-----------------------------------------
      000175                        635 __mcs51_genRAMCLEAR:
                                    636 ;	testlcd.c:191: }
      000175 22               [24]  637 	ret
                                    638 ;------------------------------------------------------------
                                    639 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    640 ;------------------------------------------------------------
                                    641 ;	testlcd.c:192: void _mcs51_genXINIT(void) {}
                                    642 ;	-----------------------------------------
                                    643 ;	 function _mcs51_genXINIT
                                    644 ;	-----------------------------------------
      000176                        645 __mcs51_genXINIT:
      000176 22               [24]  646 	ret
                                    647 ;------------------------------------------------------------
                                    648 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    649 ;------------------------------------------------------------
                                    650 ;	testlcd.c:193: void _mcs51_genXRAMCLEAR(void) {}
                                    651 ;	-----------------------------------------
                                    652 ;	 function _mcs51_genXRAMCLEAR
                                    653 ;	-----------------------------------------
      000177                        654 __mcs51_genXRAMCLEAR:
      000177 22               [24]  655 	ret
                                    656 ;------------------------------------------------------------
                                    657 ;Allocation info for local variables in function 'timer0_ISR'
                                    658 ;------------------------------------------------------------
                                    659 ;	testlcd.c:195: void timer0_ISR(void) __interrupt(1) {
                                    660 ;	-----------------------------------------
                                    661 ;	 function timer0_ISR
                                    662 ;	-----------------------------------------
      000178                        663 _timer0_ISR:
                                    664 ;	testlcd.c:198: __endasm;
      000178 02 02 C6         [24]  665 	LJMP	_myTimer0Handler
                                    666 ;	testlcd.c:199: }
      00017B 32               [24]  667 	reti
                                    668 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    669 ;	eliminated unneeded push/pop not_psw
                                    670 ;	eliminated unneeded push/pop dpl
                                    671 ;	eliminated unneeded push/pop dph
                                    672 ;	eliminated unneeded push/pop b
                                    673 ;	eliminated unneeded push/pop acc
                                    674 	.area CSEG    (CODE)
                                    675 	.area CONST   (CODE)
                                    676 	.area XINIT   (CODE)
                                    677 	.area CABS    (ABS,CODE)
