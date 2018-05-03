image segment in/out
primitiveStoreImageSegment
	"This primitive is called from Squeak as...
		<imageSegment> storeSegmentFor: arrayOfRoots into: aWordArray outPointers: anArray."

"This primitive will store a binary image segment (in the same format as the Squeak image file) of the receiver and every object in its proper tree of subParts (ie, that is not refered to from anywhere else outside the tree).  All pointers from within the tree to objects outside the tree will be copied into the array of outpointers.  In their place in the image segment will be an oop equal to the offset in the outPointer array (the first would be 4). but with the high bit set."

"The primitive expects the array and wordArray to be more than adequately long.  In this case it returns normally, and truncates the two arrays to exactly the right size.  To simplify truncation, both incoming arrays are required to be 256 bytes or more long (ie with 3-word headers).  If either array is too small, the primitive will fail, but in no other case.

During operation of the primitive, it is necessary to convert from both internal and external oops to their mapped values.  To make this fast, the headers of the original objects in question are replaced by the mapped values (and this is noted by adding the forbidden XX header type).  Tables are kept of both kinds of oops, as well as of the original headers for restoration.

To be specific, there are two similar two-part tables, the outpointer array, and one in the upper fifth of the segmentWordArray.  Each grows oops from the bottom up, and preserved headers from halfway up.

In case of either success or failure, the headers must be restored.  In the event of primitive failure, the table of outpointers must also be nilled out (since the garbage in the high half will not have been discarded."

	| outPointerArray segmentWordArray savedYoungStart lastOut lastIn firstIn lastSeg endSeg segOop fieldPtr fieldOop mapOop doingClass lastPtr extraSize hdrTypeBits arrayOfRoots hdrBaseIn hdrBaseOut header firstOut versionOffset |

	<var: #firstIn type: 'usqInt'>
	<var: #lastIn type: 'usqInt'>
	<var: #firstOut type: 'usqInt'>
	<var: #lastOut type: 'usqInt'>
	<var: #hdrBaseIn type: 'usqInt'>
	<var: #hdrBaseOut type: 'usqInt'>
	<var: #lastSeg type: 'usqInt'>
	<var: #endSeg type: 'usqInt'>
	<var: #fieldPtr type: 'usqInt'>
	<var: #lastPtr type: 'usqInt'>
	<var: #segOop type: 'usqInt'>
	<var: #savedYoungStart type: 'usqInt'>

	outPointerArray := self stackTop.
	segmentWordArray := self stackValue: 1.
	arrayOfRoots := self stackValue: 2.

	"Essential type checks"
	((objectMemory formatOf: arrayOfRoots) = 2				"Must be indexable pointers"
		and: [(objectMemory formatOf: outPointerArray) = 2				"Must be indexable pointers"
		and: [(objectMemory formatOf: segmentWordArray) = 6]])	"Must be indexable words"
		ifFalse: [^ self primitiveFail].
	((objectMemory headerType: outPointerArray) = HeaderTypeSizeAndClass	"Must be 3-word header"
		and: [(objectMemory headerType: segmentWordArray) = HeaderTypeSizeAndClass])	"Must be 3-word header"
		ifFalse: [^ self primitiveFail].

	DoAssertionChecks ifTrue: [objectMemory verifyCleanHeaders].
	"Use the top half of outPointers for saved headers."
	firstOut := outPointerArray + objectMemory baseHeaderSize.
	lastOut := firstOut - objectMemory bytesPerWord.
	hdrBaseOut := outPointerArray + ((objectMemory lastPointerOf: outPointerArray) // (objectMemory bytesPerWord * 2) * objectMemory bytesPerWord). "top half"

	lastSeg := segmentWordArray.
	endSeg := segmentWordArray + (objectMemory sizeBitsOf: segmentWordArray) - objectMemory bytesPerWord.

	"Write a version number for byte order and version check"
	versionOffset := objectMemory bytesPerWord.
	lastSeg := lastSeg + versionOffset.
	lastSeg > endSeg ifTrue: [^ self primitiveFail].
	objectMemory longAt: lastSeg put: objectMemory imageSegmentVersion.

	"Allocate top 1/8 of segment for table of internal oops and saved headers"
	firstIn := endSeg - ((objectMemory sizeBitsOf: segmentWordArray) // (objectMemory bytesPerWord * 8) * objectMemory bytesPerWord).  "Take 1/8 of seg"
	lastIn := firstIn - objectMemory bytesPerWord.
	hdrBaseIn := firstIn + ((objectMemory sizeBitsOf: segmentWordArray) // (objectMemory bytesPerWord * 16) * objectMemory bytesPerWord). "top half of that"

	"First mark the rootArray and all root objects."
	objectMemory longAt: arrayOfRoots put: ((objectMemory longAt: arrayOfRoots) bitOr: objectMemory markBit).
	lastPtr := arrayOfRoots + (objectMemory lastPointerOf: arrayOfRoots).
	fieldPtr := arrayOfRoots + objectMemory baseHeaderSize.
	[fieldPtr <= lastPtr] whileTrue:
		[fieldOop := objectMemory longAt: fieldPtr.
		(objectMemory isIntegerObject: fieldOop) ifFalse:
			[objectMemory longAt: fieldOop put: ((objectMemory longAt: fieldOop) bitOr: objectMemory markBit)].
		fieldPtr := fieldPtr + objectMemory bytesPerWord].

	"Then do a mark pass over all objects.  This will stop at our marked roots,
	thus leaving our segment unmarked in their shadow."
	savedYoungStart := objectMemory getYoungStart.
	objectMemory setYoungStart: objectMemory startOfMemory.  "process all of memory"
		"clear the recycled context lists"
		objectMemory setFreeContexts: objectMemory nilContext.
		objectMemory setFreeLargeContexts: objectMemory nilContext.
	self markAndTraceInterpreterOops: true.	"and special objects array"
	objectMemory setYoungStart: savedYoungStart.
	
	"Finally unmark the rootArray and all root objects."
	objectMemory longAt: arrayOfRoots put: ((objectMemory longAt: arrayOfRoots) bitAnd: objectMemory allButMarkBit).
	fieldPtr := arrayOfRoots + objectMemory baseHeaderSize.
	[fieldPtr <= lastPtr] whileTrue:
		[fieldOop := objectMemory longAt: fieldPtr.
		(objectMemory isIntegerObject: fieldOop) ifFalse:
			[objectMemory longAt: fieldOop put: ((objectMemory longAt: fieldOop) bitAnd: objectMemory allButMarkBit)].
		fieldPtr := fieldPtr + objectMemory bytesPerWord].

	"All external objects, and only they, are now marked.
	Copy the array of roots into the segment, and forward its oop."
	lastIn := lastIn + objectMemory bytesPerWord.
	lastIn >= hdrBaseIn ifTrue: [self primitiveFail].
	lastSeg := self copyObj: arrayOfRoots toSegment: segmentWordArray addr: lastSeg stopAt: firstIn saveOopAt: lastIn headerAt: hdrBaseIn + (lastIn - firstIn).
	self successful ifFalse:
		[lastIn := lastIn - objectMemory bytesPerWord.
		objectMemory restoreHeadersFrom: firstIn to: lastIn from: hdrBaseIn and: firstOut to: lastOut from: hdrBaseOut.
		^ self primitiveFailAfterCleanup: outPointerArray].

	"Now run through the segment fixing up all the pointers.
	Note that more objects will be added to the segment as we make our way along."
	segOop := objectMemory oopFromChunk: segmentWordArray + versionOffset + objectMemory baseHeaderSize.
	[segOop <= lastSeg] whileTrue:
		[(objectMemory headerType: segOop) <= 1
			ifTrue: ["This object has a class field (type=0 or 1) -- start with that."
					fieldPtr := segOop - objectMemory bytesPerWord.  doingClass := true]
			ifFalse: ["No class field -- start with first data field"
					fieldPtr := segOop + objectMemory baseHeaderSize.  doingClass := false].
		lastPtr := segOop + (objectMemory lastPointerOf: segOop).	"last field"

		"Go through all oops, remapping them..."
		[fieldPtr > lastPtr] whileFalse:
			["Examine each pointer field"
			fieldOop := objectMemory longAt: fieldPtr.
			doingClass ifTrue:
				[hdrTypeBits := fieldOop bitAnd: TypeMask.
				fieldOop := fieldOop - hdrTypeBits].
			(objectMemory isIntegerObject: fieldOop)
				ifTrue: ["Just an integer -- nothing to do"
						fieldPtr := fieldPtr + objectMemory bytesPerWord]
				ifFalse:
				[header := objectMemory longAt: fieldOop.
				(header bitAnd: TypeMask) = objectMemory headerTypeFree
					ifTrue: ["Has already been forwarded -- this is the link"
							mapOop := header bitAnd: objectMemory allButTypeMask]
					ifFalse:
					[((objectMemory longAt: fieldOop) bitAnd: objectMemory markBit) = 0
						ifTrue:
							["Points to an unmarked obj -- an internal pointer.
							Copy the object into the segment, and forward its oop."
							lastIn := lastIn + objectMemory bytesPerWord.
							lastIn >= hdrBaseIn ifTrue: [self primitiveFail].
							lastSeg := self copyObj: fieldOop toSegment: segmentWordArray addr: lastSeg stopAt: firstIn saveOopAt: lastIn headerAt: hdrBaseIn + (lastIn - firstIn).
							self successful ifFalse:
								["Out of space in segment"
								lastIn := lastIn - objectMemory bytesPerWord.
								objectMemory restoreHeadersFrom: firstIn to: lastIn from: hdrBaseIn and: firstOut to: lastOut from: hdrBaseOut.
								^ self primitiveFailAfterCleanup: outPointerArray].
							mapOop := (objectMemory longAt: fieldOop) bitAnd: objectMemory allButTypeMask]
						ifFalse:
							["Points to a marked obj -- an external pointer.
							Map it as a tagged index in outPointers, and forward its oop."
							lastOut := lastOut + objectMemory bytesPerWord.
							lastOut >= hdrBaseOut ifTrue:
								["Out of space in outPointerArray"
								lastOut := lastOut - objectMemory bytesPerWord.
								objectMemory restoreHeadersFrom: firstIn to: lastIn from: hdrBaseIn and: firstOut to: lastOut from: hdrBaseOut.
								^ self primitiveFailAfterCleanup: outPointerArray].
.							mapOop := lastOut - outPointerArray bitOr: 16r80000000.
							objectMemory forward: fieldOop to: mapOop
								savingOopAt: lastOut andHeaderAt: hdrBaseOut + (lastOut - firstOut)]].
					"Replace the oop by its mapped value"
					doingClass
						ifTrue: [objectMemory longAt: fieldPtr put: mapOop + hdrTypeBits.
								fieldPtr := fieldPtr + (objectMemory bytesPerWord*2).
								doingClass := false]
						ifFalse: [objectMemory longAt: fieldPtr put: mapOop.
								fieldPtr := fieldPtr + objectMemory bytesPerWord].
]].
		segOop := objectMemory objectAfter: segOop].

	objectMemory restoreHeadersFrom: firstIn to: lastIn from: hdrBaseIn and: firstOut to: lastOut from: hdrBaseOut.

	"Truncate the outPointerArray..."
	((outPointerArray + (objectMemory lastPointerOf: outPointerArray) - lastOut) < 12
		or: [(endSeg - lastSeg) < 12]) ifTrue:
			["Not enough room to insert simple 3-word headers"
			^ self primitiveFailAfterCleanup: outPointerArray].
	extraSize := objectMemory extraHeaderBytes: segmentWordArray.
	hdrTypeBits := objectMemory headerType: segmentWordArray.
	"Copy the 3-word wordArray header to establish a free chunk."
	self transfer: 3
		from: segmentWordArray - extraSize
		to: lastOut+objectMemory bytesPerWord.
	"Adjust the size of the original as well as the free chunk."
	objectMemory longAt: lastOut+objectMemory bytesPerWord
		put: outPointerArray + (objectMemory lastPointerOf: outPointerArray) - lastOut - extraSize + hdrTypeBits.
	objectMemory longAt: outPointerArray-extraSize
		put: lastOut - firstOut + (objectMemory bytesPerWord*2) + hdrTypeBits.
	"Note that pointers have been stored into roots table"
	objectMemory beRootIfOld: outPointerArray.

	"Truncate the image segment..."
	"Copy the 3-word wordArray header to establish a free chunk."
	self transfer: 3
		from: segmentWordArray - extraSize
		to: lastSeg+objectMemory bytesPerWord.
	"Adjust the size of the original as well as the free chunk."
	objectMemory longAt: segmentWordArray-extraSize
		put: lastSeg - segmentWordArray + objectMemory baseHeaderSize + hdrTypeBits.
	objectMemory longAt: lastSeg+objectMemory bytesPerWord
		put: endSeg - lastSeg - extraSize + hdrTypeBits.

	DoAssertionChecks ifTrue: [objectMemory verifyCleanHeaders].
	self pop: 3.  "...leaving the receiver on the stack as return value"
