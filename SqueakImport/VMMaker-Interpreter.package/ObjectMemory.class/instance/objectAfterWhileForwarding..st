gc -- compaction
objectAfterWhileForwarding: oop
	"Return the oop of the object after the given oop when the actual header of the oop may be in the forwarding table."

	| header fwdBlock realHeader sz |
	<inline: true>
	header := self longAt: oop.
	(header bitAnd: self markBit) = 0 ifTrue: [ ^ self objectAfter: oop ].  "oop not forwarded"

	"Assume: mark bit cannot be set on a free chunk, so if we get here,
	 oop is not free and it has a forwarding table entry"

	fwdBlock := (header bitAnd: self allButMarkBitAndTypeMask) << 1.
	DoAssertionChecks ifTrue: [ self fwdBlockValidate: fwdBlock ].
	realHeader := self longAt: fwdBlock + self bytesPerWord.
	"following code is like sizeBitsOf:"
	(realHeader bitAnd: TypeMask) = HeaderTypeSizeAndClass
		ifTrue: [ sz := (self sizeHeader: oop) bitAnd: self longSizeMask ]
		ifFalse: [ sz := realHeader bitAnd: self sizeMask ].

	^ self oopFromChunk: (oop + sz)