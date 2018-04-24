;
; rscrll.asm -- Downward Scroll Routine
;
; by James McClanahan W4JBM
;
; Rev 1.0 for Retro Challenge, April 2018
;
; Provides the downward scrolling of the regular text or semigraphic
; screen on the Tandy Color Computer.
;
; It leaves the top line of the screen in place unchanged. Other code
; should either blank or create the new top line of the display.
;
; The code only uses relative branches, so it should relocate to other
; areas of memory as needed. It should be in memory protected by the
; BASIC CLEAR command.
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
loop:	LDD	,--X
	STD	,--Y
	CMPX #done
	BHI	loop
	RTS
end:
