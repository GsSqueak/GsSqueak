object access primitives
primitiveArrayBecomeOneWayCopyHash
	"Similar to primitiveArrayBecomeOneWay but accepts a third
	argument deciding whether to
	copy the receiver's elements identity hashes over the argument's
	elements identity hashes."
	| _gsSqueakTemp_copyHashFlag _gsSqueakTemp_ec |
	self stackTop = objectMemory trueObject
		ifTrue: [_gsSqueakTemp_copyHashFlag := true]
		ifFalse: [self stackTop = objectMemory falseObject
				ifTrue: [_gsSqueakTemp_copyHashFlag := false]
				ifFalse: [self primitiveFailFor: PrimErrBadArgument.
					^ nil]].
	_gsSqueakTemp_ec := objectMemory
				become: (self stackValue: 2)
				with: (self stackValue: 1)
				twoWay: false
				copyHash: _gsSqueakTemp_copyHashFlag.
	_gsSqueakTemp_ec = PrimNoErr
		ifTrue: [self pop: argumentCount]
		ifFalse: [self primitiveFailFor: _gsSqueakTemp_ec]