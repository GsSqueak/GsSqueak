image segment in/out
primitiveLoadImageSegment
	"This primitive is called from Squeak as...
		<imageSegment> loadSegmentFrom: aWordArray outPointers: anArray."

"This primitive will load a binary image segment created by primitiveStoreImageSegment.  It expects the outPointer array to be of the proper size, and the wordArray to be well formed.  It will return as its value the original array of roots, and the erstwhile segmentWordArray will have been truncated to a size of zero.  If this primitive should fail, the segmentWordArray will, sadly, have been reduced to an unrecognizable and unusable jumble.  But what more could you have done with it anyway?"

	| outPointerArray segmentWordArray endSeg segOop fieldPtr fieldOop doingClass lastPtr extraSize mapOop lastOut outPtr hdrTypeBits header data |

	<var: #endSeg type: 'usqInt'>
	<var: #segOop type: 'usqInt'>
	<var: #fieldPtr type: 'usqInt'>
	<var: #lastOut type: 'usqInt'>
	<var: #outPtr type: 'usqInt'>
	<var: #lastPtr type: 'usqInt'>

	DoAssertionChecks ifTrue: [objectMemory verifyCleanHeaders].
	outPointerArray := self stackTop.
	lastOut := outPointerArray + (objectMemory lastPointerOf: outPointerArray).
	segmentWordArray := self stackValue: 1.
	endSeg := segmentWordArray + (objectMemory sizeBitsOf: segmentWordArray) - objectMemory baseHeaderSize.

	"Essential type checks"
	((objectMemory formatOf: outPointerArray) = 2				"Must be indexable pointers"
		and: [(objectMemory formatOf: segmentWordArray) = 6])	"Must be indexable words"
		ifFalse: [^ self primitiveFail].

	"Version check.  Byte order of the WordArray now"
	data := objectMemory longAt: segmentWordArray + objectMemory baseHeaderSize.
	(self readableFormat: (data bitAnd: 16rFFFF "low 2 bytes")) ifFalse: [
		"Not readable -- try again with reversed bytes..."
		objectMemory reverseBytesFrom: segmentWordArray + objectMemory baseHeaderSize to: endSeg + objectMemory bytesPerWord.
		data := objectMemory longAt: segmentWordArray + objectMemory baseHeaderSize.
		(self readableFormat: (data bitAnd: 16rFFFF "low 2 bytes")) ifFalse: [
			"Still NG -- put things back and fail"
			objectMemory reverseBytesFrom: segmentWordArray + objectMemory baseHeaderSize to: endSeg + objectMemory bytesPerWord.
			DoAssertionChecks ifTrue: [objectMemory verifyCleanHeaders].
			^ self primitiveFail]].
	"Reverse the Byte type objects if the is data from opposite endian machine."
	"Test top byte.  $d on the Mac or $s on the PC.  Rest of word is equal."
	(data >> 16) = (objectMemory imageSegmentVersion >> 16) ifFalse: [
		"Reverse the byte-type objects once"
		segOop := objectMemory oopFromChunk: segmentWordArray + objectMemory baseHeaderSize + objectMemory bytesPerWord.
			 "Oop of first embedded object"
		self byteSwapByteObjectsFrom: segOop to: endSeg + objectMemory bytesPerWord].

	"Proceed through the segment, remapping pointers..."
	segOop := objectMemory oopFromChunk: segmentWordArray + objectMemory baseHeaderSize + objectMemory bytesPerWord.
	[segOop <= endSeg] whileTrue:
		[(objectMemory headerType: segOop) <= 1
			ifTrue: ["This object has a class field (type = 0 or 1) -- start with that."
					fieldPtr := segOop - objectMemory bytesPerWord.  doingClass := true]
			ifFalse: ["No class field -- start with first data field"
					fieldPtr := segOop + objectMemory baseHeaderSize.  doingClass := false].
		lastPtr := segOop + (objectMemory lastPointerOf: segOop).	"last field"
		lastPtr > endSeg ifTrue: [
			DoAssertionChecks ifTrue: [objectMemory verifyCleanHeaders].
			^ self primitiveFail "out of bounds"].

		"Go through all oops, remapping them..."
		[fieldPtr > lastPtr] whileFalse:
			["Examine each pointer field"
			fieldOop := objectMemory longAt: fieldPtr.
			doingClass ifTrue:
				[hdrTypeBits := objectMemory headerType: fieldPtr.
				fieldOop := fieldOop - hdrTypeBits].
			(objectMemory isIntegerObject: fieldOop)
				ifTrue:
					["Integer -- nothing to do"
					fieldPtr := fieldPtr + objectMemory bytesPerWord]
				ifFalse:
					[(fieldOop bitAnd: 3) = 0 ifFalse: [^ self primitiveFail "bad oop"].
					(fieldOop bitAnd: 16r80000000) = 0
						ifTrue: ["Internal pointer -- add segment offset"
								mapOop := fieldOop + segmentWordArray]
						ifFalse: ["External pointer -- look it up in outPointers"
								outPtr := outPointerArray + (fieldOop bitAnd: 16r7FFFFFFF).
								outPtr > lastOut ifTrue: [^ self primitiveFail "out of bounds"].
								mapOop := objectMemory longAt: outPtr].
					doingClass
						ifTrue: [objectMemory longAt: fieldPtr put: mapOop + hdrTypeBits.
								fieldPtr := fieldPtr + 8.
								doingClass := false]
						ifFalse: [objectMemory longAt: fieldPtr put: mapOop.
								fieldPtr := fieldPtr + objectMemory bytesPerWord].
					segOop < objectMemory getYoungStart
						ifTrue: [objectMemory possibleRootStoreInto: segOop value: mapOop].
					]].
		segOop := objectMemory objectAfter: segOop].

	"Again, proceed through the segment checking consistency..."
	segOop := objectMemory oopFromChunk: segmentWordArray + objectMemory baseHeaderSize + objectMemory bytesPerWord.
	[segOop <= endSeg] whileTrue:
		[(objectMemory oopHasAcceptableClass: segOop) ifFalse: [^ self primitiveFail "inconsistency"].
		fieldPtr := segOop + objectMemory baseHeaderSize.		"first field"
		lastPtr := segOop + (objectMemory lastPointerOf: segOop).	"last field"
		"Go through all oops, remapping them..."
		[fieldPtr > lastPtr] whileFalse:
			["Examine each pointer field"
			fieldOop := objectMemory longAt: fieldPtr.
			(objectMemory oopHasAcceptableClass: fieldOop) ifFalse: [^ self primitiveFail "inconsistency"].
			fieldPtr := fieldPtr + objectMemory bytesPerWord].
		segOop := objectMemory objectAfter: segOop].

	"Truncate the segment word array to size = objectMemory bytesPerWord (vers stamp only)"
	extraSize := objectMemory extraHeaderBytes: segmentWordArray.
	hdrTypeBits := objectMemory headerType: segmentWordArray.
	extraSize = 8
		ifTrue: [objectMemory longAt: segmentWordArray-extraSize put: objectMemory baseHeaderSize + objectMemory bytesPerWord + hdrTypeBits]
		ifFalse: [header := objectMemory longAt: segmentWordArray.
				objectMemory longAt: segmentWordArray
					put: header - (header bitAnd: objectMemory sizeMask) + objectMemory baseHeaderSize + objectMemory bytesPerWord].	
	"and return the roots array which was first in the segment"
	DoAssertionChecks ifTrue: [objectMemory verifyCleanHeaders].
	self pop: 3 thenPush: (objectMemory oopFromChunk: segmentWordArray + objectMemory baseHeaderSize + objectMemory bytesPerWord).
