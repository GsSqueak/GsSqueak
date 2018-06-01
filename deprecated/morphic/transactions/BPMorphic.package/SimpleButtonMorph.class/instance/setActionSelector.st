menu
setActionSelector
	| _gsSqueakTemp_newSel |
	_gsSqueakTemp_newSel := UIManager default request: 'Please type the selector to be sent to
the target when this button is pressed' translated initialAnswer: actionSelector.
	_gsSqueakTemp_newSel isEmpty
		ifFalse: [self actionSelector: _gsSqueakTemp_newSel]