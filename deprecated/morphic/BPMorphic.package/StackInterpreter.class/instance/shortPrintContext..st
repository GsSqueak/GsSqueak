debug printing
shortPrintContext: aContext 
	| _gsSqueakTemp_theFP |
	(objectMemory isContext: aContext)
		ifFalse: [self printHex: aContext;
				 print: ' is not a context';
				 cr.
			^ nil].
	self printHex: aContext.
	(self isMarriedOrWidowedContext: aContext)
		ifTrue: [(self checkIsStillMarriedContext: aContext currentFP: framePointer)
				ifTrue: [_gsSqueakTemp_theFP := self frameOfMarriedContext: aContext.
					(self isMachineCodeFrame: _gsSqueakTemp_theFP)
						ifTrue: [self print: ' M (']
						ifFalse: [self print: ' I ('].
					self printHex: _gsSqueakTemp_theFP asUnsignedIntegerPtr;
						 print: ') ']
				ifFalse: [self print: ' w ']]
		ifFalse: [self print: ' s '].
	(self findHomeForContext: aContext)
		ifNil: [self print: ' BOGUS CONTEXT (can''t determine home)']
		ifNotNil: [:home | self
				printActivationNameFor: (objectMemory
						fetchPointer: MethodIndex
						ofObject: (home
								ifNil: [aContext]))
				receiver: (home
						ifNil: [objectMemory nilObject]
						ifNotNil: [objectMemory fetchPointer: ReceiverIndex ofObject: home])
				isBlock: home ~= aContext
				firstTemporary: (objectMemory fetchPointer: 0 + CtxtTempFrameStart ofObject: home)].
	self cr