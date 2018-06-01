utilities
addItem: item toMenu: menu selection: action color: aColor thumbnail: aForm
	"Add menu item representing the sender to a menu"

	menu
		add: item
		selector: #jumpToSelection:
		argument: action.
	menu lastItem color: aColor.
	aForm isNil
		ifFalse: [menu lastItem
				icon: (aForm
						scaledIntoFormOfSize: (Preferences tinyDisplay
								ifTrue: [16]
								ifFalse: [28]))]