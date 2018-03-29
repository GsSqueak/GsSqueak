internal interpreter access
internalPushShadowCallStackInt64: int64Value 
	"In the StackInterpreter stacks grow down."
	shadowCallStackPointer := shadowCallStackPointer - 8.
	"In the StackInterpreter stacks grow down."
	stackPages int64AtPointer: shadowCallStackPointer put: int64Value