debug printing
printCallStackFP: theFP 
	| _gsSqueakTemp_context |
	_gsSqueakTemp_context := self shortReversePrintFrameAndCallers: theFP.
	[_gsSqueakTemp_context = objectMemory nilObject]
		whileFalse: [(self isMarriedOrWidowedContext: _gsSqueakTemp_context)
				ifTrue: [(self checkIsStillMarriedContext: _gsSqueakTemp_context currentFP: framePointer)
						ifFalse: [self shortPrintContext: _gsSqueakTemp_context.
							^ nil].
					_gsSqueakTemp_context := self
								shortReversePrintFrameAndCallers: (self frameOfMarriedContext: _gsSqueakTemp_context)]
				ifFalse: [_gsSqueakTemp_context := self printContextCallStackOf: _gsSqueakTemp_context]]