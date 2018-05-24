utilities
confirm: aString orCancel: cancelBlock
	"UserDialogBoxMorph confirm: 'Do you like chocolate?'"
	^self confirm: aString orCancel: cancelBlock at: nil