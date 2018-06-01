primitive support
saneFunctionPointerForFailureOfPrimIndex: primIndex 
	| _gsSqueakTemp_basePrimitive |
	_gsSqueakTemp_basePrimitive := self functionPointerFor: primIndex inClass: objectMemory nilObject.
	^ primitiveFunctionPointer = _gsSqueakTemp_basePrimitive
		or: [(_gsSqueakTemp_basePrimitive = #primitiveExternalCall
					and: [self isPrimitiveFunctionPointerAnIndex not])
				or: [(self isMetaPrimitiveIndex: primIndex)
						and: [metaAccessorDepth > -2]]]