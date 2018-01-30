evaluating
bench
	"See how many times I can value in 5 seconds.  I'll answer a meaningful description."

	| startTime endTime count |
	count := 0.
	endTime := Time millisecondClockValue + 5000.
	startTime := Time millisecondClockValue.
	[ Time millisecondClockValue > endTime ] whileFalse: [ self value.  count := count + 1 ].
	endTime := Time millisecondClockValue.
	^count = 1
		ifTrue: [ ((endTime - startTime) // 1000) printString, ' seconds.' ]
		ifFalse:
			[ ((count * 1000) / (endTime - startTime)) asFloat printString, ' per second.' ]