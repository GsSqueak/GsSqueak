plugin primitive support
methodReturnInteger: integer 
	"Sets the return value for a method. In the CoInterpreter we replace
	the cumbersome
	primResult machinery."
	self pop: argumentCount + 1 thenPushInteger: integer.
	^ 0