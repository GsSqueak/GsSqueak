menu
getMenu: shiftKeyState 
	"Answer the menu for this text view, supplying an empty menu to be
	filled in. If the menu selector takes an extra argument, pass in the
	current state of the shift key."
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := super getMenu: shiftKeyState.
	_gsSqueakTemp_aMenu
		ifNotNil: [_gsSqueakTemp_aMenu commandKeyHandler: self].
	^ _gsSqueakTemp_aMenu