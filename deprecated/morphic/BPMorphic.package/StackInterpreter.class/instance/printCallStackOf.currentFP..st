debug printing
printCallStackOf: aContext currentFP: currFP 
	| _gsSqueakTemp_ctxt _gsSqueakTemp_theFP _gsSqueakTemp_thePage |
	_gsSqueakTemp_ctxt := aContext.
	[_gsSqueakTemp_ctxt = objectMemory nilObject]
		whileFalse: [(self isMarriedOrWidowedContext: _gsSqueakTemp_ctxt)
				ifTrue: [_gsSqueakTemp_theFP := self frameOfMarriedContext: _gsSqueakTemp_ctxt.
					(self checkIsStillMarriedContext: _gsSqueakTemp_ctxt currentFP: currFP)
						ifTrue: [_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
							(stackPages isFree: _gsSqueakTemp_thePage)
								ifTrue: [self printHexPtr: _gsSqueakTemp_theFP;
										 print: ' is on a free page?!';
										 cr.
									^ nil].
							self shortPrintFrameAndCallers: _gsSqueakTemp_theFP.
							_gsSqueakTemp_theFP := _gsSqueakTemp_thePage baseFP.
							_gsSqueakTemp_ctxt := self frameCallerContext: _gsSqueakTemp_theFP.
							(objectMemory isForwarded: _gsSqueakTemp_ctxt)
								ifTrue: [_gsSqueakTemp_ctxt := objectMemory followForwarded: _gsSqueakTemp_ctxt]]
						ifFalse: [self print: 'widowed caller frame ';
								 printHexPtr: _gsSqueakTemp_theFP;
								 cr.
							^ nil]]
				ifFalse: [self shortPrintContext: _gsSqueakTemp_ctxt.
					_gsSqueakTemp_ctxt := objectMemory fetchPointer: SenderIndex ofObject: _gsSqueakTemp_ctxt]]