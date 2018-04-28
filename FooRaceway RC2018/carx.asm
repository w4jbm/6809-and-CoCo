;
; Draw Car Routine
;
; by James McClanahan W4JBM
;
; Rev 1.0 for Retro Challenge, April 2018
;
		org	16030
;
;***** Start of Program
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
H		LEAX 32-6,X
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
