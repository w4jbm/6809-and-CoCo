; random.asm - Pseudo Random Number Generator
;
; adopted by James McClanahan W4JBM
; from code by John Vander Reyden found in the book
; Dragon Machine Language for the Absolute Beginner (1983)
;
; Rev 1.0 - April 2018
;
; This is a linear congruential generator (LCG) with a power of two
; modulus (65536). This gives a 16 bit result without any extra overhead
;
; New Value = Old Value * 1541 ($605) + 13849 ($3619) MOD 65536 ($10000)
;
; This sequence only repeats ever 2^16 time meaning each 16 bit value
; is achieved once and only once through the pseudo random sequence.
;
; The sequence can be seeded by either initializing the value (if a
; 16 bit seed is readily available) or by stepping through the sequence
; a several times (if a smaller seed value is available).
;
; Note that a 6309 implementation could make use of that processor's
; ability to multiply two 16 bit numbers, but this code will work on both
; the 6809 and the 6309.
;
.cpu	M6809

org		$4000

random:	ldd rannum		; load current random number value
		adda rannum+1	; d = old random * $101
        aslb			; d = old random * $202
        rola
        adda rannum+1	; d = old random * $302
        aslb			; d = old random * $604
        rola
        addd rannum		; d = old random * $605
        addd #13849		; d is now new random number
        std rannum		; store it
        rts				; and return
;
; random number is stored following the code, but can be moved
; to other locations in memory
;
; relative addressing is not used for this, so code is not relocatable
;
rannum:	fdb $1234
;
; end of routine
