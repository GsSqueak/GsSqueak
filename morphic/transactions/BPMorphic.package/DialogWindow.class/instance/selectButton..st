selection
selectButton: aButton 
	| _gsSqueakTemp_buttonColor |
	_gsSqueakTemp_buttonColor := (self userInterfaceTheme selectionModifier
				ifNil: [[:c | c muchLighter]])
				value: (aButton valueOfProperty: #normalColor).
	self deselectButton: selectedButton.
	aButton offColor: _gsSqueakTemp_buttonColor.
	selectedButton := aButton