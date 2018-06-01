accessing
size
	| _gsSqueakTemp_n _gsSqueakTemp_cell |
	_gsSqueakTemp_n := 0.
	_gsSqueakTemp_cell := self.
	[_gsSqueakTemp_cell isNil]
		whileFalse: [_gsSqueakTemp_n := _gsSqueakTemp_n + 1.
			_gsSqueakTemp_cell := _gsSqueakTemp_cell nextCell].
	^ _gsSqueakTemp_n