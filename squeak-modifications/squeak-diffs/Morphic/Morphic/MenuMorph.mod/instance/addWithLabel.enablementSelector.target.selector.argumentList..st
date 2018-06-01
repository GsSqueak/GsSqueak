construction
addWithLabel: aLabel enablementSelector: enablementSelector target: target selector: aSymbol argumentList: argList
	"Append a menu item with the given label. If the item is selected, it will send the given selector to the target object with the given arguments. If the selector takes one more argument than the number of arguments in the given list, then the triggering event is supplied as as the last argument.  In this variant, the wording of the menu item is constant, and the optional enablementSelector determines whether or not the item should be enabled."

	| item |
	item := UpdatingMenuItemMorph new
		target: target;
		selector: aSymbol;
		contents: aLabel;
		wordingProvider: target wordingSelector: nil;
		enablementSelector: enablementSelector;
		arguments: argList asArray.
	self addMorphBack: item.
