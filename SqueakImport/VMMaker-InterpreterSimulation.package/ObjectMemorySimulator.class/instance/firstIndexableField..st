memory access
firstIndexableField: oop
	"NOTE: overridden from Interpreter to add coercion to CArray"

	| hdr fmt totalLength fixedFields |
	self returnTypeC: 'void *'.
	hdr := self baseHeader: oop.
	fmt := (hdr >> 8) bitAnd: 16rF.
	totalLength := self lengthOf: oop baseHeader: hdr format: fmt.
	fixedFields := self fixedFieldsOf: oop format: fmt length: totalLength.
	fmt < 8 ifTrue:
		[fmt = 6 ifTrue:
			["32 bit field objects"
			^ self cCoerce: (self pointerForOop: oop + self baseHeaderSize + (fixedFields << 2)) to: 'int *'].
		"full word objects (pointer or bits)"
		^ self cCoerce: (self pointerForOop: oop + self baseHeaderSize + (fixedFields << self shiftForWord)) to: 'oop *']
		ifFalse:
		["Byte objects"
		^ self cCoerce: (self pointerForOop: oop + self baseHeaderSize + fixedFields) to: 'char *']