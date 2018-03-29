internal interpreter access
internalPushShadowCallStackInt32: int32Value 
	"In the StackInterpreter stacks grow down."
	shadowCallStackPointer := shadowCallStackPointer - objectMemory bytesPerOop.
	"In the StackInterpreter stacks grow down."
	stackPages int32AtPointer: shadowCallStackPointer put: int32Value