init:
	clrf PORTA
	clrf PORTB
	bsf STATUS,RP0
	movlw b'11111111'
	movwf TRISA
	movlw b'00000000'
	movwf TRISB
	bcf STATUS,RP0
	
main:
toggle_on:
    btfss PORTA,0   REM;check if A0 is set - "button pressed"
    goto toggle_on  REM;if clear, continue checking
    bsf PORTB,1     REM;if set, then set B1 and continue
toggle_off:
    btfss PORTA,0   
    goto toggle_off
    bcf PORTB,1     REM;if set, then clear B1 and continue
    goto toggle_on  REM;program loops
	
END