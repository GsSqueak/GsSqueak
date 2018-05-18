button
doButtonAction
	"Perform the action of this button. Subclasses may override this method. The default behavior is to send the button's actionSelector to its target object with its arguments."

	| args |
	(target notNil and: [actionSelector notNil]) 
		ifTrue: 
			[args := actionSelector numArgs > arguments size
				ifTrue:
					[arguments copyWith: ActiveEvent]
				ifFalse:
					[arguments].
			Cursor normal 
				showWhile: [target perform: actionSelector withArguments: args].
			target isMorph ifTrue: [target changed]]