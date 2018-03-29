indexing primitives
primitiveFloatAtPut
	"Provide platform-independent access to 32-bit words comprising
	a Float. Map index 1 onto the most significant word and index 2
	onto the least significant word."
	| _gsSqueakTemp_rcvr _gsSqueakTemp_index _gsSqueakTemp_oopToStore _gsSqueakTemp_valueToStore |
	_gsSqueakTemp_oopToStore := self stackTop.
	_gsSqueakTemp_valueToStore := self positive32BitValueOf: _gsSqueakTemp_oopToStore.
	self successful
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_rcvr := self stackValue: 2.
	_gsSqueakTemp_index := self stackValue: 1.
	(objectMemory isImmediateFloat: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	(objectMemory isObjImmutable: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_index = ConstOne
		ifTrue: [objectMemory
				storeLong32: (VMBIGENDIAN
						ifTrue: [0]
						ifFalse: [1])
				ofObject: _gsSqueakTemp_rcvr
				withValue: _gsSqueakTemp_valueToStore.
			^ self pop: 3 thenPush: _gsSqueakTemp_oopToStore].
	_gsSqueakTemp_index = ConstTwo
		ifTrue: [objectMemory
				storeLong32: (VMBIGENDIAN
						ifTrue: [1]
						ifFalse: [0])
				ofObject: _gsSqueakTemp_rcvr
				withValue: _gsSqueakTemp_valueToStore.
			^ self pop: 3 thenPush: _gsSqueakTemp_oopToStore].
	self
		primitiveFailFor: ((objectMemory isIntegerObject: _gsSqueakTemp_index)
				ifTrue: [PrimErrBadIndex]
				ifFalse: [PrimErrBadArgument])