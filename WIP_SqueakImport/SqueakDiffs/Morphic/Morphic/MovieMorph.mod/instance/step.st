stepping and presenter
step

	playMode = #stop ifTrue: [^ self].

	dwellCount > 0 ifTrue: [
		dwellCount := dwellCount - 1.
		^ self].

	currentFrameIndex < frameList size
		ifTrue: [^ self setFrame: currentFrameIndex + 1].

	playMode = #loop
		ifTrue: [self setFrame: 1]
		ifFalse: [playMode := #stop].
