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
                                    111 	.globl _temp
                                    112 	.globl _temp_SP
                                    113 	.globl _savedSP
                                    114 	.globl _newID
                                    115 	.globl _currID
                                    116 	.globl _ThreadCreate
                                    117 	.globl _ThreadYield
                                    118 	.globl _ThreadExit
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
                           000031   234 _currID	=	0x0031
                           000033   235 _newID	=	0x0033
                           000037   236 _savedSP	=	0x0037
                           000071   237 _temp_SP	=	0x0071
                           000072   238 _temp	=	0x0072
                                    239 ;--------------------------------------------------------
                                    240 ; overlayable items in internal ram
                                    241 ;--------------------------------------------------------
                                    242 	.area	OSEG    (OVR,DATA)
                                    243 	.area	OSEG    (OVR,DATA)
                                    244 ;--------------------------------------------------------
                                    245 ; indirectly addressable internal ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area ISEG    (DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; absolute internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area IABS    (ABS,DATA)
      000030                        252 	.org 0x0030
      000030                        253 _bitmap::
      000030                        254 	.ds 1
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
      000004                        260 _ThreadYield_sloc0_1_0:
      000004                        261 	.ds 1
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
                                    289 ; global & static initialisations
                                    290 ;--------------------------------------------------------
                                    291 	.area HOME    (CODE)
                                    292 	.area GSINIT  (CODE)
                                    293 	.area GSFINAL (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 ;	preemptive.c:17: __data __at (0x30) char bitmap = 0x00;
      000017 75 30 00         [24]  296 	mov	_bitmap,#0x00
                                    297 ;--------------------------------------------------------
                                    298 ; Home
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
                                    301 	.area HOME    (CODE)
                                    302 ;--------------------------------------------------------
                                    303 ; code
                                    304 ;--------------------------------------------------------
                                    305 	.area CSEG    (CODE)
                                    306 ;------------------------------------------------------------
                                    307 ;Allocation info for local variables in function 'Bootstrap'
                                    308 ;------------------------------------------------------------
                                    309 ;	preemptive.c:80: void Bootstrap(void)
                                    310 ;	-----------------------------------------
                                    311 ;	 function Bootstrap
                                    312 ;	-----------------------------------------
      000165                        313 _Bootstrap:
                           000007   314 	ar7 = 0x07
                           000006   315 	ar6 = 0x06
                           000005   316 	ar5 = 0x05
                           000004   317 	ar4 = 0x04
                           000003   318 	ar3 = 0x03
                           000002   319 	ar2 = 0x02
                           000001   320 	ar1 = 0x01
                           000000   321 	ar0 = 0x00
                                    322 ;	preemptive.c:95: TMOD = 0; // timer 0 mode 0
      000165 75 89 00         [24]  323 	mov	_TMOD,#0x00
                                    324 ;	preemptive.c:96: IE = 0x82; // enable timer 0 interrupt; keep consumer polling EA - ET2 ES ET1 EX1 ET0 EX0
      000168 75 A8 82         [24]  325 	mov	_IE,#0x82
                                    326 ;	preemptive.c:97: TR0 = 1; // set bit TR0 to start running timer 0
                                    327 ;	assignBit
      00016B D2 8C            [12]  328 	setb	_TR0
                                    329 ;	preemptive.c:98: currID = ThreadCreate(main);
      00016D 90 01 34         [24]  330 	mov	dptr,#_main
      000170 12 01 88         [24]  331 	lcall	_ThreadCreate
      000173 85 82 31         [24]  332 	mov	_currID,dpl
                                    333 ;	preemptive.c:99: RESTORESTATE;
      000176 E5 31            [12]  334 	mov	a,_currID
      000178 24 37            [12]  335 	add	a,#_savedSP
      00017A F9               [12]  336 	mov	r1,a
      00017B 87 81            [24]  337 	mov	_SP,@r1
      00017D D0 D0            [24]  338 	POP PSW 
      00017F D0 83            [24]  339 	POP DPH 
      000181 D0 82            [24]  340 	POP DPL 
      000183 D0 F0            [24]  341 	POP B 
      000185 D0 E0            [24]  342 	POP ACC 
                                    343 ;	preemptive.c:101: }
      000187 22               [24]  344 	ret
                                    345 ;------------------------------------------------------------
                                    346 ;Allocation info for local variables in function 'ThreadCreate'
                                    347 ;------------------------------------------------------------
                                    348 ;fp                        Allocated to registers 
                                    349 ;i                         Allocated to registers r7 
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:109: ThreadID ThreadCreate(FunctionPtr fp)
                                    352 ;	-----------------------------------------
                                    353 ;	 function ThreadCreate
                                    354 ;	-----------------------------------------
      000188                        355 _ThreadCreate:
      000188 D3               [12]  356 	setb	c
      000189 10 AF 01         [24]  357 	jbc	ea,00122$
      00018C C3               [12]  358 	clr	c
      00018D                        359 00122$:
      00018D C0 D0            [24]  360 	push	psw
                                    361 ;	preemptive.c:116: if (bitmap == 15)
      00018F 74 0F            [12]  362 	mov	a,#0x0f
      000191 B5 30 06         [24]  363 	cjne	a,_bitmap,00102$
                                    364 ;	preemptive.c:117: return -1;
      000194 75 82 FF         [24]  365 	mov	dpl,#0xff
      000197 02 02 13         [24]  366 	ljmp	00108$
      00019A                        367 00102$:
                                    368 ;	preemptive.c:131: for (i = 0;i < 4;i ++){
      00019A 7F 00            [12]  369 	mov	r7,#0x00
      00019C 7E 00            [12]  370 	mov	r6,#0x00
      00019E                        371 00106$:
                                    372 ;	preemptive.c:132: if (!(bitmap & (1 << i))){
      00019E 8E F0            [24]  373 	mov	b,r6
      0001A0 05 F0            [12]  374 	inc	b
      0001A2 7C 01            [12]  375 	mov	r4,#0x01
      0001A4 7D 00            [12]  376 	mov	r5,#0x00
      0001A6 80 06            [24]  377 	sjmp	00126$
      0001A8                        378 00125$:
      0001A8 EC               [12]  379 	mov	a,r4
      0001A9 2C               [12]  380 	add	a,r4
      0001AA FC               [12]  381 	mov	r4,a
      0001AB ED               [12]  382 	mov	a,r5
      0001AC 33               [12]  383 	rlc	a
      0001AD FD               [12]  384 	mov	r5,a
      0001AE                        385 00126$:
      0001AE D5 F0 F7         [24]  386 	djnz	b,00125$
      0001B1 AA 30            [24]  387 	mov	r2,_bitmap
      0001B3 7B 00            [12]  388 	mov	r3,#0x00
      0001B5 EA               [12]  389 	mov	a,r2
      0001B6 52 04            [12]  390 	anl	ar4,a
      0001B8 EB               [12]  391 	mov	a,r3
      0001B9 52 05            [12]  392 	anl	ar5,a
      0001BB EC               [12]  393 	mov	a,r4
      0001BC 4D               [12]  394 	orl	a,r5
      0001BD 70 16            [24]  395 	jnz	00107$
                                    396 ;	preemptive.c:134: bitmap |= (1 << i);
      0001BF 8F 05            [24]  397 	mov	ar5,r7
      0001C1 8D F0            [24]  398 	mov	b,r5
      0001C3 05 F0            [12]  399 	inc	b
      0001C5 74 01            [12]  400 	mov	a,#0x01
      0001C7 80 02            [24]  401 	sjmp	00130$
      0001C9                        402 00128$:
      0001C9 25 E0            [12]  403 	add	a,acc
      0001CB                        404 00130$:
      0001CB D5 F0 FB         [24]  405 	djnz	b,00128$
      0001CE FD               [12]  406 	mov	r5,a
      0001CF 42 30            [12]  407 	orl	_bitmap,a
                                    408 ;	preemptive.c:135: newID = i;
      0001D1 8F 33            [24]  409 	mov	_newID,r7
                                    410 ;	preemptive.c:136: break;
      0001D3 80 08            [24]  411 	sjmp	00105$
      0001D5                        412 00107$:
                                    413 ;	preemptive.c:131: for (i = 0;i < 4;i ++){
      0001D5 0E               [12]  414 	inc	r6
      0001D6 8E 07            [24]  415 	mov	ar7,r6
      0001D8 BE 04 00         [24]  416 	cjne	r6,#0x04,00131$
      0001DB                        417 00131$:
      0001DB 40 C1            [24]  418 	jc	00106$
      0001DD                        419 00105$:
                                    420 ;	preemptive.c:143: temp = (0x3F) + (0x10)*newID;
      0001DD E5 33            [12]  421 	mov	a,_newID
      0001DF C4               [12]  422 	swap	a
      0001E0 54 F0            [12]  423 	anl	a,#0xf0
      0001E2 FF               [12]  424 	mov	r7,a
      0001E3 24 3F            [12]  425 	add	a,#0x3f
      0001E5 F5 72            [12]  426 	mov	_temp,a
                                    427 ;	preemptive.c:148: temp_SP = SP;
      0001E7 85 81 71         [24]  428 	mov	_temp_SP,_SP
                                    429 ;	preemptive.c:149: SP = temp;
      0001EA 85 72 81         [24]  430 	mov	_SP,_temp
                                    431 ;	preemptive.c:162: __endasm;
      0001ED C0 82            [24]  432 	PUSH	DPL
      0001EF C0 83            [24]  433 	PUSH	DPH
                                    434 ;	preemptive.c:176: __endasm;
      0001F1 74 00            [12]  435 	MOV	A, #0
      0001F3 C0 E0            [24]  436 	PUSH	ACC
      0001F5 C0 E0            [24]  437 	PUSH	ACC
      0001F7 C0 E0            [24]  438 	PUSH	ACC
      0001F9 C0 E0            [24]  439 	PUSH	ACC
                                    440 ;	preemptive.c:191: temp = newID << 3;
      0001FB E5 33            [12]  441 	mov	a,_newID
      0001FD FF               [12]  442 	mov	r7,a
      0001FE C4               [12]  443 	swap	a
      0001FF 03               [12]  444 	rr	a
      000200 54 F8            [12]  445 	anl	a,#0xf8
      000202 F5 72            [12]  446 	mov	_temp,a
                                    447 ;	preemptive.c:194: __endasm;
      000204 C0 72            [24]  448 	PUSH	_temp
                                    449 ;	preemptive.c:200: savedSP[newID] = SP;
      000206 E5 33            [12]  450 	mov	a,_newID
      000208 24 37            [12]  451 	add	a,#_savedSP
      00020A F8               [12]  452 	mov	r0,a
      00020B A6 81            [24]  453 	mov	@r0,_SP
                                    454 ;	preemptive.c:204: SP = temp_SP;
      00020D 85 71 81         [24]  455 	mov	_SP,_temp_SP
                                    456 ;	preemptive.c:208: return newID;
      000210 85 33 82         [24]  457 	mov	dpl,_newID
      000213                        458 00108$:
                                    459 ;	preemptive.c:211: }
      000213 D0 D0            [24]  460 	pop	psw
      000215 92 AF            [24]  461 	mov	ea,c
      000217 22               [24]  462 	ret
                                    463 ;------------------------------------------------------------
                                    464 ;Allocation info for local variables in function 'ThreadYield'
                                    465 ;------------------------------------------------------------
                                    466 ;	preemptive.c:220: void ThreadYield(void)
                                    467 ;	-----------------------------------------
                                    468 ;	 function ThreadYield
                                    469 ;	-----------------------------------------
      000218                        470 _ThreadYield:
      000218 D3               [12]  471 	setb	c
      000219 10 AF 01         [24]  472 	jbc	ea,00122$
      00021C C3               [12]  473 	clr	c
      00021D                        474 00122$:
      00021D C0 D0            [24]  475 	push	psw
                                    476 ;	preemptive.c:222: SAVESTATE;
      00021F C0 E0            [24]  477 	PUSH ACC 
      000221 C0 F0            [24]  478 	PUSH B 
      000223 C0 82            [24]  479 	PUSH DPL 
      000225 C0 83            [24]  480 	PUSH DPH 
      000227 C0 D0            [24]  481 	PUSH PSW 
      000229 E5 31            [12]  482 	mov	a,_currID
      00022B 24 37            [12]  483 	add	a,#_savedSP
      00022D F8               [12]  484 	mov	r0,a
      00022E A6 81            [24]  485 	mov	@r0,_SP
                                    486 ;	preemptive.c:224: do
      000230                        487 00103$:
                                    488 ;	preemptive.c:236: currID = ((currID >= 3)? 0 : (currID + 1));
      000230 C3               [12]  489 	clr	c
      000231 E5 31            [12]  490 	mov	a,_currID
      000233 94 03            [12]  491 	subb	a,#0x03
      000235 92 04            [24]  492 	mov	_ThreadYield_sloc0_1_0,c
      000237 40 06            [24]  493 	jc	00108$
      000239 7E 00            [12]  494 	mov	r6,#0x00
      00023B 7F 00            [12]  495 	mov	r7,#0x00
      00023D 80 09            [24]  496 	sjmp	00109$
      00023F                        497 00108$:
      00023F AD 31            [24]  498 	mov	r5,_currID
      000241 0D               [12]  499 	inc	r5
      000242 ED               [12]  500 	mov	a,r5
      000243 FE               [12]  501 	mov	r6,a
      000244 33               [12]  502 	rlc	a
      000245 95 E0            [12]  503 	subb	a,acc
      000247 FF               [12]  504 	mov	r7,a
      000248                        505 00109$:
      000248 8E 31            [24]  506 	mov	_currID,r6
                                    507 ;	preemptive.c:237: if (bitmap & (1 << currID)){
      00024A AF 31            [24]  508 	mov	r7,_currID
      00024C 8F F0            [24]  509 	mov	b,r7
      00024E 05 F0            [12]  510 	inc	b
      000250 7F 01            [12]  511 	mov	r7,#0x01
      000252 7E 00            [12]  512 	mov	r6,#0x00
      000254 80 06            [24]  513 	sjmp	00125$
      000256                        514 00124$:
      000256 EF               [12]  515 	mov	a,r7
      000257 2F               [12]  516 	add	a,r7
      000258 FF               [12]  517 	mov	r7,a
      000259 EE               [12]  518 	mov	a,r6
      00025A 33               [12]  519 	rlc	a
      00025B FE               [12]  520 	mov	r6,a
      00025C                        521 00125$:
      00025C D5 F0 F7         [24]  522 	djnz	b,00124$
      00025F AC 30            [24]  523 	mov	r4,_bitmap
      000261 7D 00            [12]  524 	mov	r5,#0x00
      000263 EC               [12]  525 	mov	a,r4
      000264 52 07            [12]  526 	anl	ar7,a
      000266 ED               [12]  527 	mov	a,r5
      000267 52 06            [12]  528 	anl	ar6,a
      000269 EF               [12]  529 	mov	a,r7
      00026A 4E               [12]  530 	orl	a,r6
      00026B 60 C3            [24]  531 	jz	00103$
                                    532 ;	preemptive.c:243: RESTORESTATE;
      00026D E5 31            [12]  533 	mov	a,_currID
      00026F 24 37            [12]  534 	add	a,#_savedSP
      000271 F9               [12]  535 	mov	r1,a
      000272 87 81            [24]  536 	mov	_SP,@r1
      000274 D0 D0            [24]  537 	POP PSW 
      000276 D0 83            [24]  538 	POP DPH 
      000278 D0 82            [24]  539 	POP DPL 
      00027A D0 F0            [24]  540 	POP B 
      00027C D0 E0            [24]  541 	POP ACC 
                                    542 ;	preemptive.c:244: }
      00027E D0 D0            [24]  543 	pop	psw
      000280 92 AF            [24]  544 	mov	ea,c
      000282 22               [24]  545 	ret
                                    546 ;------------------------------------------------------------
                                    547 ;Allocation info for local variables in function 'myTimer0Handler'
                                    548 ;------------------------------------------------------------
                                    549 ;sft                       Allocated to registers r7 
                                    550 ;------------------------------------------------------------
                                    551 ;	preemptive.c:246: void myTimer0Handler(void){
                                    552 ;	-----------------------------------------
                                    553 ;	 function myTimer0Handler
                                    554 ;	-----------------------------------------
      000283                        555 _myTimer0Handler:
                                    556 ;	preemptive.c:247: EA = 0;
                                    557 ;	assignBit
      000283 C2 AF            [12]  558 	clr	_EA
                                    559 ;	preemptive.c:248: SAVESTATE;
      000285 C0 E0            [24]  560 	PUSH ACC 
      000287 C0 F0            [24]  561 	PUSH B 
      000289 C0 82            [24]  562 	PUSH DPL 
      00028B C0 83            [24]  563 	PUSH DPH 
      00028D C0 D0            [24]  564 	PUSH PSW 
      00028F E5 31            [12]  565 	mov	a,_currID
      000291 24 37            [12]  566 	add	a,#_savedSP
      000293 F8               [12]  567 	mov	r0,a
      000294 A6 81            [24]  568 	mov	@r0,_SP
                                    569 ;	preemptive.c:266: __endasm;
      000296 E8               [12]  570 	MOV	A, R0
      000297 C0 E0            [24]  571 	PUSH	ACC
      000299 E9               [12]  572 	MOV	A, R1
      00029A C0 E0            [24]  573 	PUSH	ACC
      00029C EA               [12]  574 	MOV	A, R2
      00029D C0 E0            [24]  575 	PUSH	ACC
      00029F EB               [12]  576 	MOV	A, R3
      0002A0 C0 E0            [24]  577 	PUSH	ACC
      0002A2 EC               [12]  578 	MOV	A, R4
      0002A3 C0 E0            [24]  579 	PUSH	ACC
      0002A5 ED               [12]  580 	MOV	A, R5
      0002A6 C0 E0            [24]  581 	PUSH	ACC
      0002A8 EE               [12]  582 	MOV	A, R6
      0002A9 C0 E0            [24]  583 	PUSH	ACC
      0002AB EF               [12]  584 	MOV	A, R7
      0002AC C0 E0            [24]  585 	PUSH	ACC
                                    586 ;	preemptive.c:268: do{
      0002AE                        587 00103$:
                                    588 ;	preemptive.c:269: currID = (currID < 3 ) ?  currID+1 : 0;
      0002AE 74 FD            [12]  589 	mov	a,#0x100 - 0x03
      0002B0 25 31            [12]  590 	add	a,_currID
      0002B2 40 0B            [24]  591 	jc	00108$
      0002B4 AF 31            [24]  592 	mov	r7,_currID
      0002B6 0F               [12]  593 	inc	r7
      0002B7 EF               [12]  594 	mov	a,r7
      0002B8 FE               [12]  595 	mov	r6,a
      0002B9 33               [12]  596 	rlc	a
      0002BA 95 E0            [12]  597 	subb	a,acc
      0002BC FF               [12]  598 	mov	r7,a
      0002BD 80 04            [24]  599 	sjmp	00109$
      0002BF                        600 00108$:
      0002BF 7E 00            [12]  601 	mov	r6,#0x00
      0002C1 7F 00            [12]  602 	mov	r7,#0x00
      0002C3                        603 00109$:
      0002C3 8E 31            [24]  604 	mov	_currID,r6
                                    605 ;	preemptive.c:270: sft = 1 << currID;
      0002C5 AF 31            [24]  606 	mov	r7,_currID
      0002C7 8F F0            [24]  607 	mov	b,r7
      0002C9 05 F0            [12]  608 	inc	b
      0002CB 74 01            [12]  609 	mov	a,#0x01
      0002CD 80 02            [24]  610 	sjmp	00125$
      0002CF                        611 00123$:
      0002CF 25 E0            [12]  612 	add	a,acc
      0002D1                        613 00125$:
      0002D1 D5 F0 FB         [24]  614 	djnz	b,00123$
                                    615 ;	preemptive.c:271: if( bitmap & sft ){
      0002D4 FF               [12]  616 	mov	r7,a
      0002D5 55 30            [12]  617 	anl	a,_bitmap
      0002D7 60 D5            [24]  618 	jz	00103$
                                    619 ;	preemptive.c:293: __endasm;  
      0002D9 D0 E0            [24]  620 	POP	ACC
      0002DB FF               [12]  621 	MOV	R7, A
      0002DC D0 E0            [24]  622 	POP	ACC
      0002DE FE               [12]  623 	MOV	R6, A
      0002DF D0 E0            [24]  624 	POP	ACC
      0002E1 FD               [12]  625 	MOV	R5, A
      0002E2 D0 E0            [24]  626 	POP	ACC
      0002E4 FC               [12]  627 	MOV	R4, A
      0002E5 D0 E0            [24]  628 	POP	ACC
      0002E7 FB               [12]  629 	MOV	R3, A
      0002E8 D0 E0            [24]  630 	POP	ACC
      0002EA FA               [12]  631 	MOV	R2, A
      0002EB D0 E0            [24]  632 	POP	ACC
      0002ED F9               [12]  633 	MOV	R1, A
      0002EE D0 E0            [24]  634 	POP	ACC
      0002F0 F8               [12]  635 	MOV	R0, A
                                    636 ;	preemptive.c:295: RESTORESTATE;
      0002F1 E5 31            [12]  637 	mov	a,_currID
      0002F3 24 37            [12]  638 	add	a,#_savedSP
      0002F5 F9               [12]  639 	mov	r1,a
      0002F6 87 81            [24]  640 	mov	_SP,@r1
      0002F8 D0 D0            [24]  641 	POP PSW 
      0002FA D0 83            [24]  642 	POP DPH 
      0002FC D0 82            [24]  643 	POP DPL 
      0002FE D0 F0            [24]  644 	POP B 
      000300 D0 E0            [24]  645 	POP ACC 
                                    646 ;	preemptive.c:296: EA = 1;
                                    647 ;	assignBit
      000302 D2 AF            [12]  648 	setb	_EA
                                    649 ;	preemptive.c:299: __endasm;
      000304 32               [24]  650 	RETI
                                    651 ;	preemptive.c:300: }
      000305 22               [24]  652 	ret
                                    653 ;------------------------------------------------------------
                                    654 ;Allocation info for local variables in function 'ThreadExit'
                                    655 ;------------------------------------------------------------
                                    656 ;	preemptive.c:307: void ThreadExit(void)
                                    657 ;	-----------------------------------------
                                    658 ;	 function ThreadExit
                                    659 ;	-----------------------------------------
      000306                        660 _ThreadExit:
      000306 D3               [12]  661 	setb	c
      000307 10 AF 01         [24]  662 	jbc	ea,00103$
      00030A C3               [12]  663 	clr	c
      00030B                        664 00103$:
      00030B C0 D0            [24]  665 	push	psw
                                    666 ;	preemptive.c:316: RESTORESTATE;
      00030D E5 31            [12]  667 	mov	a,_currID
      00030F 24 37            [12]  668 	add	a,#_savedSP
      000311 F9               [12]  669 	mov	r1,a
      000312 87 81            [24]  670 	mov	_SP,@r1
      000314 D0 D0            [24]  671 	POP PSW 
      000316 D0 83            [24]  672 	POP DPH 
      000318 D0 82            [24]  673 	POP DPL 
      00031A D0 F0            [24]  674 	POP B 
      00031C D0 E0            [24]  675 	POP ACC 
                                    676 ;	preemptive.c:317: }
      00031E D0 D0            [24]  677 	pop	psw
      000320 92 AF            [24]  678 	mov	ea,c
      000322 22               [24]  679 	ret
                                    680 	.area CSEG    (CODE)
                                    681 	.area CONST   (CODE)
                                    682 	.area XINIT   (CODE)
                                    683 	.area CABS    (ABS,CODE)
