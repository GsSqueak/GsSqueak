construction
addItem: aBlock 
	| _gsSqueakTemp_item |
	_gsSqueakTemp_item := MenuItemMorph new.
	aBlock value: _gsSqueakTemp_item.
	self addMenuItem: _gsSqueakTemp_item