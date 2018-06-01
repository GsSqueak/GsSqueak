internal interpreter access
internalPopStackFloat64
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_topDouble |
	nativeSP := self nativeStackPointerIn: localFP.
	_gsSqueakTemp_topDouble := stackPages floatAtPointer: nativeSP - 1.
	nativeSP := self nativeStackPointerIn: localFP put: nativeSP + 8.
	^ _gsSqueakTemp_topDouble