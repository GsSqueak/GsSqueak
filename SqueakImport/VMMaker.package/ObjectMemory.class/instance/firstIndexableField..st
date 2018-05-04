plugin support
firstIndexableField: oop
	"NOTE: copied in InterpreterSimulator, so please duplicate any changes"

	| hdr fmt totalLength fixedFields |
	<returnTypeC: 'char *'>
	hdr := self baseHeader: oop.
	fmt := (hdr >> 8) bitAnd: 16rF.
	totalLength := self lengthOf: oop baseHeader: hdr format: fmt.
	fixedFields := self fixedFieldsOf: oop format: fmt length: totalLength.
	fmt < 8 ifTrue:
		[fmt = 6 ifTrue:
			["32 bit field objects"
			^ self pointerForOop: oop + self baseHeaderSize + (fixedFields << 2)].
		"full word objects (pointer or bits)"
		^ self pointerForOop: oop + self baseHeaderSize + (fixedFields << self shiftForWord)]
	ifFalse:
		["Byte objects"
		^ self pointerForOop: oop + self baseHeaderSize + fixedFields]