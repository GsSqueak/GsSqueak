image save/restore
updateObjectsPostByteSwapFrom: startOop to: stopAddr 
	"Byte-swap the words of all bytes objects in a range of the 
	 image, including Strings, ByteArrays, and CompiledMethods.
	 This returns these objects to their original byte ordering 
	 after blindly byte-swapping the entire image. For compiled 
	 methods, byte-swap only their bytecodes part.
	 Ensure floats are in platform-order."
	| oop fmt wordAddr methodHeader swapFloatWords temp |
	swapFloatWords := objectMemory vmEndianness ~= imageFloatsBigEndian.
	self assert: ClassFloatCompactIndex ~= 0.
	oop := startOop.
	[self oop: oop isLessThan: stopAddr] whileTrue:
		[(objectMemory isFreeObject: oop) ifFalse:
			[fmt := objectMemory formatOf: oop.
			 fmt >= 8 ifTrue: "oop contains bytes"
				[wordAddr := oop + objectMemory baseHeaderSize.
				fmt >= 12 ifTrue: "compiled method; start after methodHeader and literals"
					[methodHeader := self longAt: oop + objectMemory baseHeaderSize.
					 wordAddr := wordAddr + objectMemory bytesPerWord + ((methodHeader >> 10 bitAnd: 255) * objectMemory bytesPerWord)].
				objectMemory reverseBytesFrom: wordAddr to: oop + (objectMemory sizeBitsOf: oop)].
			 fmt = 6 ifTrue: "Bitmap, Float etc"
				[(swapFloatWords
				  and: [(objectMemory compactClassIndexOf: oop) = ClassFloatCompactIndex])
					ifTrue:
						[temp := self longAt: oop + objectMemory baseHeaderSize.
						 self longAt: oop + objectMemory baseHeaderSize put: (self longAt: oop + objectMemory baseHeaderSize + 4).
						 self longAt: oop + objectMemory baseHeaderSize + 4 put: temp]
					ifFalse:
						[objectMemory bytesPerWord = 8 ifTrue: "Object contains 32-bit half-words packed into 64-bit machine words."
							[wordAddr := oop + objectMemory baseHeaderSize.
							 objectMemory reverseWordsFrom: wordAddr to: oop + (objectMemory sizeBitsOf: oop)]]]].
			oop := objectMemory objectAfter: oop]