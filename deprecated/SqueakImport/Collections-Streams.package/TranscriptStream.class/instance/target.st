stream extensions
target

	^ self class redirectToStdOut
		ifTrue: [FileStream stdout]
		ifFalse: [self]