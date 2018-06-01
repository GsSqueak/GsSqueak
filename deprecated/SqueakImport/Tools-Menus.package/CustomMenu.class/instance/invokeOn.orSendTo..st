invocation
invokeOn: targetObject orSendTo: anObject
	"Pop up this menu and return the result of sending to the target object the selector corresponding to the menu item selected by the user. Return  nil if no item is selected.  If the chosen selector has arguments, obtain appropriately.  If the recipient does not respond to the resulting message, send it to the alternate object provided"

	| aSelector anIndex recipient |
	^ (aSelector := self startUp) ifNotNil:
		[anIndex := self selection.
		recipient := ((targets := self targets) isEmptyOrNil or: [anIndex > targets size])
			ifTrue:
				[targetObject]
			ifFalse:
				[targets at: anIndex].
		aSelector numArgs = 0
			ifTrue:
				[recipient perform: aSelector orSendTo: anObject]
			ifFalse:
				[recipient perform: aSelector withArguments: (self arguments at: anIndex)]]