navigation
navigateFromKeystroke: aChar 
	"A character was typed in an effort to do interproject navigation along the receiver's thread"

	| ascii |
	ascii := aChar asciiValue.
	(#(29 31 32) includes: ascii) ifTrue: [^self nextPage].	"right arrow, down arrow, space"
	(#(8 28 30) includes: ascii) ifTrue: [^self previousPage].	"left arrow, up arrow, backspace"
	(#(1) includes: ascii) ifTrue: [^self firstPage].
	(#(4) includes: ascii) ifTrue: [^self lastPage].
	Beeper beep