object access primitives
primitiveSetImmutability
	| _gsSqueakTemp_rcvr _gsSqueakTemp_wasImmutable |
	_gsSqueakTemp_rcvr := self stackValue: 1.
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	_gsSqueakTemp_wasImmutable := objectMemory isObjImmutable: _gsSqueakTemp_rcvr.
	self stackTop = objectMemory trueObject
		ifTrue: [(self canBeImmutable: _gsSqueakTemp_rcvr)
				ifFalse: [^ self primitiveFailFor: PrimErrInappropriate].
			objectMemory setIsImmutableOf: _gsSqueakTemp_rcvr to: true]
		ifFalse: [self stackTop = objectMemory falseObject
				ifTrue: [objectMemory setIsImmutableOf: _gsSqueakTemp_rcvr to: false]
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument]].
	self pop: argumentCount + 1 thenPushBool: _gsSqueakTemp_wasImmutable