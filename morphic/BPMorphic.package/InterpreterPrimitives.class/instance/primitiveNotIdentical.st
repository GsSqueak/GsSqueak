object access primitives
primitiveNotIdentical
	"is the receiver/first argument not the same object as the (last)
	argument?. pop argumentCount because this can be used as a mirror
	primitive. "
	| _gsSqueakTemp_thisObject _gsSqueakTemp_otherObject |
	_gsSqueakTemp_otherObject := self stackValue: 1.
	_gsSqueakTemp_thisObject := self stackTop.
	(objectMemory isOopForwarded: _gsSqueakTemp_otherObject)
		ifTrue: [self assert: argumentCount > 1.
			_gsSqueakTemp_otherObject := objectMemory followForwarded: _gsSqueakTemp_thisObject].
	(objectMemory isOopForwarded: _gsSqueakTemp_thisObject)
		ifTrue: [_gsSqueakTemp_thisObject := objectMemory followForwarded: _gsSqueakTemp_thisObject].
	self pop: argumentCount + 1 thenPushBool: _gsSqueakTemp_thisObject ~= _gsSqueakTemp_otherObject