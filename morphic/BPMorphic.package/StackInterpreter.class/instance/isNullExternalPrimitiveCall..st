compiled methods
isNullExternalPrimitiveCall: aMethodObj 
	"Answer if the method is an external primtiive call (prim 117) with a
	null external primtiive.
	This is just for an assert in the CoInterpreter."
	| _gsSqueakTemp_lit |
	((self isExternalPrimitiveCall: aMethodObj)
			and: [(objectMemory literalCountOf: aMethodObj)
					> 0])
		ifFalse: [^ false].
	_gsSqueakTemp_lit := self literal: 0 ofMethod: aMethodObj.
	^ (objectMemory isArray: _gsSqueakTemp_lit)
		and: [(objectMemory numSlotsOf: _gsSqueakTemp_lit)
					= 4
				and: [(objectMemory fetchPointer: 3 ofObject: _gsSqueakTemp_lit)
							= ConstZero
						or: [(objectMemory fetchPointer: 3 ofObject: _gsSqueakTemp_lit)
								= ConstMinusOne]]]