internal interpreter access
internalPopStackInt64
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_topInt64 |
	nativeSP := self nativeStackPointerIn: localFP.
	_gsSqueakTemp_topInt64 := stackPages long64AtPointer: nativeSP - 1.
	nativeSP := self nativeStackPointerIn: localFP put: nativeSP + 8.
	^ _gsSqueakTemp_topInt64