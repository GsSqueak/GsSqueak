arithmetic float primitives
primitiveSmallFloatTruncated
	| _gsSqueakTemp_rcvr _gsSqueakTemp_trunc |
	_gsSqueakTemp_rcvr := objectMemory smallFloatValueOf: self stackTop.
	self
		cCode: [self
				mod: _gsSqueakTemp_rcvr
				f: (self addressOf: _gsSqueakTemp_trunc)]
		inSmalltalk: [_gsSqueakTemp_trunc := _gsSqueakTemp_rcvr truncated].
	(_gsSqueakTemp_trunc between: objectMemory minSmallInteger asFloat and: objectMemory maxSmallInteger asFloat)
		ifTrue: [self
				stackTopPut: (objectMemory integerObjectOf: _gsSqueakTemp_trunc asInteger)]
		ifFalse: [self primitiveFail]