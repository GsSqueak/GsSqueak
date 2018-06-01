private
moveCursor: directionBlock forward: forward event: aKeyboardEvent specialBlock: specialBlock 
	"Private - Move cursor.
	directionBlock is a one argument Block that computes the new Position from a given one.
	specialBlock is a one argumentBlock that computes the new position from a given one under the alternate semantics.
	Note that directionBlock always is evaluated first."
	| indices newPosition shouldSelect |
	shouldSelect := aKeyboardEvent shiftPressed.
	indices := self setIndices: shouldSelect forward: forward.
	newPosition := directionBlock value: (indices at: #moving).
	(aKeyboardEvent commandKeyPressed or: [aKeyboardEvent controlKeyPressed])
		ifTrue: [newPosition := specialBlock value: newPosition].
	shouldSelect
		ifTrue: [self selectMark: (indices at: #fixed) point: newPosition - 1]
		ifFalse: [self selectAt: newPosition]