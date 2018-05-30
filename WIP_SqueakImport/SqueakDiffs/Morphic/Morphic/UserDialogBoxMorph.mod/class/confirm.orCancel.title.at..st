utilities
confirm: aString orCancel: cancelBlock title: titleString at: aPointOrNil
	
	(self new
		title: titleString;
		message: aString;
		createButton: 'Yes' translated value: true;
		createButton: 'No' translated  value: false;
		createButton: 'Cancel' translated value: nil;
		selectedButtonIndex: 1; "YES"
		registerKeyboardShortcuts;
		yourself) in: [:dialog |
			^ (aPointOrNil
				ifNil: [dialog getUserResponseAtHand]
				ifNotNil: [
					dialog moveTo: aPointOrNil.
					dialog getUserResponse])
						ifNil: [ cancelBlock value ]]