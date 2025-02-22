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
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _bitmap
                                    111 	.globl _i
                                    112 	.globl _new_stk
                                    113 	.globl _temp_PSW
                                    114 	.globl _temp_SP
                                    115 	.globl _newID
                                    116 	.globl _sft_temp
                                    117 	.globl _savedSP
                                    118 	.globl _currID
                                    119 	.globl _ThreadCreate
                                    120 	.globl _ThreadYield
                                    121 	.globl _ThreadExit
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000031   237 _currID	=	0x0031
                           000035   238 _savedSP	=	0x0035
                           000039   239 _sft_temp	=	0x0039
                           00003A   240 _newID	=	0x003a
                           00003B   241 _temp_SP	=	0x003b
                           00003C   242 _temp_PSW	=	0x003c
                           00003D   243 _new_stk	=	0x003d
                           00003E   244 _i	=	0x003e
                                    245 ;--------------------------------------------------------
                                    246 ; overlayable items in internal ram
                                    247 ;--------------------------------------------------------
                                    248 	.area	OSEG    (OVR,DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; indirectly addressable internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area ISEG    (DATA)
                                    253 ;--------------------------------------------------------
                                    254 ; absolute internal ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area IABS    (ABS,DATA)
      000030                        257 	.org 0x0030
      000030                        258 _bitmap::
      000030                        259 	.ds 1
                                    260 	.area IABS    (ABS,DATA)
                                    261 ;--------------------------------------------------------
                                    262 ; bit data
                                    263 ;--------------------------------------------------------
                                    264 	.area BSEG    (BIT)
      000002                        265 _ThreadYield_sloc0_1_0:
      000002                        266 	.ds 1
      000003                        267 _myTimer0Handler_sloc0_1_0:
      000003                        268 	.ds 1
                                    269 ;--------------------------------------------------------
                                    270 ; paged external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area PSEG    (PAG,XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XSEG    (XDATA)
                                    277 ;--------------------------------------------------------
                                    278 ; absolute external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area XABS    (ABS,XDATA)
                                    281 ;--------------------------------------------------------
                                    282 ; external initialized ram data
                                    283 ;--------------------------------------------------------
                                    284 	.area XISEG   (XDATA)
                                    285 	.area HOME    (CODE)
                                    286 	.area GSINIT0 (CODE)
                                    287 	.area GSINIT1 (CODE)
                                    288 	.area GSINIT2 (CODE)
                                    289 	.area GSINIT3 (CODE)
                                    290 	.area GSINIT4 (CODE)
                                    291 	.area GSINIT5 (CODE)
                                    292 	.area GSINIT  (CODE)
                                    293 	.area GSFINAL (CODE)
                                    294 	.area CSEG    (CODE)
                                    295 ;--------------------------------------------------------
                                    296 ; global & static initialisations
                                    297 ;--------------------------------------------------------
                                    298 	.area HOME    (CODE)
                                    299 	.area GSINIT  (CODE)
                                    300 	.area GSFINAL (CODE)
                                    301 	.area GSINIT  (CODE)
                                    302 ;	preemptive.c:17: __data __at (0x30) char bitmap = 0x00;
      000011 75 30 00         [24]  303 	mov	_bitmap,#0x00
                                    304 ;--------------------------------------------------------
                                    305 ; Home
                                    306 ;--------------------------------------------------------
                                    307 	.area HOME    (CODE)
                                    308 	.area HOME    (CODE)
                                    309 ;--------------------------------------------------------
                                    310 ; code
                                    311 ;--------------------------------------------------------
                                    312 	.area CSEG    (CODE)
                                    313 ;------------------------------------------------------------
                                    314 ;Allocation info for local variables in function 'Bootstrap'
                                    315 ;------------------------------------------------------------
                                    316 ;	preemptive.c:83: void Bootstrap(void)
                                    317 ;	-----------------------------------------
                                    318 ;	 function Bootstrap
                                    319 ;	-----------------------------------------
      00009F                        320 _Bootstrap:
                           000007   321 	ar7 = 0x07
                           000006   322 	ar6 = 0x06
                           000005   323 	ar5 = 0x05
                           000004   324 	ar4 = 0x04
                           000003   325 	ar3 = 0x03
                           000002   326 	ar2 = 0x02
                           000001   327 	ar1 = 0x01
                           000000   328 	ar0 = 0x00
                                    329 ;	preemptive.c:98: TMOD = 0; // timer 0 mode 0
      00009F 75 89 00         [24]  330 	mov	_TMOD,#0x00
                                    331 ;	preemptive.c:99: IE = 0x82;
      0000A2 75 A8 82         [24]  332 	mov	_IE,#0x82
                                    333 ;	preemptive.c:102: TR0 = 1; // set bit TR0 to start running timer 0
                                    334 ;	assignBit
      0000A5 D2 8C            [12]  335 	setb	_TR0
                                    336 ;	preemptive.c:103: currID = ThreadCreate(main);
      0000A7 90 00 85         [24]  337 	mov	dptr,#_main
      0000AA 12 00 C2         [24]  338 	lcall	_ThreadCreate
      0000AD 85 82 31         [24]  339 	mov	_currID,dpl
                                    340 ;	preemptive.c:104: RESTORESTATE;
      0000B0 E5 31            [12]  341 	mov	a,_currID
      0000B2 24 35            [12]  342 	add	a,#_savedSP
      0000B4 F9               [12]  343 	mov	r1,a
      0000B5 87 81            [24]  344 	mov	_SP,@r1
      0000B7 D0 D0            [24]  345 	POP PSW 
      0000B9 D0 83            [24]  346 	POP DPH 
      0000BB D0 82            [24]  347 	POP DPL 
      0000BD D0 F0            [24]  348 	POP B 
      0000BF D0 E0            [24]  349 	POP ACC 
                                    350 ;	preemptive.c:106: }
      0000C1 22               [24]  351 	ret
                                    352 ;------------------------------------------------------------
                                    353 ;Allocation info for local variables in function 'ThreadCreate'
                                    354 ;------------------------------------------------------------
                                    355 ;fp                        Allocated to registers 
                                    356 ;------------------------------------------------------------
                                    357 ;	preemptive.c:114: ThreadID ThreadCreate(FunctionPtr fp)
                                    358 ;	-----------------------------------------
                                    359 ;	 function ThreadCreate
                                    360 ;	-----------------------------------------
      0000C2                        361 _ThreadCreate:
      0000C2 D3               [12]  362 	setb	c
      0000C3 10 AF 01         [24]  363 	jbc	ea,00127$
      0000C6 C3               [12]  364 	clr	c
      0000C7                        365 00127$:
      0000C7 C0 D0            [24]  366 	push	psw
                                    367 ;	preemptive.c:121: if (bitmap == 15)
      0000C9 74 0F            [12]  368 	mov	a,#0x0f
      0000CB B5 30 06         [24]  369 	cjne	a,_bitmap,00102$
                                    370 ;	preemptive.c:122: return -1;
      0000CE 75 82 FF         [24]  371 	mov	dpl,#0xff
      0000D1 02 01 5A         [24]  372 	ljmp	00109$
      0000D4                        373 00102$:
                                    374 ;	preemptive.c:135: for (i = 0;i < 4;i ++){
      0000D4 75 3E 00         [24]  375 	mov	_i,#0x00
      0000D7                        376 00107$:
      0000D7 74 FC            [12]  377 	mov	a,#0x100 - 0x04
      0000D9 25 3E            [12]  378 	add	a,_i
      0000DB 40 41            [24]  379 	jc	00105$
                                    380 ;	preemptive.c:136: if (!(bitmap & (1 << i))){
      0000DD AF 3E            [24]  381 	mov	r7,_i
      0000DF 8F F0            [24]  382 	mov	b,r7
      0000E1 05 F0            [12]  383 	inc	b
      0000E3 7F 01            [12]  384 	mov	r7,#0x01
      0000E5 7E 00            [12]  385 	mov	r6,#0x00
      0000E7 80 06            [24]  386 	sjmp	00132$
      0000E9                        387 00131$:
      0000E9 EF               [12]  388 	mov	a,r7
      0000EA 2F               [12]  389 	add	a,r7
      0000EB FF               [12]  390 	mov	r7,a
      0000EC EE               [12]  391 	mov	a,r6
      0000ED 33               [12]  392 	rlc	a
      0000EE FE               [12]  393 	mov	r6,a
      0000EF                        394 00132$:
      0000EF D5 F0 F7         [24]  395 	djnz	b,00131$
      0000F2 AC 30            [24]  396 	mov	r4,_bitmap
      0000F4 7D 00            [12]  397 	mov	r5,#0x00
      0000F6 EC               [12]  398 	mov	a,r4
      0000F7 52 07            [12]  399 	anl	ar7,a
      0000F9 ED               [12]  400 	mov	a,r5
      0000FA 52 06            [12]  401 	anl	ar6,a
      0000FC EF               [12]  402 	mov	a,r7
      0000FD 4E               [12]  403 	orl	a,r6
      0000FE 70 17            [24]  404 	jnz	00108$
                                    405 ;	preemptive.c:138: bitmap |= (1 << i);
      000100 AF 3E            [24]  406 	mov	r7,_i
      000102 8F F0            [24]  407 	mov	b,r7
      000104 05 F0            [12]  408 	inc	b
      000106 74 01            [12]  409 	mov	a,#0x01
      000108 80 02            [24]  410 	sjmp	00136$
      00010A                        411 00134$:
      00010A 25 E0            [12]  412 	add	a,acc
      00010C                        413 00136$:
      00010C D5 F0 FB         [24]  414 	djnz	b,00134$
      00010F FF               [12]  415 	mov	r7,a
      000110 42 30            [12]  416 	orl	_bitmap,a
                                    417 ;	preemptive.c:139: newID = i;
      000112 85 3E 3A         [24]  418 	mov	_newID,_i
                                    419 ;	preemptive.c:140: break;
      000115 80 07            [24]  420 	sjmp	00105$
      000117                        421 00108$:
                                    422 ;	preemptive.c:135: for (i = 0;i < 4;i ++){
      000117 E5 3E            [12]  423 	mov	a,_i
      000119 04               [12]  424 	inc	a
      00011A F5 3E            [12]  425 	mov	_i,a
      00011C 80 B9            [24]  426 	sjmp	00107$
      00011E                        427 00105$:
                                    428 ;	preemptive.c:147: new_stk = (0x3F) + (0x10)*newID;
      00011E E5 3A            [12]  429 	mov	a,_newID
      000120 C4               [12]  430 	swap	a
      000121 54 F0            [12]  431 	anl	a,#0xf0
      000123 FF               [12]  432 	mov	r7,a
      000124 24 3F            [12]  433 	add	a,#0x3f
      000126 F5 3D            [12]  434 	mov	_new_stk,a
                                    435 ;	preemptive.c:152: temp_SP = SP;
      000128 85 81 3B         [24]  436 	mov	_temp_SP,_SP
                                    437 ;	preemptive.c:153: SP = new_stk;
      00012B 85 3D 81         [24]  438 	mov	_SP,_new_stk
                                    439 ;	preemptive.c:167: __endasm;
      00012E C0 82            [24]  440 	PUSH	DPL
      000130 C0 83            [24]  441 	PUSH	DPH
                                    442 ;	preemptive.c:181: __endasm;
      000132 74 00            [12]  443 	MOV	A, #0
      000134 C0 E0            [24]  444 	PUSH	ACC
      000136 C0 E0            [24]  445 	PUSH	ACC
      000138 C0 E0            [24]  446 	PUSH	ACC
      00013A C0 E0            [24]  447 	PUSH	ACC
                                    448 ;	preemptive.c:195: temp_PSW = PSW;
      00013C 85 D0 3C         [24]  449 	mov	_temp_PSW,_PSW
                                    450 ;	preemptive.c:196: PSW = newID << 3;
      00013F E5 3A            [12]  451 	mov	a,_newID
      000141 FF               [12]  452 	mov	r7,a
      000142 C4               [12]  453 	swap	a
      000143 03               [12]  454 	rr	a
      000144 54 F8            [12]  455 	anl	a,#0xf8
      000146 F5 D0            [12]  456 	mov	_PSW,a
                                    457 ;	preemptive.c:199: __endasm;
      000148 C0 D0            [24]  458 	PUSH	PSW
                                    459 ;	preemptive.c:200: PSW = temp_PSW;
      00014A 85 3C D0         [24]  460 	mov	_PSW,_temp_PSW
                                    461 ;	preemptive.c:205: savedSP[newID] = SP;
      00014D E5 3A            [12]  462 	mov	a,_newID
      00014F 24 35            [12]  463 	add	a,#_savedSP
      000151 F8               [12]  464 	mov	r0,a
      000152 A6 81            [24]  465 	mov	@r0,_SP
                                    466 ;	preemptive.c:209: SP = temp_SP;
      000154 85 3B 81         [24]  467 	mov	_SP,_temp_SP
                                    468 ;	preemptive.c:213: return newID;
      000157 85 3A 82         [24]  469 	mov	dpl,_newID
      00015A                        470 00109$:
                                    471 ;	preemptive.c:216: }
      00015A D0 D0            [24]  472 	pop	psw
      00015C 92 AF            [24]  473 	mov	ea,c
      00015E 22               [24]  474 	ret
                                    475 ;------------------------------------------------------------
                                    476 ;Allocation info for local variables in function 'ThreadYield'
                                    477 ;------------------------------------------------------------
                                    478 ;	preemptive.c:225: void ThreadYield(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function ThreadYield
                                    481 ;	-----------------------------------------
      00015F                        482 _ThreadYield:
      00015F D3               [12]  483 	setb	c
      000160 10 AF 01         [24]  484 	jbc	ea,00122$
      000163 C3               [12]  485 	clr	c
      000164                        486 00122$:
      000164 C0 D0            [24]  487 	push	psw
                                    488 ;	preemptive.c:227: SAVESTATE;
      000166 C0 E0            [24]  489 	PUSH ACC 
      000168 C0 F0            [24]  490 	PUSH B 
      00016A C0 82            [24]  491 	PUSH DPL 
      00016C C0 83            [24]  492 	PUSH DPH 
      00016E C0 D0            [24]  493 	PUSH PSW 
      000170 E5 31            [12]  494 	mov	a,_currID
      000172 24 35            [12]  495 	add	a,#_savedSP
      000174 F8               [12]  496 	mov	r0,a
      000175 A6 81            [24]  497 	mov	@r0,_SP
                                    498 ;	preemptive.c:229: do
      000177                        499 00103$:
                                    500 ;	preemptive.c:241: currID = ((currID >= 3)? 0 : (currID + 1));
      000177 C3               [12]  501 	clr	c
      000178 E5 31            [12]  502 	mov	a,_currID
      00017A 94 03            [12]  503 	subb	a,#0x03
      00017C 92 02            [24]  504 	mov	_ThreadYield_sloc0_1_0,c
      00017E 40 06            [24]  505 	jc	00108$
      000180 7E 00            [12]  506 	mov	r6,#0x00
      000182 7F 00            [12]  507 	mov	r7,#0x00
      000184 80 09            [24]  508 	sjmp	00109$
      000186                        509 00108$:
      000186 AD 31            [24]  510 	mov	r5,_currID
      000188 0D               [12]  511 	inc	r5
      000189 ED               [12]  512 	mov	a,r5
      00018A FE               [12]  513 	mov	r6,a
      00018B 33               [12]  514 	rlc	a
      00018C 95 E0            [12]  515 	subb	a,acc
      00018E FF               [12]  516 	mov	r7,a
      00018F                        517 00109$:
      00018F 8E 31            [24]  518 	mov	_currID,r6
                                    519 ;	preemptive.c:242: if (bitmap & (1 << currID)){
      000191 AF 31            [24]  520 	mov	r7,_currID
      000193 8F F0            [24]  521 	mov	b,r7
      000195 05 F0            [12]  522 	inc	b
      000197 7F 01            [12]  523 	mov	r7,#0x01
      000199 7E 00            [12]  524 	mov	r6,#0x00
      00019B 80 06            [24]  525 	sjmp	00125$
      00019D                        526 00124$:
      00019D EF               [12]  527 	mov	a,r7
      00019E 2F               [12]  528 	add	a,r7
      00019F FF               [12]  529 	mov	r7,a
      0001A0 EE               [12]  530 	mov	a,r6
      0001A1 33               [12]  531 	rlc	a
      0001A2 FE               [12]  532 	mov	r6,a
      0001A3                        533 00125$:
      0001A3 D5 F0 F7         [24]  534 	djnz	b,00124$
      0001A6 AC 30            [24]  535 	mov	r4,_bitmap
      0001A8 7D 00            [12]  536 	mov	r5,#0x00
      0001AA EC               [12]  537 	mov	a,r4
      0001AB 52 07            [12]  538 	anl	ar7,a
      0001AD ED               [12]  539 	mov	a,r5
      0001AE 52 06            [12]  540 	anl	ar6,a
      0001B0 EF               [12]  541 	mov	a,r7
      0001B1 4E               [12]  542 	orl	a,r6
      0001B2 60 C3            [24]  543 	jz	00103$
                                    544 ;	preemptive.c:248: RESTORESTATE;
      0001B4 E5 31            [12]  545 	mov	a,_currID
      0001B6 24 35            [12]  546 	add	a,#_savedSP
      0001B8 F9               [12]  547 	mov	r1,a
      0001B9 87 81            [24]  548 	mov	_SP,@r1
      0001BB D0 D0            [24]  549 	POP PSW 
      0001BD D0 83            [24]  550 	POP DPH 
      0001BF D0 82            [24]  551 	POP DPL 
      0001C1 D0 F0            [24]  552 	POP B 
      0001C3 D0 E0            [24]  553 	POP ACC 
                                    554 ;	preemptive.c:249: }
      0001C5 D0 D0            [24]  555 	pop	psw
      0001C7 92 AF            [24]  556 	mov	ea,c
      0001C9 22               [24]  557 	ret
                                    558 ;------------------------------------------------------------
                                    559 ;Allocation info for local variables in function 'myTimer0Handler'
                                    560 ;------------------------------------------------------------
                                    561 ;	preemptive.c:251: void myTimer0Handler(void){
                                    562 ;	-----------------------------------------
                                    563 ;	 function myTimer0Handler
                                    564 ;	-----------------------------------------
      0001CA                        565 _myTimer0Handler:
                                    566 ;	preemptive.c:252: EA = 0;
                                    567 ;	assignBit
      0001CA C2 AF            [12]  568 	clr	_EA
                                    569 ;	preemptive.c:253: SAVESTATE;
      0001CC C0 E0            [24]  570 	PUSH ACC 
      0001CE C0 F0            [24]  571 	PUSH B 
      0001D0 C0 82            [24]  572 	PUSH DPL 
      0001D2 C0 83            [24]  573 	PUSH DPH 
      0001D4 C0 D0            [24]  574 	PUSH PSW 
      0001D6 E5 31            [12]  575 	mov	a,_currID
      0001D8 24 35            [12]  576 	add	a,#_savedSP
      0001DA F8               [12]  577 	mov	r0,a
      0001DB A6 81            [24]  578 	mov	@r0,_SP
                                    579 ;	preemptive.c:271: __endasm;
      0001DD E8               [12]  580 	MOV	A, R0
      0001DE C0 E0            [24]  581 	PUSH	ACC
      0001E0 E9               [12]  582 	MOV	A, R1
      0001E1 C0 E0            [24]  583 	PUSH	ACC
      0001E3 EA               [12]  584 	MOV	A, R2
      0001E4 C0 E0            [24]  585 	PUSH	ACC
      0001E6 EB               [12]  586 	MOV	A, R3
      0001E7 C0 E0            [24]  587 	PUSH	ACC
      0001E9 EC               [12]  588 	MOV	A, R4
      0001EA C0 E0            [24]  589 	PUSH	ACC
      0001EC ED               [12]  590 	MOV	A, R5
      0001ED C0 E0            [24]  591 	PUSH	ACC
      0001EF EE               [12]  592 	MOV	A, R6
      0001F0 C0 E0            [24]  593 	PUSH	ACC
      0001F2 EF               [12]  594 	MOV	A, R7
      0001F3 C0 E0            [24]  595 	PUSH	ACC
                                    596 ;	preemptive.c:273: do
      0001F5                        597 00109$:
                                    598 ;	preemptive.c:285: currID = ((currID >= 3)? 0 : (currID + 1));
      0001F5 C3               [12]  599 	clr	c
      0001F6 E5 31            [12]  600 	mov	a,_currID
      0001F8 94 03            [12]  601 	subb	a,#0x03
      0001FA 92 03            [24]  602 	mov	_myTimer0Handler_sloc0_1_0,c
      0001FC 40 06            [24]  603 	jc	00114$
      0001FE 7E 00            [12]  604 	mov	r6,#0x00
      000200 7F 00            [12]  605 	mov	r7,#0x00
      000202 80 09            [24]  606 	sjmp	00115$
      000204                        607 00114$:
      000204 AD 31            [24]  608 	mov	r5,_currID
      000206 0D               [12]  609 	inc	r5
      000207 ED               [12]  610 	mov	a,r5
      000208 FE               [12]  611 	mov	r6,a
      000209 33               [12]  612 	rlc	a
      00020A 95 E0            [12]  613 	subb	a,acc
      00020C FF               [12]  614 	mov	r7,a
      00020D                        615 00115$:
      00020D 8E 31            [24]  616 	mov	_currID,r6
                                    617 ;	preemptive.c:286: switch (currID)
      00020F E5 31            [12]  618 	mov	a,_currID
      000211 FF               [12]  619 	mov	r7,a
      000212 24 FC            [12]  620 	add	a,#0xff - 0x03
      000214 40 20            [24]  621 	jc	00106$
      000216 EF               [12]  622 	mov	a,r7
      000217 2F               [12]  623 	add	a,r7
                                    624 ;	preemptive.c:288: case 0:
      000218 90 02 1C         [24]  625 	mov	dptr,#00134$
      00021B 73               [24]  626 	jmp	@a+dptr
      00021C                        627 00134$:
      00021C 80 06            [24]  628 	sjmp	00101$
      00021E 80 09            [24]  629 	sjmp	00102$
      000220 80 0C            [24]  630 	sjmp	00103$
      000222 80 0F            [24]  631 	sjmp	00104$
      000224                        632 00101$:
                                    633 ;	preemptive.c:289: sft_temp = 1;
      000224 75 39 01         [24]  634 	mov	_sft_temp,#0x01
                                    635 ;	preemptive.c:290: break;
                                    636 ;	preemptive.c:291: case 1:
      000227 80 0D            [24]  637 	sjmp	00106$
      000229                        638 00102$:
                                    639 ;	preemptive.c:292: sft_temp = 2;
      000229 75 39 02         [24]  640 	mov	_sft_temp,#0x02
                                    641 ;	preemptive.c:293: break;
                                    642 ;	preemptive.c:294: case 2:
      00022C 80 08            [24]  643 	sjmp	00106$
      00022E                        644 00103$:
                                    645 ;	preemptive.c:295: sft_temp = 4;
      00022E 75 39 04         [24]  646 	mov	_sft_temp,#0x04
                                    647 ;	preemptive.c:296: break;
                                    648 ;	preemptive.c:297: case 3:
      000231 80 03            [24]  649 	sjmp	00106$
      000233                        650 00104$:
                                    651 ;	preemptive.c:298: sft_temp = 8;
      000233 75 39 08         [24]  652 	mov	_sft_temp,#0x08
                                    653 ;	preemptive.c:303: }
      000236                        654 00106$:
                                    655 ;	preemptive.c:304: if (bitmap & sft_temp){
      000236 E5 39            [12]  656 	mov	a,_sft_temp
      000238 55 30            [12]  657 	anl	a,_bitmap
      00023A 60 B9            [24]  658 	jz	00109$
                                    659 ;	preemptive.c:327: __endasm;  
      00023C D0 E0            [24]  660 	POP	ACC
      00023E FF               [12]  661 	MOV	R7, A
      00023F D0 E0            [24]  662 	POP	ACC
      000241 FE               [12]  663 	MOV	R6, A
      000242 D0 E0            [24]  664 	POP	ACC
      000244 FD               [12]  665 	MOV	R5, A
      000245 D0 E0            [24]  666 	POP	ACC
      000247 FC               [12]  667 	MOV	R4, A
      000248 D0 E0            [24]  668 	POP	ACC
      00024A FB               [12]  669 	MOV	R3, A
      00024B D0 E0            [24]  670 	POP	ACC
      00024D FA               [12]  671 	MOV	R2, A
      00024E D0 E0            [24]  672 	POP	ACC
      000250 F9               [12]  673 	MOV	R1, A
      000251 D0 E0            [24]  674 	POP	ACC
      000253 F8               [12]  675 	MOV	R0, A
                                    676 ;	preemptive.c:329: RESTORESTATE;
      000254 E5 31            [12]  677 	mov	a,_currID
      000256 24 35            [12]  678 	add	a,#_savedSP
      000258 F9               [12]  679 	mov	r1,a
      000259 87 81            [24]  680 	mov	_SP,@r1
      00025B D0 D0            [24]  681 	POP PSW 
      00025D D0 83            [24]  682 	POP DPH 
      00025F D0 82            [24]  683 	POP DPL 
      000261 D0 F0            [24]  684 	POP B 
      000263 D0 E0            [24]  685 	POP ACC 
                                    686 ;	preemptive.c:330: EA = 1;
                                    687 ;	assignBit
      000265 D2 AF            [12]  688 	setb	_EA
                                    689 ;	preemptive.c:333: __endasm;
      000267 32               [24]  690 	RETI
                                    691 ;	preemptive.c:334: }
      000268 22               [24]  692 	ret
                                    693 ;------------------------------------------------------------
                                    694 ;Allocation info for local variables in function 'ThreadExit'
                                    695 ;------------------------------------------------------------
                                    696 ;	preemptive.c:341: void ThreadExit(void)
                                    697 ;	-----------------------------------------
                                    698 ;	 function ThreadExit
                                    699 ;	-----------------------------------------
      000269                        700 _ThreadExit:
      000269 D3               [12]  701 	setb	c
      00026A 10 AF 01         [24]  702 	jbc	ea,00103$
      00026D C3               [12]  703 	clr	c
      00026E                        704 00103$:
      00026E C0 D0            [24]  705 	push	psw
                                    706 ;	preemptive.c:350: RESTORESTATE;
      000270 E5 31            [12]  707 	mov	a,_currID
      000272 24 35            [12]  708 	add	a,#_savedSP
      000274 F9               [12]  709 	mov	r1,a
      000275 87 81            [24]  710 	mov	_SP,@r1
      000277 D0 D0            [24]  711 	POP PSW 
      000279 D0 83            [24]  712 	POP DPH 
      00027B D0 82            [24]  713 	POP DPL 
      00027D D0 F0            [24]  714 	POP B 
      00027F D0 E0            [24]  715 	POP ACC 
                                    716 ;	preemptive.c:351: }
      000281 D0 D0            [24]  717 	pop	psw
      000283 92 AF            [24]  718 	mov	ea,c
      000285 22               [24]  719 	ret
                                    720 	.area CSEG    (CODE)
                                    721 	.area CONST   (CODE)
                                    722 	.area XINIT   (CODE)
                                    723 	.area CABS    (ABS,CODE)
