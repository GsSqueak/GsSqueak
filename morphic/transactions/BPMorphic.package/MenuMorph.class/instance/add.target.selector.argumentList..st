construction
add: aString target: target selector: aSymbol argumentList: argList 
	"Append a menu item with the given label. If the item is selected, it
	will send the given selector to the target object with the given
	arguments. If the selector takes one more argument than the number
	of arguments in the given list, then the triggering event is supplied as
	as the last argument."
	| _gsSqueakTemp_item |
	_gsSqueakTemp_item := MenuItemMorph new contents: aString;
				 target: target;
				 selector: aSymbol;
				 arguments: argList asArray.
	self addMorphBack: _gsSqueakTemp_item