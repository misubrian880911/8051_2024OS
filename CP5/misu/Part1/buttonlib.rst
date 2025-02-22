                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module buttonlib
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _AnyButtonPressed
                                    108 	.globl _ButtonToChar
                                    109 ;--------------------------------------------------------
                                    110 ; special function registers
                                    111 ;--------------------------------------------------------
                                    112 	.area RSEG    (ABS,DATA)
      000000                        113 	.org 0x0000
                           000080   114 _P0	=	0x0080
                           000081   115 _SP	=	0x0081
                           000082   116 _DPL	=	0x0082
                           000083   117 _DPH	=	0x0083
                           000087   118 _PCON	=	0x0087
                           000088   119 _TCON	=	0x0088
                           000089   120 _TMOD	=	0x0089
                           00008A   121 _TL0	=	0x008a
                           00008B   122 _TL1	=	0x008b
                           00008C   123 _TH0	=	0x008c
                           00008D   124 _TH1	=	0x008d
                           000090   125 _P1	=	0x0090
                           000098   126 _SCON	=	0x0098
                           000099   127 _SBUF	=	0x0099
                           0000A0   128 _P2	=	0x00a0
                           0000A8   129 _IE	=	0x00a8
                           0000B0   130 _P3	=	0x00b0
                           0000B8   131 _IP	=	0x00b8
                           0000D0   132 _PSW	=	0x00d0
                           0000E0   133 _ACC	=	0x00e0
                           0000F0   134 _B	=	0x00f0
                                    135 ;--------------------------------------------------------
                                    136 ; special function bits
                                    137 ;--------------------------------------------------------
                                    138 	.area RSEG    (ABS,DATA)
      000000                        139 	.org 0x0000
                           000080   140 _P0_0	=	0x0080
                           000081   141 _P0_1	=	0x0081
                           000082   142 _P0_2	=	0x0082
                           000083   143 _P0_3	=	0x0083
                           000084   144 _P0_4	=	0x0084
                           000085   145 _P0_5	=	0x0085
                           000086   146 _P0_6	=	0x0086
                           000087   147 _P0_7	=	0x0087
                           000088   148 _IT0	=	0x0088
                           000089   149 _IE0	=	0x0089
                           00008A   150 _IT1	=	0x008a
                           00008B   151 _IE1	=	0x008b
                           00008C   152 _TR0	=	0x008c
                           00008D   153 _TF0	=	0x008d
                           00008E   154 _TR1	=	0x008e
                           00008F   155 _TF1	=	0x008f
                           000090   156 _P1_0	=	0x0090
                           000091   157 _P1_1	=	0x0091
                           000092   158 _P1_2	=	0x0092
                           000093   159 _P1_3	=	0x0093
                           000094   160 _P1_4	=	0x0094
                           000095   161 _P1_5	=	0x0095
                           000096   162 _P1_6	=	0x0096
                           000097   163 _P1_7	=	0x0097
                           000098   164 _RI	=	0x0098
                           000099   165 _TI	=	0x0099
                           00009A   166 _RB8	=	0x009a
                           00009B   167 _TB8	=	0x009b
                           00009C   168 _REN	=	0x009c
                           00009D   169 _SM2	=	0x009d
                           00009E   170 _SM1	=	0x009e
                           00009F   171 _SM0	=	0x009f
                           0000A0   172 _P2_0	=	0x00a0
                           0000A1   173 _P2_1	=	0x00a1
                           0000A2   174 _P2_2	=	0x00a2
                           0000A3   175 _P2_3	=	0x00a3
                           0000A4   176 _P2_4	=	0x00a4
                           0000A5   177 _P2_5	=	0x00a5
                           0000A6   178 _P2_6	=	0x00a6
                           0000A7   179 _P2_7	=	0x00a7
                           0000A8   180 _EX0	=	0x00a8
                           0000A9   181 _ET0	=	0x00a9
                           0000AA   182 _EX1	=	0x00aa
                           0000AB   183 _ET1	=	0x00ab
                           0000AC   184 _ES	=	0x00ac
                           0000AF   185 _EA	=	0x00af
                           0000B0   186 _P3_0	=	0x00b0
                           0000B1   187 _P3_1	=	0x00b1
                           0000B2   188 _P3_2	=	0x00b2
                           0000B3   189 _P3_3	=	0x00b3
                           0000B4   190 _P3_4	=	0x00b4
                           0000B5   191 _P3_5	=	0x00b5
                           0000B6   192 _P3_6	=	0x00b6
                           0000B7   193 _P3_7	=	0x00b7
                           0000B0   194 _RXD	=	0x00b0
                           0000B1   195 _TXD	=	0x00b1
                           0000B2   196 _INT0	=	0x00b2
                           0000B3   197 _INT1	=	0x00b3
                           0000B4   198 _T0	=	0x00b4
                           0000B5   199 _T1	=	0x00b5
                           0000B6   200 _WR	=	0x00b6
                           0000B7   201 _RD	=	0x00b7
                           0000B8   202 _PX0	=	0x00b8
                           0000B9   203 _PT0	=	0x00b9
                           0000BA   204 _PX1	=	0x00ba
                           0000BB   205 _PT1	=	0x00bb
                           0000BC   206 _PS	=	0x00bc
                           0000D0   207 _P	=	0x00d0
                           0000D1   208 _F1	=	0x00d1
                           0000D2   209 _OV	=	0x00d2
                           0000D3   210 _RS0	=	0x00d3
                           0000D4   211 _RS1	=	0x00d4
                           0000D5   212 _F0	=	0x00d5
                           0000D6   213 _AC	=	0x00d6
                           0000D7   214 _CY	=	0x00d7
                                    215 ;--------------------------------------------------------
                                    216 ; overlayable register banks
                                    217 ;--------------------------------------------------------
                                    218 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        219 	.ds 8
                                    220 ;--------------------------------------------------------
                                    221 ; internal ram data
                                    222 ;--------------------------------------------------------
                                    223 	.area DSEG    (DATA)
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable items in internal ram
                                    226 ;--------------------------------------------------------
                                    227 ;--------------------------------------------------------
                                    228 ; indirectly addressable internal ram data
                                    229 ;--------------------------------------------------------
                                    230 	.area ISEG    (DATA)
                                    231 ;--------------------------------------------------------
                                    232 ; absolute internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area IABS    (ABS,DATA)
                                    235 	.area IABS    (ABS,DATA)
                                    236 ;--------------------------------------------------------
                                    237 ; bit data
                                    238 ;--------------------------------------------------------
                                    239 	.area BSEG    (BIT)
                                    240 ;--------------------------------------------------------
                                    241 ; paged external ram data
                                    242 ;--------------------------------------------------------
                                    243 	.area PSEG    (PAG,XDATA)
                                    244 ;--------------------------------------------------------
                                    245 ; external ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area XSEG    (XDATA)
                                    248 ;--------------------------------------------------------
                                    249 ; absolute external ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area XABS    (ABS,XDATA)
                                    252 ;--------------------------------------------------------
                                    253 ; external initialized ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area XISEG   (XDATA)
                                    256 	.area HOME    (CODE)
                                    257 	.area GSINIT0 (CODE)
                                    258 	.area GSINIT1 (CODE)
                                    259 	.area GSINIT2 (CODE)
                                    260 	.area GSINIT3 (CODE)
                                    261 	.area GSINIT4 (CODE)
                                    262 	.area GSINIT5 (CODE)
                                    263 	.area GSINIT  (CODE)
                                    264 	.area GSFINAL (CODE)
                                    265 	.area CSEG    (CODE)
                                    266 ;--------------------------------------------------------
                                    267 ; global & static initialisations
                                    268 ;--------------------------------------------------------
                                    269 	.area HOME    (CODE)
                                    270 	.area GSINIT  (CODE)
                                    271 	.area GSFINAL (CODE)
                                    272 	.area GSINIT  (CODE)
                                    273 ;--------------------------------------------------------
                                    274 ; Home
                                    275 ;--------------------------------------------------------
                                    276 	.area HOME    (CODE)
                                    277 	.area HOME    (CODE)
                                    278 ;--------------------------------------------------------
                                    279 ; code
                                    280 ;--------------------------------------------------------
                                    281 	.area CSEG    (CODE)
                                    282 ;------------------------------------------------------------
                                    283 ;Allocation info for local variables in function 'AnyButtonPressed'
                                    284 ;------------------------------------------------------------
                                    285 ;	buttonlib.c:10: char AnyButtonPressed(void) {
                                    286 ;	-----------------------------------------
                                    287 ;	 function AnyButtonPressed
                                    288 ;	-----------------------------------------
      00042F                        289 _AnyButtonPressed:
                           000007   290 	ar7 = 0x07
                           000006   291 	ar6 = 0x06
                           000005   292 	ar5 = 0x05
                           000004   293 	ar4 = 0x04
                           000003   294 	ar3 = 0x03
                           000002   295 	ar2 = 0x02
                           000001   296 	ar1 = 0x01
                           000000   297 	ar0 = 0x00
                                    298 ;	buttonlib.c:11: return (P2 == 0xFF)? 0 : 1;/* @@@ Your code here. returns true  if any bits of P2 is 0; false otherwise.. */;
      00042F 74 FF            [12]  299 	mov	a,#0xff
      000431 B5 A0 06         [24]  300 	cjne	a,_P2,00103$
      000434 7E 00            [12]  301 	mov	r6,#0x00
      000436 7F 00            [12]  302 	mov	r7,#0x00
      000438 80 04            [24]  303 	sjmp	00104$
      00043A                        304 00103$:
      00043A 7E 01            [12]  305 	mov	r6,#0x01
      00043C 7F 00            [12]  306 	mov	r7,#0x00
      00043E                        307 00104$:
      00043E 8E 82            [24]  308 	mov	dpl,r6
                                    309 ;	buttonlib.c:12: }
      000440 22               [24]  310 	ret
                                    311 ;------------------------------------------------------------
                                    312 ;Allocation info for local variables in function 'ButtonToChar'
                                    313 ;------------------------------------------------------------
                                    314 ;	buttonlib.c:17: char ButtonToChar(void) {
                                    315 ;	-----------------------------------------
                                    316 ;	 function ButtonToChar
                                    317 ;	-----------------------------------------
      000441                        318 _ButtonToChar:
                                    319 ;	buttonlib.c:18: if ((~P2) & 0x80) {
      000441 AE A0            [24]  320 	mov	r6,_P2
      000443 7F 00            [12]  321 	mov	r7,#0x00
      000445 EE               [12]  322 	mov	a,r6
      000446 F4               [12]  323 	cpl	a
      000447 FE               [12]  324 	mov	r6,a
      000448 EF               [12]  325 	mov	a,r7
      000449 F4               [12]  326 	cpl	a
      00044A EE               [12]  327 	mov	a,r6
      00044B 30 E7 04         [24]  328 	jnb	acc.7,00123$
                                    329 ;	buttonlib.c:19: return '7';
      00044E 75 82 37         [24]  330 	mov	dpl,#0x37
      000451 22               [24]  331 	ret
      000452                        332 00123$:
                                    333 ;	buttonlib.c:21: else if ((~P2) & 0x40){
      000452 AE A0            [24]  334 	mov	r6,_P2
      000454 7F 00            [12]  335 	mov	r7,#0x00
      000456 EE               [12]  336 	mov	a,r6
      000457 F4               [12]  337 	cpl	a
      000458 FE               [12]  338 	mov	r6,a
      000459 EF               [12]  339 	mov	a,r7
      00045A F4               [12]  340 	cpl	a
      00045B EE               [12]  341 	mov	a,r6
      00045C 30 E6 04         [24]  342 	jnb	acc.6,00120$
                                    343 ;	buttonlib.c:22: return '6';
      00045F 75 82 36         [24]  344 	mov	dpl,#0x36
      000462 22               [24]  345 	ret
      000463                        346 00120$:
                                    347 ;	buttonlib.c:24: else if ((~P2) & 0x20){
      000463 AE A0            [24]  348 	mov	r6,_P2
      000465 7F 00            [12]  349 	mov	r7,#0x00
      000467 EE               [12]  350 	mov	a,r6
      000468 F4               [12]  351 	cpl	a
      000469 FE               [12]  352 	mov	r6,a
      00046A EF               [12]  353 	mov	a,r7
      00046B F4               [12]  354 	cpl	a
      00046C EE               [12]  355 	mov	a,r6
      00046D 30 E5 04         [24]  356 	jnb	acc.5,00117$
                                    357 ;	buttonlib.c:25: return '5';
      000470 75 82 35         [24]  358 	mov	dpl,#0x35
      000473 22               [24]  359 	ret
      000474                        360 00117$:
                                    361 ;	buttonlib.c:27: else if ((~P2) & 0x10){
      000474 AE A0            [24]  362 	mov	r6,_P2
      000476 7F 00            [12]  363 	mov	r7,#0x00
      000478 EE               [12]  364 	mov	a,r6
      000479 F4               [12]  365 	cpl	a
      00047A FE               [12]  366 	mov	r6,a
      00047B EF               [12]  367 	mov	a,r7
      00047C F4               [12]  368 	cpl	a
      00047D EE               [12]  369 	mov	a,r6
      00047E 30 E4 04         [24]  370 	jnb	acc.4,00114$
                                    371 ;	buttonlib.c:28: return '4';
      000481 75 82 34         [24]  372 	mov	dpl,#0x34
      000484 22               [24]  373 	ret
      000485                        374 00114$:
                                    375 ;	buttonlib.c:30: else if ((~P2) & 0x08){
      000485 AE A0            [24]  376 	mov	r6,_P2
      000487 7F 00            [12]  377 	mov	r7,#0x00
      000489 EE               [12]  378 	mov	a,r6
      00048A F4               [12]  379 	cpl	a
      00048B FE               [12]  380 	mov	r6,a
      00048C EF               [12]  381 	mov	a,r7
      00048D F4               [12]  382 	cpl	a
      00048E EE               [12]  383 	mov	a,r6
      00048F 30 E3 04         [24]  384 	jnb	acc.3,00111$
                                    385 ;	buttonlib.c:31: return '3';
      000492 75 82 33         [24]  386 	mov	dpl,#0x33
      000495 22               [24]  387 	ret
      000496                        388 00111$:
                                    389 ;	buttonlib.c:33: else if ((~P2) & 0x04){
      000496 AE A0            [24]  390 	mov	r6,_P2
      000498 7F 00            [12]  391 	mov	r7,#0x00
      00049A EE               [12]  392 	mov	a,r6
      00049B F4               [12]  393 	cpl	a
      00049C FE               [12]  394 	mov	r6,a
      00049D EF               [12]  395 	mov	a,r7
      00049E F4               [12]  396 	cpl	a
      00049F EE               [12]  397 	mov	a,r6
      0004A0 30 E2 04         [24]  398 	jnb	acc.2,00108$
                                    399 ;	buttonlib.c:34: return '2';
      0004A3 75 82 32         [24]  400 	mov	dpl,#0x32
      0004A6 22               [24]  401 	ret
      0004A7                        402 00108$:
                                    403 ;	buttonlib.c:36: else if ((~P2) & 0x02){
      0004A7 AE A0            [24]  404 	mov	r6,_P2
      0004A9 7F 00            [12]  405 	mov	r7,#0x00
      0004AB EE               [12]  406 	mov	a,r6
      0004AC F4               [12]  407 	cpl	a
      0004AD FE               [12]  408 	mov	r6,a
      0004AE EF               [12]  409 	mov	a,r7
      0004AF F4               [12]  410 	cpl	a
      0004B0 EE               [12]  411 	mov	a,r6
      0004B1 30 E1 04         [24]  412 	jnb	acc.1,00105$
                                    413 ;	buttonlib.c:37: return '1';
      0004B4 75 82 31         [24]  414 	mov	dpl,#0x31
      0004B7 22               [24]  415 	ret
      0004B8                        416 00105$:
                                    417 ;	buttonlib.c:39: else if ((~P2) & 0x01){
      0004B8 AE A0            [24]  418 	mov	r6,_P2
      0004BA 7F 00            [12]  419 	mov	r7,#0x00
      0004BC EE               [12]  420 	mov	a,r6
      0004BD F4               [12]  421 	cpl	a
      0004BE FE               [12]  422 	mov	r6,a
      0004BF EF               [12]  423 	mov	a,r7
      0004C0 F4               [12]  424 	cpl	a
      0004C1 EE               [12]  425 	mov	a,r6
      0004C2 30 E0 04         [24]  426 	jnb	acc.0,00102$
                                    427 ;	buttonlib.c:40: return '0';
      0004C5 75 82 30         [24]  428 	mov	dpl,#0x30
      0004C8 22               [24]  429 	ret
      0004C9                        430 00102$:
                                    431 ;	buttonlib.c:43: return '\0'; // return empty char
      0004C9 75 82 00         [24]  432 	mov	dpl,#0x00
                                    433 ;	buttonlib.c:47: }
      0004CC 22               [24]  434 	ret
                                    435 	.area CSEG    (CODE)
                                    436 	.area CONST   (CODE)
                                    437 	.area XINIT   (CODE)
                                    438 	.area CABS    (ABS,CODE)
