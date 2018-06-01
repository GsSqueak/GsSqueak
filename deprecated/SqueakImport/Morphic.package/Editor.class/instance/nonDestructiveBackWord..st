typing/selecting keys
nonDestructiveBackWord: aKeyboardEvent 
	"Select the prior word."
	| indices newPosition |
	self closeTypeIn.
	indices := self 
		setIndices: true
		forward: false.
	newPosition := 1 max: (indices at: #moving) - 1.
	newPosition :=  self previousWord: newPosition.
	self selectMark: (indices at: #fixed) point: newPosition - 1.
	^ true