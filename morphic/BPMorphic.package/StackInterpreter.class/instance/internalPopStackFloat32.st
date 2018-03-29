internal interpreter access
internalPopStackFloat32
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_topSingle |
	nativeSP := self nativeStackPointerIn: localFP.
	_gsSqueakTemp_topSingle := stackPages singleFloatAtPointer: nativeSP - 1.
	nativeSP := self nativeStackPointerIn: localFP put: nativeSP + objectMemory bytesPerOop.
	^ _gsSqueakTemp_topSingle