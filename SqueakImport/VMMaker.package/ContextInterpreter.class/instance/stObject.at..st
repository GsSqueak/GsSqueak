array primitive support
stObject: array at: index
	"Return what ST would return for <obj> at: index."

	| hdr fmt totalLength fixedFields stSize |
	hdr := objectMemory baseHeader: array.
	fmt := (hdr >> 8) bitAnd: 16rF.
	totalLength := objectMemory lengthOf: array baseHeader: hdr format: fmt.
	fixedFields := objectMemory fixedFieldsOf: array format: fmt length: totalLength.
	(self shouldBoundAccessWithinStackFor: hdr withFormat: fmt)
		ifTrue: [stSize := self fetchStackPointerOf: array]
		ifFalse: [stSize := totalLength - fixedFields].
	((objectMemory oop: index isGreaterThanOrEqualTo: 1)
			and: [objectMemory oop: index isLessThanOrEqualTo: stSize])
		ifTrue: [^ self subscript: array with: (index + fixedFields) format: fmt]
		ifFalse: [self primitiveFail.  ^ 0].