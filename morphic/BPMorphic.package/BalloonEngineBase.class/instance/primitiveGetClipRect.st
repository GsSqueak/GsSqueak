primitives-access
primitiveGetClipRect
	| _gsSqueakTemp_failureCode _gsSqueakTemp_rectOop _gsSqueakTemp_pointOop |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 1)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_rectOop := interpreterProxy stackObjectValue: 0.
	(interpreterProxy failed not
			and: [(interpreterProxy isPointers: _gsSqueakTemp_rectOop)
					and: [(interpreterProxy slotSizeOf: _gsSqueakTemp_rectOop)
							>= 2]])
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	interpreterProxy pushRemappableOop: _gsSqueakTemp_rectOop.
	_gsSqueakTemp_pointOop := interpreterProxy makePointwithxValue: self clipMinXGet yValue: self clipMinYGet.
	interpreterProxy
		storePointer: 0
		ofObject: interpreterProxy topRemappableOop
		withValue: _gsSqueakTemp_pointOop.
	_gsSqueakTemp_pointOop := interpreterProxy makePointwithxValue: self clipMaxXGet yValue: self clipMaxYGet.
	_gsSqueakTemp_rectOop := interpreterProxy popRemappableOop.
	interpreterProxy
		storePointer: 1
		ofObject: _gsSqueakTemp_rectOop
		withValue: _gsSqueakTemp_pointOop.
	interpreterProxy pop: 2 thenPush: _gsSqueakTemp_rectOop