image save/restore
convertFloatsToPlatformOrderFrom: startOop to: stopAddr 
	"Byte-swap the words of all bytes objects in a range of the 
	 image, including Strings, ByteArrays, and CompiledMethods.
	 This returns these objects to their original byte ordering 
	 after blindly byte-swapping the entire image. For compiled 
	 methods, byte-swap only their bytecodes part.
	 Ensure floats are in platform-order."
	| oop temp |
	objectMemory vmEndianness = imageFloatsBigEndian ifTrue:
		[^self].
	self assert: ClassFloatCompactIndex ~= 0.
	oop := startOop.
	[self oop: oop isLessThan: stopAddr] whileTrue:
		[(objectMemory isFreeObject: oop) ifFalse:
			[(objectMemory compactClassIndexOf: oop) = ClassFloatCompactIndex ifTrue:
				[temp := self longAt: oop + objectMemory baseHeaderSize.
				 self longAt: oop + objectMemory baseHeaderSize put: (self longAt: oop + objectMemory baseHeaderSize + 4).
				 self longAt: oop + objectMemory baseHeaderSize + 4 put: temp]].
		 oop := objectMemory objectAfter: oop]