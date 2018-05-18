utilities
confirm: aString trueChoice: trueChoice falseChoice: falseChoice
	"UserDialogBoxMorph confirm: 'Do you like chocolate?' trueChoice: 'Oh yessir!' falseChoice: 'Not so much...'  "
	^self confirm: aString title: 'Please confirm:' trueChoice: trueChoice falseChoice: falseChoice at: nil