utilities
composeDisplayTextIntoForm: displayText

	| tmpText canvas |
	tmpText := TextMorph new contentsAsIs: displayText text deepCopy.
	displayText foregroundColor ifNotNil: [:color |
		tmpText text addAttribute: (TextColor color: color)].
	displayText backgroundColor ifNotNil: [:color |
		tmpText backgroundColor: color].
	tmpText setTextStyle: displayText textStyle.
	canvas := FormCanvas on: (Form extent: tmpText extent depth: 32).
	tmpText drawOn: canvas.
	^ canvas form