frame access
stackPointerIndexForFrame: theFP 
	"Return the 0-based index rel to the given frame.
	(This is what stackPointer used to be before conversion to pointer)"
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_thePage _gsSqueakTemp_theSP |
	_gsSqueakTemp_thePage := stackPages stackPageFor: theFP.
	_gsSqueakTemp_theSP := self findSPOf: theFP on: _gsSqueakTemp_thePage.
	^ self stackPointerIndexForFrame: theFP WithSP: _gsSqueakTemp_theSP