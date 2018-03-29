internal interpreter access
internalPushShadowCallStackFloat64: floatValue 
	"In the StackInterpreter stacks grow down."
	shadowCallStackPointer := shadowCallStackPointer - 8.
	"In the StackInterpreter stacks grow down."
	stackPages singleFloatAtPointer: shadowCallStackPointer put: floatValue