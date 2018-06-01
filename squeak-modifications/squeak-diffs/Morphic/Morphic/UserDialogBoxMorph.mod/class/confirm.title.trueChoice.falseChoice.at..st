utilities
confirm: aString title: titleString trueChoice: trueChoice falseChoice: falseChoice at: aPointOrNil
	"UserDialogBoxMorph confirm: 'Make your choice carefully' withCRs title: 'Do you like chocolate?' trueChoice: 'Oh yessir!' falseChoice: 'Not so much...'"
	^self new
		title: titleString;
		message: aString;
		createButton: trueChoice translated value: true;
		createCancelButton: falseChoice translated value: false;
		selectedButtonIndex: 1;
		registerKeyboardShortcuts;
		moveTo: (aPointOrNil ifNil: [ActiveWorld center]);
		getUserResponse