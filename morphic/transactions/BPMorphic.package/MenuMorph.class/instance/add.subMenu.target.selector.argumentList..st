construction
add: aString subMenu: aMenuMorph target: target selector: aSymbol argumentList: argList 
	"Append the given submenu with the given label."
	| _gsSqueakTemp_item |
	_gsSqueakTemp_item := MenuItemMorph new.
	_gsSqueakTemp_item contents: aString;
		 target: target;
		 selector: aSymbol;
		 arguments: argList asArray;
		 subMenu: aMenuMorph.
	self addMorphBack: _gsSqueakTemp_item.
	^ _gsSqueakTemp_item