private
insertFrames: newFrames
	"Insert the given collection of frames into this movie just after the currentrame."

	frameList isEmpty ifTrue: [
		frameList := newFrames asArray copy.
		self setFrame: 1.
		^ self].

	frameList :=
		frameList
			copyReplaceFrom: currentFrameIndex + 1  "insert before"
			to: currentFrameIndex
			with: newFrames.
