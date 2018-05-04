indexing primitives
primitiveContextSize
	| rcvr sz hdr fmt totalLength fixedFields |
	rcvr := self stackTop.
	hdr := objectMemory baseHeader: rcvr.
	fmt := objectMemory formatOfHeader: hdr.
	totalLength := objectMemory lengthOf: rcvr baseHeader: hdr format: fmt.
	fixedFields := objectMemory fixedFieldsOf: rcvr format: fmt length: totalLength.
	(self isContextHeader: hdr)
		ifTrue:
			[self externalWriteBackHeadFramePointers.
			sz := self stackPointerForMaybeMarriedContext: rcvr]
		ifFalse: [sz := totalLength - fixedFields].
	self successful ifTrue:
		[self pop: 1 thenPush: (objectMemory integerObjectOf: sz)]