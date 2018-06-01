menu
addTitle
	| _gsSqueakTemp_string |
	_gsSqueakTemp_string := UIManager default request: 'Title for this menu?'.
	_gsSqueakTemp_string isEmpty
		ifTrue: [^ self].
	self addTitle: _gsSqueakTemp_string