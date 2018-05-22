utilities
confirm: aString title: titleString trueChoice: trueChoice falseChoice: falseChoice
	"UserDialogBoxMorph confirm: 'Make your choice carefully' withCRs title: 'Do you like chocolate?' trueChoice: 'Oh yessir!' falseChoice: 'Not so much...'  "
	^self confirm: aString title: titleString trueChoice: trueChoice falseChoice: falseChoice at: nil