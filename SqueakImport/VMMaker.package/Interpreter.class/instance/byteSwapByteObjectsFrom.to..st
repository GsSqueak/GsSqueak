utilities
byteSwapByteObjectsFrom: startOop to: stopAddr 
	"Byte-swap the words of all bytes objects in a range of the 
	image, including Strings, ByteArrays, and CompiledMethods. 
	This returns these objects to their original byte ordering 
	after blindly byte-swapping the entire image. For compiled 
	methods, byte-swap only their bytecodes part."
	| oop fmt wordAddr methodHeader |
	oop := startOop.
	[objectMemory oop: oop isLessThan: stopAddr]
		whileTrue: [(objectMemory isFreeObject: oop)
				ifFalse: [fmt := objectMemory formatOf: oop.
					fmt >= 8
						ifTrue: ["oop contains bytes"
							wordAddr := oop + objectMemory baseHeaderSize.
							fmt >= 12
								ifTrue: ["compiled method; start after methodHeader and literals"
									methodHeader := objectMemory longAt: oop + objectMemory baseHeaderSize.
									wordAddr := wordAddr + objectMemory bytesPerWord + ((methodHeader >> 10 bitAnd: 255) * objectMemory bytesPerWord)].
							objectMemory reverseBytesFrom: wordAddr to: oop + (objectMemory sizeBitsOf: oop)].
					(fmt = 6 and: [objectMemory bytesPerWord = 8])
						ifTrue: ["Object contains 32-bit half-words packed into 64-bit machine words."
							wordAddr := oop + objectMemory baseHeaderSize.
							objectMemory reverseWordsFrom: wordAddr to: oop + (objectMemory sizeBitsOf: oop)]].
			oop := objectMemory objectAfter: oop]