menu
extractFrame: evt

	| f |
	f := self currentFrame.
	f ifNil: [^ self].
	frameList := frameList copyWithout: f.
	frameList isEmpty
		ifTrue: [self position: f position]
		ifFalse: [self setFrame: currentFrameIndex].
	evt hand attachMorph: f.
