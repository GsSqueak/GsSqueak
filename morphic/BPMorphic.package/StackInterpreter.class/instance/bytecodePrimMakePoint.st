common selector sends
bytecodePrimMakePoint
	"Inline primitiveMakePoint for the benefit of the interpreter.
	Externalizing the
	sp & fp, then internalizing and testign for primitive failure add much
	overhead. So simply inline the relatively small ammount of code
	directly. "
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg _gsSqueakTemp_pt |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_arg := self internalStackTop.
	((objectMemory isFloatOrInt: _gsSqueakTemp_rcvr)
			and: [objectMemory isFloatOrInt: _gsSqueakTemp_arg])
		ifTrue: [_gsSqueakTemp_pt := objectMemory
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
			self internalPop: 2 thenPush: _gsSqueakTemp_pt.
			^ self fetchNextBytecode"success"].
	messageSelector := self specialSelector: 11.
	argumentCount := 1.
	self normalSend