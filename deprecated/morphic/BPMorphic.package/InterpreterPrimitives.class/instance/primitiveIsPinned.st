memory space primitives
primitiveIsPinned
	"Answer if the receiver is pinned, i.e. immobile."
	| _gsSqueakTemp_obj |
	_gsSqueakTemp_obj := self stackTop.
	((objectMemory isImmediate: _gsSqueakTemp_obj)
			or: [objectMemory isForwarded: _gsSqueakTemp_obj])
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	self
		pop: argumentCount + 1
		thenPushBool: (objectMemory isPinned: _gsSqueakTemp_obj)