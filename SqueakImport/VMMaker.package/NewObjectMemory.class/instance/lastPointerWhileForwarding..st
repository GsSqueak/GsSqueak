gc -- compaction
lastPointerWhileForwarding: oop 
	"The given object may have its header word in a forwarding block. Find  
	 the offset of the last pointer in the object in spite of this obstacle."
	| header fmt size contextSize |
	<inline: true>
	header := self headerWhileForwardingOf: oop.
	fmt := self formatOfHeader: header.
	fmt <= 4 ifTrue:
		[(fmt = 3
		  and: [interpreter isContextHeader: header]) ifTrue:
			["contexts end at the stack pointer"
			 contextSize := self nacFetchStackPointerOf: oop.
			 self assert: ReceiverIndex + contextSize < (self lengthOf: oop baseHeader: header format: fmt).
			 ^CtxtTempFrameStart + contextSize * self bytesPerWord].
		 "do sizeBitsOf: using the header we obtained"
		 size := (header bitAnd: TypeMask) = HeaderTypeSizeAndClass
					ifTrue: [(self sizeHeader: oop) bitAnd: self allButTypeMask]
					ifFalse: [header bitAnd: self sizeMask].
		 ^size - self baseHeaderSize].
	fmt < 12 ifTrue: [^0]. "no pointers"

	"CompiledMethod: contains both pointers and bytes"
	^(coInterpreter literalCountOf: oop) * self bytesPerWord + self baseHeaderSize