primitive support
byteLengthOf: oop
	"Return the number of indexable bytes in the given object. This is basically a special copy of lengthOf: for BitBlt."
	| header sz fmt |
	header := self baseHeader: oop.
	(header bitAnd: TypeMask) = HeaderTypeSizeAndClass
		ifTrue: [ sz := (self sizeHeader: oop) bitAnd: self allButTypeMask ]
		ifFalse: [ sz := header bitAnd: self sizeMask ].
	fmt := (header >> 8) bitAnd: 16rF.
	fmt < 8
		ifTrue: [ ^ (sz - self baseHeaderSize)]  "words"
		ifFalse: [ ^ (sz - self baseHeaderSize) - (fmt bitAnd: 3)]  "bytes"