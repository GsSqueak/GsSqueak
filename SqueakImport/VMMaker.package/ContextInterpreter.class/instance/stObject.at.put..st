array primitive support
stObject: array at: index put: value
	"Do what ST would return for <obj> at: index put: value."

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
		ifTrue: [self subscript: array with: (index + fixedFields) storing: value format: fmt]
		ifFalse: [self primitiveFail]