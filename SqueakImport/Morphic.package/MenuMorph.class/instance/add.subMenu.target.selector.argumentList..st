construction
add: aString subMenu: aMenuMorph target: target selector: aSymbol argumentList: argList
	"Append the given submenu with the given label."

	| item |
	item := MenuItemMorph new.
	item 
		contents: aString;
		target: target;
		selector: aSymbol;
		arguments: argList asArray;
		subMenu: aMenuMorph.
	self addMorphBack: item.
	^item