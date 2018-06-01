private
moveCursor: directionBlock forward: forward select: shouldSelect
	"Private - Move cursor.
	directionBlock is a one argument Block that computes the new Position from a given one.
	specialBlock is a one argumentBlock that computes the new position from a given one under the alternate semantics.
	Note that directionBlock always is evaluated first."
	| indices newPosition |
	indices := self setIndices: shouldSelect forward: forward.
	newPosition := directionBlock value: (indices at: #moving).
	shouldSelect
		ifTrue: [self selectMark: (indices at: #fixed) point: newPosition - 1]
		ifFalse: [self selectAt: newPosition]