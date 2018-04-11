typing support
dispatchOnEnterWith: aKeyboardEvent 
	"Enter key hit. Treat is as an 'accept', viz a synonym for cmd-s. If cmd
	key is down, treat is as a synonym for print-it."
	aKeyboardEvent commandKeyPressed
		ifTrue: [self printIt]
		ifFalse: [self insertAndCloseTypeIn.
			self accept].
	^ true