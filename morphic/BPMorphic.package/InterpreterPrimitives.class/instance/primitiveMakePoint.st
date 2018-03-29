arithmetic integer primitives
primitiveMakePoint
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg _gsSqueakTemp_pt |
	_gsSqueakTemp_rcvr := self stackValue: 1.
	_gsSqueakTemp_arg := self stackTop.
	(objectMemory isFloatOrInt: _gsSqueakTemp_arg)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_pt := objectMemory
				eeInstantiateSmallClass: (objectMemory splObj: ClassPoint)
				numSlots: YIndex + 1.
	objectMemory
		storePointerUnchecked: XIndex
		ofObject: _gsSqueakTemp_pt
		withValue: _gsSqueakTemp_rcvr;
		
		storePointerUnchecked: YIndex
		ofObject: _gsSqueakTemp_pt
		withValue: _gsSqueakTemp_arg.
	"No need to check since new object is always new."
	self pop: 2 thenPush: _gsSqueakTemp_pt