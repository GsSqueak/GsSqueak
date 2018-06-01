menu
setLabel
	| _gsSqueakTemp_newLabel |
	_gsSqueakTemp_newLabel := UIManager default request: 'Please enter a new label for this button' initialAnswer: self label.
	_gsSqueakTemp_newLabel isEmpty
		ifFalse: [self labelString: _gsSqueakTemp_newLabel]