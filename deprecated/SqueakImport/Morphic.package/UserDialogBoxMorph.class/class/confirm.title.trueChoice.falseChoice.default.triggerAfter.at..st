utilities
confirm: aString title: titleString trueChoice: trueChoice falseChoice: falseChoice default: default triggerAfter: seconds at: aPointOrNil
	"UserDialogBoxMorph confirm: 'I like hot java' title: 'What do you say?' trueChoice: 'You bet!' falseChoice: 'Nope' default: false triggerAfter: 12 at: 121@212"
	^self new
		title: titleString;
		message: aString;
		createButton: trueChoice translated value: true;
		createCancelButton: falseChoice translated value: false;
		selectedButtonIndex: (default ifTrue: [1] ifFalse: [2]);
		registerKeyboardShortcuts;
		moveTo: (aPointOrNil ifNil: [ActiveWorld center]);
		getUserResponseAfter: seconds