dialogs
inform: aString
	"PopUpMenu inform: 'I like Squeak'"

	| iconOrNil |
	iconOrNil := Smalltalk at: #MenuIcons ifPresent: [:cls | cls confirmIcon].
	(PopUpMenu labels: ' OK ' translated)
		startUpWithCaption: aString
		icon: iconOrNil
