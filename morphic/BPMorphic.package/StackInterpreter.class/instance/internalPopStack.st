internal interpreter access
internalPopStack
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_top |
	_gsSqueakTemp_top := stackPages longAt: localSP.
	localSP := localSP + objectMemory bytesPerOop.
	^ _gsSqueakTemp_top