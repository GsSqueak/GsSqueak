as yet unclassified
pauseProgrammedMoves

	programmedMoves isEmptyOrNil ifTrue: [^self].
	programmedMoves first
		at: #pauseTime
		put: Time millisecondClockValue
