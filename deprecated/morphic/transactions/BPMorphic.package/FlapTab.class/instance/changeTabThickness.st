solid tabs
changeTabThickness
	| _gsSqueakTemp_newThickness |
	_gsSqueakTemp_newThickness := UIManager default request: 'New thickness:' initialAnswer: self tabThickness printString.
	_gsSqueakTemp_newThickness notEmpty
		ifTrue: [self applyTabThickness: _gsSqueakTemp_newThickness]