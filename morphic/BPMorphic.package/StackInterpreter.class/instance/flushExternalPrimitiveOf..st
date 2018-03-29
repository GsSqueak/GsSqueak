plugin primitive support
flushExternalPrimitiveOf: methodObj 
	"methodObj is a CompiledMethod. If it contains an external primitive,
	flush the function address and session ID of the CM. Answer the prim
	index for the benefit of subclass overrides."
	| _gsSqueakTemp_header _gsSqueakTemp_primIdx _gsSqueakTemp_lit |
	_gsSqueakTemp_header := objectMemory methodHeaderOf: methodObj.
	_gsSqueakTemp_primIdx := self primitiveIndexOfMethod: methodObj header: _gsSqueakTemp_header.
	(_gsSqueakTemp_primIdx = PrimNumberExternalCall
			and: [(objectMemory literalCountOfMethodHeader: _gsSqueakTemp_header)
					> 0])
		ifTrue: ["If not, something's broken"
			_gsSqueakTemp_lit := self literal: 0 ofMethod: methodObj.
			((objectMemory isArray: _gsSqueakTemp_lit)
					and: [(objectMemory numSlotsOf: _gsSqueakTemp_lit)
							= 4])
				ifTrue: ["If not, something's broken"
					objectMemory
						storePointerUnchecked: 2
						ofObject: _gsSqueakTemp_lit
						withValue: ConstZero;
						
						storePointerUnchecked: 3
						ofObject: _gsSqueakTemp_lit
						withValue: ConstZero]].
	^ _gsSqueakTemp_primIdx