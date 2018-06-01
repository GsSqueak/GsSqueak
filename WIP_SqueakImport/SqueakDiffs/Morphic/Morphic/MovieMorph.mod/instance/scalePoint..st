accessing
scalePoint: newScalePoint

	| frame |
	newScalePoint ~= scalePoint ifTrue: [
		self changed.
		scalePoint := newScalePoint.
		frame := self currentFrame.
		frame ifNotNil: [frame scalePoint: newScalePoint].
		self layoutChanged.
		self changed].
