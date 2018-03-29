object access primitives
primitiveArrayBecomeOneWay
	"We must flush the method cache here, to eliminate stale references
	to mutated classes and/or selectors."
	| _gsSqueakTemp_arg _gsSqueakTemp_rcvr _gsSqueakTemp_ec |
	_gsSqueakTemp_arg := self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	_gsSqueakTemp_ec := objectMemory
				become: _gsSqueakTemp_rcvr
				with: _gsSqueakTemp_arg
				twoWay: false
				copyHash: true.
	_gsSqueakTemp_ec = PrimNoErr
		ifTrue: [self pop: 1]
		ifFalse: [self primitiveFailFor: _gsSqueakTemp_ec]