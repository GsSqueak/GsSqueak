gc -- compaction
lastPointerWhileForwarding: oop 
	"The given object may have its header word in a forwarding block. Find  
	the offset of the last pointer in the object in spite of this obstacle. "
	| header fwdBlock fmt size methodHeader contextSize |
	<inline: true>
	header := self longAt: oop.
	(header bitAnd: self markBit) ~= 0
		ifTrue: ["oop is forwarded; get its real header from its forwarding table entry"
			fwdBlock := (header bitAnd: self allButMarkBitAndTypeMask) << 1.
			DoAssertionChecks
				ifTrue: [self fwdBlockValidate: fwdBlock].
			header := self longAt: fwdBlock + self bytesPerWord].
	fmt := header >> 8 bitAnd: 15.
	fmt <= 4
		ifTrue: [(fmt = 3 and: [interpreter isContextHeader: header])
				ifTrue: ["contexts end at the stack pointer"
					contextSize := interpreter fetchStackPointerOf: oop.
					^ CtxtTempFrameStart + contextSize * self bytesPerWord].
			"do sizeBitsOf: using the header we obtained"
			(header bitAnd: TypeMask) = HeaderTypeSizeAndClass
				ifTrue: [size := (self sizeHeader: oop) bitAnd: self allButTypeMask]
				ifFalse: [size := header bitAnd: self sizeMask].
			^ size - self baseHeaderSize].
	fmt < 12 ifTrue: [^ 0]. "no pointers"
	methodHeader := self longAt: oop + self baseHeaderSize.
	^ (methodHeader >> 10 bitAnd: 255) * self bytesPerWord + self baseHeaderSize