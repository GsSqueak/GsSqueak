allocation
allocate: byteSize headerSize: hdrSize h1: baseHeader h2: classOopArg h3: extendedSize doFill: doFill format: format
	"Allocate a new object of the given size and number of header words. (Note: byteSize already includes space for the base header word.) Initialize the header fields of the new object and fill the remainder of the object with a value appropriate for the format.
	May cause a GC"

	| newObj classOop |
	<inline: true>
	<var: #i type: 'usqInt'>
	<var: #end type: 'usqInt'>
	newObj := self allocateChunk: byteSize + (hdrSize - 1 * self bytesPerWord).
	newObj = 0
		ifTrue:
			["remap classOop because GC may move the classOop"
			hdrSize > 1 ifTrue: [self pushRemappableOop: classOopArg].
			newObj := self allocateChunkAfterGC: byteSize + (hdrSize - 1 * self bytesPerWord).
			hdrSize > 1 ifTrue: [classOop := self popRemappableOop].
			newObj = 0 ifTrue: [^newObj]]
		ifFalse: [classOop := classOopArg].

	hdrSize = 3 ifTrue:
		[self longAt: newObj put: (extendedSize bitOr: HeaderTypeSizeAndClass).
		 self longAt: newObj + self bytesPerWord put: (classOop bitOr: HeaderTypeSizeAndClass).
		 self longAt: newObj + (self bytesPerWord*2) put: (baseHeader bitOr: HeaderTypeSizeAndClass).
		 newObj := newObj + (self bytesPerWord*2)].

	hdrSize = 2 ifTrue:
		[self longAt: newObj put: (classOop bitOr: HeaderTypeClass).
		 self longAt: newObj + self bytesPerWord put: (baseHeader bitOr: HeaderTypeClass).
		 newObj := newObj + self bytesPerWord].

	hdrSize = 1 ifTrue:
		[self longAt: newObj put: (baseHeader bitOr: HeaderTypeShort)].

	"clear new object"
	doFill ifTrue:
		[| fillWord end i |
		 fillWord := format <= 4
					ifTrue: [nilObj] "if pointers, fill with nil oop"
					ifFalse: [0].
		 end := newObj + byteSize.
		 i := newObj + self bytesPerWord.
		 [i < end] whileTrue:
			[self longAt: i put: fillWord.
			 i := i + self bytesPerWord]].
	DoExpensiveAssertionChecks ifTrue:
		[self okayOop: newObj.
		 self oopHasOkayClass: newObj.
		 (self safeObjectAfter: newObj) = freeStart ifFalse:
			[self error: 'allocate bug: did not set header of new oop correctly']].

	^newObj