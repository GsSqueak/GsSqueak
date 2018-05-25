*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqByteArray-platform independent access
unsignedLongAt: index bigEndian: bigEndian
	"Return a 32-bit unsigned integer quantity starting from the given byte index. Use #normalize where necessary to ensure compatibility with non-30-bit SmallIntegers."
	| byte |
	bigEndian ifTrue:
		[((byte := self at: index) <= 16r3F
		 or: [SmallInteger maxVal >  1073741823]) ifTrue:
			[^(((byte bitShift: 8) + (self at: index + 1) bitShift: 8) + (self at: index + 2) bitShift: 8) + (self at: index + 3)].
		^(LargePositiveInteger new: 4)
			digitAt: 1 put: (self at: index + 3);
			digitAt: 2 put: (self at: index + 2);
			digitAt: 3 put: (self at: index + 1);
			digitAt: 4 put: byte;
			normalize].
	((byte := self at: index + 3) <= 16r3F
	 or: [SmallInteger maxVal >  1073741823]) ifTrue:
		[^(((byte bitShift: 8) + (self at: index + 2) bitShift: 8) + (self at: index + 1) bitShift: 8) + (self at: index)].
	^(LargePositiveInteger new: 4)
		replaceFrom: 1 to: 4 with: self startingAt: index;
		normalize
