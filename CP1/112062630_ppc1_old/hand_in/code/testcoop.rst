                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module testcoop
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl __mcs51_genXRAMCLEAR
                                     12 	.globl __mcs51_genXINIT
                                     13 	.globl __mcs51_genRAMCLEAR
                                     14 	.globl __sdcc_gsinit_startup
                                     15 	.globl _main
                                     16 	.globl _Consumer
                                     17 	.globl _Producer
                                     18 	.globl _ThreadYield
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
                                    116 	.globl _item
                                    117 	.globl _buff_full
                                    118 	.globl _buff
                                    119 ;--------------------------------------------------------
                                    120 ; special function registers
                                    121 ;--------------------------------------------------------
                                    122 	.area RSEG    (ABS,DATA)
      000000                        123 	.org 0x0000
                           000080   124 _P0	=	0x0080
                           000081   125 _SP	=	0x0081
                           000082   126 _DPL	=	0x0082
                           000083   127 _DPH	=	0x0083
                           000087   128 _PCON	=	0x0087
                           000088   129 _TCON	=	0x0088
                           000089   130 _TMOD	=	0x0089
                           00008A   131 _TL0	=	0x008a
                           00008B   132 _TL1	=	0x008b
                           00008C   133 _TH0	=	0x008c
                           00008D   134 _TH1	=	0x008d
                           000090   135 _P1	=	0x0090
                           000098   136 _SCON	=	0x0098
                           000099   137 _SBUF	=	0x0099
                           0000A0   138 _P2	=	0x00a0
                           0000A8   139 _IE	=	0x00a8
                           0000B0   140 _P3	=	0x00b0
                           0000B8   141 _IP	=	0x00b8
                           0000D0   142 _PSW	=	0x00d0
                           0000E0   143 _ACC	=	0x00e0
                           0000F0   144 _B	=	0x00f0
                                    145 ;--------------------------------------------------------
                                    146 ; special function bits
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0_0	=	0x0080
                           000081   151 _P0_1	=	0x0081
                           000082   152 _P0_2	=	0x0082
                           000083   153 _P0_3	=	0x0083
                           000084   154 _P0_4	=	0x0084
                           000085   155 _P0_5	=	0x0085
                           000086   156 _P0_6	=	0x0086
                           000087   157 _P0_7	=	0x0087
                           000088   158 _IT0	=	0x0088
                           000089   159 _IE0	=	0x0089
                           00008A   160 _IT1	=	0x008a
                           00008B   161 _IE1	=	0x008b
                           00008C   162 _TR0	=	0x008c
                           00008D   163 _TF0	=	0x008d
                           00008E   164 _TR1	=	0x008e
                           00008F   165 _TF1	=	0x008f
                           000090   166 _P1_0	=	0x0090
                           000091   167 _P1_1	=	0x0091
                           000092   168 _P1_2	=	0x0092
                           000093   169 _P1_3	=	0x0093
                           000094   170 _P1_4	=	0x0094
                           000095   171 _P1_5	=	0x0095
                           000096   172 _P1_6	=	0x0096
                           000097   173 _P1_7	=	0x0097
                           000098   174 _RI	=	0x0098
                           000099   175 _TI	=	0x0099
                           00009A   176 _RB8	=	0x009a
                           00009B   177 _TB8	=	0x009b
                           00009C   178 _REN	=	0x009c
                           00009D   179 _SM2	=	0x009d
                           00009E   180 _SM1	=	0x009e
                           00009F   181 _SM0	=	0x009f
                           0000A0   182 _P2_0	=	0x00a0
                           0000A1   183 _P2_1	=	0x00a1
                           0000A2   184 _P2_2	=	0x00a2
                           0000A3   185 _P2_3	=	0x00a3
                           0000A4   186 _P2_4	=	0x00a4
                           0000A5   187 _P2_5	=	0x00a5
                           0000A6   188 _P2_6	=	0x00a6
                           0000A7   189 _P2_7	=	0x00a7
                           0000A8   190 _EX0	=	0x00a8
                           0000A9   191 _ET0	=	0x00a9
                           0000AA   192 _EX1	=	0x00aa
                           0000AB   193 _ET1	=	0x00ab
                           0000AC   194 _ES	=	0x00ac
                           0000AF   195 _EA	=	0x00af
                           0000B0   196 _P3_0	=	0x00b0
                           0000B1   197 _P3_1	=	0x00b1
                           0000B2   198 _P3_2	=	0x00b2
                           0000B3   199 _P3_3	=	0x00b3
                           0000B4   200 _P3_4	=	0x00b4
                           0000B5   201 _P3_5	=	0x00b5
                           0000B6   202 _P3_6	=	0x00b6
                           0000B7   203 _P3_7	=	0x00b7
                           0000B0   204 _RXD	=	0x00b0
                           0000B1   205 _TXD	=	0x00b1
                           0000B2   206 _INT0	=	0x00b2
                           0000B3   207 _INT1	=	0x00b3
                           0000B4   208 _T0	=	0x00b4
                           0000B5   209 _T1	=	0x00b5
                           0000B6   210 _WR	=	0x00b6
                           0000B7   211 _RD	=	0x00b7
                           0000B8   212 _PX0	=	0x00b8
                           0000B9   213 _PT0	=	0x00b9
                           0000BA   214 _PX1	=	0x00ba
                           0000BB   215 _PT1	=	0x00bb
                           0000BC   216 _PS	=	0x00bc
                           0000D0   217 _P	=	0x00d0
                           0000D1   218 _F1	=	0x00d1
                           0000D2   219 _OV	=	0x00d2
                           0000D3   220 _RS0	=	0x00d3
                           0000D4   221 _RS1	=	0x00d4
                           0000D5   222 _F0	=	0x00d5
                           0000D6   223 _AC	=	0x00d6
                           0000D7   224 _CY	=	0x00d7
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable register banks
                                    227 ;--------------------------------------------------------
                                    228 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        229 	.ds 8
                                    230 ;--------------------------------------------------------
                                    231 ; internal ram data
                                    232 ;--------------------------------------------------------
                                    233 	.area DSEG    (DATA)
                           000036   234 _buff	=	0x0036
                           000037   235 _buff_full	=	0x0037
                           000038   236 _item	=	0x0038
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 ;--------------------------------------------------------
                                    241 ; Stack segment in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area	SSEG
      000035                        244 __start__stack:
      000035                        245 	.ds	1
                                    246 
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
      000000                        260 _Producer_sloc0_1_0:
      000000                        261 	.ds 1
                                    262 ;--------------------------------------------------------
                                    263 ; paged external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area PSEG    (PAG,XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XSEG    (XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; absolute external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XABS    (ABS,XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; external initialized ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XISEG   (XDATA)
                                    278 	.area HOME    (CODE)
                                    279 	.area GSINIT0 (CODE)
                                    280 	.area GSINIT1 (CODE)
                                    281 	.area GSINIT2 (CODE)
                                    282 	.area GSINIT3 (CODE)
                                    283 	.area GSINIT4 (CODE)
                                    284 	.area GSINIT5 (CODE)
                                    285 	.area GSINIT  (CODE)
                                    286 	.area GSFINAL (CODE)
                                    287 	.area CSEG    (CODE)
                                    288 ;--------------------------------------------------------
                                    289 ; interrupt vector
                                    290 ;--------------------------------------------------------
                                    291 	.area HOME    (CODE)
      000000                        292 __interrupt_vect:
      000000 02 00 6E         [24]  293 	ljmp	__sdcc_gsinit_startup
                                    294 ;--------------------------------------------------------
                                    295 ; global & static initialisations
                                    296 ;--------------------------------------------------------
                                    297 	.area HOME    (CODE)
                                    298 	.area GSINIT  (CODE)
                                    299 	.area GSFINAL (CODE)
                                    300 	.area GSINIT  (CODE)
                                    301 	.globl __sdcc_gsinit_startup
                                    302 	.globl __sdcc_program_startup
                                    303 	.globl __start__stack
                                    304 	.globl __mcs51_genXINIT
                                    305 	.globl __mcs51_genXRAMCLEAR
                                    306 	.globl __mcs51_genRAMCLEAR
                                    307 	.area GSFINAL (CODE)
      000009 02 00 03         [24]  308 	ljmp	__sdcc_program_startup
                                    309 ;--------------------------------------------------------
                                    310 ; Home
                                    311 ;--------------------------------------------------------
                                    312 	.area HOME    (CODE)
                                    313 	.area HOME    (CODE)
      000003                        314 __sdcc_program_startup:
      000003 02 00 62         [24]  315 	ljmp	_main
                                    316 ;	return from main will return to caller
                                    317 ;--------------------------------------------------------
                                    318 ; code
                                    319 ;--------------------------------------------------------
                                    320 	.area CSEG    (CODE)
                                    321 ;------------------------------------------------------------
                                    322 ;Allocation info for local variables in function 'Producer'
                                    323 ;------------------------------------------------------------
                                    324 ;	testcoop.c:27: void Producer(void)
                                    325 ;	-----------------------------------------
                                    326 ;	 function Producer
                                    327 ;	-----------------------------------------
      00000C                        328 _Producer:
                           000007   329 	ar7 = 0x07
                           000006   330 	ar6 = 0x06
                           000005   331 	ar5 = 0x05
                           000004   332 	ar4 = 0x04
                           000003   333 	ar3 = 0x03
                           000002   334 	ar2 = 0x02
                           000001   335 	ar1 = 0x01
                           000000   336 	ar0 = 0x00
                                    337 ;	testcoop.c:34: item = 'A';
      00000C 75 38 41         [24]  338 	mov	_item,#0x41
                                    339 ;	testcoop.c:36: while (1)
      00000F                        340 00105$:
                                    341 ;	testcoop.c:41: buff = item;
      00000F 85 38 36         [24]  342 	mov	_buff,_item
                                    343 ;	testcoop.c:42: item = (item != 'Z')? (item + 1) : 'A';
      000012 74 5A            [12]  344 	mov	a,#0x5a
      000014 B5 38 03         [24]  345 	cjne	a,_item,00127$
      000017 D3               [12]  346 	setb	c
      000018 80 01            [24]  347 	sjmp	00128$
      00001A                        348 00127$:
      00001A C3               [12]  349 	clr	c
      00001B                        350 00128$:
      00001B 92 00            [24]  351 	mov	_Producer_sloc0_1_0,c
      00001D 40 0B            [24]  352 	jc	00109$
      00001F AF 38            [24]  353 	mov	r7,_item
      000021 0F               [12]  354 	inc	r7
      000022 EF               [12]  355 	mov	a,r7
      000023 FE               [12]  356 	mov	r6,a
      000024 33               [12]  357 	rlc	a
      000025 95 E0            [12]  358 	subb	a,acc
      000027 FF               [12]  359 	mov	r7,a
      000028 80 04            [24]  360 	sjmp	00110$
      00002A                        361 00109$:
      00002A 7E 41            [12]  362 	mov	r6,#0x41
      00002C 7F 00            [12]  363 	mov	r7,#0x00
      00002E                        364 00110$:
      00002E 8E 38            [24]  365 	mov	_item,r6
                                    366 ;	testcoop.c:43: buff_full = 1;
      000030 75 37 01         [24]  367 	mov	_buff_full,#0x01
                                    368 ;	testcoop.c:44: while (buff_full){
      000033                        369 00101$:
      000033 E5 37            [12]  370 	mov	a,_buff_full
      000035 60 D8            [24]  371 	jz	00105$
                                    372 ;	testcoop.c:45: ThreadYield();
      000037 12 01 23         [24]  373 	lcall	_ThreadYield
                                    374 ;	testcoop.c:50: }
      00003A 80 F7            [24]  375 	sjmp	00101$
                                    376 ;------------------------------------------------------------
                                    377 ;Allocation info for local variables in function 'Consumer'
                                    378 ;------------------------------------------------------------
                                    379 ;	testcoop.c:57: void Consumer(void)
                                    380 ;	-----------------------------------------
                                    381 ;	 function Consumer
                                    382 ;	-----------------------------------------
      00003C                        383 _Consumer:
                                    384 ;	testcoop.c:63: TMOD = 0x20;
      00003C 75 89 20         [24]  385 	mov	_TMOD,#0x20
                                    386 ;	testcoop.c:64: TH1 = (char)-6;
      00003F 75 8D FA         [24]  387 	mov	_TH1,#0xfa
                                    388 ;	testcoop.c:65: SCON = 0x50;
      000042 75 98 50         [24]  389 	mov	_SCON,#0x50
                                    390 ;	testcoop.c:66: TR1 = 1;
                                    391 ;	assignBit
      000045 D2 8E            [12]  392 	setb	_TR1
                                    393 ;	testcoop.c:73: while (!buff_full){
      000047                        394 00101$:
      000047 E5 37            [12]  395 	mov	a,_buff_full
      000049 70 05            [24]  396 	jnz	00103$
                                    397 ;	testcoop.c:74: ThreadYield();
      00004B 12 01 23         [24]  398 	lcall	_ThreadYield
      00004E 80 F7            [24]  399 	sjmp	00101$
      000050                        400 00103$:
                                    401 ;	testcoop.c:83: SBUF = buff;
      000050 85 36 99         [24]  402 	mov	_SBUF,_buff
                                    403 ;	testcoop.c:84: buff_full = 0;
      000053 75 37 00         [24]  404 	mov	_buff_full,#0x00
                                    405 ;	testcoop.c:85: while (!TI){
      000056                        406 00104$:
      000056 20 99 05         [24]  407 	jb	_TI,00106$
                                    408 ;	testcoop.c:86: ThreadYield();
      000059 12 01 23         [24]  409 	lcall	_ThreadYield
      00005C 80 F8            [24]  410 	sjmp	00104$
      00005E                        411 00106$:
                                    412 ;	testcoop.c:89: TI = 0;
                                    413 ;	assignBit
      00005E C2 99            [12]  414 	clr	_TI
                                    415 ;	testcoop.c:91: }
      000060 80 E5            [24]  416 	sjmp	00101$
                                    417 ;------------------------------------------------------------
                                    418 ;Allocation info for local variables in function 'main'
                                    419 ;------------------------------------------------------------
                                    420 ;	testcoop.c:98: void main(void)
                                    421 ;	-----------------------------------------
                                    422 ;	 function main
                                    423 ;	-----------------------------------------
      000062                        424 _main:
                                    425 ;	testcoop.c:104: buff_full = 0;
      000062 75 37 00         [24]  426 	mov	_buff_full,#0x00
                                    427 ;	testcoop.c:112: ThreadCreate(Producer);
      000065 90 00 0C         [24]  428 	mov	dptr,#_Producer
      000068 12 00 93         [24]  429 	lcall	_ThreadCreate
                                    430 ;	testcoop.c:113: Consumer();
                                    431 ;	testcoop.c:114: }
      00006B 02 00 3C         [24]  432 	ljmp	_Consumer
                                    433 ;------------------------------------------------------------
                                    434 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    435 ;------------------------------------------------------------
                                    436 ;	testcoop.c:116: void _sdcc_gsinit_startup(void)
                                    437 ;	-----------------------------------------
                                    438 ;	 function _sdcc_gsinit_startup
                                    439 ;	-----------------------------------------
      00006E                        440 __sdcc_gsinit_startup:
                                    441 ;	testcoop.c:120: __endasm;
      00006E 02 00 78         [24]  442 	LJMP	_Bootstrap
                                    443 ;	testcoop.c:121: }
      000071 22               [24]  444 	ret
                                    445 ;------------------------------------------------------------
                                    446 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    447 ;------------------------------------------------------------
                                    448 ;	testcoop.c:123: void _mcs51_genRAMCLEAR(void) {
                                    449 ;	-----------------------------------------
                                    450 ;	 function _mcs51_genRAMCLEAR
                                    451 ;	-----------------------------------------
      000072                        452 __mcs51_genRAMCLEAR:
                                    453 ;	testcoop.c:126: __endasm;
      000072 75 34 00         [24]  454 	MOV	0x34, #0
                                    455 ;	testcoop.c:127: }
      000075 22               [24]  456 	ret
                                    457 ;------------------------------------------------------------
                                    458 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    459 ;------------------------------------------------------------
                                    460 ;	testcoop.c:128: void _mcs51_genXINIT(void) {}
                                    461 ;	-----------------------------------------
                                    462 ;	 function _mcs51_genXINIT
                                    463 ;	-----------------------------------------
      000076                        464 __mcs51_genXINIT:
      000076 22               [24]  465 	ret
                                    466 ;------------------------------------------------------------
                                    467 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    468 ;------------------------------------------------------------
                                    469 ;	testcoop.c:129: void _mcs51_genXRAMCLEAR(void) {}
                                    470 ;	-----------------------------------------
                                    471 ;	 function _mcs51_genXRAMCLEAR
                                    472 ;	-----------------------------------------
      000077                        473 __mcs51_genXRAMCLEAR:
      000077 22               [24]  474 	ret
                                    475 	.area CSEG    (CODE)
                                    476 	.area CONST   (CODE)
                                    477 	.area XINIT   (CODE)
                                    478 	.area CABS    (ABS,CODE)
