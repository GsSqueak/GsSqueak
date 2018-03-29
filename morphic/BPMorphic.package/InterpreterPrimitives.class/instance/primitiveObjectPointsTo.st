object access primitives
primitiveObjectPointsTo
	| _gsSqueakTemp_rcvr _gsSqueakTemp_thang _gsSqueakTemp_lastField |
	_gsSqueakTemp_thang := self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	(objectMemory isIntegerObject: _gsSqueakTemp_rcvr)
		ifTrue: [^ self pop: 2 thenPushBool: false].
	_gsSqueakTemp_lastField := self lastPointerOf: _gsSqueakTemp_rcvr.
	objectMemory baseHeaderSize
		to: _gsSqueakTemp_lastField
		by: objectMemory bytesPerOop
		do: [:i | (objectMemory longAt: _gsSqueakTemp_rcvr + i)
					= _gsSqueakTemp_thang
				ifTrue: [^ self pop: 2 thenPushBool: true]].
	self pop: 2 thenPushBool: false