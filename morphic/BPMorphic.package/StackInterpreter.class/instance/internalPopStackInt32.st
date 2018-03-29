internal interpreter access
internalPopStackInt32
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_topInt32 |
	nativeSP := self nativeStackPointerIn: localFP.
	_gsSqueakTemp_topInt32 := stackPages int32AtPointer: nativeSP - 1.
	nativeSP := self nativeStackPointerIn: localFP put: nativeSP + objectMemory bytesPerOop.
	^ _gsSqueakTemp_topInt32