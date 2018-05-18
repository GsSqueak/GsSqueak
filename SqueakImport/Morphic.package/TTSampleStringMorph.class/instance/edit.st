menus
edit
	"Allow the user to change the text in a crude way"

	| str |
	str := FillInTheBlankMorph request: 'Type in new text for this TrueType displayer.'
				 initialAnswer: 'some text'.
	str isEmpty ifTrue: [^ self].
	self string: str.
