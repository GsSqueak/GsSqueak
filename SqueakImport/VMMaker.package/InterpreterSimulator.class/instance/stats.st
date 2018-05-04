testing
stats
	| oop fieldAddr fieldOop last stats v d |
	stats := Bag new.
	oop := objectMemory firstObject.

'Scanning the image...' displayProgressAt: Sensor cursorPoint
	from: oop to: objectMemory getEndOfMemory
	during: [:bar |

	[oop < objectMemory getEndOfMemory] whileTrue:
		[(objectMemory isFreeObject: oop) ifFalse:
			[stats add: #objects.
			fieldAddr := oop + (objectMemory lastPointerOf: oop).
			[fieldAddr > oop] whileTrue:
				[fieldOop := objectMemory longAt: fieldAddr.
				(objectMemory isIntegerObject: fieldOop)
					ifTrue: [v := objectMemory integerValueOf: fieldOop.
							(v between: -16000 and: 16000)
								ifTrue: [stats add: #ints32k]
								ifFalse: [stats add: #intsOther]]
					ifFalse: [fieldOop = objectMemory getNilObj ifTrue: [stats add: #nil]
							ifFalse:
							[d := fieldOop - oop.
							(d between: -16000 and: 16000)
								ifTrue: [stats add: #oops32k]
								ifFalse: [stats add: #oopsOther]]].
				fieldAddr := fieldAddr - bytesPerWord]].
		bar value: oop.
		last := oop.
		last := last.
		oop := objectMemory objectAfter: oop]].
	^ stats sortedElements