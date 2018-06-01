menu
getMenu: shiftKeyState 
	"Answer the menu for this text view, supplying an empty menu to be
	filled in. If the menu selector takes an extra argument, pass in the
	current state of the shift key."
	| _gsSqueakTemp_menu _gsSqueakTemp_aMenu _gsSqueakTemp_aTitle |
	getMenuSelector == nil
		ifTrue: [^ nil].
	_gsSqueakTemp_menu := MenuMorph new defaultTarget: model.
	_gsSqueakTemp_aTitle := getMenuTitleSelector
				ifNotNil: [model perform: getMenuTitleSelector].
	getMenuSelector numArgs = 1
		ifTrue: [_gsSqueakTemp_aMenu := model perform: getMenuSelector with: _gsSqueakTemp_menu.
			_gsSqueakTemp_aTitle
				ifNotNil: [_gsSqueakTemp_aMenu addTitle: _gsSqueakTemp_aTitle].
			^ _gsSqueakTemp_aMenu].
	getMenuSelector numArgs = 2
		ifTrue: [_gsSqueakTemp_aMenu := model
						perform: getMenuSelector
						with: _gsSqueakTemp_menu
						with: shiftKeyState.
			_gsSqueakTemp_aTitle
				ifNotNil: [_gsSqueakTemp_aMenu addTitle: _gsSqueakTemp_aTitle].
			^ _gsSqueakTemp_aMenu].
	^ self error: 'The getMenuSelector must be a 1- or 2-keyword symbol'