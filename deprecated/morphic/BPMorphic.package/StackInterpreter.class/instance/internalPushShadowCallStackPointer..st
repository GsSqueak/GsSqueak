internal interpreter access
internalPushShadowCallStackPointer: pointerValue 
	"In the StackInterpreter stacks grow down."
	shadowCallStackPointer := shadowCallStackPointer - BytesPerOop.
	"In the StackInterpreter stacks grow down."
	stackPages pointerAtPointer: shadowCallStackPointer put: pointerValue