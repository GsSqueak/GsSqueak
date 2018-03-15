private
previousWord: position 
	| _gsSqueakTemp_string _gsSqueakTemp_index |
	_gsSqueakTemp_string := self string.
	_gsSqueakTemp_index := position.
	[(_gsSqueakTemp_index between: 1 and: _gsSqueakTemp_string size)
		and: [(_gsSqueakTemp_string at: _gsSqueakTemp_index) isAlphaNumeric not]]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index - 1].
	[(_gsSqueakTemp_index between: 1 and: _gsSqueakTemp_string size)
		and: [(_gsSqueakTemp_string at: _gsSqueakTemp_index) isAlphaNumeric]]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index - 1].
	^ _gsSqueakTemp_index + 1