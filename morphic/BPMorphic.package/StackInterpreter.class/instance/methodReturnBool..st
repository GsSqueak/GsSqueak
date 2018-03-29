plugin primitive support
methodReturnBool: boolean 
	"Sets the return value for a method. In the CoInterpreter we replace
	the cumbersome
	primResult machinery."
	self pop: argumentCount + 1 thenPushBool: boolean.
	^ 0