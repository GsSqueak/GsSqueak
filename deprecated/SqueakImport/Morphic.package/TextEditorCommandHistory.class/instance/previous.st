accessing
previous

	^ self hasPrevious
		ifTrue: [commands at: currentIndex]
		ifFalse: [nil]