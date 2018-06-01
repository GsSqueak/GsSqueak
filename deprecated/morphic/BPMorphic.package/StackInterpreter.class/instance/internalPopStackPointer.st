internal interpreter access
internalPopStackPointer
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_topPointer |
	nativeSP := self nativeStackPointerIn: localFP.
	_gsSqueakTemp_topPointer := stackPages pointerAtPointer: nativeSP - 1.
	nativeSP := self nativeStackPointerIn: localFP put: nativeSP + objectMemory bytesPerOop.
	^ _gsSqueakTemp_topPointer