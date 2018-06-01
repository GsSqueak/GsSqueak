utilities
confirm: aString title: titleString at: aPointOrNil
	"UserDialogBoxMorph confirm: 'Make your choice carefully' withCRs title: 'Do you like chocolate?'"
	^self new
		title: titleString;
		message: aString;
		createButton: 'Yes' translated value: true;
		createCancelButton: 'No' translated  value: false;
		selectedButtonIndex: 1; "YES"
		registerKeyboardShortcuts;
		getUserResponseAtHand