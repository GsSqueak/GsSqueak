debug support
okayOop: signedOop
	"Verify that the given oop is legitimate. Check address, header, and size but not class."

	| sz type fmt unusedBit oop |
	<var: #oop type: 'usqInt'>
	oop := self cCoerce: signedOop to: 'usqInt'.

	"address and size checks"
	(self isIntegerObject: oop) ifTrue: [ ^true ].
	(oop < endOfMemory)
		ifFalse: [ self error: 'oop is not a valid address' ].
	((oop \\ self bytesPerWord) = 0)
		ifFalse: [ self error: 'oop is not a word-aligned address' ].
	sz := self sizeBitsOf: oop.
	(oop + sz) < endOfMemory
		ifFalse: [ self error: 'oop size would make it extend beyond the end of memory' ].

	"header type checks"
	type := self headerType: oop.
	type = HeaderTypeFree
		ifTrue:  [ self error: 'oop is a free chunk, not an object' ].
	type = HeaderTypeShort ifTrue: [
		(((self baseHeader: oop) >> 12) bitAnd: 16r1F) = 0
			ifTrue:  [ self error: 'cannot have zero compact class field in a short header' ].
	].
	type = HeaderTypeClass ifTrue: [
		((oop >= self bytesPerWord) and: [(self headerType: oop - self bytesPerWord) = type])
			ifFalse: [ self error: 'class header word has wrong type' ].
	].
	type = HeaderTypeSizeAndClass ifTrue: [
		((oop >= (self bytesPerWord * 2)) and:
		 [(self headerType: oop - (self bytesPerWord * 2)) = type and:
		 [(self headerType: oop - self bytesPerWord) = type]])
			ifFalse: [ self error: 'class header word has wrong type' ].
	].

	"format check"
	fmt := self formatOf: oop.
	((fmt = 5) | (fmt = 7))
		ifTrue:  [ self error: 'oop has an unknown format type' ].

	"mark and root bit checks"
	unusedBit := 16r20000000.
	self bytesPerWord = 8
		ifTrue:
			[unusedBit := unusedBit << 16.
			 unusedBit := unusedBit << 16].
	((self longAt: oop) bitAnd: unusedBit) = 0
		ifFalse: [ self error: 'unused header bit 30 is set; should be zero' ].
"xxx
	((self longAt: oop) bitAnd: MarkBit) = 0
		ifFalse: [ self error: 'mark bit should not be set except during GC' ].
xxx"
	(((self longAt: oop) bitAnd: self rootBit) = 1 and:
	 [oop >= youngStart])
		ifTrue: [ self error: 'root bit is set in a young object' ].
	^true
