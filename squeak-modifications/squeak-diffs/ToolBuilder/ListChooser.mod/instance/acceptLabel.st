colors
acceptLabel

	^ self canAdd
		ifFalse: ['Choose' translated]
		ifTrue: [self canAccept
			ifTrue: ['Choose or Add' translated]
			ifFalse: ['Add' translated]]