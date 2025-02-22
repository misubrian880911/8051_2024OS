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
                                    115 	.globl _savedSP
                                    116 	.globl _newID
                                    117 	.globl _nextID
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
                           000032   238 _nextID	=	0x0032
                           000033   239 _newID	=	0x0033
                           000037   240 _savedSP	=	0x0037
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
                                    267 ;--------------------------------------------------------
                                    268 ; paged external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area PSEG    (PAG,XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XSEG    (XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; absolute external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XABS    (ABS,XDATA)
                                    279 ;--------------------------------------------------------
                                    280 ; external initialized ram data
                                    281 ;--------------------------------------------------------
                                    282 	.area XISEG   (XDATA)
                                    283 	.area HOME    (CODE)
                                    284 	.area GSINIT0 (CODE)
                                    285 	.area GSINIT1 (CODE)
                                    286 	.area GSINIT2 (CODE)
                                    287 	.area GSINIT3 (CODE)
                                    288 	.area GSINIT4 (CODE)
                                    289 	.area GSINIT5 (CODE)
                                    290 	.area GSINIT  (CODE)
                                    291 	.area GSFINAL (CODE)
                                    292 	.area CSEG    (CODE)
                                    293 ;--------------------------------------------------------
                                    294 ; global & static initialisations
                                    295 ;--------------------------------------------------------
                                    296 	.area HOME    (CODE)
                                    297 	.area GSINIT  (CODE)
                                    298 	.area GSFINAL (CODE)
                                    299 	.area GSINIT  (CODE)
                                    300 ;	preemptive.c:17: __data __at (0x30) char bitmap = 0x00;
      000011 75 30 00         [24]  301 	mov	_bitmap,#0x00
                                    302 ;--------------------------------------------------------
                                    303 ; Home
                                    304 ;--------------------------------------------------------
                                    305 	.area HOME    (CODE)
                                    306 	.area HOME    (CODE)
                                    307 ;--------------------------------------------------------
                                    308 ; code
                                    309 ;--------------------------------------------------------
                                    310 	.area CSEG    (CODE)
                                    311 ;------------------------------------------------------------
                                    312 ;Allocation info for local variables in function 'Bootstrap'
                                    313 ;------------------------------------------------------------
                                    314 ;	preemptive.c:83: void Bootstrap(void)
                                    315 ;	-----------------------------------------
                                    316 ;	 function Bootstrap
                                    317 ;	-----------------------------------------
      000092                        318 _Bootstrap:
                           000007   319 	ar7 = 0x07
                           000006   320 	ar6 = 0x06
                           000005   321 	ar5 = 0x05
                           000004   322 	ar4 = 0x04
                           000003   323 	ar3 = 0x03
                           000002   324 	ar2 = 0x02
                           000001   325 	ar1 = 0x01
                           000000   326 	ar0 = 0x00
                                    327 ;	preemptive.c:98: TMOD = 0; // timer 0 mode 0
      000092 75 89 00         [24]  328 	mov	_TMOD,#0x00
                                    329 ;	preemptive.c:99: IE = 0x82;
      000095 75 A8 82         [24]  330 	mov	_IE,#0x82
                                    331 ;	preemptive.c:102: TR0 = 1; // set bit TR0 to start running timer 0
                                    332 ;	assignBit
      000098 D2 8C            [12]  333 	setb	_TR0
                                    334 ;	preemptive.c:103: currID = ThreadCreate(main);
      00009A 90 00 78         [24]  335 	mov	dptr,#_main
      00009D 12 00 B5         [24]  336 	lcall	_ThreadCreate
      0000A0 85 82 31         [24]  337 	mov	_currID,dpl
                                    338 ;	preemptive.c:104: RESTORESTATE;
      0000A3 E5 31            [12]  339 	mov	a,_currID
      0000A5 24 37            [12]  340 	add	a,#_savedSP
      0000A7 F9               [12]  341 	mov	r1,a
      0000A8 87 81            [24]  342 	mov	_SP,@r1
      0000AA D0 D0            [24]  343 	POP PSW 
      0000AC D0 83            [24]  344 	POP DPH 
      0000AE D0 82            [24]  345 	POP DPL 
      0000B0 D0 F0            [24]  346 	POP B 
      0000B2 D0 E0            [24]  347 	POP ACC 
                                    348 ;	preemptive.c:106: }
      0000B4 22               [24]  349 	ret
                                    350 ;------------------------------------------------------------
                                    351 ;Allocation info for local variables in function 'ThreadCreate'
                                    352 ;------------------------------------------------------------
                                    353 ;fp                        Allocated to registers 
                                    354 ;------------------------------------------------------------
                                    355 ;	preemptive.c:114: ThreadID ThreadCreate(FunctionPtr fp)
                                    356 ;	-----------------------------------------
                                    357 ;	 function ThreadCreate
                                    358 ;	-----------------------------------------
      0000B5                        359 _ThreadCreate:
      0000B5 D3               [12]  360 	setb	c
      0000B6 10 AF 01         [24]  361 	jbc	ea,00127$
      0000B9 C3               [12]  362 	clr	c
      0000BA                        363 00127$:
      0000BA C0 D0            [24]  364 	push	psw
                                    365 ;	preemptive.c:121: if (bitmap == 15)
      0000BC 74 0F            [12]  366 	mov	a,#0x0f
      0000BE B5 30 06         [24]  367 	cjne	a,_bitmap,00102$
                                    368 ;	preemptive.c:122: return -1;
      0000C1 75 82 FF         [24]  369 	mov	dpl,#0xff
      0000C4 02 01 4D         [24]  370 	ljmp	00109$
      0000C7                        371 00102$:
                                    372 ;	preemptive.c:135: for (i = 0;i < 4;i ++){
      0000C7 75 3E 00         [24]  373 	mov	_i,#0x00
      0000CA                        374 00107$:
      0000CA 74 FC            [12]  375 	mov	a,#0x100 - 0x04
      0000CC 25 3E            [12]  376 	add	a,_i
      0000CE 40 41            [24]  377 	jc	00105$
                                    378 ;	preemptive.c:136: if (!(bitmap & (1 << i))){
      0000D0 AF 3E            [24]  379 	mov	r7,_i
      0000D2 8F F0            [24]  380 	mov	b,r7
      0000D4 05 F0            [12]  381 	inc	b
      0000D6 7F 01            [12]  382 	mov	r7,#0x01
      0000D8 7E 00            [12]  383 	mov	r6,#0x00
      0000DA 80 06            [24]  384 	sjmp	00132$
      0000DC                        385 00131$:
      0000DC EF               [12]  386 	mov	a,r7
      0000DD 2F               [12]  387 	add	a,r7
      0000DE FF               [12]  388 	mov	r7,a
      0000DF EE               [12]  389 	mov	a,r6
      0000E0 33               [12]  390 	rlc	a
      0000E1 FE               [12]  391 	mov	r6,a
      0000E2                        392 00132$:
      0000E2 D5 F0 F7         [24]  393 	djnz	b,00131$
      0000E5 AC 30            [24]  394 	mov	r4,_bitmap
      0000E7 7D 00            [12]  395 	mov	r5,#0x00
      0000E9 EC               [12]  396 	mov	a,r4
      0000EA 52 07            [12]  397 	anl	ar7,a
      0000EC ED               [12]  398 	mov	a,r5
      0000ED 52 06            [12]  399 	anl	ar6,a
      0000EF EF               [12]  400 	mov	a,r7
      0000F0 4E               [12]  401 	orl	a,r6
      0000F1 70 17            [24]  402 	jnz	00108$
                                    403 ;	preemptive.c:138: bitmap |= (1 << i);
      0000F3 AF 3E            [24]  404 	mov	r7,_i
      0000F5 8F F0            [24]  405 	mov	b,r7
      0000F7 05 F0            [12]  406 	inc	b
      0000F9 74 01            [12]  407 	mov	a,#0x01
      0000FB 80 02            [24]  408 	sjmp	00136$
      0000FD                        409 00134$:
      0000FD 25 E0            [12]  410 	add	a,acc
      0000FF                        411 00136$:
      0000FF D5 F0 FB         [24]  412 	djnz	b,00134$
      000102 FF               [12]  413 	mov	r7,a
      000103 42 30            [12]  414 	orl	_bitmap,a
                                    415 ;	preemptive.c:139: newID = i;
      000105 85 3E 33         [24]  416 	mov	_newID,_i
                                    417 ;	preemptive.c:140: break;
      000108 80 07            [24]  418 	sjmp	00105$
      00010A                        419 00108$:
                                    420 ;	preemptive.c:135: for (i = 0;i < 4;i ++){
      00010A E5 3E            [12]  421 	mov	a,_i
      00010C 04               [12]  422 	inc	a
      00010D F5 3E            [12]  423 	mov	_i,a
      00010F 80 B9            [24]  424 	sjmp	00107$
      000111                        425 00105$:
                                    426 ;	preemptive.c:147: new_stk = (0x3F) + (0x10)*newID;
      000111 E5 33            [12]  427 	mov	a,_newID
      000113 C4               [12]  428 	swap	a
      000114 54 F0            [12]  429 	anl	a,#0xf0
      000116 FF               [12]  430 	mov	r7,a
      000117 24 3F            [12]  431 	add	a,#0x3f
      000119 F5 3D            [12]  432 	mov	_new_stk,a
                                    433 ;	preemptive.c:152: temp_SP = SP;
      00011B 85 81 3B         [24]  434 	mov	_temp_SP,_SP
                                    435 ;	preemptive.c:153: SP = new_stk;
      00011E 85 3D 81         [24]  436 	mov	_SP,_new_stk
                                    437 ;	preemptive.c:167: __endasm;
      000121 C0 82            [24]  438 	PUSH	DPL
      000123 C0 83            [24]  439 	PUSH	DPH
                                    440 ;	preemptive.c:181: __endasm;
      000125 74 00            [12]  441 	MOV	A, #0
      000127 C0 E0            [24]  442 	PUSH	ACC
      000129 C0 E0            [24]  443 	PUSH	ACC
      00012B C0 E0            [24]  444 	PUSH	ACC
      00012D C0 E0            [24]  445 	PUSH	ACC
                                    446 ;	preemptive.c:195: temp_PSW = PSW;
      00012F 85 D0 3C         [24]  447 	mov	_temp_PSW,_PSW
                                    448 ;	preemptive.c:196: PSW = newID << 3;
      000132 E5 33            [12]  449 	mov	a,_newID
      000134 FF               [12]  450 	mov	r7,a
      000135 C4               [12]  451 	swap	a
      000136 03               [12]  452 	rr	a
      000137 54 F8            [12]  453 	anl	a,#0xf8
      000139 F5 D0            [12]  454 	mov	_PSW,a
                                    455 ;	preemptive.c:199: __endasm;
      00013B C0 D0            [24]  456 	PUSH	PSW
                                    457 ;	preemptive.c:200: PSW = temp_PSW;
      00013D 85 3C D0         [24]  458 	mov	_PSW,_temp_PSW
                                    459 ;	preemptive.c:205: savedSP[newID] = SP;
      000140 E5 33            [12]  460 	mov	a,_newID
      000142 24 37            [12]  461 	add	a,#_savedSP
      000144 F8               [12]  462 	mov	r0,a
      000145 A6 81            [24]  463 	mov	@r0,_SP
                                    464 ;	preemptive.c:209: SP = temp_SP;
      000147 85 3B 81         [24]  465 	mov	_SP,_temp_SP
                                    466 ;	preemptive.c:213: return newID;
      00014A 85 33 82         [24]  467 	mov	dpl,_newID
      00014D                        468 00109$:
                                    469 ;	preemptive.c:216: }
      00014D D0 D0            [24]  470 	pop	psw
      00014F 92 AF            [24]  471 	mov	ea,c
      000151 22               [24]  472 	ret
                                    473 ;------------------------------------------------------------
                                    474 ;Allocation info for local variables in function 'ThreadYield'
                                    475 ;------------------------------------------------------------
                                    476 ;	preemptive.c:225: void ThreadYield(void)
                                    477 ;	-----------------------------------------
                                    478 ;	 function ThreadYield
                                    479 ;	-----------------------------------------
      000152                        480 _ThreadYield:
      000152 D3               [12]  481 	setb	c
      000153 10 AF 01         [24]  482 	jbc	ea,00122$
      000156 C3               [12]  483 	clr	c
      000157                        484 00122$:
      000157 C0 D0            [24]  485 	push	psw
                                    486 ;	preemptive.c:227: SAVESTATE;
      000159 C0 E0            [24]  487 	PUSH ACC 
      00015B C0 F0            [24]  488 	PUSH B 
      00015D C0 82            [24]  489 	PUSH DPL 
      00015F C0 83            [24]  490 	PUSH DPH 
      000161 C0 D0            [24]  491 	PUSH PSW 
      000163 E5 31            [12]  492 	mov	a,_currID
      000165 24 37            [12]  493 	add	a,#_savedSP
      000167 F8               [12]  494 	mov	r0,a
      000168 A6 81            [24]  495 	mov	@r0,_SP
                                    496 ;	preemptive.c:229: do
      00016A                        497 00103$:
                                    498 ;	preemptive.c:241: currID = ((currID >= 3)? 0 : (currID + 1));
      00016A C3               [12]  499 	clr	c
      00016B E5 31            [12]  500 	mov	a,_currID
      00016D 94 03            [12]  501 	subb	a,#0x03
      00016F 92 02            [24]  502 	mov	_ThreadYield_sloc0_1_0,c
      000171 40 06            [24]  503 	jc	00108$
      000173 7E 00            [12]  504 	mov	r6,#0x00
      000175 7F 00            [12]  505 	mov	r7,#0x00
      000177 80 09            [24]  506 	sjmp	00109$
      000179                        507 00108$:
      000179 AD 31            [24]  508 	mov	r5,_currID
      00017B 0D               [12]  509 	inc	r5
      00017C ED               [12]  510 	mov	a,r5
      00017D FE               [12]  511 	mov	r6,a
      00017E 33               [12]  512 	rlc	a
      00017F 95 E0            [12]  513 	subb	a,acc
      000181 FF               [12]  514 	mov	r7,a
      000182                        515 00109$:
      000182 8E 31            [24]  516 	mov	_currID,r6
                                    517 ;	preemptive.c:242: if (bitmap & (1 << currID)){
      000184 AF 31            [24]  518 	mov	r7,_currID
      000186 8F F0            [24]  519 	mov	b,r7
      000188 05 F0            [12]  520 	inc	b
      00018A 7F 01            [12]  521 	mov	r7,#0x01
      00018C 7E 00            [12]  522 	mov	r6,#0x00
      00018E 80 06            [24]  523 	sjmp	00125$
      000190                        524 00124$:
      000190 EF               [12]  525 	mov	a,r7
      000191 2F               [12]  526 	add	a,r7
      000192 FF               [12]  527 	mov	r7,a
      000193 EE               [12]  528 	mov	a,r6
      000194 33               [12]  529 	rlc	a
      000195 FE               [12]  530 	mov	r6,a
      000196                        531 00125$:
      000196 D5 F0 F7         [24]  532 	djnz	b,00124$
      000199 AC 30            [24]  533 	mov	r4,_bitmap
      00019B 7D 00            [12]  534 	mov	r5,#0x00
      00019D EC               [12]  535 	mov	a,r4
      00019E 52 07            [12]  536 	anl	ar7,a
      0001A0 ED               [12]  537 	mov	a,r5
      0001A1 52 06            [12]  538 	anl	ar6,a
      0001A3 EF               [12]  539 	mov	a,r7
      0001A4 4E               [12]  540 	orl	a,r6
      0001A5 60 C3            [24]  541 	jz	00103$
                                    542 ;	preemptive.c:248: RESTORESTATE;
      0001A7 E5 31            [12]  543 	mov	a,_currID
      0001A9 24 37            [12]  544 	add	a,#_savedSP
      0001AB F9               [12]  545 	mov	r1,a
      0001AC 87 81            [24]  546 	mov	_SP,@r1
      0001AE D0 D0            [24]  547 	POP PSW 
      0001B0 D0 83            [24]  548 	POP DPH 
      0001B2 D0 82            [24]  549 	POP DPL 
      0001B4 D0 F0            [24]  550 	POP B 
      0001B6 D0 E0            [24]  551 	POP ACC 
                                    552 ;	preemptive.c:249: }
      0001B8 D0 D0            [24]  553 	pop	psw
      0001BA 92 AF            [24]  554 	mov	ea,c
      0001BC 22               [24]  555 	ret
                                    556 ;------------------------------------------------------------
                                    557 ;Allocation info for local variables in function 'myTimer0Handler'
                                    558 ;------------------------------------------------------------
                                    559 ;	preemptive.c:251: void myTimer0Handler(void){
                                    560 ;	-----------------------------------------
                                    561 ;	 function myTimer0Handler
                                    562 ;	-----------------------------------------
      0001BD                        563 _myTimer0Handler:
                                    564 ;	preemptive.c:252: EA = 0;
                                    565 ;	assignBit
      0001BD C2 AF            [12]  566 	clr	_EA
                                    567 ;	preemptive.c:253: SAVESTATE;
      0001BF C0 E0            [24]  568 	PUSH ACC 
      0001C1 C0 F0            [24]  569 	PUSH B 
      0001C3 C0 82            [24]  570 	PUSH DPL 
      0001C5 C0 83            [24]  571 	PUSH DPH 
      0001C7 C0 D0            [24]  572 	PUSH PSW 
      0001C9 E5 31            [12]  573 	mov	a,_currID
      0001CB 24 37            [12]  574 	add	a,#_savedSP
      0001CD F8               [12]  575 	mov	r0,a
      0001CE A6 81            [24]  576 	mov	@r0,_SP
                                    577 ;	preemptive.c:271: __endasm;
      0001D0 E8               [12]  578 	MOV	A, R0
      0001D1 C0 E0            [24]  579 	PUSH	ACC
      0001D3 E9               [12]  580 	MOV	A, R1
      0001D4 C0 E0            [24]  581 	PUSH	ACC
      0001D6 EA               [12]  582 	MOV	A, R2
      0001D7 C0 E0            [24]  583 	PUSH	ACC
      0001D9 EB               [12]  584 	MOV	A, R3
      0001DA C0 E0            [24]  585 	PUSH	ACC
      0001DC EC               [12]  586 	MOV	A, R4
      0001DD C0 E0            [24]  587 	PUSH	ACC
      0001DF ED               [12]  588 	MOV	A, R5
      0001E0 C0 E0            [24]  589 	PUSH	ACC
      0001E2 EE               [12]  590 	MOV	A, R6
      0001E3 C0 E0            [24]  591 	PUSH	ACC
      0001E5 EF               [12]  592 	MOV	A, R7
      0001E6 C0 E0            [24]  593 	PUSH	ACC
                                    594 ;	preemptive.c:273: do{
      0001E8                        595 00114$:
                                    596 ;	preemptive.c:274: currID = (currID < 3 ) ?  currID+1 : 0;
      0001E8 74 FD            [12]  597 	mov	a,#0x100 - 0x03
      0001EA 25 31            [12]  598 	add	a,_currID
      0001EC 40 0B            [24]  599 	jc	00119$
      0001EE AF 31            [24]  600 	mov	r7,_currID
      0001F0 0F               [12]  601 	inc	r7
      0001F1 EF               [12]  602 	mov	a,r7
      0001F2 FE               [12]  603 	mov	r6,a
      0001F3 33               [12]  604 	rlc	a
      0001F4 95 E0            [12]  605 	subb	a,acc
      0001F6 FF               [12]  606 	mov	r7,a
      0001F7 80 04            [24]  607 	sjmp	00120$
      0001F9                        608 00119$:
      0001F9 7E 00            [12]  609 	mov	r6,#0x00
      0001FB 7F 00            [12]  610 	mov	r7,#0x00
      0001FD                        611 00120$:
      0001FD 8E 31            [24]  612 	mov	_currID,r6
                                    613 ;	preemptive.c:275: if( currID == 0 )nextID = 1;
      0001FF E5 31            [12]  614 	mov	a,_currID
      000201 70 05            [24]  615 	jnz	00110$
      000203 75 32 01         [24]  616 	mov	_nextID,#0x01
      000206 80 1C            [24]  617 	sjmp	00111$
      000208                        618 00110$:
                                    619 ;	preemptive.c:276: else if( currID == 1 )nextID = 2;
      000208 74 01            [12]  620 	mov	a,#0x01
      00020A B5 31 05         [24]  621 	cjne	a,_currID,00107$
      00020D 75 32 02         [24]  622 	mov	_nextID,#0x02
      000210 80 12            [24]  623 	sjmp	00111$
      000212                        624 00107$:
                                    625 ;	preemptive.c:277: else if( currID == 2 )nextID = 4;
      000212 74 02            [12]  626 	mov	a,#0x02
      000214 B5 31 05         [24]  627 	cjne	a,_currID,00104$
      000217 75 32 04         [24]  628 	mov	_nextID,#0x04
      00021A 80 08            [24]  629 	sjmp	00111$
      00021C                        630 00104$:
                                    631 ;	preemptive.c:278: else if( currID == 3 )nextID = 8;
      00021C 74 03            [12]  632 	mov	a,#0x03
      00021E B5 31 03         [24]  633 	cjne	a,_currID,00111$
      000221 75 32 08         [24]  634 	mov	_nextID,#0x08
      000224                        635 00111$:
                                    636 ;	preemptive.c:279: if( bitmap & nextID ){
      000224 E5 32            [12]  637 	mov	a,_nextID
      000226 55 30            [12]  638 	anl	a,_bitmap
      000228 60 BE            [24]  639 	jz	00114$
                                    640 ;	preemptive.c:301: __endasm;  
      00022A D0 E0            [24]  641 	POP	ACC
      00022C FF               [12]  642 	MOV	R7, A
      00022D D0 E0            [24]  643 	POP	ACC
      00022F FE               [12]  644 	MOV	R6, A
      000230 D0 E0            [24]  645 	POP	ACC
      000232 FD               [12]  646 	MOV	R5, A
      000233 D0 E0            [24]  647 	POP	ACC
      000235 FC               [12]  648 	MOV	R4, A
      000236 D0 E0            [24]  649 	POP	ACC
      000238 FB               [12]  650 	MOV	R3, A
      000239 D0 E0            [24]  651 	POP	ACC
      00023B FA               [12]  652 	MOV	R2, A
      00023C D0 E0            [24]  653 	POP	ACC
      00023E F9               [12]  654 	MOV	R1, A
      00023F D0 E0            [24]  655 	POP	ACC
      000241 F8               [12]  656 	MOV	R0, A
                                    657 ;	preemptive.c:303: RESTORESTATE;
      000242 E5 31            [12]  658 	mov	a,_currID
      000244 24 37            [12]  659 	add	a,#_savedSP
      000246 F9               [12]  660 	mov	r1,a
      000247 87 81            [24]  661 	mov	_SP,@r1
      000249 D0 D0            [24]  662 	POP PSW 
      00024B D0 83            [24]  663 	POP DPH 
      00024D D0 82            [24]  664 	POP DPL 
      00024F D0 F0            [24]  665 	POP B 
      000251 D0 E0            [24]  666 	POP ACC 
                                    667 ;	preemptive.c:304: EA = 1;
                                    668 ;	assignBit
      000253 D2 AF            [12]  669 	setb	_EA
                                    670 ;	preemptive.c:307: __endasm;
      000255 32               [24]  671 	RETI
                                    672 ;	preemptive.c:308: }
      000256 22               [24]  673 	ret
                                    674 ;------------------------------------------------------------
                                    675 ;Allocation info for local variables in function 'ThreadExit'
                                    676 ;------------------------------------------------------------
                                    677 ;	preemptive.c:315: void ThreadExit(void)
                                    678 ;	-----------------------------------------
                                    679 ;	 function ThreadExit
                                    680 ;	-----------------------------------------
      000257                        681 _ThreadExit:
      000257 D3               [12]  682 	setb	c
      000258 10 AF 01         [24]  683 	jbc	ea,00103$
      00025B C3               [12]  684 	clr	c
      00025C                        685 00103$:
      00025C C0 D0            [24]  686 	push	psw
                                    687 ;	preemptive.c:324: RESTORESTATE;
      00025E E5 31            [12]  688 	mov	a,_currID
      000260 24 37            [12]  689 	add	a,#_savedSP
      000262 F9               [12]  690 	mov	r1,a
      000263 87 81            [24]  691 	mov	_SP,@r1
      000265 D0 D0            [24]  692 	POP PSW 
      000267 D0 83            [24]  693 	POP DPH 
      000269 D0 82            [24]  694 	POP DPL 
      00026B D0 F0            [24]  695 	POP B 
      00026D D0 E0            [24]  696 	POP ACC 
                                    697 ;	preemptive.c:325: }
      00026F D0 D0            [24]  698 	pop	psw
      000271 92 AF            [24]  699 	mov	ea,c
      000273 22               [24]  700 	ret
                                    701 	.area CSEG    (CODE)
                                    702 	.area CONST   (CODE)
                                    703 	.area XINIT   (CODE)
                                    704 	.area CABS    (ABS,CODE)
