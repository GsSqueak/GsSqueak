private
moveCursor: directionBlock forward: forward event: aKeyboardEvent specialBlock: specialBlock 
	"Private - Move cursor.
	directionBlock is a one argument Block that computes the new
	Position from a given one.
	specialBlock is a one argumentBlock that computes the new position
	from a given one under the alternate semantics.
	Note that directionBlock always is evaluated first."
	| _gsSqueakTemp_indices _gsSqueakTemp_newPosition _gsSqueakTemp_shouldSelect |
	_gsSqueakTemp_shouldSelect := aKeyboardEvent shiftPressed.
	_gsSqueakTemp_indices := self setIndices: _gsSqueakTemp_shouldSelect forward: forward.
	_gsSqueakTemp_newPosition := directionBlock
				value: (_gsSqueakTemp_indices at: #moving).
	(aKeyboardEvent commandKeyPressed
			or: [aKeyboardEvent controlKeyPressed])
		ifTrue: [_gsSqueakTemp_newPosition := specialBlock value: _gsSqueakTemp_newPosition].
	_gsSqueakTemp_shouldSelect
		ifTrue: [self
				selectMark: (_gsSqueakTemp_indices at: #fixed)
				point: _gsSqueakTemp_newPosition - 1]
		ifFalse: [self selectAt: _gsSqueakTemp_newPosition]