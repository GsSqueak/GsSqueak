label
relabel
	| _gsSqueakTemp_newLabel |
	_gsSqueakTemp_newLabel := UIManager default request: 'New title for this window' translated initialAnswer: labelString.
	_gsSqueakTemp_newLabel isEmpty
		ifTrue: [^ self].
	(model windowReqNewLabel: _gsSqueakTemp_newLabel)
		ifTrue: [self setLabel: _gsSqueakTemp_newLabel]