construction
add: wordingString icon: aForm help: helpString subMenu: aMenuMorph 
	"Append the given submenu with the given label."
	| _gsSqueakTemp_item |
	_gsSqueakTemp_item := MenuItemMorph new.
	_gsSqueakTemp_item contents: wordingString.
	_gsSqueakTemp_item subMenu: aMenuMorph.
	_gsSqueakTemp_item icon: aForm.
	helpString isNil
		ifFalse: [_gsSqueakTemp_item setBalloonText: helpString].
	self addMorphBack: _gsSqueakTemp_item