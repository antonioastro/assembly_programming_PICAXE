init:
	clrf PORTA
	clrf PORTB
	bsf STATUS,RP0
	movlw b'11111111'
	movwf TRISA
	movlw b'00000000'
	movwf TRISB
	bcf STATUS,RP0
	
	REM bsf INTCON,INT0IE
	REM bsf INTCON,GIE

main: 
	nop
	goto main
	
interrupt: REM PICAXE interrupt pin is A7
	nop
	retfie
	
END