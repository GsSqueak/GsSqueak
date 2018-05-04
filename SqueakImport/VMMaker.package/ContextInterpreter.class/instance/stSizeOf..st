array primitive support
stSizeOf: oop
	"Return the number of indexable fields in the given object. (i.e., what Smalltalk would return for <obj> size)."
	"Note: Assume oop is not a SmallInteger!"

	| hdr fmt totalLength fixedFields |
	hdr := objectMemory baseHeader: oop.
	fmt := (hdr >> 8) bitAnd: 16rF.
	totalLength := objectMemory lengthOf: oop baseHeader: hdr format: fmt.
	fixedFields := objectMemory fixedFieldsOf: oop format: fmt length: totalLength.
	(self shouldBoundAccessWithinStackFor: hdr withFormat: fmt)
		ifTrue: [^ self fetchStackPointerOf: oop]
		ifFalse: [^ totalLength - fixedFields]