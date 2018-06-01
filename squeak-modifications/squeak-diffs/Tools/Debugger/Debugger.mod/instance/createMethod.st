private
createMethod
	"Should only be called when this Debugger was created in response to a
	MessageNotUnderstood exception. Create a stub for the method that was
	missing and proceed into it."
	
	| msg chosenClass |
	msg := self contextStackTop exceptionMessage.
	chosenClass := self
		askForSuperclassOf: self contextStackTop receiver class
		toImplement: msg selector
		ifCancel: [^self].
	self implementMissingMethod: msg inClass: chosenClass.