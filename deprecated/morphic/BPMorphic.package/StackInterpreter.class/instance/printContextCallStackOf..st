debug printing
printContextCallStackOf: aContext 
	"Print the call stack of aContext until it links to a frame."
	| _gsSqueakTemp_ctxt |
	_gsSqueakTemp_ctxt := aContext.
	[_gsSqueakTemp_ctxt = objectMemory nilObject
		or: [self isMarriedOrWidowedContext: _gsSqueakTemp_ctxt]]
		whileFalse: [self shortPrintContext: _gsSqueakTemp_ctxt.
			_gsSqueakTemp_ctxt := objectMemory fetchPointer: SenderIndex ofObject: _gsSqueakTemp_ctxt].
	^ _gsSqueakTemp_ctxt