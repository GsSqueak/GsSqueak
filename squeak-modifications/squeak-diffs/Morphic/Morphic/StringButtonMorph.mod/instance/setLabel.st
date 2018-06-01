menu
setLabel

	| newLabel |
	newLabel := UIManager default
		request:
'Please type a new label for this button'
		initialAnswer: self contents.
	newLabel isEmpty ifFalse: [self contents: newLabel].
