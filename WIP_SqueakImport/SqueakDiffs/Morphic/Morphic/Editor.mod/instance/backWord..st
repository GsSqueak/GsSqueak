typing/selecting keys
backWord: aKeyboardEvent 
	^ self class destructiveBackWord 
		ifTrue: [ self destructiveBackWord: aKeyboardEvent ]
		ifFalse: [ self nonDestructiveBackWord: aKeyboardEvent ]