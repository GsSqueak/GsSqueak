image segment in/out
loadImageSegmentFrom: segmentWordArray outPointers: outPointerArray
	"This primitive is called from Squeak as...
		<imageSegment> loadSegmentFrom: aWordArray outPointers: anArray."

"This primitive will load a binary image segment created by primitiveStoreImageSegment.  It expects the outPointer array to be of the proper size, and the wordArray to be well formed.  It will return as its value the original array of roots, and the erstwhile segmentWordArray will have been truncated to a size of zero.  If this primitive should fail, the segmentWordArray will, sadly, have been reduced to an unrecognizable and unusable jumble.  But what more could you have done with it anyway?"

	| endSeg segOop fieldPtr fieldOop doingClass lastPtr extraSize mapOop lastOut outPtr hdrTypeBits header data |
	<inline: false>
	<var: #endSeg type: #usqInt>
	<var: #segOop type: #usqInt>
	<var: #fieldPtr type: #usqInt>
	<var: #lastOut type: #usqInt>
	<var: #outPtr type: #usqInt>
	<var: #lastPtr type: #usqInt>

	DoAssertionChecks ifTrue: [self verifyCleanHeaders].
	lastOut := outPointerArray + (self lastPointerOf: outPointerArray).
	endSeg := segmentWordArray + (self sizeBitsOf: segmentWordArray) - self baseHeaderSize.

	"Version check.  Byte order of the WordArray now"
	data := self longAt: segmentWordArray + self baseHeaderSize.
	(self readableFormat: (data bitAnd: 16rFFFF "low 2 bytes")) ifFalse:
		"Not readable -- try again with reversed bytes..."
		[self reverseBytesFrom: segmentWordArray + self baseHeaderSize to: endSeg + self bytesPerWord.
		data := self longAt: segmentWordArray + self baseHeaderSize.
		(self readableFormat: (data bitAnd: 16rFFFF "low 2 bytes")) ifFalse:
			"Still NG -- put things back and fail"
			[self reverseBytesFrom: segmentWordArray + self baseHeaderSize to: endSeg + self bytesPerWord.
			DoAssertionChecks ifTrue: [self verifyCleanHeaders].
			^0]].
	"Reverse the Byte type objects if the data is from opposite endian machine.
	 Revese the words in Floats if from an earlier version with different Float order.
	 Test top byte.  $d on the Mac or $s on the PC.  Rest of word is equal."
	(data >> 16) = (self imageSegmentVersion >> 16)
		ifTrue:
			"Need to swap floats if the segment is being loaded into a little-endian VM from a version
			 that keeps Floats in big-endian word order as was the case prior to the 6505 image format."
			[(self isPlatformFloatOrderVersion: (data bitAnd: 16rFFFF "low 2 bytes")) ifFalse:
				[self vmEndianness ~= 1 "~= 1 => little-endian" ifTrue:
					[segOop := self oopFromChunk: segmentWordArray + self baseHeaderSize + self bytesPerWord.
					 self wordSwapFloatsFrom: segOop to: endSeg + self bytesPerWord]]]
		ifFalse: "Reverse the byte-type objects once"
			[segOop := self oopFromChunk: segmentWordArray + self baseHeaderSize + self bytesPerWord.
				 "Oop of first embedded object"
			self byteSwapByteObjectsFrom: segOop
				to: endSeg + self bytesPerWord
				flipFloatsIf: (self isPlatformFloatOrderVersion: (data bitAnd: 16rFFFF "low 2 bytes"))].

	"Proceed through the segment, remapping pointers..."
	segOop := self oopFromChunk: segmentWordArray + self baseHeaderSize + self bytesPerWord.
	[segOop <= endSeg] whileTrue:
		[(self headerType: segOop) <= 1
			ifTrue: ["This object has a class field (type = 0 or 1) -- start with that."
					fieldPtr := segOop - self bytesPerWord.  doingClass := true]
			ifFalse: ["No class field -- start with first data field"
					fieldPtr := segOop + self baseHeaderSize.  doingClass := false].
		lastPtr := segOop + (self lastPointerOf: segOop).	"last field"
		lastPtr > endSeg ifTrue:
			[DoAssertionChecks ifTrue: [self verifyCleanHeaders].
			^0 "out of bounds"].

		"Go through all oops, remapping them..."
		[fieldPtr > lastPtr] whileFalse:
			["Examine each pointer field"
			fieldOop := self longAt: fieldPtr.
			doingClass ifTrue:
				[hdrTypeBits := self headerType: fieldPtr.
				fieldOop := fieldOop - hdrTypeBits].
			(self isIntegerObject: fieldOop)
				ifTrue:
					["Integer -- nothing to do"
					fieldPtr := fieldPtr + self bytesPerWord]
				ifFalse:
					[(fieldOop bitAnd: 3) = 0 ifFalse:
						[^0 "bad oop"].
					(fieldOop bitAnd: 16r80000000) = 0
						ifTrue: ["Internal pointer -- add segment offset"
								mapOop := fieldOop + segmentWordArray]
						ifFalse: ["External pointer -- look it up in outPointers"
								outPtr := outPointerArray + (fieldOop bitAnd: 16r7FFFFFFF).
								outPtr > lastOut ifTrue:
									[^0 "out of bounds"].
								mapOop := self longAt: outPtr].
					doingClass
						ifTrue: [self longAt: fieldPtr put: mapOop + hdrTypeBits.
								fieldPtr := fieldPtr + 8.
								doingClass := false]
						ifFalse: [self longAt: fieldPtr put: mapOop.
								fieldPtr := fieldPtr + self bytesPerWord].
					segOop < youngStart ifTrue:
						[self possibleRootStoreInto: segOop value: mapOop]]].
		segOop := self objectAfter: segOop].

	"Again, proceed through the segment checking consistency..."
	segOop := self oopFromChunk: segmentWordArray + self baseHeaderSize + self bytesPerWord.
	[segOop <= endSeg] whileTrue:
		[(self oopHasAcceptableClass: segOop) ifFalse:
			[^0 "inconsistency"].
		fieldPtr := segOop + self baseHeaderSize.		"first field"
		lastPtr := segOop + (self lastPointerOf: segOop).	"last field"
		"Go through all oops, remapping them..."
		[fieldPtr > lastPtr] whileFalse:
			["Examine each pointer field"
			fieldOop := self longAt: fieldPtr.
			(self oopHasAcceptableClass: fieldOop) ifFalse:
				[^0 "inconsistency"].
			fieldPtr := fieldPtr + self bytesPerWord].
		segOop := self objectAfter: segOop].

	"Truncate the segment word array to size = self bytesPerWord (vers stamp only)"
	extraSize := self extraHeaderBytes: segmentWordArray.
	hdrTypeBits := self headerType: segmentWordArray.
	extraSize = 8
		ifTrue: [self longAt: segmentWordArray-extraSize put: self baseHeaderSize + self bytesPerWord + hdrTypeBits]
		ifFalse: [header := self longAt: segmentWordArray.
				self longAt: segmentWordArray
					put: header - (header bitAnd: self sizeMask) + self baseHeaderSize + self bytesPerWord].	
	"and return the roots array which was first in the segment"
	DoAssertionChecks ifTrue: [self verifyCleanHeaders].
	^self oopFromChunk: segmentWordArray + self baseHeaderSize + self bytesPerWord