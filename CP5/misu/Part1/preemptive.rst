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
                                    112 	.globl _sft
                                    113 	.globl _temp
                                    114 	.globl _temp_SP
                                    115 	.globl _savedSP
                                    116 	.globl _newID
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
                           000033   237 _newID	=	0x0033
                           000037   238 _savedSP	=	0x0037
                           000020   239 _temp_SP	=	0x0020
                           000021   240 _temp	=	0x0021
                           000022   241 _sft	=	0x0022
                           000023   242 _i	=	0x0023
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
                                    263 ;--------------------------------------------------------
                                    264 ; paged external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area PSEG    (PAG,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XSEG    (XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; absolute external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XABS    (ABS,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; external initialized ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XISEG   (XDATA)
                                    279 	.area HOME    (CODE)
                                    280 	.area GSINIT0 (CODE)
                                    281 	.area GSINIT1 (CODE)
                                    282 	.area GSINIT2 (CODE)
                                    283 	.area GSINIT3 (CODE)
                                    284 	.area GSINIT4 (CODE)
                                    285 	.area GSINIT5 (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area CSEG    (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; global & static initialisations
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 ;	preemptive.c:17: __data __at (0x30) char bitmap = 0x00;
      000017 75 30 00         [24]  297 	mov	_bitmap,#0x00
                                    298 ;--------------------------------------------------------
                                    299 ; Home
                                    300 ;--------------------------------------------------------
                                    301 	.area HOME    (CODE)
                                    302 	.area HOME    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; code
                                    305 ;--------------------------------------------------------
                                    306 	.area CSEG    (CODE)
                                    307 ;------------------------------------------------------------
                                    308 ;Allocation info for local variables in function 'Bootstrap'
                                    309 ;------------------------------------------------------------
                                    310 ;	preemptive.c:82: void Bootstrap(void)
                                    311 ;	-----------------------------------------
                                    312 ;	 function Bootstrap
                                    313 ;	-----------------------------------------
      00017C                        314 _Bootstrap:
                           000007   315 	ar7 = 0x07
                           000006   316 	ar6 = 0x06
                           000005   317 	ar5 = 0x05
                           000004   318 	ar4 = 0x04
                           000003   319 	ar3 = 0x03
                           000002   320 	ar2 = 0x02
                           000001   321 	ar1 = 0x01
                           000000   322 	ar0 = 0x00
                                    323 ;	preemptive.c:97: TMOD = 0; // timer 0 mode 0
      00017C 75 89 00         [24]  324 	mov	_TMOD,#0x00
                                    325 ;	preemptive.c:98: IE = 0x82; // enable timer 0 interrupt; keep consumer polling EA - ET2 ES ET1 EX1 ET0 EX0
      00017F 75 A8 82         [24]  326 	mov	_IE,#0x82
                                    327 ;	preemptive.c:99: TR0 = 1; // set bit TR0 to start running timer 0
                                    328 ;	assignBit
      000182 D2 8C            [12]  329 	setb	_TR0
                                    330 ;	preemptive.c:100: if (bitmap == 0){
      000184 E5 30            [12]  331 	mov	a,_bitmap
      000186 70 1A            [24]  332 	jnz	00103$
                                    333 ;	preemptive.c:101: currID = ThreadCreate(main);
      000188 90 01 4E         [24]  334 	mov	dptr,#_main
      00018B 12 01 A3         [24]  335 	lcall	_ThreadCreate
      00018E 85 82 31         [24]  336 	mov	_currID,dpl
                                    337 ;	preemptive.c:102: RESTORESTATE;
      000191 E5 31            [12]  338 	mov	a,_currID
      000193 24 37            [12]  339 	add	a,#_savedSP
      000195 F9               [12]  340 	mov	r1,a
      000196 87 81            [24]  341 	mov	_SP,@r1
      000198 D0 D0            [24]  342 	POP PSW 
      00019A D0 83            [24]  343 	POP DPH 
      00019C D0 82            [24]  344 	POP DPL 
      00019E D0 F0            [24]  345 	POP B 
      0001A0 D0 E0            [24]  346 	POP ACC 
      0001A2                        347 00103$:
                                    348 ;	preemptive.c:108: }
      0001A2 22               [24]  349 	ret
                                    350 ;------------------------------------------------------------
                                    351 ;Allocation info for local variables in function 'ThreadCreate'
                                    352 ;------------------------------------------------------------
                                    353 ;fp                        Allocated to registers 
                                    354 ;------------------------------------------------------------
                                    355 ;	preemptive.c:116: ThreadID ThreadCreate(FunctionPtr fp)
                                    356 ;	-----------------------------------------
                                    357 ;	 function ThreadCreate
                                    358 ;	-----------------------------------------
      0001A3                        359 _ThreadCreate:
      0001A3 D3               [12]  360 	setb	c
      0001A4 10 AF 01         [24]  361 	jbc	ea,00127$
      0001A7 C3               [12]  362 	clr	c
      0001A8                        363 00127$:
      0001A8 C0 D0            [24]  364 	push	psw
                                    365 ;	preemptive.c:123: if (bitmap == 15)
      0001AA 74 0F            [12]  366 	mov	a,#0x0f
      0001AC B5 30 06         [24]  367 	cjne	a,_bitmap,00102$
                                    368 ;	preemptive.c:124: return -1;
      0001AF 75 82 FF         [24]  369 	mov	dpl,#0xff
      0001B2 02 02 35         [24]  370 	ljmp	00109$
      0001B5                        371 00102$:
                                    372 ;	preemptive.c:138: for (i = 0;i < 4;i ++){
      0001B5 75 23 00         [24]  373 	mov	_i,#0x00
      0001B8                        374 00107$:
      0001B8 74 FC            [12]  375 	mov	a,#0x100 - 0x04
      0001BA 25 23            [12]  376 	add	a,_i
      0001BC 40 41            [24]  377 	jc	00105$
                                    378 ;	preemptive.c:139: if (!(bitmap & (1 << i))){
      0001BE AF 23            [24]  379 	mov	r7,_i
      0001C0 8F F0            [24]  380 	mov	b,r7
      0001C2 05 F0            [12]  381 	inc	b
      0001C4 7F 01            [12]  382 	mov	r7,#0x01
      0001C6 7E 00            [12]  383 	mov	r6,#0x00
      0001C8 80 06            [24]  384 	sjmp	00132$
      0001CA                        385 00131$:
      0001CA EF               [12]  386 	mov	a,r7
      0001CB 2F               [12]  387 	add	a,r7
      0001CC FF               [12]  388 	mov	r7,a
      0001CD EE               [12]  389 	mov	a,r6
      0001CE 33               [12]  390 	rlc	a
      0001CF FE               [12]  391 	mov	r6,a
      0001D0                        392 00132$:
      0001D0 D5 F0 F7         [24]  393 	djnz	b,00131$
      0001D3 AC 30            [24]  394 	mov	r4,_bitmap
      0001D5 7D 00            [12]  395 	mov	r5,#0x00
      0001D7 EC               [12]  396 	mov	a,r4
      0001D8 52 07            [12]  397 	anl	ar7,a
      0001DA ED               [12]  398 	mov	a,r5
      0001DB 52 06            [12]  399 	anl	ar6,a
      0001DD EF               [12]  400 	mov	a,r7
      0001DE 4E               [12]  401 	orl	a,r6
      0001DF 70 17            [24]  402 	jnz	00108$
                                    403 ;	preemptive.c:141: bitmap |= (1 << i);
      0001E1 AF 23            [24]  404 	mov	r7,_i
      0001E3 8F F0            [24]  405 	mov	b,r7
      0001E5 05 F0            [12]  406 	inc	b
      0001E7 74 01            [12]  407 	mov	a,#0x01
      0001E9 80 02            [24]  408 	sjmp	00136$
      0001EB                        409 00134$:
      0001EB 25 E0            [12]  410 	add	a,acc
      0001ED                        411 00136$:
      0001ED D5 F0 FB         [24]  412 	djnz	b,00134$
      0001F0 FF               [12]  413 	mov	r7,a
      0001F1 42 30            [12]  414 	orl	_bitmap,a
                                    415 ;	preemptive.c:142: newID = i;
      0001F3 85 23 33         [24]  416 	mov	_newID,_i
                                    417 ;	preemptive.c:143: break;
      0001F6 80 07            [24]  418 	sjmp	00105$
      0001F8                        419 00108$:
                                    420 ;	preemptive.c:138: for (i = 0;i < 4;i ++){
      0001F8 E5 23            [12]  421 	mov	a,_i
      0001FA 04               [12]  422 	inc	a
      0001FB F5 23            [12]  423 	mov	_i,a
      0001FD 80 B9            [24]  424 	sjmp	00107$
      0001FF                        425 00105$:
                                    426 ;	preemptive.c:150: temp = (0x3F) + (0x10)*newID;
      0001FF E5 33            [12]  427 	mov	a,_newID
      000201 C4               [12]  428 	swap	a
      000202 54 F0            [12]  429 	anl	a,#0xf0
      000204 FF               [12]  430 	mov	r7,a
      000205 24 3F            [12]  431 	add	a,#0x3f
      000207 F5 21            [12]  432 	mov	_temp,a
                                    433 ;	preemptive.c:155: temp_SP = SP;
      000209 85 81 20         [24]  434 	mov	_temp_SP,_SP
                                    435 ;	preemptive.c:156: SP = temp;
      00020C 85 21 81         [24]  436 	mov	_SP,_temp
                                    437 ;	preemptive.c:169: __endasm;
      00020F C0 82            [24]  438 	PUSH	DPL
      000211 C0 83            [24]  439 	PUSH	DPH
                                    440 ;	preemptive.c:183: __endasm;
      000213 74 00            [12]  441 	MOV	A, #0
      000215 C0 E0            [24]  442 	PUSH	ACC
      000217 C0 E0            [24]  443 	PUSH	ACC
      000219 C0 E0            [24]  444 	PUSH	ACC
      00021B C0 E0            [24]  445 	PUSH	ACC
                                    446 ;	preemptive.c:198: temp = newID << 3;
      00021D E5 33            [12]  447 	mov	a,_newID
      00021F FF               [12]  448 	mov	r7,a
      000220 C4               [12]  449 	swap	a
      000221 03               [12]  450 	rr	a
      000222 54 F8            [12]  451 	anl	a,#0xf8
      000224 F5 21            [12]  452 	mov	_temp,a
                                    453 ;	preemptive.c:201: __endasm;
      000226 C0 21            [24]  454 	PUSH	_temp
                                    455 ;	preemptive.c:207: savedSP[newID] = SP;
      000228 E5 33            [12]  456 	mov	a,_newID
      00022A 24 37            [12]  457 	add	a,#_savedSP
      00022C F8               [12]  458 	mov	r0,a
      00022D A6 81            [24]  459 	mov	@r0,_SP
                                    460 ;	preemptive.c:211: SP = temp_SP;
      00022F 85 20 81         [24]  461 	mov	_SP,_temp_SP
                                    462 ;	preemptive.c:215: return newID;
      000232 85 33 82         [24]  463 	mov	dpl,_newID
      000235                        464 00109$:
                                    465 ;	preemptive.c:218: }
      000235 D0 D0            [24]  466 	pop	psw
      000237 92 AF            [24]  467 	mov	ea,c
      000239 22               [24]  468 	ret
                                    469 ;------------------------------------------------------------
                                    470 ;Allocation info for local variables in function 'ThreadYield'
                                    471 ;------------------------------------------------------------
                                    472 ;	preemptive.c:227: void ThreadYield(void)
                                    473 ;	-----------------------------------------
                                    474 ;	 function ThreadYield
                                    475 ;	-----------------------------------------
      00023A                        476 _ThreadYield:
      00023A D3               [12]  477 	setb	c
      00023B 10 AF 01         [24]  478 	jbc	ea,00122$
      00023E C3               [12]  479 	clr	c
      00023F                        480 00122$:
      00023F C0 D0            [24]  481 	push	psw
                                    482 ;	preemptive.c:229: SAVESTATE;
      000241 C0 E0            [24]  483 	PUSH ACC 
      000243 C0 F0            [24]  484 	PUSH B 
      000245 C0 82            [24]  485 	PUSH DPL 
      000247 C0 83            [24]  486 	PUSH DPH 
      000249 C0 D0            [24]  487 	PUSH PSW 
      00024B E5 31            [12]  488 	mov	a,_currID
      00024D 24 37            [12]  489 	add	a,#_savedSP
      00024F F8               [12]  490 	mov	r0,a
      000250 A6 81            [24]  491 	mov	@r0,_SP
                                    492 ;	preemptive.c:247: __endasm;
      000252 E8               [12]  493 	MOV	A, R0
      000253 C0 E0            [24]  494 	PUSH	ACC
      000255 E9               [12]  495 	MOV	A, R1
      000256 C0 E0            [24]  496 	PUSH	ACC
      000258 EA               [12]  497 	MOV	A, R2
      000259 C0 E0            [24]  498 	PUSH	ACC
      00025B EB               [12]  499 	MOV	A, R3
      00025C C0 E0            [24]  500 	PUSH	ACC
      00025E EC               [12]  501 	MOV	A, R4
      00025F C0 E0            [24]  502 	PUSH	ACC
      000261 ED               [12]  503 	MOV	A, R5
      000262 C0 E0            [24]  504 	PUSH	ACC
      000264 EE               [12]  505 	MOV	A, R6
      000265 C0 E0            [24]  506 	PUSH	ACC
      000267 EF               [12]  507 	MOV	A, R7
      000268 C0 E0            [24]  508 	PUSH	ACC
                                    509 ;	preemptive.c:250: do{
      00026A                        510 00103$:
                                    511 ;	preemptive.c:251: currID = (currID < 3 ) ?  currID+1 : 0;
      00026A 74 FD            [12]  512 	mov	a,#0x100 - 0x03
      00026C 25 31            [12]  513 	add	a,_currID
      00026E 40 0B            [24]  514 	jc	00108$
      000270 AF 31            [24]  515 	mov	r7,_currID
      000272 0F               [12]  516 	inc	r7
      000273 EF               [12]  517 	mov	a,r7
      000274 FE               [12]  518 	mov	r6,a
      000275 33               [12]  519 	rlc	a
      000276 95 E0            [12]  520 	subb	a,acc
      000278 FF               [12]  521 	mov	r7,a
      000279 80 04            [24]  522 	sjmp	00109$
      00027B                        523 00108$:
      00027B 7E 00            [12]  524 	mov	r6,#0x00
      00027D 7F 00            [12]  525 	mov	r7,#0x00
      00027F                        526 00109$:
      00027F 8E 31            [24]  527 	mov	_currID,r6
                                    528 ;	preemptive.c:252: sft = 1 << currID;
      000281 AF 31            [24]  529 	mov	r7,_currID
      000283 8F F0            [24]  530 	mov	b,r7
      000285 05 F0            [12]  531 	inc	b
      000287 74 01            [12]  532 	mov	a,#0x01
      000289 80 02            [24]  533 	sjmp	00126$
      00028B                        534 00124$:
      00028B 25 E0            [12]  535 	add	a,acc
      00028D                        536 00126$:
      00028D D5 F0 FB         [24]  537 	djnz	b,00124$
      000290 F5 22            [12]  538 	mov	_sft,a
                                    539 ;	preemptive.c:253: if( bitmap & sft ){
      000292 E5 22            [12]  540 	mov	a,_sft
      000294 55 30            [12]  541 	anl	a,_bitmap
      000296 60 D2            [24]  542 	jz	00103$
                                    543 ;	preemptive.c:274: __endasm;  
      000298 D0 E0            [24]  544 	POP	ACC
      00029A FF               [12]  545 	MOV	R7, A
      00029B D0 E0            [24]  546 	POP	ACC
      00029D FE               [12]  547 	MOV	R6, A
      00029E D0 E0            [24]  548 	POP	ACC
      0002A0 FD               [12]  549 	MOV	R5, A
      0002A1 D0 E0            [24]  550 	POP	ACC
      0002A3 FC               [12]  551 	MOV	R4, A
      0002A4 D0 E0            [24]  552 	POP	ACC
      0002A6 FB               [12]  553 	MOV	R3, A
      0002A7 D0 E0            [24]  554 	POP	ACC
      0002A9 FA               [12]  555 	MOV	R2, A
      0002AA D0 E0            [24]  556 	POP	ACC
      0002AC F9               [12]  557 	MOV	R1, A
      0002AD D0 E0            [24]  558 	POP	ACC
      0002AF F8               [12]  559 	MOV	R0, A
                                    560 ;	preemptive.c:275: RESTORESTATE;
      0002B0 E5 31            [12]  561 	mov	a,_currID
      0002B2 24 37            [12]  562 	add	a,#_savedSP
      0002B4 F9               [12]  563 	mov	r1,a
      0002B5 87 81            [24]  564 	mov	_SP,@r1
      0002B7 D0 D0            [24]  565 	POP PSW 
      0002B9 D0 83            [24]  566 	POP DPH 
      0002BB D0 82            [24]  567 	POP DPL 
      0002BD D0 F0            [24]  568 	POP B 
      0002BF D0 E0            [24]  569 	POP ACC 
                                    570 ;	preemptive.c:276: }
      0002C1 D0 D0            [24]  571 	pop	psw
      0002C3 92 AF            [24]  572 	mov	ea,c
      0002C5 22               [24]  573 	ret
                                    574 ;------------------------------------------------------------
                                    575 ;Allocation info for local variables in function 'myTimer0Handler'
                                    576 ;------------------------------------------------------------
                                    577 ;	preemptive.c:278: void myTimer0Handler(void){
                                    578 ;	-----------------------------------------
                                    579 ;	 function myTimer0Handler
                                    580 ;	-----------------------------------------
      0002C6                        581 _myTimer0Handler:
                                    582 ;	preemptive.c:279: EA = 0;
                                    583 ;	assignBit
      0002C6 C2 AF            [12]  584 	clr	_EA
                                    585 ;	preemptive.c:280: SAVESTATE;
      0002C8 C0 E0            [24]  586 	PUSH ACC 
      0002CA C0 F0            [24]  587 	PUSH B 
      0002CC C0 82            [24]  588 	PUSH DPL 
      0002CE C0 83            [24]  589 	PUSH DPH 
      0002D0 C0 D0            [24]  590 	PUSH PSW 
      0002D2 E5 31            [12]  591 	mov	a,_currID
      0002D4 24 37            [12]  592 	add	a,#_savedSP
      0002D6 F8               [12]  593 	mov	r0,a
      0002D7 A6 81            [24]  594 	mov	@r0,_SP
                                    595 ;	preemptive.c:298: __endasm;
      0002D9 E8               [12]  596 	MOV	A, R0
      0002DA C0 E0            [24]  597 	PUSH	ACC
      0002DC E9               [12]  598 	MOV	A, R1
      0002DD C0 E0            [24]  599 	PUSH	ACC
      0002DF EA               [12]  600 	MOV	A, R2
      0002E0 C0 E0            [24]  601 	PUSH	ACC
      0002E2 EB               [12]  602 	MOV	A, R3
      0002E3 C0 E0            [24]  603 	PUSH	ACC
      0002E5 EC               [12]  604 	MOV	A, R4
      0002E6 C0 E0            [24]  605 	PUSH	ACC
      0002E8 ED               [12]  606 	MOV	A, R5
      0002E9 C0 E0            [24]  607 	PUSH	ACC
      0002EB EE               [12]  608 	MOV	A, R6
      0002EC C0 E0            [24]  609 	PUSH	ACC
      0002EE EF               [12]  610 	MOV	A, R7
      0002EF C0 E0            [24]  611 	PUSH	ACC
                                    612 ;	preemptive.c:300: do{
      0002F1                        613 00103$:
                                    614 ;	preemptive.c:301: currID = (currID < 3 ) ?  currID+1 : 0;
      0002F1 74 FD            [12]  615 	mov	a,#0x100 - 0x03
      0002F3 25 31            [12]  616 	add	a,_currID
      0002F5 40 0B            [24]  617 	jc	00108$
      0002F7 AF 31            [24]  618 	mov	r7,_currID
      0002F9 0F               [12]  619 	inc	r7
      0002FA EF               [12]  620 	mov	a,r7
      0002FB FE               [12]  621 	mov	r6,a
      0002FC 33               [12]  622 	rlc	a
      0002FD 95 E0            [12]  623 	subb	a,acc
      0002FF FF               [12]  624 	mov	r7,a
      000300 80 04            [24]  625 	sjmp	00109$
      000302                        626 00108$:
      000302 7E 00            [12]  627 	mov	r6,#0x00
      000304 7F 00            [12]  628 	mov	r7,#0x00
      000306                        629 00109$:
      000306 8E 31            [24]  630 	mov	_currID,r6
                                    631 ;	preemptive.c:302: sft = 1 << currID;
      000308 AF 31            [24]  632 	mov	r7,_currID
      00030A 8F F0            [24]  633 	mov	b,r7
      00030C 05 F0            [12]  634 	inc	b
      00030E 74 01            [12]  635 	mov	a,#0x01
      000310 80 02            [24]  636 	sjmp	00125$
      000312                        637 00123$:
      000312 25 E0            [12]  638 	add	a,acc
      000314                        639 00125$:
      000314 D5 F0 FB         [24]  640 	djnz	b,00123$
      000317 F5 22            [12]  641 	mov	_sft,a
                                    642 ;	preemptive.c:303: if( bitmap & sft ){
      000319 E5 22            [12]  643 	mov	a,_sft
      00031B 55 30            [12]  644 	anl	a,_bitmap
      00031D 60 D2            [24]  645 	jz	00103$
                                    646 ;	preemptive.c:325: __endasm;  
      00031F D0 E0            [24]  647 	POP	ACC
      000321 FF               [12]  648 	MOV	R7, A
      000322 D0 E0            [24]  649 	POP	ACC
      000324 FE               [12]  650 	MOV	R6, A
      000325 D0 E0            [24]  651 	POP	ACC
      000327 FD               [12]  652 	MOV	R5, A
      000328 D0 E0            [24]  653 	POP	ACC
      00032A FC               [12]  654 	MOV	R4, A
      00032B D0 E0            [24]  655 	POP	ACC
      00032D FB               [12]  656 	MOV	R3, A
      00032E D0 E0            [24]  657 	POP	ACC
      000330 FA               [12]  658 	MOV	R2, A
      000331 D0 E0            [24]  659 	POP	ACC
      000333 F9               [12]  660 	MOV	R1, A
      000334 D0 E0            [24]  661 	POP	ACC
      000336 F8               [12]  662 	MOV	R0, A
                                    663 ;	preemptive.c:327: RESTORESTATE;
      000337 E5 31            [12]  664 	mov	a,_currID
      000339 24 37            [12]  665 	add	a,#_savedSP
      00033B F9               [12]  666 	mov	r1,a
      00033C 87 81            [24]  667 	mov	_SP,@r1
      00033E D0 D0            [24]  668 	POP PSW 
      000340 D0 83            [24]  669 	POP DPH 
      000342 D0 82            [24]  670 	POP DPL 
      000344 D0 F0            [24]  671 	POP B 
      000346 D0 E0            [24]  672 	POP ACC 
                                    673 ;	preemptive.c:328: EA = 1;
                                    674 ;	assignBit
      000348 D2 AF            [12]  675 	setb	_EA
                                    676 ;	preemptive.c:331: __endasm;
      00034A 32               [24]  677 	RETI
                                    678 ;	preemptive.c:332: }
      00034B 22               [24]  679 	ret
                                    680 ;------------------------------------------------------------
                                    681 ;Allocation info for local variables in function 'ThreadExit'
                                    682 ;------------------------------------------------------------
                                    683 ;	preemptive.c:339: void ThreadExit(void)
                                    684 ;	-----------------------------------------
                                    685 ;	 function ThreadExit
                                    686 ;	-----------------------------------------
      00034C                        687 _ThreadExit:
      00034C D3               [12]  688 	setb	c
      00034D 10 AF 01         [24]  689 	jbc	ea,00103$
      000350 C3               [12]  690 	clr	c
      000351                        691 00103$:
      000351 C0 D0            [24]  692 	push	psw
                                    693 ;	preemptive.c:348: RESTORESTATE;
      000353 E5 31            [12]  694 	mov	a,_currID
      000355 24 37            [12]  695 	add	a,#_savedSP
      000357 F9               [12]  696 	mov	r1,a
      000358 87 81            [24]  697 	mov	_SP,@r1
      00035A D0 D0            [24]  698 	POP PSW 
      00035C D0 83            [24]  699 	POP DPH 
      00035E D0 82            [24]  700 	POP DPL 
      000360 D0 F0            [24]  701 	POP B 
      000362 D0 E0            [24]  702 	POP ACC 
                                    703 ;	preemptive.c:349: }
      000364 D0 D0            [24]  704 	pop	psw
      000366 92 AF            [24]  705 	mov	ea,c
      000368 22               [24]  706 	ret
                                    707 	.area CSEG    (CODE)
                                    708 	.area CONST   (CODE)
                                    709 	.area XINIT   (CODE)
                                    710 	.area CABS    (ABS,CODE)
