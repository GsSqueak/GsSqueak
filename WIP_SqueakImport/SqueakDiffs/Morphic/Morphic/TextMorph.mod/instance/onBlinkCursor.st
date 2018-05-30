blinking
onBlinkCursor

	| para |
	para := paragraph ifNil: [^nil].
	Time millisecondClockValue < self blinkStart 
		ifTrue: [para showCaret: para focused]
		ifFalse: [para showCaret: para showCaret not].
	para caretRect ifNotNil: [ :r | self invalidRect: r].