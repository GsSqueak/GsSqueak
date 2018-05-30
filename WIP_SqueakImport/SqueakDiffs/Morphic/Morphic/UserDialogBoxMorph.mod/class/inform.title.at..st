utilities
inform: aString title: titleString at: aPointOrNil
	"UserDialogBoxMorph inform: 'Squeak is great!' title: 'Will you look at this:'"
	
	^self new
		title: titleString;
		message: aString;
		createButton: 'OK' translated value: nil;
		getUserResponseAtHand