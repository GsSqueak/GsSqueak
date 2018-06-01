utilities
confirm: aString title: titleString
	"UserDialogBoxMorph confirm: 'Make your choice carefully' withCRs title: 'Do you like chocolate?'"
	^self confirm: aString title: titleString at: nil