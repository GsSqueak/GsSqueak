event handling
filterEvent: aKeyboardEvent for: aMorph

	| char |
	aKeyboardEvent isKeystroke ifFalse: [^ aKeyboardEvent].
	aKeyboardEvent anyModifierKeyPressed ifTrue: [^ aKeyboardEvent].
	
	char := aKeyboardEvent keyCharacter.
	
	(char = Character cr or: [char = Character enter])
		ifTrue: [self acceptFileName. aKeyboardEvent ignore].
	char = Character escape 
		ifTrue: [self cancelFileChooser. aKeyboardEvent ignore].
	
	^ aKeyboardEvent