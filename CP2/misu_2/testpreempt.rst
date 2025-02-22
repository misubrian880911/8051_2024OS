                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
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
                           000034   234 _buff	=	0x0034
                           000035   235 _buff_full	=	0x0035
                           000036   236 _item	=	0x0036
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 ;--------------------------------------------------------
                                    241 ; Stack segment in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area	SSEG
      000031                        244 __start__stack:
      000031                        245 	.ds	1
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
      000001                        262 _Consumer_sloc0_1_0:
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
                                    291 ; interrupt vector
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
      000000                        294 __interrupt_vect:
      000000 02 00 91         [24]  295 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  296 	reti
      000004                        297 	.ds	7
      00000B 02 00 9B         [24]  298 	ljmp	_timer0_ISR
                                    299 ;--------------------------------------------------------
                                    300 ; global & static initialisations
                                    301 ;--------------------------------------------------------
                                    302 	.area HOME    (CODE)
                                    303 	.area GSINIT  (CODE)
                                    304 	.area GSFINAL (CODE)
                                    305 	.area GSINIT  (CODE)
                                    306 	.globl __sdcc_gsinit_startup
                                    307 	.globl __sdcc_program_startup
                                    308 	.globl __start__stack
                                    309 	.globl __mcs51_genXINIT
                                    310 	.globl __mcs51_genXRAMCLEAR
                                    311 	.globl __mcs51_genRAMCLEAR
                                    312 	.area GSFINAL (CODE)
      000014 02 00 0E         [24]  313 	ljmp	__sdcc_program_startup
                                    314 ;--------------------------------------------------------
                                    315 ; Home
                                    316 ;--------------------------------------------------------
                                    317 	.area HOME    (CODE)
                                    318 	.area HOME    (CODE)
      00000E                        319 __sdcc_program_startup:
      00000E 02 00 85         [24]  320 	ljmp	_main
                                    321 ;	return from main will return to caller
                                    322 ;--------------------------------------------------------
                                    323 ; code
                                    324 ;--------------------------------------------------------
                                    325 	.area CSEG    (CODE)
                                    326 ;------------------------------------------------------------
                                    327 ;Allocation info for local variables in function 'Producer'
                                    328 ;------------------------------------------------------------
                                    329 ;	testpreempt.c:27: void Producer(void)
                                    330 ;	-----------------------------------------
                                    331 ;	 function Producer
                                    332 ;	-----------------------------------------
      000017                        333 _Producer:
                           000007   334 	ar7 = 0x07
                           000006   335 	ar6 = 0x06
                           000005   336 	ar5 = 0x05
                           000004   337 	ar4 = 0x04
                           000003   338 	ar3 = 0x03
                           000002   339 	ar2 = 0x02
                           000001   340 	ar1 = 0x01
                           000000   341 	ar0 = 0x00
                                    342 ;	testpreempt.c:34: item = 'A';
      000017 75 36 41         [24]  343 	mov	_item,#0x41
                                    344 ;	testpreempt.c:40: while (buff_full){
      00001A                        345 00101$:
      00001A E5 35            [12]  346 	mov	a,_buff_full
      00001C 70 FC            [24]  347 	jnz	00101$
                                    348 ;	testpreempt.c:46: }
      00001E D2 00            [12]  349 	setb	_Producer_sloc0_1_0
      000020 10 AF 02         [24]  350 	jbc	ea,00124$
      000023 C2 00            [12]  351 	clr	_Producer_sloc0_1_0
      000025                        352 00124$:
                                    353 ;	testpreempt.c:44: buff = item;
      000025 85 36 34         [24]  354 	mov	_buff,_item
                                    355 ;	testpreempt.c:45: buff_full = 1;
      000028 75 35 01         [24]  356 	mov	_buff_full,#0x01
      00002B A2 00            [12]  357 	mov	c,_Producer_sloc0_1_0
      00002D 92 AF            [24]  358 	mov	ea,c
                                    359 ;	testpreempt.c:47: item = (item != 'Z')? (item + 1) : 'A';
      00002F 74 5A            [12]  360 	mov	a,#0x5a
      000031 B5 36 03         [24]  361 	cjne	a,_item,00125$
      000034 D3               [12]  362 	setb	c
      000035 80 01            [24]  363 	sjmp	00126$
      000037                        364 00125$:
      000037 C3               [12]  365 	clr	c
      000038                        366 00126$:
      000038 92 00            [24]  367 	mov	_Producer_sloc0_1_0,c
      00003A 40 0B            [24]  368 	jc	00109$
      00003C AF 36            [24]  369 	mov	r7,_item
      00003E 0F               [12]  370 	inc	r7
      00003F EF               [12]  371 	mov	a,r7
      000040 FE               [12]  372 	mov	r6,a
      000041 33               [12]  373 	rlc	a
      000042 95 E0            [12]  374 	subb	a,acc
      000044 FF               [12]  375 	mov	r7,a
      000045 80 04            [24]  376 	sjmp	00110$
      000047                        377 00109$:
      000047 7E 41            [12]  378 	mov	r6,#0x41
      000049 7F 00            [12]  379 	mov	r7,#0x00
      00004B                        380 00110$:
      00004B 8E 36            [24]  381 	mov	_item,r6
                                    382 ;	testpreempt.c:53: }
      00004D 80 CB            [24]  383 	sjmp	00101$
                                    384 ;------------------------------------------------------------
                                    385 ;Allocation info for local variables in function 'Consumer'
                                    386 ;------------------------------------------------------------
                                    387 ;	testpreempt.c:60: void Consumer(void)
                                    388 ;	-----------------------------------------
                                    389 ;	 function Consumer
                                    390 ;	-----------------------------------------
      00004F                        391 _Consumer:
                                    392 ;	testpreempt.c:66: EA = 0;
                                    393 ;	assignBit
      00004F C2 AF            [12]  394 	clr	_EA
                                    395 ;	testpreempt.c:67: TMOD |= 0x20;
      000051 43 89 20         [24]  396 	orl	_TMOD,#0x20
                                    397 ;	testpreempt.c:68: TH1 = (char)-6;
      000054 75 8D FA         [24]  398 	mov	_TH1,#0xfa
                                    399 ;	testpreempt.c:69: SCON = 0x50;
      000057 75 98 50         [24]  400 	mov	_SCON,#0x50
                                    401 ;	testpreempt.c:70: TR1 = 1;
                                    402 ;	assignBit
      00005A D2 8E            [12]  403 	setb	_TR1
                                    404 ;	testpreempt.c:71: EA = 1;
                                    405 ;	assignBit
      00005C D2 AF            [12]  406 	setb	_EA
                                    407 ;	testpreempt.c:78: while (!buff_full){
      00005E                        408 00101$:
      00005E E5 35            [12]  409 	mov	a,_buff_full
      000060 60 FC            [24]  410 	jz	00101$
                                    411 ;	testpreempt.c:91: }
      000062 D2 01            [12]  412 	setb	_Consumer_sloc0_1_0
      000064 10 AF 02         [24]  413 	jbc	ea,00129$
      000067 C2 01            [12]  414 	clr	_Consumer_sloc0_1_0
      000069                        415 00129$:
                                    416 ;	testpreempt.c:90: SBUF = buff;
      000069 85 34 99         [24]  417 	mov	_SBUF,_buff
      00006C A2 01            [12]  418 	mov	c,_Consumer_sloc0_1_0
      00006E 92 AF            [24]  419 	mov	ea,c
                                    420 ;	testpreempt.c:92: while (!TI){
      000070                        421 00104$:
                                    422 ;	testpreempt.c:95: TI = 0;
                                    423 ;	assignBit
      000070 10 99 02         [24]  424 	jbc	_TI,00130$
      000073 80 FB            [24]  425 	sjmp	00104$
      000075                        426 00130$:
                                    427 ;	testpreempt.c:98: }
      000075 D2 01            [12]  428 	setb	_Consumer_sloc0_1_0
      000077 10 AF 02         [24]  429 	jbc	ea,00131$
      00007A C2 01            [12]  430 	clr	_Consumer_sloc0_1_0
      00007C                        431 00131$:
                                    432 ;	testpreempt.c:97: buff_full = 0;
      00007C 75 35 00         [24]  433 	mov	_buff_full,#0x00
      00007F A2 01            [12]  434 	mov	c,_Consumer_sloc0_1_0
      000081 92 AF            [24]  435 	mov	ea,c
                                    436 ;	testpreempt.c:101: }
      000083 80 D9            [24]  437 	sjmp	00101$
                                    438 ;------------------------------------------------------------
                                    439 ;Allocation info for local variables in function 'main'
                                    440 ;------------------------------------------------------------
                                    441 ;	testpreempt.c:108: void main(void)
                                    442 ;	-----------------------------------------
                                    443 ;	 function main
                                    444 ;	-----------------------------------------
      000085                        445 _main:
                                    446 ;	testpreempt.c:114: buff_full = 0;
      000085 75 35 00         [24]  447 	mov	_buff_full,#0x00
                                    448 ;	testpreempt.c:122: ThreadCreate(Producer);
      000088 90 00 17         [24]  449 	mov	dptr,#_Producer
      00008B 12 00 C2         [24]  450 	lcall	_ThreadCreate
                                    451 ;	testpreempt.c:123: Consumer();
                                    452 ;	testpreempt.c:124: }
      00008E 02 00 4F         [24]  453 	ljmp	_Consumer
                                    454 ;------------------------------------------------------------
                                    455 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    456 ;------------------------------------------------------------
                                    457 ;	testpreempt.c:126: void _sdcc_gsinit_startup(void)
                                    458 ;	-----------------------------------------
                                    459 ;	 function _sdcc_gsinit_startup
                                    460 ;	-----------------------------------------
      000091                        461 __sdcc_gsinit_startup:
                                    462 ;	testpreempt.c:130: __endasm;
      000091 02 00 9F         [24]  463 	LJMP	_Bootstrap
                                    464 ;	testpreempt.c:131: }
      000094 22               [24]  465 	ret
                                    466 ;------------------------------------------------------------
                                    467 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    468 ;------------------------------------------------------------
                                    469 ;	testpreempt.c:133: void _mcs51_genRAMCLEAR(void) {
                                    470 ;	-----------------------------------------
                                    471 ;	 function _mcs51_genRAMCLEAR
                                    472 ;	-----------------------------------------
      000095                        473 __mcs51_genRAMCLEAR:
                                    474 ;	testpreempt.c:136: __endasm;
      000095 75 34 00         [24]  475 	MOV	0x34, #0
                                    476 ;	testpreempt.c:137: }
      000098 22               [24]  477 	ret
                                    478 ;------------------------------------------------------------
                                    479 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    480 ;------------------------------------------------------------
                                    481 ;	testpreempt.c:138: void _mcs51_genXINIT(void) {}
                                    482 ;	-----------------------------------------
                                    483 ;	 function _mcs51_genXINIT
                                    484 ;	-----------------------------------------
      000099                        485 __mcs51_genXINIT:
      000099 22               [24]  486 	ret
                                    487 ;------------------------------------------------------------
                                    488 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    489 ;------------------------------------------------------------
                                    490 ;	testpreempt.c:139: void _mcs51_genXRAMCLEAR(void) {}
                                    491 ;	-----------------------------------------
                                    492 ;	 function _mcs51_genXRAMCLEAR
                                    493 ;	-----------------------------------------
      00009A                        494 __mcs51_genXRAMCLEAR:
      00009A 22               [24]  495 	ret
                                    496 ;------------------------------------------------------------
                                    497 ;Allocation info for local variables in function 'timer0_ISR'
                                    498 ;------------------------------------------------------------
                                    499 ;	testpreempt.c:141: void timer0_ISR(void) __interrupt(1) {
                                    500 ;	-----------------------------------------
                                    501 ;	 function timer0_ISR
                                    502 ;	-----------------------------------------
      00009B                        503 _timer0_ISR:
                                    504 ;	testpreempt.c:144: __endasm;
      00009B 02 01 CA         [24]  505 	LJMP	_myTimer0Handler
                                    506 ;	testpreempt.c:145: }
      00009E 32               [24]  507 	reti
                                    508 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    509 ;	eliminated unneeded push/pop not_psw
                                    510 ;	eliminated unneeded push/pop dpl
                                    511 ;	eliminated unneeded push/pop dph
                                    512 ;	eliminated unneeded push/pop b
                                    513 ;	eliminated unneeded push/pop acc
                                    514 	.area CSEG    (CODE)
                                    515 	.area CONST   (CODE)
                                    516 	.area XINIT   (CODE)
                                    517 	.area CABS    (ABS,CODE)
