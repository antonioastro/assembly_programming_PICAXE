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
    btfss PORTA,0   ;check if A0 is set - "button pressed"
    goto toggle_on  ;if clear, continue checking
    bsf PORTB,1     ;if set, then set B1 and continue
toggle_off:
    btfss PORTA,0   
    goto toggle_off
    bcf PORTB,1     ;if set, then clear B1 and continue
    goto toggle_on  ;program loops
	
END