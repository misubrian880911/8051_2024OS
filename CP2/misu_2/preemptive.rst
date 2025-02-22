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
                                    117 	.globl _sft_temp
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
                           000032   238 _sft_temp	=	0x0032
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
      00009F                        318 _Bootstrap:
                           000007   319 	ar7 = 0x07
                           000006   320 	ar6 = 0x06
                           000005   321 	ar5 = 0x05
                           000004   322 	ar4 = 0x04
                           000003   323 	ar3 = 0x03
                           000002   324 	ar2 = 0x02
                           000001   325 	ar1 = 0x01
                           000000   326 	ar0 = 0x00
                                    327 ;	preemptive.c:98: TMOD = 0; // timer 0 mode 0
      00009F 75 89 00         [24]  328 	mov	_TMOD,#0x00
                                    329 ;	preemptive.c:99: IE = 0x82;
      0000A2 75 A8 82         [24]  330 	mov	_IE,#0x82
                                    331 ;	preemptive.c:102: TR0 = 1; // set bit TR0 to start running timer 0
                                    332 ;	assignBit
      0000A5 D2 8C            [12]  333 	setb	_TR0
                                    334 ;	preemptive.c:103: currID = ThreadCreate(main);
      0000A7 90 00 85         [24]  335 	mov	dptr,#_main
      0000AA 12 00 C2         [24]  336 	lcall	_ThreadCreate
      0000AD 85 82 31         [24]  337 	mov	_currID,dpl
                                    338 ;	preemptive.c:104: RESTORESTATE;
      0000B0 E5 31            [12]  339 	mov	a,_currID
      0000B2 24 37            [12]  340 	add	a,#_savedSP
      0000B4 F9               [12]  341 	mov	r1,a
      0000B5 87 81            [24]  342 	mov	_SP,@r1
      0000B7 D0 D0            [24]  343 	POP PSW 
      0000B9 D0 83            [24]  344 	POP DPH 
      0000BB D0 82            [24]  345 	POP DPL 
      0000BD D0 F0            [24]  346 	POP B 
      0000BF D0 E0            [24]  347 	POP ACC 
                                    348 ;	preemptive.c:106: }
      0000C1 22               [24]  349 	ret
                                    350 ;------------------------------------------------------------
                                    351 ;Allocation info for local variables in function 'ThreadCreate'
                                    352 ;------------------------------------------------------------
                                    353 ;fp                        Allocated to registers 
                                    354 ;------------------------------------------------------------
                                    355 ;	preemptive.c:114: ThreadID ThreadCreate(FunctionPtr fp)
                                    356 ;	-----------------------------------------
                                    357 ;	 function ThreadCreate
                                    358 ;	-----------------------------------------
      0000C2                        359 _ThreadCreate:
      0000C2 D3               [12]  360 	setb	c
      0000C3 10 AF 01         [24]  361 	jbc	ea,00127$
      0000C6 C3               [12]  362 	clr	c
      0000C7                        363 00127$:
      0000C7 C0 D0            [24]  364 	push	psw
                                    365 ;	preemptive.c:121: if (bitmap == 15)
      0000C9 74 0F            [12]  366 	mov	a,#0x0f
      0000CB B5 30 06         [24]  367 	cjne	a,_bitmap,00102$
                                    368 ;	preemptive.c:122: return -1;
      0000CE 75 82 FF         [24]  369 	mov	dpl,#0xff
      0000D1 02 01 5A         [24]  370 	ljmp	00109$
      0000D4                        371 00102$:
                                    372 ;	preemptive.c:135: for (i = 0;i < 4;i ++){
      0000D4 75 3E 00         [24]  373 	mov	_i,#0x00
      0000D7                        374 00107$:
      0000D7 74 FC            [12]  375 	mov	a,#0x100 - 0x04
      0000D9 25 3E            [12]  376 	add	a,_i
      0000DB 40 41            [24]  377 	jc	00105$
                                    378 ;	preemptive.c:136: if (!(bitmap & (1 << i))){
      0000DD AF 3E            [24]  379 	mov	r7,_i
      0000DF 8F F0            [24]  380 	mov	b,r7
      0000E1 05 F0            [12]  381 	inc	b
      0000E3 7F 01            [12]  382 	mov	r7,#0x01
      0000E5 7E 00            [12]  383 	mov	r6,#0x00
      0000E7 80 06            [24]  384 	sjmp	00132$
      0000E9                        385 00131$:
      0000E9 EF               [12]  386 	mov	a,r7
      0000EA 2F               [12]  387 	add	a,r7
      0000EB FF               [12]  388 	mov	r7,a
      0000EC EE               [12]  389 	mov	a,r6
      0000ED 33               [12]  390 	rlc	a
      0000EE FE               [12]  391 	mov	r6,a
      0000EF                        392 00132$:
      0000EF D5 F0 F7         [24]  393 	djnz	b,00131$
      0000F2 AC 30            [24]  394 	mov	r4,_bitmap
      0000F4 7D 00            [12]  395 	mov	r5,#0x00
      0000F6 EC               [12]  396 	mov	a,r4
      0000F7 52 07            [12]  397 	anl	ar7,a
      0000F9 ED               [12]  398 	mov	a,r5
      0000FA 52 06            [12]  399 	anl	ar6,a
      0000FC EF               [12]  400 	mov	a,r7
      0000FD 4E               [12]  401 	orl	a,r6
      0000FE 70 17            [24]  402 	jnz	00108$
                                    403 ;	preemptive.c:138: bitmap |= (1 << i);
      000100 AF 3E            [24]  404 	mov	r7,_i
      000102 8F F0            [24]  405 	mov	b,r7
      000104 05 F0            [12]  406 	inc	b
      000106 74 01            [12]  407 	mov	a,#0x01
      000108 80 02            [24]  408 	sjmp	00136$
      00010A                        409 00134$:
      00010A 25 E0            [12]  410 	add	a,acc
      00010C                        411 00136$:
      00010C D5 F0 FB         [24]  412 	djnz	b,00134$
      00010F FF               [12]  413 	mov	r7,a
      000110 42 30            [12]  414 	orl	_bitmap,a
                                    415 ;	preemptive.c:139: newID = i;
      000112 85 3E 33         [24]  416 	mov	_newID,_i
                                    417 ;	preemptive.c:140: break;
      000115 80 07            [24]  418 	sjmp	00105$
      000117                        419 00108$:
                                    420 ;	preemptive.c:135: for (i = 0;i < 4;i ++){
      000117 E5 3E            [12]  421 	mov	a,_i
      000119 04               [12]  422 	inc	a
      00011A F5 3E            [12]  423 	mov	_i,a
      00011C 80 B9            [24]  424 	sjmp	00107$
      00011E                        425 00105$:
                                    426 ;	preemptive.c:147: new_stk = (0x3F) + (0x10)*newID;
      00011E E5 33            [12]  427 	mov	a,_newID
      000120 C4               [12]  428 	swap	a
      000121 54 F0            [12]  429 	anl	a,#0xf0
      000123 FF               [12]  430 	mov	r7,a
      000124 24 3F            [12]  431 	add	a,#0x3f
      000126 F5 3D            [12]  432 	mov	_new_stk,a
                                    433 ;	preemptive.c:152: temp_SP = SP;
      000128 85 81 3B         [24]  434 	mov	_temp_SP,_SP
                                    435 ;	preemptive.c:153: SP = new_stk;
      00012B 85 3D 81         [24]  436 	mov	_SP,_new_stk
                                    437 ;	preemptive.c:167: __endasm;
      00012E C0 82            [24]  438 	PUSH	DPL
      000130 C0 83            [24]  439 	PUSH	DPH
                                    440 ;	preemptive.c:181: __endasm;
      000132 74 00            [12]  441 	MOV	A, #0
      000134 C0 E0            [24]  442 	PUSH	ACC
      000136 C0 E0            [24]  443 	PUSH	ACC
      000138 C0 E0            [24]  444 	PUSH	ACC
      00013A C0 E0            [24]  445 	PUSH	ACC
                                    446 ;	preemptive.c:195: temp_PSW = PSW;
      00013C 85 D0 3C         [24]  447 	mov	_temp_PSW,_PSW
                                    448 ;	preemptive.c:196: PSW = newID << 3;
      00013F E5 33            [12]  449 	mov	a,_newID
      000141 FF               [12]  450 	mov	r7,a
      000142 C4               [12]  451 	swap	a
      000143 03               [12]  452 	rr	a
      000144 54 F8            [12]  453 	anl	a,#0xf8
      000146 F5 D0            [12]  454 	mov	_PSW,a
                                    455 ;	preemptive.c:199: __endasm;
      000148 C0 D0            [24]  456 	PUSH	PSW
                                    457 ;	preemptive.c:200: PSW = temp_PSW;
      00014A 85 3C D0         [24]  458 	mov	_PSW,_temp_PSW
                                    459 ;	preemptive.c:205: savedSP[newID] = SP;
      00014D E5 33            [12]  460 	mov	a,_newID
      00014F 24 37            [12]  461 	add	a,#_savedSP
      000151 F8               [12]  462 	mov	r0,a
      000152 A6 81            [24]  463 	mov	@r0,_SP
                                    464 ;	preemptive.c:209: SP = temp_SP;
      000154 85 3B 81         [24]  465 	mov	_SP,_temp_SP
                                    466 ;	preemptive.c:213: return newID;
      000157 85 33 82         [24]  467 	mov	dpl,_newID
      00015A                        468 00109$:
                                    469 ;	preemptive.c:216: }
      00015A D0 D0            [24]  470 	pop	psw
      00015C 92 AF            [24]  471 	mov	ea,c
      00015E 22               [24]  472 	ret
                                    473 ;------------------------------------------------------------
                                    474 ;Allocation info for local variables in function 'ThreadYield'
                                    475 ;------------------------------------------------------------
                                    476 ;	preemptive.c:225: void ThreadYield(void)
                                    477 ;	-----------------------------------------
                                    478 ;	 function ThreadYield
                                    479 ;	-----------------------------------------
      00015F                        480 _ThreadYield:
      00015F D3               [12]  481 	setb	c
      000160 10 AF 01         [24]  482 	jbc	ea,00122$
      000163 C3               [12]  483 	clr	c
      000164                        484 00122$:
      000164 C0 D0            [24]  485 	push	psw
                                    486 ;	preemptive.c:227: SAVESTATE;
      000166 C0 E0            [24]  487 	PUSH ACC 
      000168 C0 F0            [24]  488 	PUSH B 
      00016A C0 82            [24]  489 	PUSH DPL 
      00016C C0 83            [24]  490 	PUSH DPH 
      00016E C0 D0            [24]  491 	PUSH PSW 
      000170 E5 31            [12]  492 	mov	a,_currID
      000172 24 37            [12]  493 	add	a,#_savedSP
      000174 F8               [12]  494 	mov	r0,a
      000175 A6 81            [24]  495 	mov	@r0,_SP
                                    496 ;	preemptive.c:229: do
      000177                        497 00103$:
                                    498 ;	preemptive.c:241: currID = ((currID >= 3)? 0 : (currID + 1));
      000177 C3               [12]  499 	clr	c
      000178 E5 31            [12]  500 	mov	a,_currID
      00017A 94 03            [12]  501 	subb	a,#0x03
      00017C 92 02            [24]  502 	mov	_ThreadYield_sloc0_1_0,c
      00017E 40 06            [24]  503 	jc	00108$
      000180 7E 00            [12]  504 	mov	r6,#0x00
      000182 7F 00            [12]  505 	mov	r7,#0x00
      000184 80 09            [24]  506 	sjmp	00109$
      000186                        507 00108$:
      000186 AD 31            [24]  508 	mov	r5,_currID
      000188 0D               [12]  509 	inc	r5
      000189 ED               [12]  510 	mov	a,r5
      00018A FE               [12]  511 	mov	r6,a
      00018B 33               [12]  512 	rlc	a
      00018C 95 E0            [12]  513 	subb	a,acc
      00018E FF               [12]  514 	mov	r7,a
      00018F                        515 00109$:
      00018F 8E 31            [24]  516 	mov	_currID,r6
                                    517 ;	preemptive.c:242: if (bitmap & (1 << currID)){
      000191 AF 31            [24]  518 	mov	r7,_currID
      000193 8F F0            [24]  519 	mov	b,r7
      000195 05 F0            [12]  520 	inc	b
      000197 7F 01            [12]  521 	mov	r7,#0x01
      000199 7E 00            [12]  522 	mov	r6,#0x00
      00019B 80 06            [24]  523 	sjmp	00125$
      00019D                        524 00124$:
      00019D EF               [12]  525 	mov	a,r7
      00019E 2F               [12]  526 	add	a,r7
      00019F FF               [12]  527 	mov	r7,a
      0001A0 EE               [12]  528 	mov	a,r6
      0001A1 33               [12]  529 	rlc	a
      0001A2 FE               [12]  530 	mov	r6,a
      0001A3                        531 00125$:
      0001A3 D5 F0 F7         [24]  532 	djnz	b,00124$
      0001A6 AC 30            [24]  533 	mov	r4,_bitmap
      0001A8 7D 00            [12]  534 	mov	r5,#0x00
      0001AA EC               [12]  535 	mov	a,r4
      0001AB 52 07            [12]  536 	anl	ar7,a
      0001AD ED               [12]  537 	mov	a,r5
      0001AE 52 06            [12]  538 	anl	ar6,a
      0001B0 EF               [12]  539 	mov	a,r7
      0001B1 4E               [12]  540 	orl	a,r6
      0001B2 60 C3            [24]  541 	jz	00103$
                                    542 ;	preemptive.c:248: RESTORESTATE;
      0001B4 E5 31            [12]  543 	mov	a,_currID
      0001B6 24 37            [12]  544 	add	a,#_savedSP
      0001B8 F9               [12]  545 	mov	r1,a
      0001B9 87 81            [24]  546 	mov	_SP,@r1
      0001BB D0 D0            [24]  547 	POP PSW 
      0001BD D0 83            [24]  548 	POP DPH 
      0001BF D0 82            [24]  549 	POP DPL 
      0001C1 D0 F0            [24]  550 	POP B 
      0001C3 D0 E0            [24]  551 	POP ACC 
                                    552 ;	preemptive.c:249: }
      0001C5 D0 D0            [24]  553 	pop	psw
      0001C7 92 AF            [24]  554 	mov	ea,c
      0001C9 22               [24]  555 	ret
                                    556 ;------------------------------------------------------------
                                    557 ;Allocation info for local variables in function 'myTimer0Handler'
                                    558 ;------------------------------------------------------------
                                    559 ;	preemptive.c:251: void myTimer0Handler(void){
                                    560 ;	-----------------------------------------
                                    561 ;	 function myTimer0Handler
                                    562 ;	-----------------------------------------
      0001CA                        563 _myTimer0Handler:
                                    564 ;	preemptive.c:252: EA = 0;
                                    565 ;	assignBit
      0001CA C2 AF            [12]  566 	clr	_EA
                                    567 ;	preemptive.c:253: SAVESTATE;
      0001CC C0 E0            [24]  568 	PUSH ACC 
      0001CE C0 F0            [24]  569 	PUSH B 
      0001D0 C0 82            [24]  570 	PUSH DPL 
      0001D2 C0 83            [24]  571 	PUSH DPH 
      0001D4 C0 D0            [24]  572 	PUSH PSW 
      0001D6 E5 31            [12]  573 	mov	a,_currID
      0001D8 24 37            [12]  574 	add	a,#_savedSP
      0001DA F8               [12]  575 	mov	r0,a
      0001DB A6 81            [24]  576 	mov	@r0,_SP
                                    577 ;	preemptive.c:271: __endasm;
      0001DD E8               [12]  578 	MOV	A, R0
      0001DE C0 E0            [24]  579 	PUSH	ACC
      0001E0 E9               [12]  580 	MOV	A, R1
      0001E1 C0 E0            [24]  581 	PUSH	ACC
      0001E3 EA               [12]  582 	MOV	A, R2
      0001E4 C0 E0            [24]  583 	PUSH	ACC
      0001E6 EB               [12]  584 	MOV	A, R3
      0001E7 C0 E0            [24]  585 	PUSH	ACC
      0001E9 EC               [12]  586 	MOV	A, R4
      0001EA C0 E0            [24]  587 	PUSH	ACC
      0001EC ED               [12]  588 	MOV	A, R5
      0001ED C0 E0            [24]  589 	PUSH	ACC
      0001EF EE               [12]  590 	MOV	A, R6
      0001F0 C0 E0            [24]  591 	PUSH	ACC
      0001F2 EF               [12]  592 	MOV	A, R7
      0001F3 C0 E0            [24]  593 	PUSH	ACC
                                    594 ;	preemptive.c:273: do{
      0001F5                        595 00109$:
                                    596 ;	preemptive.c:274: currID = (currID < 3 ) ?  currID+1 : 0;
      0001F5 74 FD            [12]  597 	mov	a,#0x100 - 0x03
      0001F7 25 31            [12]  598 	add	a,_currID
      0001F9 40 0B            [24]  599 	jc	00114$
      0001FB AF 31            [24]  600 	mov	r7,_currID
      0001FD 0F               [12]  601 	inc	r7
      0001FE EF               [12]  602 	mov	a,r7
      0001FF FE               [12]  603 	mov	r6,a
      000200 33               [12]  604 	rlc	a
      000201 95 E0            [12]  605 	subb	a,acc
      000203 FF               [12]  606 	mov	r7,a
      000204 80 04            [24]  607 	sjmp	00115$
      000206                        608 00114$:
      000206 7E 00            [12]  609 	mov	r6,#0x00
      000208 7F 00            [12]  610 	mov	r7,#0x00
      00020A                        611 00115$:
      00020A 8E 31            [24]  612 	mov	_currID,r6
                                    613 ;	preemptive.c:275: switch (currID)
      00020C E5 31            [12]  614 	mov	a,_currID
      00020E FF               [12]  615 	mov	r7,a
      00020F 24 FC            [12]  616 	add	a,#0xff - 0x03
      000211 40 20            [24]  617 	jc	00106$
      000213 EF               [12]  618 	mov	a,r7
      000214 2F               [12]  619 	add	a,r7
                                    620 ;	preemptive.c:277: case 0:
      000215 90 02 19         [24]  621 	mov	dptr,#00134$
      000218 73               [24]  622 	jmp	@a+dptr
      000219                        623 00134$:
      000219 80 06            [24]  624 	sjmp	00101$
      00021B 80 09            [24]  625 	sjmp	00102$
      00021D 80 0C            [24]  626 	sjmp	00103$
      00021F 80 0F            [24]  627 	sjmp	00104$
      000221                        628 00101$:
                                    629 ;	preemptive.c:278: sft_temp = 1;
      000221 75 32 01         [24]  630 	mov	_sft_temp,#0x01
                                    631 ;	preemptive.c:279: break;
                                    632 ;	preemptive.c:280: case 1:
      000224 80 0D            [24]  633 	sjmp	00106$
      000226                        634 00102$:
                                    635 ;	preemptive.c:281: sft_temp = 2;
      000226 75 32 02         [24]  636 	mov	_sft_temp,#0x02
                                    637 ;	preemptive.c:282: break;
                                    638 ;	preemptive.c:283: case 2:
      000229 80 08            [24]  639 	sjmp	00106$
      00022B                        640 00103$:
                                    641 ;	preemptive.c:284: sft_temp = 4;
      00022B 75 32 04         [24]  642 	mov	_sft_temp,#0x04
                                    643 ;	preemptive.c:285: break;
                                    644 ;	preemptive.c:286: case 3:
      00022E 80 03            [24]  645 	sjmp	00106$
      000230                        646 00104$:
                                    647 ;	preemptive.c:287: sft_temp = 8;
      000230 75 32 08         [24]  648 	mov	_sft_temp,#0x08
                                    649 ;	preemptive.c:292: }
      000233                        650 00106$:
                                    651 ;	preemptive.c:293: if (bitmap & sft_temp){
      000233 E5 32            [12]  652 	mov	a,_sft_temp
      000235 55 30            [12]  653 	anl	a,_bitmap
      000237 60 BC            [24]  654 	jz	00109$
                                    655 ;	preemptive.c:317: __endasm;  
      000239 D0 E0            [24]  656 	POP	ACC
      00023B FF               [12]  657 	MOV	R7, A
      00023C D0 E0            [24]  658 	POP	ACC
      00023E FE               [12]  659 	MOV	R6, A
      00023F D0 E0            [24]  660 	POP	ACC
      000241 FD               [12]  661 	MOV	R5, A
      000242 D0 E0            [24]  662 	POP	ACC
      000244 FC               [12]  663 	MOV	R4, A
      000245 D0 E0            [24]  664 	POP	ACC
      000247 FB               [12]  665 	MOV	R3, A
      000248 D0 E0            [24]  666 	POP	ACC
      00024A FA               [12]  667 	MOV	R2, A
      00024B D0 E0            [24]  668 	POP	ACC
      00024D F9               [12]  669 	MOV	R1, A
      00024E D0 E0            [24]  670 	POP	ACC
      000250 F8               [12]  671 	MOV	R0, A
                                    672 ;	preemptive.c:319: RESTORESTATE;
      000251 E5 31            [12]  673 	mov	a,_currID
      000253 24 37            [12]  674 	add	a,#_savedSP
      000255 F9               [12]  675 	mov	r1,a
      000256 87 81            [24]  676 	mov	_SP,@r1
      000258 D0 D0            [24]  677 	POP PSW 
      00025A D0 83            [24]  678 	POP DPH 
      00025C D0 82            [24]  679 	POP DPL 
      00025E D0 F0            [24]  680 	POP B 
      000260 D0 E0            [24]  681 	POP ACC 
                                    682 ;	preemptive.c:320: EA = 1;
                                    683 ;	assignBit
      000262 D2 AF            [12]  684 	setb	_EA
                                    685 ;	preemptive.c:323: __endasm;
      000264 32               [24]  686 	RETI
                                    687 ;	preemptive.c:324: }
      000265 22               [24]  688 	ret
                                    689 ;------------------------------------------------------------
                                    690 ;Allocation info for local variables in function 'ThreadExit'
                                    691 ;------------------------------------------------------------
                                    692 ;	preemptive.c:331: void ThreadExit(void)
                                    693 ;	-----------------------------------------
                                    694 ;	 function ThreadExit
                                    695 ;	-----------------------------------------
      000266                        696 _ThreadExit:
      000266 D3               [12]  697 	setb	c
      000267 10 AF 01         [24]  698 	jbc	ea,00103$
      00026A C3               [12]  699 	clr	c
      00026B                        700 00103$:
      00026B C0 D0            [24]  701 	push	psw
                                    702 ;	preemptive.c:340: RESTORESTATE;
      00026D E5 31            [12]  703 	mov	a,_currID
      00026F 24 37            [12]  704 	add	a,#_savedSP
      000271 F9               [12]  705 	mov	r1,a
      000272 87 81            [24]  706 	mov	_SP,@r1
      000274 D0 D0            [24]  707 	POP PSW 
      000276 D0 83            [24]  708 	POP DPH 
      000278 D0 82            [24]  709 	POP DPL 
      00027A D0 F0            [24]  710 	POP B 
      00027C D0 E0            [24]  711 	POP ACC 
                                    712 ;	preemptive.c:341: }
      00027E D0 D0            [24]  713 	pop	psw
      000280 92 AF            [24]  714 	mov	ea,c
      000282 22               [24]  715 	ret
                                    716 	.area CSEG    (CODE)
                                    717 	.area CONST   (CODE)
                                    718 	.area XINIT   (CODE)
                                    719 	.area CABS    (ABS,CODE)
