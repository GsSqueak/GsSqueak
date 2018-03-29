debug printing
printFrame: theFP WithSP: theSP 
	| _gsSqueakTemp_theMethod _gsSqueakTemp_numArgs _gsSqueakTemp_topThing |
	self
		cCode: ''
		inSmalltalk: [self transcript ensureCr].
	(stackPages couldBeFramePointer: theFP)
		ifFalse: [self printHexPtr: theFP;
				 print: ' is not in the stack zone?!';
				 cr.
			^ nil].
	_gsSqueakTemp_theMethod := self frameMethod: theFP.
	_gsSqueakTemp_numArgs := self frameNumArgs: theFP.
	self shortPrintFrame: theFP.
	self printFrameOop: 'rcvr/clsr' at: theFP + FoxCallerSavedIP + (_gsSqueakTemp_numArgs + 1 * objectMemory wordSize).
	_gsSqueakTemp_numArgs
		to: 1
		by: -1
		do: [:i | self printFrameOop: 'arg' at: theFP + FoxCallerSavedIP + (i * objectMemory wordSize)].
	self printFrameThing: 'cllr ip/ctxt' at: theFP + FoxCallerSavedIP.
	self printFrameThing: 'saved fp' at: theFP + FoxSavedFP.
	self printFrameOop: 'method' at: theFP + FoxMethod.
	self printFrameFlagsForFP: theFP.
	self printFrameThing: 'context' at: theFP + FoxThisContext.
	self printFrameOop: 'receiver' at: theFP + FoxReceiver.
	_gsSqueakTemp_topThing := stackPages longAt: theSP.
	(_gsSqueakTemp_topThing >= _gsSqueakTemp_theMethod
			and: [_gsSqueakTemp_topThing <= (_gsSqueakTemp_theMethod
						+ (objectMemory sizeBitsOfSafe: _gsSqueakTemp_theMethod))])
		ifTrue: [theFP + FoxReceiver - objectMemory wordSize
				to: theSP + objectMemory wordSize
				by: objectMemory wordSize negated
				do: [:addr | self printFrameOop: 'temp/stck' at: addr].
			self printFrameThing: 'frame ip' at: theSP]
		ifFalse: [theFP + FoxReceiver - objectMemory wordSize
				to: theSP
				by: objectMemory wordSize negated
				do: [:addr | self printFrameOop: 'temp/stck' at: addr]]