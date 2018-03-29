object access primitives
primitiveCopyObject
	"Primitive. Copy the state of the receiver from the argument. 
	Fail if receiver and argument are of a different class.
	Fail if the receiver or argument are contexts (because of
	context-to-stack mapping).
	Fail if receiver and argument have different lengths (for indexable
	objects). Fail if the objects are not in a fit state to be copied (e.g.
	married contexts and Cogged methods)"
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg _gsSqueakTemp_length |
	self methodArgumentCount >= 1
		ifFalse: [^ self primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_arg := self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	(objectMemory isImmediate: _gsSqueakTemp_arg)
		ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory fetchClassTagOfNonImm: _gsSqueakTemp_rcvr)
			~= (objectMemory fetchClassTagOfNonImm: _gsSqueakTemp_arg)
		ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory isWordsOrBytesNonImm: _gsSqueakTemp_rcvr)
		ifTrue: [_gsSqueakTemp_length := objectMemory numBytesOf: _gsSqueakTemp_rcvr.
			((objectMemory formatOf: _gsSqueakTemp_rcvr)
						= (objectMemory formatOf: _gsSqueakTemp_arg)
					and: [_gsSqueakTemp_length
							= (objectMemory numBytesOf: _gsSqueakTemp_arg)])
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
			self
				mem: (_gsSqueakTemp_rcvr + objectMemory baseHeaderSize) asVoidPointer
				cp: (_gsSqueakTemp_arg + objectMemory baseHeaderSize) asVoidPointer
				y: _gsSqueakTemp_length]
		ifFalse: [(self isAppropriateForCopyObject: _gsSqueakTemp_rcvr)
				ifFalse: [^ self primitiveFailFor: PrimErrBadReceiver].
			_gsSqueakTemp_length := objectMemory numSlotsOf: _gsSqueakTemp_rcvr.
			((self isAppropriateForCopyObject: _gsSqueakTemp_arg)
					and: [_gsSqueakTemp_length
							= (objectMemory lengthOf: _gsSqueakTemp_arg)])
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
			0
				to: _gsSqueakTemp_length - 1
				do: [:i | objectMemory
						storePointer: i
						ofObject: _gsSqueakTemp_rcvr
						withValue: (objectMemory fetchPointer: i ofObject: _gsSqueakTemp_arg)]].
	"Note: The above could be faster for young receivers but I don't think
	it'll matter"
	self pop: self methodArgumentCount
	"pop arg; answer receiver"