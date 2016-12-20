;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Tue Dec 20 19:35:46 2016
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _colBitMask
	.globl _Font5x7
	.globl _main
	.globl _cheap_delay
	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
	.globl _reDot_displayASCII
	.globl _myChar
	.globl _displayBuffer
	.globl _colCounter
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_colCounter::
	.ds 1
_displayBuffer::
	.ds 5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_myChar::
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 35: void reDot_displayASCII(char index)
;	-----------------------------------------
;	 function reDot_displayASCII
;	-----------------------------------------
_reDot_displayASCII:
	sub	sp, #6
;	main.c: 37: index-=32;
	ld	a, (0x09, sp)
	sub	a, #0x20
	ld	(0x09, sp), a
;	main.c: 38: if (index>95) // if ascii>127
	ld	a, (0x09, sp)
	cp	a, #0x5f
;	main.c: 39: return;
	jrsgt	00103$
;	main.c: 40: displayBuffer[0]=Font5x7[index][0];
	ldw	x, #_displayBuffer+0
	ldw	(0x03, sp), x
	ldw	x, #_Font5x7+0
	ldw	(0x01, sp), x
	push	#0x05
	ld	a, (0x0a, sp)
	push	a
	call	__muluschar
	addw	sp, #2
	addw	x, (0x01, sp)
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ld	(x), a
;	main.c: 41: displayBuffer[1]=Font5x7[index][1];
	ldw	x, #_displayBuffer+1
	ldw	y, (0x05, sp)
	ld	a, (0x1, y)
	ld	(x), a
;	main.c: 42: displayBuffer[2]=Font5x7[index][2];
	ldw	x, #_displayBuffer+2
	ldw	y, (0x05, sp)
	ld	a, (0x2, y)
	ld	(x), a
;	main.c: 43: displayBuffer[3]=Font5x7[index][3];
	ldw	x, #_displayBuffer+3
	ldw	y, (0x05, sp)
	ld	a, (0x3, y)
	ld	(x), a
;	main.c: 44: displayBuffer[4]=Font5x7[index][4];  
	ldw	x, #_displayBuffer+4
	ldw	y, (0x05, sp)
	ld	a, (0x4, y)
	ld	(x), a
00103$:
	addw	sp, #6
	ret
;	main.c: 48: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11){
;	-----------------------------------------
;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
;	-----------------------------------------
_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
	sub	sp, #2
;	main.c: 49: if(TIM1_SR1 & TIM_SR1_UIF)
	ldw	x, #0x5255
	ld	a, (x)
	srl	a
	jrc	00122$
	jp	00107$
00122$:
;	main.c: 51: colCounter++;
	inc	_colCounter+0
;	main.c: 52: if (colCounter>4) colCounter=0;
	ld	a, _colCounter+0
	cp	a, #0x04
	jrule	00102$
	clr	_colCounter+0
00102$:
;	main.c: 54: PB_ODR |= ROWS_PORTB_MASK;    // set all rows to high = off 
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x30
	ld	(x), a
;	main.c: 55: PC_ODR |= ROWS_PORTC_MASK;
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0xf8
	ld	(x), a
;	main.c: 57: PD_ODR &= ~COLS_PORTD_MASK;	// cols off
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xe1
	ld	(x), a
;	main.c: 59: PA_ODR = 0;
	mov	0x5000+0, #0x00
;	main.c: 63: PB_ODR = ~( (displayBuffer[colCounter] )<<4);
	ldw	x, #_displayBuffer+0
	ld	a, xl
	add	a, _colCounter+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	swap	a
	and	a, #0xf0
	cpl	a
	ldw	x, #0x5005
	ld	(x), a
;	main.c: 64: PC_ODR = ~( (displayBuffer[colCounter] )<<1);
	ldw	x, #_displayBuffer+0
	ld	a, xl
	add	a, _colCounter+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	sll	a
	cpl	a
	ldw	x, #0x500a
	ld	(x), a
;	main.c: 67: if (colCounter==3)
	ld	a, _colCounter+0
	cp	a, #0x03
	jrne	00104$
;	main.c: 69: PA_ODR |= colBitMask[colCounter];
	ldw	x, #0x5000
	ld	a, (x)
	ld	(0x02, sp), a
	ldw	x, #_colBitMask+0
	ld	a, xl
	add	a, _colCounter+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	or	a, (0x02, sp)
	ldw	x, #0x5000
	ld	(x), a
	jra	00107$
00104$:
;	main.c: 73: PD_ODR |= colBitMask[colCounter];
	ldw	x, #0x500f
	ld	a, (x)
	ld	(0x01, sp), a
	ldw	x, #_colBitMask+0
	ld	a, xl
	add	a, _colCounter+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x500f
	ld	(x), a
00107$:
;	main.c: 76: TIM1_SR1 = 0; // clear all interrupt flags
	mov	0x5255+0, #0x00
	addw	sp, #2
	iret
;	main.c: 80: void cheap_delay(void)
;	-----------------------------------------
;	 function cheap_delay
;	-----------------------------------------
_cheap_delay:
;	main.c: 83: for (a=0; a<255; a++)
	clr	a
	ld	xl, a
00106$:
;	main.c: 85: for (b=0; b<255; b++);
	ld	a, #0xff
	ld	xh, a
00105$:
	ld	a, xh
	dec	a
	ld	xh, a
	tnz	a
	jrne	00105$
;	main.c: 86: nop();
	nop
;	main.c: 87: nop();
	nop
;	main.c: 83: for (a=0; a<255; a++)
	incw	x
	ld	a, xl
	cp	a, #0xff
	jrc	00106$
	ret
;	main.c: 91: int main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 93: PD_DDR = COLS_PORTD_MASK;	//set all cols to push-pull output 
	mov	0x5011+0, #0x1e
;	main.c: 94: PA_DDR = COLS_PORTA_MASK;
	mov	0x5002+0, #0x08
;	main.c: 95: PD_CR1 = COLS_PORTD_MASK;
	mov	0x5012+0, #0x1e
;	main.c: 96: PA_CR1 = COLS_PORTA_MASK;
	mov	0x5003+0, #0x08
;	main.c: 98: PB_DDR = ROWS_PORTB_MASK;    // set all row to (true) open drain outputs 
	mov	0x5007+0, #0x30
;	main.c: 99: PC_DDR = ROWS_PORTC_MASK;
	mov	0x500c+0, #0xf8
;	main.c: 100: PB_ODR = ROWS_PORTB_MASK;    // set all rows to high = off 
	mov	0x5005+0, #0x30
;	main.c: 101: PC_ODR = ROWS_PORTC_MASK;
	mov	0x500a+0, #0xf8
;	main.c: 103: TIM1_ARRH = 0x01;
	mov	0x5262+0, #0x01
;	main.c: 104: TIM1_ARRL = 0xD0;
	mov	0x5263+0, #0xd0
;	main.c: 106: TIM1_IER = TIM_IER_UIE; // interrupts: update
	mov	0x5254+0, #0x01
;	main.c: 107: TIM1_CR1 = TIM_CR1_APRE | TIM_CR1_URS | TIM_CR1_CEN; // auto-reload + interrupt on overflow + enable
	mov	0x5250+0, #0x85
;	main.c: 109: enableInterrupts();
	rim
;	main.c: 111: while(1)
00105$:
;	main.c: 113: reDot_displayASCII(myChar);
	push	_myChar+0
	call	_reDot_displayASCII
	pop	a
;	main.c: 114: if (myChar==127)
	ld	a, _myChar+0
	cp	a, #0x7f
	jrne	00102$
;	main.c: 115: myChar='32';
	mov	_myChar+0, #0x33
	jra	00103$
00102$:
;	main.c: 117: myChar++;
	inc	_myChar+0
00103$:
;	main.c: 119: cheap_delay();
	call	_cheap_delay
;	main.c: 120: cheap_delay();
	call	_cheap_delay
;	main.c: 121: cheap_delay();
	call	_cheap_delay
	jra	00105$
	ret
	.area CODE
_Font5x7:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5F	; 95
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x7F	; 127
	.db #0x14	; 20
	.db #0x7F	; 127
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x2A	; 42
	.db #0x7F	; 127
	.db #0x2A	; 42
	.db #0x12	; 18
	.db #0x23	; 35
	.db #0x13	; 19
	.db #0x08	; 8
	.db #0x64	; 100	'd'
	.db #0x62	; 98	'b'
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x55	; 85	'U'
	.db #0x22	; 34
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2A	; 42
	.db #0x1C	; 28
	.db #0x2A	; 42
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3E	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x3E	; 62
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x7F	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x46	; 70	'F'
	.db #0x21	; 33
	.db #0x41	; 65	'A'
	.db #0x45	; 69	'E'
	.db #0x4B	; 75	'K'
	.db #0x31	; 49	'1'
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x7F	; 127
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x39	; 57	'9'
	.db #0x3C	; 60
	.db #0x4A	; 74	'J'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x71	; 113	'q'
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x06	; 6
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x29	; 41
	.db #0x1E	; 30
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x32	; 50	'2'
	.db #0x49	; 73	'I'
	.db #0x79	; 121	'y'
	.db #0x41	; 65	'A'
	.db #0x3E	; 62
	.db #0x7E	; 126
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x7E	; 126
	.db #0x7F	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x7F	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1C	; 28
	.db #0x7F	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x51	; 81	'Q'
	.db #0x32	; 50	'2'
	.db #0x7F	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x3F	; 63
	.db #0x01	; 1
	.db #0x7F	; 127
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7F	; 127
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x7F	; 127
	.db #0x7F	; 127
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x7F	; 127
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x3E	; 62
	.db #0x7F	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x3E	; 62
	.db #0x41	; 65	'A'
	.db #0x51	; 81	'Q'
	.db #0x21	; 33
	.db #0x5E	; 94
	.db #0x7F	; 127
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x29	; 41
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7F	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3F	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3F	; 63
	.db #0x1F	; 31
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x1F	; 31
	.db #0x7F	; 127
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x7F	; 127
	.db #0x63	; 99	'c'
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x78	; 120	'x'
	.db #0x7F	; 127
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x7F	; 127
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x7E	; 126
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x3C	; 60
	.db #0x7F	; 127
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x7D	; 125
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x3D	; 61
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7F	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x7C	; 124
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x7C	; 124
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x3F	; 63
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x3C	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x7C	; 124
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x3C	; 60
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x3C	; 60
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x0C	; 12
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x3C	; 60
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x54	; 84	'T'
	.db #0x4C	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x36	; 54	'6'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x36	; 54	'6'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x2A	; 42
	.db #0x1C	; 28
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1C	; 28
	.db #0x2A	; 42
	.db #0x08	; 8
	.db #0x08	; 8
_colBitMask:
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x02	; 2
	.area INITIALIZER
__xinit__myChar:
	.db #0x48	;  72	'H'
	.area CABS (ABS)
