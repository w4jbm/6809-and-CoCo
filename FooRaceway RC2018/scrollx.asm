;
; Downward Scroll and Draw Car Routines
;
; by James McClanahan W4JBM
;
; Rev 1.0 for Retro Challenge, April 2018
;
;***** Define Constants
;
; starting addresses have "+2" to compensate for pre-decrement
; of the X and Y registers.
;
sfrom	equ $5de+2		; where do we start copying from?
sto	equ $5fe+2		; where do we start copying to?
done	equ $400		; where do we stop copying?
;
; 
	org	16000
;
;***** Start of Program
;
;***** Load Constants into X and Y
;
start:	LDX #sfrom
	LDY #sto
;
;*** Main Loop (copies from address in X to address in Y)
loop:	LDA ,-Y
	BMI skip
	LDA	,-X
store:	STA	,Y
	BRA test
skip	LEAX -1,X
test:	CMPX #done
	BHI	loop
	RTS
		
	org	16030
;		
;*** Draw Car
draw:	LDX #1455
row1:	LDA #96
	STA ,X+
	LDA #133
	STA ,X+
	LDA #136
	STA ,X+
	LDA #132
	STA ,X+
	LDA #138
	STA ,X+
	LDA #96
	STA ,X+
	LEAX 32-6,X
row2:	STA ,X+
	LDA #143
	STA ,X+
	LDA #129
	STA ,X+
	LDA #130
	STA ,X+
	LDA #143
	STA ,X+
	LDA #96
	STA ,X+
	LEAX 32-6,X
row3:	STA ,X+
	LDA #133
	STA ,X+
	LDA #128
	STA ,X+
	STA ,X+
	LDA #138
	STA ,X+
	LDA #96
	STA ,X+
	RTS 
end:
