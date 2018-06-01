typing/selecting keys
destructiveBackWord: aKeyboardEvent 
	typeAhead isEmpty
		ifTrue: [super destructiveBackWord: aKeyboardEvent]
		ifFalse: [typeAhead reset].
	^ false