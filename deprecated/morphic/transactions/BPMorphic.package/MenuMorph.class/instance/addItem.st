menu
addItem
	| _gsSqueakTemp_string _gsSqueakTemp_sel |
	_gsSqueakTemp_string := UIManager default request: 'Label for new item?'.
	_gsSqueakTemp_string isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_sel := UIManager default request: 'Selector?'.
	_gsSqueakTemp_sel isEmpty
		ifFalse: [_gsSqueakTemp_sel := _gsSqueakTemp_sel asSymbol].
	self add: _gsSqueakTemp_string action: _gsSqueakTemp_sel