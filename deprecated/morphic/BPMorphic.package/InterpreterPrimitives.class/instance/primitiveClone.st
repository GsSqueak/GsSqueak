object access primitives
primitiveClone
	"Return a shallow copy of the receiver."
	| _gsSqueakTemp_rcvr _gsSqueakTemp_newCopy |
	_gsSqueakTemp_rcvr := self stackTop.
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [_gsSqueakTemp_newCopy := _gsSqueakTemp_rcvr]
		ifFalse: [(argumentCount = 0
					or: [(objectMemory isForwarded: _gsSqueakTemp_rcvr) not])
				ifTrue: [_gsSqueakTemp_newCopy := objectMemory clone: _gsSqueakTemp_rcvr]
				ifFalse: [_gsSqueakTemp_newCopy := 0].
			_gsSqueakTemp_newCopy = 0
				ifTrue: ["not enough memory most likely"
					^ self primitiveFail]].
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_newCopy