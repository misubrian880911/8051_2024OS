                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _bitmap
                                    110 	.globl _new_stk
                                    111 	.globl _temp_PSW
                                    112 	.globl _temp_SP
                                    113 	.globl _i
                                    114 	.globl _newID
                                    115 	.globl _currID
                                    116 	.globl _savedSP
                                    117 	.globl _ThreadCreate
                                    118 	.globl _ThreadYield
                                    119 	.globl _ThreadExit
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000081   126 _SP	=	0x0081
                           000082   127 _DPL	=	0x0082
                           000083   128 _DPH	=	0x0083
                           000087   129 _PCON	=	0x0087
                           000088   130 _TCON	=	0x0088
                           000089   131 _TMOD	=	0x0089
                           00008A   132 _TL0	=	0x008a
                           00008B   133 _TL1	=	0x008b
                           00008C   134 _TH0	=	0x008c
                           00008D   135 _TH1	=	0x008d
                           000090   136 _P1	=	0x0090
                           000098   137 _SCON	=	0x0098
                           000099   138 _SBUF	=	0x0099
                           0000A0   139 _P2	=	0x00a0
                           0000A8   140 _IE	=	0x00a8
                           0000B0   141 _P3	=	0x00b0
                           0000B8   142 _IP	=	0x00b8
                           0000D0   143 _PSW	=	0x00d0
                           0000E0   144 _ACC	=	0x00e0
                           0000F0   145 _B	=	0x00f0
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           000080   151 _P0_0	=	0x0080
                           000081   152 _P0_1	=	0x0081
                           000082   153 _P0_2	=	0x0082
                           000083   154 _P0_3	=	0x0083
                           000084   155 _P0_4	=	0x0084
                           000085   156 _P0_5	=	0x0085
                           000086   157 _P0_6	=	0x0086
                           000087   158 _P0_7	=	0x0087
                           000088   159 _IT0	=	0x0088
                           000089   160 _IE0	=	0x0089
                           00008A   161 _IT1	=	0x008a
                           00008B   162 _IE1	=	0x008b
                           00008C   163 _TR0	=	0x008c
                           00008D   164 _TF0	=	0x008d
                           00008E   165 _TR1	=	0x008e
                           00008F   166 _TF1	=	0x008f
                           000090   167 _P1_0	=	0x0090
                           000091   168 _P1_1	=	0x0091
                           000092   169 _P1_2	=	0x0092
                           000093   170 _P1_3	=	0x0093
                           000094   171 _P1_4	=	0x0094
                           000095   172 _P1_5	=	0x0095
                           000096   173 _P1_6	=	0x0096
                           000097   174 _P1_7	=	0x0097
                           000098   175 _RI	=	0x0098
                           000099   176 _TI	=	0x0099
                           00009A   177 _RB8	=	0x009a
                           00009B   178 _TB8	=	0x009b
                           00009C   179 _REN	=	0x009c
                           00009D   180 _SM2	=	0x009d
                           00009E   181 _SM1	=	0x009e
                           00009F   182 _SM0	=	0x009f
                           0000A0   183 _P2_0	=	0x00a0
                           0000A1   184 _P2_1	=	0x00a1
                           0000A2   185 _P2_2	=	0x00a2
                           0000A3   186 _P2_3	=	0x00a3
                           0000A4   187 _P2_4	=	0x00a4
                           0000A5   188 _P2_5	=	0x00a5
                           0000A6   189 _P2_6	=	0x00a6
                           0000A7   190 _P2_7	=	0x00a7
                           0000A8   191 _EX0	=	0x00a8
                           0000A9   192 _ET0	=	0x00a9
                           0000AA   193 _EX1	=	0x00aa
                           0000AB   194 _ET1	=	0x00ab
                           0000AC   195 _ES	=	0x00ac
                           0000AF   196 _EA	=	0x00af
                           0000B0   197 _P3_0	=	0x00b0
                           0000B1   198 _P3_1	=	0x00b1
                           0000B2   199 _P3_2	=	0x00b2
                           0000B3   200 _P3_3	=	0x00b3
                           0000B4   201 _P3_4	=	0x00b4
                           0000B5   202 _P3_5	=	0x00b5
                           0000B6   203 _P3_6	=	0x00b6
                           0000B7   204 _P3_7	=	0x00b7
                           0000B0   205 _RXD	=	0x00b0
                           0000B1   206 _TXD	=	0x00b1
                           0000B2   207 _INT0	=	0x00b2
                           0000B3   208 _INT1	=	0x00b3
                           0000B4   209 _T0	=	0x00b4
                           0000B5   210 _T1	=	0x00b5
                           0000B6   211 _WR	=	0x00b6
                           0000B7   212 _RD	=	0x00b7
                           0000B8   213 _PX0	=	0x00b8
                           0000B9   214 _PT0	=	0x00b9
                           0000BA   215 _PX1	=	0x00ba
                           0000BB   216 _PT1	=	0x00bb
                           0000BC   217 _PS	=	0x00bc
                           0000D0   218 _P	=	0x00d0
                           0000D1   219 _F1	=	0x00d1
                           0000D2   220 _OV	=	0x00d2
                           0000D3   221 _RS0	=	0x00d3
                           0000D4   222 _RS1	=	0x00d4
                           0000D5   223 _F0	=	0x00d5
                           0000D6   224 _AC	=	0x00d6
                           0000D7   225 _CY	=	0x00d7
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable register banks
                                    228 ;--------------------------------------------------------
                                    229 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        230 	.ds 8
                                    231 ;--------------------------------------------------------
                                    232 ; internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DSEG    (DATA)
                           000030   235 _savedSP	=	0x0030
                           000035   236 _currID	=	0x0035
                           000039   237 _newID	=	0x0039
                           00003A   238 _i	=	0x003a
                           00003B   239 _temp_SP	=	0x003b
                           00003C   240 _temp_PSW	=	0x003c
                           00003D   241 _new_stk	=	0x003d
                                    242 ;--------------------------------------------------------
                                    243 ; overlayable items in internal ram
                                    244 ;--------------------------------------------------------
                                    245 	.area	OSEG    (OVR,DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; indirectly addressable internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area ISEG    (DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; absolute internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area IABS    (ABS,DATA)
      000034                        254 	.org 0x0034
      000034                        255 _bitmap::
      000034                        256 	.ds 1
                                    257 	.area IABS    (ABS,DATA)
                                    258 ;--------------------------------------------------------
                                    259 ; bit data
                                    260 ;--------------------------------------------------------
                                    261 	.area BSEG    (BIT)
      000001                        262 _ThreadYield_sloc0_1_0:
      000001                        263 	.ds 1
                                    264 ;--------------------------------------------------------
                                    265 ; paged external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area PSEG    (PAG,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XSEG    (XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; absolute external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XABS    (ABS,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; external initialized ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XISEG   (XDATA)
                                    280 	.area HOME    (CODE)
                                    281 	.area GSINIT0 (CODE)
                                    282 	.area GSINIT1 (CODE)
                                    283 	.area GSINIT2 (CODE)
                                    284 	.area GSINIT3 (CODE)
                                    285 	.area GSINIT4 (CODE)
                                    286 	.area GSINIT5 (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area CSEG    (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; global & static initialisations
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 ;	cooperative.c:17: __data __at (0x34) char bitmap = 0x00;
      000006 75 34 00         [24]  298 	mov	_bitmap,#0x00
                                    299 ;--------------------------------------------------------
                                    300 ; Home
                                    301 ;--------------------------------------------------------
                                    302 	.area HOME    (CODE)
                                    303 	.area HOME    (CODE)
                                    304 ;--------------------------------------------------------
                                    305 ; code
                                    306 ;--------------------------------------------------------
                                    307 	.area CSEG    (CODE)
                                    308 ;------------------------------------------------------------
                                    309 ;Allocation info for local variables in function 'Bootstrap'
                                    310 ;------------------------------------------------------------
                                    311 ;	cooperative.c:80: void Bootstrap(void)
                                    312 ;	-----------------------------------------
                                    313 ;	 function Bootstrap
                                    314 ;	-----------------------------------------
      00007A                        315 _Bootstrap:
                           000007   316 	ar7 = 0x07
                           000006   317 	ar6 = 0x06
                           000005   318 	ar5 = 0x05
                           000004   319 	ar4 = 0x04
                           000003   320 	ar3 = 0x03
                           000002   321 	ar2 = 0x02
                           000001   322 	ar1 = 0x01
                           000000   323 	ar0 = 0x00
                                    324 ;	cooperative.c:95: currID = ThreadCreate(main);
      00007A 90 00 64         [24]  325 	mov	dptr,#_main
      00007D 12 00 95         [24]  326 	lcall	_ThreadCreate
      000080 85 82 35         [24]  327 	mov	_currID,dpl
                                    328 ;	cooperative.c:96: RESTORESTATE;
      000083 E5 35            [12]  329 	mov	a,_currID
      000085 24 30            [12]  330 	add	a,#_savedSP
      000087 F9               [12]  331 	mov	r1,a
      000088 87 81            [24]  332 	mov	_SP,@r1
      00008A D0 D0            [24]  333 	POP PSW 
      00008C D0 83            [24]  334 	POP DPH 
      00008E D0 82            [24]  335 	POP DPL 
      000090 D0 F0            [24]  336 	POP B 
      000092 D0 E0            [24]  337 	POP ACC 
                                    338 ;	cooperative.c:98: }
      000094 22               [24]  339 	ret
                                    340 ;------------------------------------------------------------
                                    341 ;Allocation info for local variables in function 'ThreadCreate'
                                    342 ;------------------------------------------------------------
                                    343 ;fp                        Allocated to registers 
                                    344 ;------------------------------------------------------------
                                    345 ;	cooperative.c:106: ThreadID ThreadCreate(FunctionPtr fp)
                                    346 ;	-----------------------------------------
                                    347 ;	 function ThreadCreate
                                    348 ;	-----------------------------------------
      000095                        349 _ThreadCreate:
                                    350 ;	cooperative.c:113: if (bitmap == 15)
      000095 74 0F            [12]  351 	mov	a,#0x0f
      000097 B5 34 04         [24]  352 	cjne	a,_bitmap,00102$
                                    353 ;	cooperative.c:114: return -1;
      00009A 75 82 FF         [24]  354 	mov	dpl,#0xff
      00009D 22               [24]  355 	ret
      00009E                        356 00102$:
                                    357 ;	cooperative.c:127: for (i = 0;i < 4;i ++){
      00009E 75 3A 00         [24]  358 	mov	_i,#0x00
      0000A1                        359 00107$:
      0000A1 74 FC            [12]  360 	mov	a,#0x100 - 0x04
      0000A3 25 3A            [12]  361 	add	a,_i
      0000A5 40 41            [24]  362 	jc	00105$
                                    363 ;	cooperative.c:128: if (!(bitmap & (1 << i))){
      0000A7 AF 3A            [24]  364 	mov	r7,_i
      0000A9 8F F0            [24]  365 	mov	b,r7
      0000AB 05 F0            [12]  366 	inc	b
      0000AD 7F 01            [12]  367 	mov	r7,#0x01
      0000AF 7E 00            [12]  368 	mov	r6,#0x00
      0000B1 80 06            [24]  369 	sjmp	00131$
      0000B3                        370 00130$:
      0000B3 EF               [12]  371 	mov	a,r7
      0000B4 2F               [12]  372 	add	a,r7
      0000B5 FF               [12]  373 	mov	r7,a
      0000B6 EE               [12]  374 	mov	a,r6
      0000B7 33               [12]  375 	rlc	a
      0000B8 FE               [12]  376 	mov	r6,a
      0000B9                        377 00131$:
      0000B9 D5 F0 F7         [24]  378 	djnz	b,00130$
      0000BC AC 34            [24]  379 	mov	r4,_bitmap
      0000BE 7D 00            [12]  380 	mov	r5,#0x00
      0000C0 EC               [12]  381 	mov	a,r4
      0000C1 52 07            [12]  382 	anl	ar7,a
      0000C3 ED               [12]  383 	mov	a,r5
      0000C4 52 06            [12]  384 	anl	ar6,a
      0000C6 EF               [12]  385 	mov	a,r7
      0000C7 4E               [12]  386 	orl	a,r6
      0000C8 70 17            [24]  387 	jnz	00108$
                                    388 ;	cooperative.c:130: bitmap |= (1 << i);
      0000CA AF 3A            [24]  389 	mov	r7,_i
      0000CC 8F F0            [24]  390 	mov	b,r7
      0000CE 05 F0            [12]  391 	inc	b
      0000D0 74 01            [12]  392 	mov	a,#0x01
      0000D2 80 02            [24]  393 	sjmp	00135$
      0000D4                        394 00133$:
      0000D4 25 E0            [12]  395 	add	a,acc
      0000D6                        396 00135$:
      0000D6 D5 F0 FB         [24]  397 	djnz	b,00133$
      0000D9 FF               [12]  398 	mov	r7,a
      0000DA 42 34            [12]  399 	orl	_bitmap,a
                                    400 ;	cooperative.c:131: newID = i;
      0000DC 85 3A 39         [24]  401 	mov	_newID,_i
                                    402 ;	cooperative.c:132: break;
      0000DF 80 07            [24]  403 	sjmp	00105$
      0000E1                        404 00108$:
                                    405 ;	cooperative.c:127: for (i = 0;i < 4;i ++){
      0000E1 E5 3A            [12]  406 	mov	a,_i
      0000E3 04               [12]  407 	inc	a
      0000E4 F5 3A            [12]  408 	mov	_i,a
      0000E6 80 B9            [24]  409 	sjmp	00107$
      0000E8                        410 00105$:
                                    411 ;	cooperative.c:139: new_stk = (0x3F) + (0x10)*newID;
      0000E8 E5 39            [12]  412 	mov	a,_newID
      0000EA C4               [12]  413 	swap	a
      0000EB 54 F0            [12]  414 	anl	a,#0xf0
      0000ED FF               [12]  415 	mov	r7,a
      0000EE 24 3F            [12]  416 	add	a,#0x3f
      0000F0 F5 3D            [12]  417 	mov	_new_stk,a
                                    418 ;	cooperative.c:144: temp_SP = SP;
      0000F2 85 81 3B         [24]  419 	mov	_temp_SP,_SP
                                    420 ;	cooperative.c:145: SP = new_stk;
      0000F5 85 3D 81         [24]  421 	mov	_SP,_new_stk
                                    422 ;	cooperative.c:159: __endasm;
      0000F8 C0 82            [24]  423 	PUSH	DPL
      0000FA C0 83            [24]  424 	PUSH	DPH
                                    425 ;	cooperative.c:173: __endasm;
      0000FC 74 00            [12]  426 	MOV	A, #0
      0000FE C0 E0            [24]  427 	PUSH	ACC
      000100 C0 E0            [24]  428 	PUSH	ACC
      000102 C0 E0            [24]  429 	PUSH	ACC
      000104 C0 E0            [24]  430 	PUSH	ACC
                                    431 ;	cooperative.c:187: temp_PSW = PSW;
      000106 85 D0 3C         [24]  432 	mov	_temp_PSW,_PSW
                                    433 ;	cooperative.c:188: PSW = newID << 3;
      000109 E5 39            [12]  434 	mov	a,_newID
      00010B FF               [12]  435 	mov	r7,a
      00010C C4               [12]  436 	swap	a
      00010D 03               [12]  437 	rr	a
      00010E 54 F8            [12]  438 	anl	a,#0xf8
      000110 F5 D0            [12]  439 	mov	_PSW,a
                                    440 ;	cooperative.c:191: __endasm;
      000112 C0 D0            [24]  441 	PUSH	PSW
                                    442 ;	cooperative.c:192: PSW = temp_PSW;
      000114 85 3C D0         [24]  443 	mov	_PSW,_temp_PSW
                                    444 ;	cooperative.c:197: savedSP[newID] = SP;
      000117 E5 39            [12]  445 	mov	a,_newID
      000119 24 30            [12]  446 	add	a,#_savedSP
      00011B F8               [12]  447 	mov	r0,a
      00011C A6 81            [24]  448 	mov	@r0,_SP
                                    449 ;	cooperative.c:201: SP = temp_SP;
      00011E 85 3B 81         [24]  450 	mov	_SP,_temp_SP
                                    451 ;	cooperative.c:205: return newID;
      000121 85 39 82         [24]  452 	mov	dpl,_newID
                                    453 ;	cooperative.c:208: }
      000124 22               [24]  454 	ret
                                    455 ;------------------------------------------------------------
                                    456 ;Allocation info for local variables in function 'ThreadYield'
                                    457 ;------------------------------------------------------------
                                    458 ;	cooperative.c:217: void ThreadYield(void)
                                    459 ;	-----------------------------------------
                                    460 ;	 function ThreadYield
                                    461 ;	-----------------------------------------
      000125                        462 _ThreadYield:
                                    463 ;	cooperative.c:219: SAVESTATE;
      000125 C0 E0            [24]  464 	PUSH ACC 
      000127 C0 F0            [24]  465 	PUSH B 
      000129 C0 82            [24]  466 	PUSH DPL 
      00012B C0 83            [24]  467 	PUSH DPH 
      00012D C0 D0            [24]  468 	PUSH PSW 
      00012F E5 35            [12]  469 	mov	a,_currID
      000131 24 30            [12]  470 	add	a,#_savedSP
      000133 F8               [12]  471 	mov	r0,a
      000134 A6 81            [24]  472 	mov	@r0,_SP
                                    473 ;	cooperative.c:220: do
      000136                        474 00103$:
                                    475 ;	cooperative.c:232: currID = ((currID >= 3)? 0 : (currID + 1));
      000136 C3               [12]  476 	clr	c
      000137 E5 35            [12]  477 	mov	a,_currID
      000139 94 03            [12]  478 	subb	a,#0x03
      00013B 92 01            [24]  479 	mov	_ThreadYield_sloc0_1_0,c
      00013D 40 06            [24]  480 	jc	00108$
      00013F 7E 00            [12]  481 	mov	r6,#0x00
      000141 7F 00            [12]  482 	mov	r7,#0x00
      000143 80 09            [24]  483 	sjmp	00109$
      000145                        484 00108$:
      000145 AD 35            [24]  485 	mov	r5,_currID
      000147 0D               [12]  486 	inc	r5
      000148 ED               [12]  487 	mov	a,r5
      000149 FE               [12]  488 	mov	r6,a
      00014A 33               [12]  489 	rlc	a
      00014B 95 E0            [12]  490 	subb	a,acc
      00014D FF               [12]  491 	mov	r7,a
      00014E                        492 00109$:
      00014E 8E 35            [24]  493 	mov	_currID,r6
                                    494 ;	cooperative.c:233: if (bitmap & (1 << currID)){
      000150 AF 35            [24]  495 	mov	r7,_currID
      000152 8F F0            [24]  496 	mov	b,r7
      000154 05 F0            [12]  497 	inc	b
      000156 7F 01            [12]  498 	mov	r7,#0x01
      000158 7E 00            [12]  499 	mov	r6,#0x00
      00015A 80 06            [24]  500 	sjmp	00124$
      00015C                        501 00123$:
      00015C EF               [12]  502 	mov	a,r7
      00015D 2F               [12]  503 	add	a,r7
      00015E FF               [12]  504 	mov	r7,a
      00015F EE               [12]  505 	mov	a,r6
      000160 33               [12]  506 	rlc	a
      000161 FE               [12]  507 	mov	r6,a
      000162                        508 00124$:
      000162 D5 F0 F7         [24]  509 	djnz	b,00123$
      000165 AC 34            [24]  510 	mov	r4,_bitmap
      000167 7D 00            [12]  511 	mov	r5,#0x00
      000169 EC               [12]  512 	mov	a,r4
      00016A 52 07            [12]  513 	anl	ar7,a
      00016C ED               [12]  514 	mov	a,r5
      00016D 52 06            [12]  515 	anl	ar6,a
      00016F EF               [12]  516 	mov	a,r7
      000170 4E               [12]  517 	orl	a,r6
      000171 60 C3            [24]  518 	jz	00103$
                                    519 ;	cooperative.c:238: RESTORESTATE;
      000173 E5 35            [12]  520 	mov	a,_currID
      000175 24 30            [12]  521 	add	a,#_savedSP
      000177 F9               [12]  522 	mov	r1,a
      000178 87 81            [24]  523 	mov	_SP,@r1
      00017A D0 D0            [24]  524 	POP PSW 
      00017C D0 83            [24]  525 	POP DPH 
      00017E D0 82            [24]  526 	POP DPL 
      000180 D0 F0            [24]  527 	POP B 
      000182 D0 E0            [24]  528 	POP ACC 
                                    529 ;	cooperative.c:239: }
      000184 22               [24]  530 	ret
                                    531 ;------------------------------------------------------------
                                    532 ;Allocation info for local variables in function 'ThreadExit'
                                    533 ;------------------------------------------------------------
                                    534 ;	cooperative.c:246: void ThreadExit(void)
                                    535 ;	-----------------------------------------
                                    536 ;	 function ThreadExit
                                    537 ;	-----------------------------------------
      000185                        538 _ThreadExit:
                                    539 ;	cooperative.c:255: RESTORESTATE;
      000185 E5 35            [12]  540 	mov	a,_currID
      000187 24 30            [12]  541 	add	a,#_savedSP
      000189 F9               [12]  542 	mov	r1,a
      00018A 87 81            [24]  543 	mov	_SP,@r1
      00018C D0 D0            [24]  544 	POP PSW 
      00018E D0 83            [24]  545 	POP DPH 
      000190 D0 82            [24]  546 	POP DPL 
      000192 D0 F0            [24]  547 	POP B 
      000194 D0 E0            [24]  548 	POP ACC 
                                    549 ;	cooperative.c:256: }
      000196 22               [24]  550 	ret
                                    551 	.area CSEG    (CODE)
                                    552 	.area CONST   (CODE)
                                    553 	.area XINIT   (CODE)
                                    554 	.area CABS    (ABS,CODE)
