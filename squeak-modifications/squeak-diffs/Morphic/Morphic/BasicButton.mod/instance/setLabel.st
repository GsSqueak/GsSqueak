as yet unclassified
setLabel
	| newLabel |
	newLabel := UIManager default
		request:
'Enter a new label for this button'
		initialAnswer: self label.
	newLabel isEmpty ifFalse: [self label: newLabel font: nil].
