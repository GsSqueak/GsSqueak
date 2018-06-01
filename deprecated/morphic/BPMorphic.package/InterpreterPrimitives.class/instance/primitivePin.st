memory space primitives
primitivePin
	"Pin or unpin the receiver, i.e. make it immobile or mobile, based on
	the argument.
	Answer whether the object was already pinned. N.B. pinning does
	*not* prevent
	an object from being garbage collected."
	| _gsSqueakTemp_obj _gsSqueakTemp_boolean _gsSqueakTemp_wasPinned |
	_gsSqueakTemp_obj := self stackValue: 1.
	((objectMemory isImmediate: _gsSqueakTemp_obj)
			or: [objectMemory isForwarded: _gsSqueakTemp_obj])
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	_gsSqueakTemp_boolean := self stackTop.
	(_gsSqueakTemp_boolean = objectMemory falseObject
			or: [_gsSqueakTemp_boolean = objectMemory trueObject])
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory isPinned: _gsSqueakTemp_obj)
		ifTrue: [_gsSqueakTemp_wasPinned := objectMemory trueObject.
			_gsSqueakTemp_boolean ~= _gsSqueakTemp_wasPinned
				ifTrue: [objectMemory setIsPinnedOf: _gsSqueakTemp_obj to: false]]
		ifFalse: [_gsSqueakTemp_wasPinned := objectMemory falseObject.
			(_gsSqueakTemp_boolean ~= _gsSqueakTemp_wasPinned
					and: [(objectMemory pinObject: _gsSqueakTemp_obj)
							= 0])
				ifTrue: [^ self primitiveFailFor: PrimErrNoMemory]].
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_wasPinned