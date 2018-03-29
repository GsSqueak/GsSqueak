primitive support
checkForAndFollowForwardedPrimitiveState
	"In Spur a primitive may fail due to encountering a forwarder. On
	failure, check the accessorDepth for the primitive and if non-negative
	scan the
	args to the depth, following any forwarders. Answer if any are found
	so the prim can be retried. The primitive index is derived from
	newMethod. "
	| _gsSqueakTemp_primIndex _gsSqueakTemp_accessorDepth _gsSqueakTemp_found _gsSqueakTemp_scannedStackFrame |
	self assert: self failed.
	_gsSqueakTemp_found := _gsSqueakTemp_scannedStackFrame := false.
	_gsSqueakTemp_primIndex := self primitiveIndexOf: newMethod.
	self
		assert: (argumentCount
					= (self argumentCountOf: newMethod)
				or: [self isMetaPrimitiveIndex: _gsSqueakTemp_primIndex]).
	"If the primitive is one of the meta primitives PrimNumberDoPrimitive
	or PrimNumberDoExternalCall, then metaAccessorDepth will have
	been set
	to nil at the start of the primitive, and to the accessor depth of the
	called primitive (or external call) immediately before dispatch. Hence
	if primIndex
	is that of a meta primiitve then if metaAccessorDepth is -2, the
	accessor depth is that of the meta primitive, and if > -2, then
	metaAccessorDepth is
	the accessor depth of the primitive (or external call). SImilarly, if the
	primitive is primitiveExternalCall then the accessor depth is that of
	primitiveExternalCall until primitiveFunctionPointer is assigned, at
	which point the accessor depth is taken from the slot in newMethod's
	first literal."
	_gsSqueakTemp_accessorDepth := ((self isMetaPrimitiveIndex: _gsSqueakTemp_primIndex)
					and: [metaAccessorDepth > -2])
				ifTrue: [metaAccessorDepth]
				ifFalse: [(_gsSqueakTemp_primIndex = PrimNumberExternalCall
							and: [primitiveFunctionPointer ~~ #primitiveExternalCall])
						ifTrue: [self primitiveAccessorDepthForExternalPrimitiveMethod: newMethod]
						ifFalse: [primitiveAccessorDepthTable at: _gsSqueakTemp_primIndex]].
	self
		assert: (self saneFunctionPointerForFailureOfPrimIndex: _gsSqueakTemp_primIndex).
	self
		assert: (_gsSqueakTemp_accessorDepth between: -1 and: 4).
	_gsSqueakTemp_accessorDepth >= 0
		ifTrue: [0
				to: argumentCount
				do: [:index | 
					| oop |
					oop := self stackValue: index.
					(objectMemory isNonImmediate: oop)
						ifTrue: [(objectMemory isForwarded: oop)
								ifTrue: [self assert: index < argumentCount.
									"receiver should have been caught at
									send time."
									_gsSqueakTemp_found := true.
									oop := objectMemory followForwarded: oop.
									self stackValue: index put: oop.
									_gsSqueakTemp_scannedStackFrame
										ifFalse: [_gsSqueakTemp_scannedStackFrame := true.
											self followForwardedFrameContents: framePointer stackPointer: stackPointer + (argumentCount + 1 * objectMemory wordSize)
											"don't repeat effort"]].
							(_gsSqueakTemp_accessorDepth > 0
									and: [(objectMemory hasPointerFields: oop)
											and: [objectMemory followForwardedObjectFields: oop toDepth: _gsSqueakTemp_accessorDepth]])
								ifTrue: [_gsSqueakTemp_found := true]]]].
	^ _gsSqueakTemp_found