menu
offerWindowMenu
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := self buildWindowMenu.
	model
		ifNotNil: [model addModelItemsToWindowMenu: _gsSqueakTemp_aMenu].
	_gsSqueakTemp_aMenu popUpEvent: self currentEvent in: self world