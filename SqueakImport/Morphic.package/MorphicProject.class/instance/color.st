accessing
color

	^ self world isInMemory
		ifTrue: [Color black]
		ifFalse: [Color brown]