menu
advanceFrame

	currentFrameIndex < frameList size
		ifTrue: [self setFrame: currentFrameIndex + 1]
		ifFalse: [self setFrame: 1].
