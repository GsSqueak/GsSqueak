primitives-access
primitiveGetOffset
	| _gsSqueakTemp_failureCode _gsSqueakTemp_pointOop |
	interpreterProxy methodArgumentCount = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 0)) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	_gsSqueakTemp_pointOop := interpreterProxy makePointwithxValue: self destOffsetXGet yValue: self destOffsetYGet.
	interpreterProxy pop: 1 thenPush: _gsSqueakTemp_pointOop