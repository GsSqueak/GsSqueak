internal interpreter access
internalPushShadowCallStackFloat32: singleFloatValue 
	"In the StackInterpreter stacks grow down."
	shadowCallStackPointer := shadowCallStackPointer - objectMemory bytesPerOop.
	"In the StackInterpreter stacks grow down."
	stackPages singleFloatAtPointer: shadowCallStackPointer put: singleFloatValue