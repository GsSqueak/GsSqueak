plugin primitive support
methodReturnFloat: aFloat 
	"Sets the return value for a method."
	self pop: argumentCount + 1 thenPushFloat: aFloat.
	^ 0