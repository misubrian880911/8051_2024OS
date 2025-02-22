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
                                    111 	.globl _new_stk
                                    112 	.globl _temp_PSW
                                    113 	.globl _temp_SP
                                    114 	.globl _savedSP
                                    115 	.globl _newID
                                    116 	.globl _nextID
                                    117 	.globl _currID
                                    118 	.globl _ThreadCreate
                                    119 	.globl _ThreadYield
                                    120 	.globl _ThreadExit
                                    121 ;--------------------------------------------------------
                                    122 ; special function registers
                                    123 ;--------------------------------------------------------
                                    124 	.area RSEG    (ABS,DATA)
      000000                        125 	.org 0x0000
                           000080   126 _P0	=	0x0080
                           000081   127 _SP	=	0x0081
                           000082   128 _DPL	=	0x0082
                           000083   129 _DPH	=	0x0083
                           000087   130 _PCON	=	0x0087
                           000088   131 _TCON	=	0x0088
                           000089   132 _TMOD	=	0x0089
                           00008A   133 _TL0	=	0x008a
                           00008B   134 _TL1	=	0x008b
                           00008C   135 _TH0	=	0x008c
                           00008D   136 _TH1	=	0x008d
                           000090   137 _P1	=	0x0090
                           000098   138 _SCON	=	0x0098
                           000099   139 _SBUF	=	0x0099
                           0000A0   140 _P2	=	0x00a0
                           0000A8   141 _IE	=	0x00a8
                           0000B0   142 _P3	=	0x00b0
                           0000B8   143 _IP	=	0x00b8
                           0000D0   144 _PSW	=	0x00d0
                           0000E0   145 _ACC	=	0x00e0
                           0000F0   146 _B	=	0x00f0
                                    147 ;--------------------------------------------------------
                                    148 ; special function bits
                                    149 ;--------------------------------------------------------
                                    150 	.area RSEG    (ABS,DATA)
      000000                        151 	.org 0x0000
                           000080   152 _P0_0	=	0x0080
                           000081   153 _P0_1	=	0x0081
                           000082   154 _P0_2	=	0x0082
                           000083   155 _P0_3	=	0x0083
                           000084   156 _P0_4	=	0x0084
                           000085   157 _P0_5	=	0x0085
                           000086   158 _P0_6	=	0x0086
                           000087   159 _P0_7	=	0x0087
                           000088   160 _IT0	=	0x0088
                           000089   161 _IE0	=	0x0089
                           00008A   162 _IT1	=	0x008a
                           00008B   163 _IE1	=	0x008b
                           00008C   164 _TR0	=	0x008c
                           00008D   165 _TF0	=	0x008d
                           00008E   166 _TR1	=	0x008e
                           00008F   167 _TF1	=	0x008f
                           000090   168 _P1_0	=	0x0090
                           000091   169 _P1_1	=	0x0091
                           000092   170 _P1_2	=	0x0092
                           000093   171 _P1_3	=	0x0093
                           000094   172 _P1_4	=	0x0094
                           000095   173 _P1_5	=	0x0095
                           000096   174 _P1_6	=	0x0096
                           000097   175 _P1_7	=	0x0097
                           000098   176 _RI	=	0x0098
                           000099   177 _TI	=	0x0099
                           00009A   178 _RB8	=	0x009a
                           00009B   179 _TB8	=	0x009b
                           00009C   180 _REN	=	0x009c
                           00009D   181 _SM2	=	0x009d
                           00009E   182 _SM1	=	0x009e
                           00009F   183 _SM0	=	0x009f
                           0000A0   184 _P2_0	=	0x00a0
                           0000A1   185 _P2_1	=	0x00a1
                           0000A2   186 _P2_2	=	0x00a2
                           0000A3   187 _P2_3	=	0x00a3
                           0000A4   188 _P2_4	=	0x00a4
                           0000A5   189 _P2_5	=	0x00a5
                           0000A6   190 _P2_6	=	0x00a6
                           0000A7   191 _P2_7	=	0x00a7
                           0000A8   192 _EX0	=	0x00a8
                           0000A9   193 _ET0	=	0x00a9
                           0000AA   194 _EX1	=	0x00aa
                           0000AB   195 _ET1	=	0x00ab
                           0000AC   196 _ES	=	0x00ac
                           0000AF   197 _EA	=	0x00af
                           0000B0   198 _P3_0	=	0x00b0
                           0000B1   199 _P3_1	=	0x00b1
                           0000B2   200 _P3_2	=	0x00b2
                           0000B3   201 _P3_3	=	0x00b3
                           0000B4   202 _P3_4	=	0x00b4
                           0000B5   203 _P3_5	=	0x00b5
                           0000B6   204 _P3_6	=	0x00b6
                           0000B7   205 _P3_7	=	0x00b7
                           0000B0   206 _RXD	=	0x00b0
                           0000B1   207 _TXD	=	0x00b1
                           0000B2   208 _INT0	=	0x00b2
                           0000B3   209 _INT1	=	0x00b3
                           0000B4   210 _T0	=	0x00b4
                           0000B5   211 _T1	=	0x00b5
                           0000B6   212 _WR	=	0x00b6
                           0000B7   213 _RD	=	0x00b7
                           0000B8   214 _PX0	=	0x00b8
                           0000B9   215 _PT0	=	0x00b9
                           0000BA   216 _PX1	=	0x00ba
                           0000BB   217 _PT1	=	0x00bb
                           0000BC   218 _PS	=	0x00bc
                           0000D0   219 _P	=	0x00d0
                           0000D1   220 _F1	=	0x00d1
                           0000D2   221 _OV	=	0x00d2
                           0000D3   222 _RS0	=	0x00d3
                           0000D4   223 _RS1	=	0x00d4
                           0000D5   224 _F0	=	0x00d5
                           0000D6   225 _AC	=	0x00d6
                           0000D7   226 _CY	=	0x00d7
                                    227 ;--------------------------------------------------------
                                    228 ; overlayable register banks
                                    229 ;--------------------------------------------------------
                                    230 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        231 	.ds 8
                                    232 ;--------------------------------------------------------
                                    233 ; internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area DSEG    (DATA)
                           000031   236 _currID	=	0x0031
                           000032   237 _nextID	=	0x0032
                           000033   238 _newID	=	0x0033
                           000037   239 _savedSP	=	0x0037
                           000071   240 _temp_SP	=	0x0071
                           000072   241 _temp_PSW	=	0x0072
                           000073   242 _new_stk	=	0x0073
                                    243 ;--------------------------------------------------------
                                    244 ; overlayable items in internal ram
                                    245 ;--------------------------------------------------------
                                    246 	.area	OSEG    (OVR,DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
      000030                        255 	.org 0x0030
      000030                        256 _bitmap::
      000030                        257 	.ds 1
                                    258 	.area IABS    (ABS,DATA)
                                    259 ;--------------------------------------------------------
                                    260 ; bit data
                                    261 ;--------------------------------------------------------
                                    262 	.area BSEG    (BIT)
      000003                        263 _ThreadYield_sloc0_1_0:
      000003                        264 	.ds 1
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
                                    298 ;	preemptive.c:17: __data __at (0x30) char bitmap = 0x00;
      000017 75 30 00         [24]  299 	mov	_bitmap,#0x00
                                    300 ;--------------------------------------------------------
                                    301 ; Home
                                    302 ;--------------------------------------------------------
                                    303 	.area HOME    (CODE)
                                    304 	.area HOME    (CODE)
                                    305 ;--------------------------------------------------------
                                    306 ; code
                                    307 ;--------------------------------------------------------
                                    308 	.area CSEG    (CODE)
                                    309 ;------------------------------------------------------------
                                    310 ;Allocation info for local variables in function 'Bootstrap'
                                    311 ;------------------------------------------------------------
                                    312 ;	preemptive.c:83: void Bootstrap(void)
                                    313 ;	-----------------------------------------
                                    314 ;	 function Bootstrap
                                    315 ;	-----------------------------------------
      0000FA                        316 _Bootstrap:
                           000007   317 	ar7 = 0x07
                           000006   318 	ar6 = 0x06
                           000005   319 	ar5 = 0x05
                           000004   320 	ar4 = 0x04
                           000003   321 	ar3 = 0x03
                           000002   322 	ar2 = 0x02
                           000001   323 	ar1 = 0x01
                           000000   324 	ar0 = 0x00
                                    325 ;	preemptive.c:98: TMOD = 0; // timer 0 mode 0
      0000FA 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:99: IE = 0x82;
      0000FD 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:102: TR0 = 1; // set bit TR0 to start running timer 0
                                    330 ;	assignBit
      000100 D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:103: currID = ThreadCreate(main);
      000102 90 00 D2         [24]  333 	mov	dptr,#_main
      000105 12 01 1D         [24]  334 	lcall	_ThreadCreate
      000108 85 82 31         [24]  335 	mov	_currID,dpl
                                    336 ;	preemptive.c:104: RESTORESTATE;
      00010B E5 31            [12]  337 	mov	a,_currID
      00010D 24 37            [12]  338 	add	a,#_savedSP
      00010F F9               [12]  339 	mov	r1,a
      000110 87 81            [24]  340 	mov	_SP,@r1
      000112 D0 D0            [24]  341 	POP PSW 
      000114 D0 83            [24]  342 	POP DPH 
      000116 D0 82            [24]  343 	POP DPL 
      000118 D0 F0            [24]  344 	POP B 
      00011A D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:106: }
      00011C 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'ThreadCreate'
                                    350 ;------------------------------------------------------------
                                    351 ;fp                        Allocated to registers 
                                    352 ;i                         Allocated to registers r7 
                                    353 ;------------------------------------------------------------
                                    354 ;	preemptive.c:114: ThreadID ThreadCreate(FunctionPtr fp)
                                    355 ;	-----------------------------------------
                                    356 ;	 function ThreadCreate
                                    357 ;	-----------------------------------------
      00011D                        358 _ThreadCreate:
      00011D D3               [12]  359 	setb	c
      00011E 10 AF 01         [24]  360 	jbc	ea,00122$
      000121 C3               [12]  361 	clr	c
      000122                        362 00122$:
      000122 C0 D0            [24]  363 	push	psw
                                    364 ;	preemptive.c:121: if (bitmap == 15)
      000124 74 0F            [12]  365 	mov	a,#0x0f
      000126 B5 30 06         [24]  366 	cjne	a,_bitmap,00102$
                                    367 ;	preemptive.c:122: return -1;
      000129 75 82 FF         [24]  368 	mov	dpl,#0xff
      00012C 02 01 AE         [24]  369 	ljmp	00108$
      00012F                        370 00102$:
                                    371 ;	preemptive.c:136: for (i = 0;i < 4;i ++){
      00012F 7F 00            [12]  372 	mov	r7,#0x00
      000131 7E 00            [12]  373 	mov	r6,#0x00
      000133                        374 00106$:
                                    375 ;	preemptive.c:137: if (!(bitmap & (1 << i))){
      000133 8E F0            [24]  376 	mov	b,r6
      000135 05 F0            [12]  377 	inc	b
      000137 7C 01            [12]  378 	mov	r4,#0x01
      000139 7D 00            [12]  379 	mov	r5,#0x00
      00013B 80 06            [24]  380 	sjmp	00126$
      00013D                        381 00125$:
      00013D EC               [12]  382 	mov	a,r4
      00013E 2C               [12]  383 	add	a,r4
      00013F FC               [12]  384 	mov	r4,a
      000140 ED               [12]  385 	mov	a,r5
      000141 33               [12]  386 	rlc	a
      000142 FD               [12]  387 	mov	r5,a
      000143                        388 00126$:
      000143 D5 F0 F7         [24]  389 	djnz	b,00125$
      000146 AA 30            [24]  390 	mov	r2,_bitmap
      000148 7B 00            [12]  391 	mov	r3,#0x00
      00014A EA               [12]  392 	mov	a,r2
      00014B 52 04            [12]  393 	anl	ar4,a
      00014D EB               [12]  394 	mov	a,r3
      00014E 52 05            [12]  395 	anl	ar5,a
      000150 EC               [12]  396 	mov	a,r4
      000151 4D               [12]  397 	orl	a,r5
      000152 70 16            [24]  398 	jnz	00107$
                                    399 ;	preemptive.c:139: bitmap |= (1 << i);
      000154 8F 05            [24]  400 	mov	ar5,r7
      000156 8D F0            [24]  401 	mov	b,r5
      000158 05 F0            [12]  402 	inc	b
      00015A 74 01            [12]  403 	mov	a,#0x01
      00015C 80 02            [24]  404 	sjmp	00130$
      00015E                        405 00128$:
      00015E 25 E0            [12]  406 	add	a,acc
      000160                        407 00130$:
      000160 D5 F0 FB         [24]  408 	djnz	b,00128$
      000163 FD               [12]  409 	mov	r5,a
      000164 42 30            [12]  410 	orl	_bitmap,a
                                    411 ;	preemptive.c:140: newID = i;
      000166 8F 33            [24]  412 	mov	_newID,r7
                                    413 ;	preemptive.c:141: break;
      000168 80 08            [24]  414 	sjmp	00105$
      00016A                        415 00107$:
                                    416 ;	preemptive.c:136: for (i = 0;i < 4;i ++){
      00016A 0E               [12]  417 	inc	r6
      00016B 8E 07            [24]  418 	mov	ar7,r6
      00016D BE 04 00         [24]  419 	cjne	r6,#0x04,00131$
      000170                        420 00131$:
      000170 40 C1            [24]  421 	jc	00106$
      000172                        422 00105$:
                                    423 ;	preemptive.c:148: new_stk = (0x3F) + (0x10)*newID;
      000172 E5 33            [12]  424 	mov	a,_newID
      000174 C4               [12]  425 	swap	a
      000175 54 F0            [12]  426 	anl	a,#0xf0
      000177 FF               [12]  427 	mov	r7,a
      000178 24 3F            [12]  428 	add	a,#0x3f
      00017A F5 73            [12]  429 	mov	_new_stk,a
                                    430 ;	preemptive.c:153: temp_SP = SP;
      00017C 85 81 71         [24]  431 	mov	_temp_SP,_SP
                                    432 ;	preemptive.c:154: SP = new_stk;
      00017F 85 73 81         [24]  433 	mov	_SP,_new_stk
                                    434 ;	preemptive.c:168: __endasm;
      000182 C0 82            [24]  435 	PUSH	DPL
      000184 C0 83            [24]  436 	PUSH	DPH
                                    437 ;	preemptive.c:182: __endasm;
      000186 74 00            [12]  438 	MOV	A, #0
      000188 C0 E0            [24]  439 	PUSH	ACC
      00018A C0 E0            [24]  440 	PUSH	ACC
      00018C C0 E0            [24]  441 	PUSH	ACC
      00018E C0 E0            [24]  442 	PUSH	ACC
                                    443 ;	preemptive.c:196: temp_PSW = PSW;
      000190 85 D0 72         [24]  444 	mov	_temp_PSW,_PSW
                                    445 ;	preemptive.c:197: PSW = newID << 3;
      000193 E5 33            [12]  446 	mov	a,_newID
      000195 FF               [12]  447 	mov	r7,a
      000196 C4               [12]  448 	swap	a
      000197 03               [12]  449 	rr	a
      000198 54 F8            [12]  450 	anl	a,#0xf8
      00019A F5 D0            [12]  451 	mov	_PSW,a
                                    452 ;	preemptive.c:200: __endasm;
      00019C C0 D0            [24]  453 	PUSH	PSW
                                    454 ;	preemptive.c:201: PSW = temp_PSW;
      00019E 85 72 D0         [24]  455 	mov	_PSW,_temp_PSW
                                    456 ;	preemptive.c:206: savedSP[newID] = SP;
      0001A1 E5 33            [12]  457 	mov	a,_newID
      0001A3 24 37            [12]  458 	add	a,#_savedSP
      0001A5 F8               [12]  459 	mov	r0,a
      0001A6 A6 81            [24]  460 	mov	@r0,_SP
                                    461 ;	preemptive.c:210: SP = temp_SP;
      0001A8 85 71 81         [24]  462 	mov	_SP,_temp_SP
                                    463 ;	preemptive.c:214: return newID;
      0001AB 85 33 82         [24]  464 	mov	dpl,_newID
      0001AE                        465 00108$:
                                    466 ;	preemptive.c:217: }
      0001AE D0 D0            [24]  467 	pop	psw
      0001B0 92 AF            [24]  468 	mov	ea,c
      0001B2 22               [24]  469 	ret
                                    470 ;------------------------------------------------------------
                                    471 ;Allocation info for local variables in function 'ThreadYield'
                                    472 ;------------------------------------------------------------
                                    473 ;	preemptive.c:226: void ThreadYield(void)
                                    474 ;	-----------------------------------------
                                    475 ;	 function ThreadYield
                                    476 ;	-----------------------------------------
      0001B3                        477 _ThreadYield:
      0001B3 D3               [12]  478 	setb	c
      0001B4 10 AF 01         [24]  479 	jbc	ea,00122$
      0001B7 C3               [12]  480 	clr	c
      0001B8                        481 00122$:
      0001B8 C0 D0            [24]  482 	push	psw
                                    483 ;	preemptive.c:228: SAVESTATE;
      0001BA C0 E0            [24]  484 	PUSH ACC 
      0001BC C0 F0            [24]  485 	PUSH B 
      0001BE C0 82            [24]  486 	PUSH DPL 
      0001C0 C0 83            [24]  487 	PUSH DPH 
      0001C2 C0 D0            [24]  488 	PUSH PSW 
      0001C4 E5 31            [12]  489 	mov	a,_currID
      0001C6 24 37            [12]  490 	add	a,#_savedSP
      0001C8 F8               [12]  491 	mov	r0,a
      0001C9 A6 81            [24]  492 	mov	@r0,_SP
                                    493 ;	preemptive.c:230: do
      0001CB                        494 00103$:
                                    495 ;	preemptive.c:242: currID = ((currID >= 3)? 0 : (currID + 1));
      0001CB C3               [12]  496 	clr	c
      0001CC E5 31            [12]  497 	mov	a,_currID
      0001CE 94 03            [12]  498 	subb	a,#0x03
      0001D0 92 03            [24]  499 	mov	_ThreadYield_sloc0_1_0,c
      0001D2 40 06            [24]  500 	jc	00108$
      0001D4 7E 00            [12]  501 	mov	r6,#0x00
      0001D6 7F 00            [12]  502 	mov	r7,#0x00
      0001D8 80 09            [24]  503 	sjmp	00109$
      0001DA                        504 00108$:
      0001DA AD 31            [24]  505 	mov	r5,_currID
      0001DC 0D               [12]  506 	inc	r5
      0001DD ED               [12]  507 	mov	a,r5
      0001DE FE               [12]  508 	mov	r6,a
      0001DF 33               [12]  509 	rlc	a
      0001E0 95 E0            [12]  510 	subb	a,acc
      0001E2 FF               [12]  511 	mov	r7,a
      0001E3                        512 00109$:
      0001E3 8E 31            [24]  513 	mov	_currID,r6
                                    514 ;	preemptive.c:243: if (bitmap & (1 << currID)){
      0001E5 AF 31            [24]  515 	mov	r7,_currID
      0001E7 8F F0            [24]  516 	mov	b,r7
      0001E9 05 F0            [12]  517 	inc	b
      0001EB 7F 01            [12]  518 	mov	r7,#0x01
      0001ED 7E 00            [12]  519 	mov	r6,#0x00
      0001EF 80 06            [24]  520 	sjmp	00125$
      0001F1                        521 00124$:
      0001F1 EF               [12]  522 	mov	a,r7
      0001F2 2F               [12]  523 	add	a,r7
      0001F3 FF               [12]  524 	mov	r7,a
      0001F4 EE               [12]  525 	mov	a,r6
      0001F5 33               [12]  526 	rlc	a
      0001F6 FE               [12]  527 	mov	r6,a
      0001F7                        528 00125$:
      0001F7 D5 F0 F7         [24]  529 	djnz	b,00124$
      0001FA AC 30            [24]  530 	mov	r4,_bitmap
      0001FC 7D 00            [12]  531 	mov	r5,#0x00
      0001FE EC               [12]  532 	mov	a,r4
      0001FF 52 07            [12]  533 	anl	ar7,a
      000201 ED               [12]  534 	mov	a,r5
      000202 52 06            [12]  535 	anl	ar6,a
      000204 EF               [12]  536 	mov	a,r7
      000205 4E               [12]  537 	orl	a,r6
      000206 60 C3            [24]  538 	jz	00103$
                                    539 ;	preemptive.c:249: RESTORESTATE;
      000208 E5 31            [12]  540 	mov	a,_currID
      00020A 24 37            [12]  541 	add	a,#_savedSP
      00020C F9               [12]  542 	mov	r1,a
      00020D 87 81            [24]  543 	mov	_SP,@r1
      00020F D0 D0            [24]  544 	POP PSW 
      000211 D0 83            [24]  545 	POP DPH 
      000213 D0 82            [24]  546 	POP DPL 
      000215 D0 F0            [24]  547 	POP B 
      000217 D0 E0            [24]  548 	POP ACC 
                                    549 ;	preemptive.c:250: }
      000219 D0 D0            [24]  550 	pop	psw
      00021B 92 AF            [24]  551 	mov	ea,c
      00021D 22               [24]  552 	ret
                                    553 ;------------------------------------------------------------
                                    554 ;Allocation info for local variables in function 'myTimer0Handler'
                                    555 ;------------------------------------------------------------
                                    556 ;	preemptive.c:252: void myTimer0Handler(void){
                                    557 ;	-----------------------------------------
                                    558 ;	 function myTimer0Handler
                                    559 ;	-----------------------------------------
      00021E                        560 _myTimer0Handler:
                                    561 ;	preemptive.c:253: EA = 0;
                                    562 ;	assignBit
      00021E C2 AF            [12]  563 	clr	_EA
                                    564 ;	preemptive.c:254: SAVESTATE;
      000220 C0 E0            [24]  565 	PUSH ACC 
      000222 C0 F0            [24]  566 	PUSH B 
      000224 C0 82            [24]  567 	PUSH DPL 
      000226 C0 83            [24]  568 	PUSH DPH 
      000228 C0 D0            [24]  569 	PUSH PSW 
      00022A E5 31            [12]  570 	mov	a,_currID
      00022C 24 37            [12]  571 	add	a,#_savedSP
      00022E F8               [12]  572 	mov	r0,a
      00022F A6 81            [24]  573 	mov	@r0,_SP
                                    574 ;	preemptive.c:272: __endasm;
      000231 E8               [12]  575 	MOV	A, R0
      000232 C0 E0            [24]  576 	PUSH	ACC
      000234 E9               [12]  577 	MOV	A, R1
      000235 C0 E0            [24]  578 	PUSH	ACC
      000237 EA               [12]  579 	MOV	A, R2
      000238 C0 E0            [24]  580 	PUSH	ACC
      00023A EB               [12]  581 	MOV	A, R3
      00023B C0 E0            [24]  582 	PUSH	ACC
      00023D EC               [12]  583 	MOV	A, R4
      00023E C0 E0            [24]  584 	PUSH	ACC
      000240 ED               [12]  585 	MOV	A, R5
      000241 C0 E0            [24]  586 	PUSH	ACC
      000243 EE               [12]  587 	MOV	A, R6
      000244 C0 E0            [24]  588 	PUSH	ACC
      000246 EF               [12]  589 	MOV	A, R7
      000247 C0 E0            [24]  590 	PUSH	ACC
                                    591 ;	preemptive.c:274: do{
      000249                        592 00114$:
                                    593 ;	preemptive.c:275: currID = (currID < 3 ) ?  currID+1 : 0;
      000249 74 FD            [12]  594 	mov	a,#0x100 - 0x03
      00024B 25 31            [12]  595 	add	a,_currID
      00024D 40 0B            [24]  596 	jc	00119$
      00024F AF 31            [24]  597 	mov	r7,_currID
      000251 0F               [12]  598 	inc	r7
      000252 EF               [12]  599 	mov	a,r7
      000253 FE               [12]  600 	mov	r6,a
      000254 33               [12]  601 	rlc	a
      000255 95 E0            [12]  602 	subb	a,acc
      000257 FF               [12]  603 	mov	r7,a
      000258 80 04            [24]  604 	sjmp	00120$
      00025A                        605 00119$:
      00025A 7E 00            [12]  606 	mov	r6,#0x00
      00025C 7F 00            [12]  607 	mov	r7,#0x00
      00025E                        608 00120$:
      00025E 8E 31            [24]  609 	mov	_currID,r6
                                    610 ;	preemptive.c:276: if( currID == 0 )nextID = 1;
      000260 E5 31            [12]  611 	mov	a,_currID
      000262 70 05            [24]  612 	jnz	00110$
      000264 75 32 01         [24]  613 	mov	_nextID,#0x01
      000267 80 1C            [24]  614 	sjmp	00111$
      000269                        615 00110$:
                                    616 ;	preemptive.c:277: else if( currID == 1 )nextID = 2;
      000269 74 01            [12]  617 	mov	a,#0x01
      00026B B5 31 05         [24]  618 	cjne	a,_currID,00107$
      00026E 75 32 02         [24]  619 	mov	_nextID,#0x02
      000271 80 12            [24]  620 	sjmp	00111$
      000273                        621 00107$:
                                    622 ;	preemptive.c:278: else if( currID == 2 )nextID = 4;
      000273 74 02            [12]  623 	mov	a,#0x02
      000275 B5 31 05         [24]  624 	cjne	a,_currID,00104$
      000278 75 32 04         [24]  625 	mov	_nextID,#0x04
      00027B 80 08            [24]  626 	sjmp	00111$
      00027D                        627 00104$:
                                    628 ;	preemptive.c:279: else if( currID == 3 )nextID = 8;
      00027D 74 03            [12]  629 	mov	a,#0x03
      00027F B5 31 03         [24]  630 	cjne	a,_currID,00111$
      000282 75 32 08         [24]  631 	mov	_nextID,#0x08
      000285                        632 00111$:
                                    633 ;	preemptive.c:280: if( bitmap & nextID ){
      000285 E5 32            [12]  634 	mov	a,_nextID
      000287 55 30            [12]  635 	anl	a,_bitmap
      000289 60 BE            [24]  636 	jz	00114$
                                    637 ;	preemptive.c:302: __endasm;  
      00028B D0 E0            [24]  638 	POP	ACC
      00028D FF               [12]  639 	MOV	R7, A
      00028E D0 E0            [24]  640 	POP	ACC
      000290 FE               [12]  641 	MOV	R6, A
      000291 D0 E0            [24]  642 	POP	ACC
      000293 FD               [12]  643 	MOV	R5, A
      000294 D0 E0            [24]  644 	POP	ACC
      000296 FC               [12]  645 	MOV	R4, A
      000297 D0 E0            [24]  646 	POP	ACC
      000299 FB               [12]  647 	MOV	R3, A
      00029A D0 E0            [24]  648 	POP	ACC
      00029C FA               [12]  649 	MOV	R2, A
      00029D D0 E0            [24]  650 	POP	ACC
      00029F F9               [12]  651 	MOV	R1, A
      0002A0 D0 E0            [24]  652 	POP	ACC
      0002A2 F8               [12]  653 	MOV	R0, A
                                    654 ;	preemptive.c:304: RESTORESTATE;
      0002A3 E5 31            [12]  655 	mov	a,_currID
      0002A5 24 37            [12]  656 	add	a,#_savedSP
      0002A7 F9               [12]  657 	mov	r1,a
      0002A8 87 81            [24]  658 	mov	_SP,@r1
      0002AA D0 D0            [24]  659 	POP PSW 
      0002AC D0 83            [24]  660 	POP DPH 
      0002AE D0 82            [24]  661 	POP DPL 
      0002B0 D0 F0            [24]  662 	POP B 
      0002B2 D0 E0            [24]  663 	POP ACC 
                                    664 ;	preemptive.c:305: EA = 1;
                                    665 ;	assignBit
      0002B4 D2 AF            [12]  666 	setb	_EA
                                    667 ;	preemptive.c:308: __endasm;
      0002B6 32               [24]  668 	RETI
                                    669 ;	preemptive.c:309: }
      0002B7 22               [24]  670 	ret
                                    671 ;------------------------------------------------------------
                                    672 ;Allocation info for local variables in function 'ThreadExit'
                                    673 ;------------------------------------------------------------
                                    674 ;	preemptive.c:316: void ThreadExit(void)
                                    675 ;	-----------------------------------------
                                    676 ;	 function ThreadExit
                                    677 ;	-----------------------------------------
      0002B8                        678 _ThreadExit:
      0002B8 D3               [12]  679 	setb	c
      0002B9 10 AF 01         [24]  680 	jbc	ea,00103$
      0002BC C3               [12]  681 	clr	c
      0002BD                        682 00103$:
      0002BD C0 D0            [24]  683 	push	psw
                                    684 ;	preemptive.c:325: RESTORESTATE;
      0002BF E5 31            [12]  685 	mov	a,_currID
      0002C1 24 37            [12]  686 	add	a,#_savedSP
      0002C3 F9               [12]  687 	mov	r1,a
      0002C4 87 81            [24]  688 	mov	_SP,@r1
      0002C6 D0 D0            [24]  689 	POP PSW 
      0002C8 D0 83            [24]  690 	POP DPH 
      0002CA D0 82            [24]  691 	POP DPL 
      0002CC D0 F0            [24]  692 	POP B 
      0002CE D0 E0            [24]  693 	POP ACC 
                                    694 ;	preemptive.c:326: }
      0002D0 D0 D0            [24]  695 	pop	psw
      0002D2 92 AF            [24]  696 	mov	ea,c
      0002D4 22               [24]  697 	ret
                                    698 	.area CSEG    (CODE)
                                    699 	.area CONST   (CODE)
                                    700 	.area XINIT   (CODE)
                                    701 	.area CABS    (ABS,CODE)
