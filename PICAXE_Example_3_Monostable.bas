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
    btfsc PORTA,0
    goto main
    bsf PORTB,1
    call wait1000ms REM;this is a built-in subroutine
    bcf PORTB,1
    goto main

interrupt: REM PICAXE interrupt pin is A7
	nop
	retfie

END