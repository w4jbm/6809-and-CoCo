; clrscrn - Clear CoCo Screen
;
; by James McClanahan W4JBM
;
; Rev 1.0 - February 2019
;
; This routine will fill the CoCo's character screen with a given character.
;
;***** Define Constants
;
scstrt	equ	$0400	; start of screen
scend	equ	$05ff	; end of screen
fillchr	equ	$2020	; fill character (*2)
;
;
	org	$2000
start:
;
; Clear the screen
;
clscr:	LDX scstrt	; load start of screen
	LDU fillchr	; load 16 bit value for filling two bytes
@loop	STU ,X++	; store and increment by two
	CMPX scend+1	; are we at the end of screen memory?
	BNE @loop	; if not, loop (using local label) until we are
;
end:
	RTS		; return when done if this is a subroutine
