object access
numBytesOfBytes: objOop 
	"Answer the number of indexable bytes in the given non-immediate byte-indexable object."
	<api>
	| header sz fmt |
	header := self baseHeader: objOop.
	sz := (header bitAnd: TypeMask) = HeaderTypeSizeAndClass
			ifTrue: [(self sizeHeader: objOop) bitAnd: self allButTypeMask]
			ifFalse: [header bitAnd: self sizeMask].
	fmt := self formatOfHeader: header.
	self assert: fmt >= self firstByteFormat.
	^(sz - self baseHeaderSize) - (fmt bitAnd: 3)