COUNT EQU b0

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
    btfss PORTA,0
    goto main
    incf b0,1	REM;increment the value in COUNT
    movf b0,w 	REM;move the value in COUNT to the working register
    movwf PORTB     REM;display the binary value on PORTB outputs
    goto main       REM;loop to wait for the next button press

interrupt: REM PICAXE interrupt pin is A7
	nop
	retfie


END
