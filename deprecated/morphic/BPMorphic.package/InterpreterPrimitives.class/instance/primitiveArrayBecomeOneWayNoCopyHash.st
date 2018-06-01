object access primitives
primitiveArrayBecomeOneWayNoCopyHash
	"Similar to primitiveArrayBecomeOneWay but does /not/ copy the
	receiver's elements identity hashes over the argument's elements
	identity hashes."
	| _gsSqueakTemp_arg _gsSqueakTemp_rcvr _gsSqueakTemp_ec |
	_gsSqueakTemp_arg := self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	_gsSqueakTemp_ec := objectMemory
				become: _gsSqueakTemp_rcvr
				with: _gsSqueakTemp_arg
				twoWay: false
				copyHash: false.
	_gsSqueakTemp_ec = PrimNoErr
		ifTrue: [self pop: 1]
		ifFalse: [self primitiveFailFor: _gsSqueakTemp_ec]