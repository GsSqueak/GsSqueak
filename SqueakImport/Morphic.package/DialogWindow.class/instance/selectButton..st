selection
selectButton: aButton

	| buttonColor |
	buttonColor :=  ((self userInterfaceTheme selectionModifier ifNil: [ [:c | c muchLighter] ]) value: (aButton valueOfProperty: #normalColor)).
	self deselectButton: selectedButton.
	aButton offColor: buttonColor.
	selectedButton := aButton.