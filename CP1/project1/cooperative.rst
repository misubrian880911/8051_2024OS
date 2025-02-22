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
                                    109 	.globl _new_thread
                                    110 	.globl _sp_temp
                                    111 	.globl _i
                                    112 	.globl _cur_thread
                                    113 	.globl _mask
                                    114 	.globl _saved_sp
                                    115 	.globl _ThreadCreate
                                    116 	.globl _ThreadYield
                                    117 	.globl _ThreadExit
                                    118 ;--------------------------------------------------------
                                    119 ; special function registers
                                    120 ;--------------------------------------------------------
                                    121 	.area RSEG    (ABS,DATA)
      000000                        122 	.org 0x0000
                           000080   123 _P0	=	0x0080
                           000081   124 _SP	=	0x0081
                           000082   125 _DPL	=	0x0082
                           000083   126 _DPH	=	0x0083
                           000087   127 _PCON	=	0x0087
                           000088   128 _TCON	=	0x0088
                           000089   129 _TMOD	=	0x0089
                           00008A   130 _TL0	=	0x008a
                           00008B   131 _TL1	=	0x008b
                           00008C   132 _TH0	=	0x008c
                           00008D   133 _TH1	=	0x008d
                           000090   134 _P1	=	0x0090
                           000098   135 _SCON	=	0x0098
                           000099   136 _SBUF	=	0x0099
                           0000A0   137 _P2	=	0x00a0
                           0000A8   138 _IE	=	0x00a8
                           0000B0   139 _P3	=	0x00b0
                           0000B8   140 _IP	=	0x00b8
                           0000D0   141 _PSW	=	0x00d0
                           0000E0   142 _ACC	=	0x00e0
                           0000F0   143 _B	=	0x00f0
                                    144 ;--------------------------------------------------------
                                    145 ; special function bits
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0_0	=	0x0080
                           000081   150 _P0_1	=	0x0081
                           000082   151 _P0_2	=	0x0082
                           000083   152 _P0_3	=	0x0083
                           000084   153 _P0_4	=	0x0084
                           000085   154 _P0_5	=	0x0085
                           000086   155 _P0_6	=	0x0086
                           000087   156 _P0_7	=	0x0087
                           000088   157 _IT0	=	0x0088
                           000089   158 _IE0	=	0x0089
                           00008A   159 _IT1	=	0x008a
                           00008B   160 _IE1	=	0x008b
                           00008C   161 _TR0	=	0x008c
                           00008D   162 _TF0	=	0x008d
                           00008E   163 _TR1	=	0x008e
                           00008F   164 _TF1	=	0x008f
                           000090   165 _P1_0	=	0x0090
                           000091   166 _P1_1	=	0x0091
                           000092   167 _P1_2	=	0x0092
                           000093   168 _P1_3	=	0x0093
                           000094   169 _P1_4	=	0x0094
                           000095   170 _P1_5	=	0x0095
                           000096   171 _P1_6	=	0x0096
                           000097   172 _P1_7	=	0x0097
                           000098   173 _RI	=	0x0098
                           000099   174 _TI	=	0x0099
                           00009A   175 _RB8	=	0x009a
                           00009B   176 _TB8	=	0x009b
                           00009C   177 _REN	=	0x009c
                           00009D   178 _SM2	=	0x009d
                           00009E   179 _SM1	=	0x009e
                           00009F   180 _SM0	=	0x009f
                           0000A0   181 _P2_0	=	0x00a0
                           0000A1   182 _P2_1	=	0x00a1
                           0000A2   183 _P2_2	=	0x00a2
                           0000A3   184 _P2_3	=	0x00a3
                           0000A4   185 _P2_4	=	0x00a4
                           0000A5   186 _P2_5	=	0x00a5
                           0000A6   187 _P2_6	=	0x00a6
                           0000A7   188 _P2_7	=	0x00a7
                           0000A8   189 _EX0	=	0x00a8
                           0000A9   190 _ET0	=	0x00a9
                           0000AA   191 _EX1	=	0x00aa
                           0000AB   192 _ET1	=	0x00ab
                           0000AC   193 _ES	=	0x00ac
                           0000AF   194 _EA	=	0x00af
                           0000B0   195 _P3_0	=	0x00b0
                           0000B1   196 _P3_1	=	0x00b1
                           0000B2   197 _P3_2	=	0x00b2
                           0000B3   198 _P3_3	=	0x00b3
                           0000B4   199 _P3_4	=	0x00b4
                           0000B5   200 _P3_5	=	0x00b5
                           0000B6   201 _P3_6	=	0x00b6
                           0000B7   202 _P3_7	=	0x00b7
                           0000B0   203 _RXD	=	0x00b0
                           0000B1   204 _TXD	=	0x00b1
                           0000B2   205 _INT0	=	0x00b2
                           0000B3   206 _INT1	=	0x00b3
                           0000B4   207 _T0	=	0x00b4
                           0000B5   208 _T1	=	0x00b5
                           0000B6   209 _WR	=	0x00b6
                           0000B7   210 _RD	=	0x00b7
                           0000B8   211 _PX0	=	0x00b8
                           0000B9   212 _PT0	=	0x00b9
                           0000BA   213 _PX1	=	0x00ba
                           0000BB   214 _PT1	=	0x00bb
                           0000BC   215 _PS	=	0x00bc
                           0000D0   216 _P	=	0x00d0
                           0000D1   217 _F1	=	0x00d1
                           0000D2   218 _OV	=	0x00d2
                           0000D3   219 _RS0	=	0x00d3
                           0000D4   220 _RS1	=	0x00d4
                           0000D5   221 _F0	=	0x00d5
                           0000D6   222 _AC	=	0x00d6
                           0000D7   223 _CY	=	0x00d7
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable register banks
                                    226 ;--------------------------------------------------------
                                    227 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        228 	.ds 8
                                    229 ;--------------------------------------------------------
                                    230 ; internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area DSEG    (DATA)
                           000030   233 _saved_sp	=	0x0030
                           000034   234 _mask	=	0x0034
                           000035   235 _cur_thread	=	0x0035
                           000036   236 _i	=	0x0036
                           000037   237 _sp_temp	=	0x0037
                           000038   238 _new_thread	=	0x0038
                                    239 ;--------------------------------------------------------
                                    240 ; overlayable items in internal ram
                                    241 ;--------------------------------------------------------
                                    242 	.area	OSEG    (OVR,DATA)
                                    243 ;--------------------------------------------------------
                                    244 ; indirectly addressable internal ram data
                                    245 ;--------------------------------------------------------
                                    246 	.area ISEG    (DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; absolute internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area IABS    (ABS,DATA)
                                    251 	.area IABS    (ABS,DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; bit data
                                    254 ;--------------------------------------------------------
                                    255 	.area BSEG    (BIT)
                                    256 ;--------------------------------------------------------
                                    257 ; paged external ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area PSEG    (PAG,XDATA)
                                    260 ;--------------------------------------------------------
                                    261 ; external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area XSEG    (XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; absolute external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XABS    (ABS,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; external initialized ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XISEG   (XDATA)
                                    272 	.area HOME    (CODE)
                                    273 	.area GSINIT0 (CODE)
                                    274 	.area GSINIT1 (CODE)
                                    275 	.area GSINIT2 (CODE)
                                    276 	.area GSINIT3 (CODE)
                                    277 	.area GSINIT4 (CODE)
                                    278 	.area GSINIT5 (CODE)
                                    279 	.area GSINIT  (CODE)
                                    280 	.area GSFINAL (CODE)
                                    281 	.area CSEG    (CODE)
                                    282 ;--------------------------------------------------------
                                    283 ; global & static initialisations
                                    284 ;--------------------------------------------------------
                                    285 	.area HOME    (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; Home
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area HOME    (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; code
                                    296 ;--------------------------------------------------------
                                    297 	.area CSEG    (CODE)
                                    298 ;------------------------------------------------------------
                                    299 ;Allocation info for local variables in function 'Bootstrap'
                                    300 ;------------------------------------------------------------
                                    301 ;	cooperative.c:81: void Bootstrap(void) {
                                    302 ;	-----------------------------------------
                                    303 ;	 function Bootstrap
                                    304 ;	-----------------------------------------
      00006C                        305 _Bootstrap:
                           000007   306 	ar7 = 0x07
                           000006   307 	ar6 = 0x06
                           000005   308 	ar5 = 0x05
                           000004   309 	ar4 = 0x04
                           000003   310 	ar3 = 0x03
                           000002   311 	ar2 = 0x02
                           000001   312 	ar1 = 0x01
                           000000   313 	ar0 = 0x00
                                    314 ;	cooperative.c:95: mask = 0;
      00006C 75 34 00         [24]  315 	mov	_mask,#0x00
                                    316 ;	cooperative.c:96: cur_thread = ThreadCreate( main );
      00006F 90 00 59         [24]  317 	mov	dptr,#_main
      000072 12 00 8A         [24]  318 	lcall	_ThreadCreate
      000075 85 82 35         [24]  319 	mov	_cur_thread,dpl
                                    320 ;	cooperative.c:97: RESTORESTATE;
      000078 E5 35            [12]  321 	mov	a,_cur_thread
      00007A 24 30            [12]  322 	add	a,#_saved_sp
      00007C F9               [12]  323 	mov	r1,a
      00007D 87 81            [24]  324 	mov	_SP,@r1
      00007F D0 D0            [24]  325 	POP PSW 
      000081 D0 83            [24]  326 	POP DPH 
      000083 D0 82            [24]  327 	POP DPL 
      000085 D0 F0            [24]  328 	POP B 
      000087 D0 E0            [24]  329 	POP ACC 
                                    330 ;	cooperative.c:103: }
      000089 22               [24]  331 	ret
                                    332 ;------------------------------------------------------------
                                    333 ;Allocation info for local variables in function 'ThreadCreate'
                                    334 ;------------------------------------------------------------
                                    335 ;fp                        Allocated to registers 
                                    336 ;------------------------------------------------------------
                                    337 ;	cooperative.c:111: ThreadID ThreadCreate(FunctionPtr fp) {
                                    338 ;	-----------------------------------------
                                    339 ;	 function ThreadCreate
                                    340 ;	-----------------------------------------
      00008A                        341 _ThreadCreate:
                                    342 ;	cooperative.c:118: if( mask == 15 ) //mask = 0b1111, four thread
      00008A 74 0F            [12]  343 	mov	a,#0x0f
      00008C B5 34 04         [24]  344 	cjne	a,_mask,00102$
                                    345 ;	cooperative.c:119: return -1;
      00008F 75 82 FF         [24]  346 	mov	dpl,#0xff
      000092 22               [24]  347 	ret
      000093                        348 00102$:
                                    349 ;	cooperative.c:120: for(i = 0; i < 4 ; i++){
      000093 75 36 00         [24]  350 	mov	_i,#0x00
      000096                        351 00107$:
      000096 74 FC            [12]  352 	mov	a,#0x100 - 0x04
      000098 25 36            [12]  353 	add	a,_i
      00009A 40 41            [24]  354 	jc	00105$
                                    355 ;	cooperative.c:121: if( !( mask & (1 << i) ) ){
      00009C AF 36            [24]  356 	mov	r7,_i
      00009E 8F F0            [24]  357 	mov	b,r7
      0000A0 05 F0            [12]  358 	inc	b
      0000A2 7F 01            [12]  359 	mov	r7,#0x01
      0000A4 7E 00            [12]  360 	mov	r6,#0x00
      0000A6 80 06            [24]  361 	sjmp	00131$
      0000A8                        362 00130$:
      0000A8 EF               [12]  363 	mov	a,r7
      0000A9 2F               [12]  364 	add	a,r7
      0000AA FF               [12]  365 	mov	r7,a
      0000AB EE               [12]  366 	mov	a,r6
      0000AC 33               [12]  367 	rlc	a
      0000AD FE               [12]  368 	mov	r6,a
      0000AE                        369 00131$:
      0000AE D5 F0 F7         [24]  370 	djnz	b,00130$
      0000B1 AC 34            [24]  371 	mov	r4,_mask
      0000B3 7D 00            [12]  372 	mov	r5,#0x00
      0000B5 EC               [12]  373 	mov	a,r4
      0000B6 52 07            [12]  374 	anl	ar7,a
      0000B8 ED               [12]  375 	mov	a,r5
      0000B9 52 06            [12]  376 	anl	ar6,a
      0000BB EF               [12]  377 	mov	a,r7
      0000BC 4E               [12]  378 	orl	a,r6
      0000BD 70 17            [24]  379 	jnz	00108$
                                    380 ;	cooperative.c:122: mask |= (1 << i);
      0000BF AF 36            [24]  381 	mov	r7,_i
      0000C1 8F F0            [24]  382 	mov	b,r7
      0000C3 05 F0            [12]  383 	inc	b
      0000C5 74 01            [12]  384 	mov	a,#0x01
      0000C7 80 02            [24]  385 	sjmp	00135$
      0000C9                        386 00133$:
      0000C9 25 E0            [12]  387 	add	a,acc
      0000CB                        388 00135$:
      0000CB D5 F0 FB         [24]  389 	djnz	b,00133$
      0000CE FF               [12]  390 	mov	r7,a
      0000CF 42 34            [12]  391 	orl	_mask,a
                                    392 ;	cooperative.c:123: new_thread = i;
      0000D1 85 36 38         [24]  393 	mov	_new_thread,_i
                                    394 ;	cooperative.c:124: break;
      0000D4 80 07            [24]  395 	sjmp	00105$
      0000D6                        396 00108$:
                                    397 ;	cooperative.c:120: for(i = 0; i < 4 ; i++){
      0000D6 E5 36            [12]  398 	mov	a,_i
      0000D8 04               [12]  399 	inc	a
      0000D9 F5 36            [12]  400 	mov	_i,a
      0000DB 80 B9            [24]  401 	sjmp	00107$
      0000DD                        402 00105$:
                                    403 ;	cooperative.c:128: sp_temp = SP;
      0000DD 85 81 37         [24]  404 	mov	_sp_temp,_SP
                                    405 ;	cooperative.c:129: SP = (0x3F) + (0x10) * new_thread;
      0000E0 E5 38            [12]  406 	mov	a,_new_thread
      0000E2 C4               [12]  407 	swap	a
      0000E3 54 F0            [12]  408 	anl	a,#0xf0
      0000E5 FF               [12]  409 	mov	r7,a
      0000E6 24 3F            [12]  410 	add	a,#0x3f
      0000E8 F5 81            [12]  411 	mov	_SP,a
                                    412 ;	cooperative.c:136: __endasm;
      0000EA C0 82            [24]  413 	PUSH	DPL
      0000EC C0 83            [24]  414 	PUSH	DPH
                                    415 ;	cooperative.c:148: __endasm;
      0000EE 54 00            [12]  416 	ANL	A, #0
      0000F0 C0 E0            [24]  417 	PUSH	ACC
      0000F2 C0 E0            [24]  418 	PUSH	ACC
      0000F4 C0 E0            [24]  419 	PUSH	ACC
      0000F6 C0 E0            [24]  420 	PUSH	ACC
                                    421 ;	cooperative.c:152: PSW = new_thread << 3;
      0000F8 E5 38            [12]  422 	mov	a,_new_thread
      0000FA FF               [12]  423 	mov	r7,a
      0000FB C4               [12]  424 	swap	a
      0000FC 03               [12]  425 	rr	a
      0000FD 54 F8            [12]  426 	anl	a,#0xf8
      0000FF F5 D0            [12]  427 	mov	_PSW,a
                                    428 ;	cooperative.c:155: __endasm;
      000101 C0 D0            [24]  429 	PUSH	PSW
                                    430 ;	cooperative.c:158: saved_sp[new_thread] = SP;
      000103 E5 38            [12]  431 	mov	a,_new_thread
      000105 24 30            [12]  432 	add	a,#_saved_sp
      000107 F8               [12]  433 	mov	r0,a
      000108 A6 81            [24]  434 	mov	@r0,_SP
                                    435 ;	cooperative.c:160: SP = sp_temp;
      00010A 85 37 81         [24]  436 	mov	_SP,_sp_temp
                                    437 ;	cooperative.c:162: return new_thread;
      00010D 85 38 82         [24]  438 	mov	dpl,_new_thread
                                    439 ;	cooperative.c:203: }
      000110 22               [24]  440 	ret
                                    441 ;------------------------------------------------------------
                                    442 ;Allocation info for local variables in function 'ThreadYield'
                                    443 ;------------------------------------------------------------
                                    444 ;	cooperative.c:214: void ThreadYield(void) {
                                    445 ;	-----------------------------------------
                                    446 ;	 function ThreadYield
                                    447 ;	-----------------------------------------
      000111                        448 _ThreadYield:
                                    449 ;	cooperative.c:215: SAVESTATE;
      000111 C0 E0            [24]  450 	PUSH ACC 
      000113 C0 F0            [24]  451 	PUSH B 
      000115 C0 82            [24]  452 	PUSH DPL 
      000117 C0 83            [24]  453 	PUSH DPH 
      000119 C0 D0            [24]  454 	PUSH PSW 
      00011B E5 35            [12]  455 	mov	a,_cur_thread
      00011D 24 30            [12]  456 	add	a,#_saved_sp
      00011F F8               [12]  457 	mov	r0,a
      000120 A6 81            [24]  458 	mov	@r0,_SP
                                    459 ;	cooperative.c:216: do {
      000122                        460 00103$:
                                    461 ;	cooperative.c:227: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      000122 74 FD            [12]  462 	mov	a,#0x100 - 0x03
      000124 25 35            [12]  463 	add	a,_cur_thread
      000126 40 0B            [24]  464 	jc	00108$
      000128 AF 35            [24]  465 	mov	r7,_cur_thread
      00012A 0F               [12]  466 	inc	r7
      00012B EF               [12]  467 	mov	a,r7
      00012C FE               [12]  468 	mov	r6,a
      00012D 33               [12]  469 	rlc	a
      00012E 95 E0            [12]  470 	subb	a,acc
      000130 FF               [12]  471 	mov	r7,a
      000131 80 04            [24]  472 	sjmp	00109$
      000133                        473 00108$:
      000133 7E 00            [12]  474 	mov	r6,#0x00
      000135 7F 00            [12]  475 	mov	r7,#0x00
      000137                        476 00109$:
      000137 8E 35            [24]  477 	mov	_cur_thread,r6
                                    478 ;	cooperative.c:228: if( mask & (1<<cur_thread) ){
      000139 AF 35            [24]  479 	mov	r7,_cur_thread
      00013B 8F F0            [24]  480 	mov	b,r7
      00013D 05 F0            [12]  481 	inc	b
      00013F 7F 01            [12]  482 	mov	r7,#0x01
      000141 7E 00            [12]  483 	mov	r6,#0x00
      000143 80 06            [24]  484 	sjmp	00124$
      000145                        485 00123$:
      000145 EF               [12]  486 	mov	a,r7
      000146 2F               [12]  487 	add	a,r7
      000147 FF               [12]  488 	mov	r7,a
      000148 EE               [12]  489 	mov	a,r6
      000149 33               [12]  490 	rlc	a
      00014A FE               [12]  491 	mov	r6,a
      00014B                        492 00124$:
      00014B D5 F0 F7         [24]  493 	djnz	b,00123$
      00014E AC 34            [24]  494 	mov	r4,_mask
      000150 7D 00            [12]  495 	mov	r5,#0x00
      000152 EC               [12]  496 	mov	a,r4
      000153 52 07            [12]  497 	anl	ar7,a
      000155 ED               [12]  498 	mov	a,r5
      000156 52 06            [12]  499 	anl	ar6,a
      000158 EF               [12]  500 	mov	a,r7
      000159 4E               [12]  501 	orl	a,r6
      00015A 60 C6            [24]  502 	jz	00103$
                                    503 ;	cooperative.c:233: RESTORESTATE;
      00015C E5 35            [12]  504 	mov	a,_cur_thread
      00015E 24 30            [12]  505 	add	a,#_saved_sp
      000160 F9               [12]  506 	mov	r1,a
      000161 87 81            [24]  507 	mov	_SP,@r1
      000163 D0 D0            [24]  508 	POP PSW 
      000165 D0 83            [24]  509 	POP DPH 
      000167 D0 82            [24]  510 	POP DPL 
      000169 D0 F0            [24]  511 	POP B 
      00016B D0 E0            [24]  512 	POP ACC 
                                    513 ;	cooperative.c:234: }
      00016D 22               [24]  514 	ret
                                    515 ;------------------------------------------------------------
                                    516 ;Allocation info for local variables in function 'ThreadExit'
                                    517 ;------------------------------------------------------------
                                    518 ;	cooperative.c:242: void ThreadExit(void) {
                                    519 ;	-----------------------------------------
                                    520 ;	 function ThreadExit
                                    521 ;	-----------------------------------------
      00016E                        522 _ThreadExit:
                                    523 ;	cooperative.c:249: mask ^= (1<<cur_thread);
      00016E AF 35            [24]  524 	mov	r7,_cur_thread
      000170 8F F0            [24]  525 	mov	b,r7
      000172 05 F0            [12]  526 	inc	b
      000174 74 01            [12]  527 	mov	a,#0x01
      000176 80 02            [24]  528 	sjmp	00129$
      000178                        529 00127$:
      000178 25 E0            [12]  530 	add	a,acc
      00017A                        531 00129$:
      00017A D5 F0 FB         [24]  532 	djnz	b,00127$
      00017D FF               [12]  533 	mov	r7,a
      00017E 62 34            [12]  534 	xrl	_mask,a
                                    535 ;	cooperative.c:250: for(i=0 ; i < 4 ; i++)
      000180 75 36 00         [24]  536 	mov	_i,#0x00
      000183                        537 00107$:
      000183 74 FC            [12]  538 	mov	a,#0x100 - 0x04
      000185 25 36            [12]  539 	add	a,_i
      000187 40 2F            [24]  540 	jc	00103$
                                    541 ;	cooperative.c:251: if( mask & (1<<i) ){
      000189 AF 36            [24]  542 	mov	r7,_i
      00018B 8F F0            [24]  543 	mov	b,r7
      00018D 05 F0            [12]  544 	inc	b
      00018F 7F 01            [12]  545 	mov	r7,#0x01
      000191 7E 00            [12]  546 	mov	r6,#0x00
      000193 80 06            [24]  547 	sjmp	00132$
      000195                        548 00131$:
      000195 EF               [12]  549 	mov	a,r7
      000196 2F               [12]  550 	add	a,r7
      000197 FF               [12]  551 	mov	r7,a
      000198 EE               [12]  552 	mov	a,r6
      000199 33               [12]  553 	rlc	a
      00019A FE               [12]  554 	mov	r6,a
      00019B                        555 00132$:
      00019B D5 F0 F7         [24]  556 	djnz	b,00131$
      00019E AC 34            [24]  557 	mov	r4,_mask
      0001A0 7D 00            [12]  558 	mov	r5,#0x00
      0001A2 EC               [12]  559 	mov	a,r4
      0001A3 52 07            [12]  560 	anl	ar7,a
      0001A5 ED               [12]  561 	mov	a,r5
      0001A6 52 06            [12]  562 	anl	ar6,a
      0001A8 EF               [12]  563 	mov	a,r7
      0001A9 4E               [12]  564 	orl	a,r6
      0001AA 60 05            [24]  565 	jz	00108$
                                    566 ;	cooperative.c:252: cur_thread = i;
      0001AC 85 36 35         [24]  567 	mov	_cur_thread,_i
                                    568 ;	cooperative.c:253: break;
      0001AF 80 07            [24]  569 	sjmp	00103$
      0001B1                        570 00108$:
                                    571 ;	cooperative.c:250: for(i=0 ; i < 4 ; i++)
      0001B1 E5 36            [12]  572 	mov	a,_i
      0001B3 04               [12]  573 	inc	a
      0001B4 F5 36            [12]  574 	mov	_i,a
      0001B6 80 CB            [24]  575 	sjmp	00107$
      0001B8                        576 00103$:
                                    577 ;	cooperative.c:256: if( i == 4 ) cur_thread = -1;
      0001B8 74 04            [12]  578 	mov	a,#0x04
      0001BA B5 36 03         [24]  579 	cjne	a,_i,00105$
      0001BD 75 35 FF         [24]  580 	mov	_cur_thread,#0xff
      0001C0                        581 00105$:
                                    582 ;	cooperative.c:259: RESTORESTATE;
      0001C0 E5 35            [12]  583 	mov	a,_cur_thread
      0001C2 24 30            [12]  584 	add	a,#_saved_sp
      0001C4 F9               [12]  585 	mov	r1,a
      0001C5 87 81            [24]  586 	mov	_SP,@r1
      0001C7 D0 D0            [24]  587 	POP PSW 
      0001C9 D0 83            [24]  588 	POP DPH 
      0001CB D0 82            [24]  589 	POP DPL 
      0001CD D0 F0            [24]  590 	POP B 
      0001CF D0 E0            [24]  591 	POP ACC 
                                    592 ;	cooperative.c:260: }
      0001D1 22               [24]  593 	ret
                                    594 	.area CSEG    (CODE)
                                    595 	.area CONST   (CODE)
                                    596 	.area XINIT   (CODE)
                                    597 	.area CABS    (ABS,CODE)
