do-its
buttonForIt
	^ self doItButtonFromSelection
		ifNotNilDo: [:e | e openInHand]