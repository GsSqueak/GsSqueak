event handling
filterEvent: aKeyboardEvent for: aMorph

	| char |
	aKeyboardEvent isKeystroke ifFalse: [^ aKeyboardEvent].
	aKeyboardEvent anyModifierKeyPressed ifTrue: [^ aKeyboardEvent].
	
	char := aKeyboardEvent keyCharacter.
	
	char = Character backspace
		ifTrue: [self searchText: (self searchText asString ifNotEmpty: [:s | s allButLast]). ^ aKeyboardEvent ignore].
	char = Character delete
		ifTrue: [self searchText: (self searchText asString ifNotEmpty: [:s | s allButFirst]). ^ aKeyboardEvent ignore].
	(char = Character cr or: [char = Character enter])
		ifTrue: [self accept. aKeyboardEvent ignore].
	char = Character escape 
		ifTrue: [self cancel. aKeyboardEvent ignore].
	(char asInteger between: 32 and: 126)
		ifTrue: [self searchText: self searchText asString, char asString. aKeyboardEvent ignore].
	(char = Character arrowUp or: [char = Character arrowDown
		or: [char = Character pageUp or: [char = Character pageDown
		or: [char = Character home or: [char = Character end]]]]])
		ifTrue: [listMorph keyStroke: aKeyboardEvent. ^aKeyboardEvent ignore].
	
	^ aKeyboardEvent