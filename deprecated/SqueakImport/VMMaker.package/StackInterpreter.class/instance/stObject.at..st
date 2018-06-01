indexing primitive support
stObject: array at: index
	"Return what ST would return for <obj> at: index."

	| hdr fmt totalLength fixedFields stSize |
	<inline: false>
	hdr := objectMemory baseHeader: array.
	fmt := objectMemory formatOfHeader: hdr.
	totalLength := objectMemory lengthOf: array baseHeader: hdr format: fmt.
	fixedFields := objectMemory fixedFieldsOf: array format: fmt length: totalLength.
	fmt = 3 ifTrue: [self assert: (self isContextHeader: hdr) not].
	stSize := totalLength - fixedFields.
	((self oop: index isGreaterThanOrEqualTo: 1)
	 and: [self oop: index isLessThanOrEqualTo: stSize])
		ifTrue: [^self subscript: array with: (index + fixedFields) format: fmt]
		ifFalse: [self primitiveFailFor: PrimErrBadIndex.  ^ 0]