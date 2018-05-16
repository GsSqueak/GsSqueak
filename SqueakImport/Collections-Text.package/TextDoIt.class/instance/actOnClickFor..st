event handling
actOnClickFor: anObject
	"Note: evalString gets evaluated IN THE CONTEXT OF anObject
	 -- meaning that self and all instVars are accessible"
	Compiler evaluate: evalString for: anObject.
	^ true 