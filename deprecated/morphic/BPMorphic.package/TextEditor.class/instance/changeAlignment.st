menu messages
changeAlignment
	| _gsSqueakTemp_aList _gsSqueakTemp_reply |
	_gsSqueakTemp_aList := #(#leftFlush #centered #justified #rightFlush ).
	_gsSqueakTemp_reply := UIManager default chooseFrom: _gsSqueakTemp_aList values: _gsSqueakTemp_aList.
	_gsSqueakTemp_reply
		ifNil: [^ self].
	self setAlignment: _gsSqueakTemp_reply.
	paragraph composeAll.
	self recomputeSelection.
	^ true