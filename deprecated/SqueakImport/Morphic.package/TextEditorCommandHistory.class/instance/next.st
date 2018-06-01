accessing
next

	^ self hasNext
		ifTrue: [commands at: currentIndex+1]
		ifFalse: [nil]