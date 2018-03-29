internal interpreter access
internalPushFloat64: floatValue 
	"In the StackInterpreter stacks grow down."
	nativeSP := (self nativeStackPointerIn: localFP)
				- 8.
	self nativeStackPointerIn: localFP put: nativeSP.
	"In the StackInterpreter stacks grow down."
	stackPages floatAtPointer: nativeSP - 1 put: floatValue