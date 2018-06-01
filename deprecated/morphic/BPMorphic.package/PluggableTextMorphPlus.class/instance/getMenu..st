menu
getMenu: shiftKeyState 
	"Answer the menu for this text view. We override the superclass
	implementation to
	so we can give the selection interval to the model."
	| _gsSqueakTemp_menu _gsSqueakTemp_aMenu |
	getMenuSelector == nil
		ifTrue: [^ nil].
	getMenuSelector numArgs < 3
		ifTrue: [^ super getMenu: shiftKeyState].
	_gsSqueakTemp_menu := MenuMorph new defaultTarget: model.
	getMenuSelector numArgs = 3
		ifTrue: [_gsSqueakTemp_aMenu := model
						perform: getMenuSelector
						with: _gsSqueakTemp_menu
						with: shiftKeyState
						with: self selectionInterval.
			getMenuTitleSelector
				ifNotNil: [_gsSqueakTemp_aMenu
						addTitle: (model perform: getMenuTitleSelector)].
			^ _gsSqueakTemp_aMenu].
	^ self error: 'The getMenuSelector must be a 1- or 2 or 3-keyword symbol'