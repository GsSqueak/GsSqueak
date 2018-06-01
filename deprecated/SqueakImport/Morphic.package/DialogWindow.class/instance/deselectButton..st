selection
deselectButton: aButton

	aButton ifNil: [^ self].
	aButton offColor: (aButton valueOfProperty: #normalColor).
	aButton == selectedButton ifTrue: [selectedButton := nil].