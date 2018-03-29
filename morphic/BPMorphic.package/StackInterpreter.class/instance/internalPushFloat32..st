internal interpreter access
internalPushFloat32: singleFloatValue 
	"In the StackInterpreter stacks grow down."
	nativeSP := (self nativeStackPointerIn: localFP)
				- objectMemory bytesPerOop.
	self nativeStackPointerIn: localFP put: nativeSP.
	"In the StackInterpreter stacks grow down."
	stackPages singleFloatAtPointer: nativeSP - 1 put: singleFloatValue