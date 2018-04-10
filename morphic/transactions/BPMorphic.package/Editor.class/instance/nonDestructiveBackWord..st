typing/selecting keys
nonDestructiveBackWord: aKeyboardEvent 
	"Select the prior word."
	| _gsSqueakTemp_indices _gsSqueakTemp_newPosition |
	self closeTypeIn.
	_gsSqueakTemp_indices := self setIndices: true forward: false.
	_gsSqueakTemp_newPosition := 1 max: (_gsSqueakTemp_indices at: #moving)
					- 1.
	_gsSqueakTemp_newPosition := self previousWord: _gsSqueakTemp_newPosition.
	self
		selectMark: (_gsSqueakTemp_indices at: #fixed)
		point: _gsSqueakTemp_newPosition - 1.
	^ true