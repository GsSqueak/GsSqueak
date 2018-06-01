object access primitives
primitiveIdentical
	"is the receiver/first argument the same object as the (last)
	argument?. pop argumentCount because this can be used as a mirror
	primitive. "
	| _gsSqueakTemp_thisObject _gsSqueakTemp_otherObject |
	_gsSqueakTemp_otherObject := self stackValue: 1.
	_gsSqueakTemp_thisObject := self stackTop.
	((objectMemory isOopForwarded: _gsSqueakTemp_otherObject)
			or: [argumentCount > 1
					and: [objectMemory isOopForwarded: _gsSqueakTemp_thisObject]])
		ifTrue: [self primitiveFailFor: PrimErrBadArgument]
		ifFalse: [self pop: argumentCount + 1 thenPushBool: _gsSqueakTemp_thisObject = _gsSqueakTemp_otherObject]