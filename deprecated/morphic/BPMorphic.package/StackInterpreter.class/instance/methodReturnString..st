plugin primitive support
methodReturnString: aCString 
	"Sets the return value for a method."
	self
		pop: argumentCount + 1
		thenPush: (objectMemory stringForCString: aCString).
	^ 0