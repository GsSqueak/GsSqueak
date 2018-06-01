construction
add: wordingString icon: aForm selectedIcon: anotherForm help: helpString subMenu: aMenuMorph 
	"Append the given submenu with the given label."
	| item |
	item := DockingBarItemMorph new
		contents: wordingString;
		subMenu: aMenuMorph;
		icon: aForm;
		selectedIcon: anotherForm.
	helpString isNil ifFalse: [
		item setBalloonText: helpString ].
	self addMorphBack: item