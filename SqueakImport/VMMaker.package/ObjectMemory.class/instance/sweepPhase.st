gc -- mark and sweep
sweepPhase
	"Sweep memory from youngStart through the end of memory. Free all 
	inaccessible objects and coalesce adjacent free chunks. Clear the mark 
	bits of accessible objects. Compute the starting point for the first pass of 
	incremental compaction (compStart). Return the number of surviving 
	objects. "
	"Details: Each time a non-free object is encountered, decrement the 
	number of available forward table entries. If all entries are spoken for 
	(i.e., entriesAvailable reaches zero), set compStart to the last free 
	chunk before that object or, if there is no free chunk before the given 
	object, the first free chunk after it. Thus, at the end of the sweep 
	phase, compStart through compEnd spans the highest collection of 
	non-free objects that can be accomodated by the forwarding table. This 
	information is used by the first pass of incremental compaction to 
	ensure that space is initially freed at the end of memory. Note that 
	there should always be at least one free chunk--the one at the end of 
	the heap."
	| entriesAvailable survivors freeChunk firstFree oop oopHeader oopHeaderType hdrBytes oopSize freeChunkSize endOfMemoryLocal |
	<inline: false>
	<var: #oop type: 'usqInt'>
	<var: #endOfMemoryLocal type: 'usqInt'>
	entriesAvailable := self fwdTableInit: self bytesPerWord * 2.
	survivors := 0.
	freeChunk := -1. "an invalid object pointer, note that 0 may refer to a meaningful slot"
	firstFree := -1.
	"will be updated later"
	endOfMemoryLocal := endOfMemory.
	oop := self oopFromChunk: youngStart.
	[oop < endOfMemoryLocal]
		whileTrue: ["get oop's header, header type, size, and header size"
			statSweepCount := statSweepCount + 1.
			oopHeader := self baseHeader: oop.
			oopHeaderType := oopHeader bitAnd: TypeMask.
			hdrBytes := headerTypeBytes at: oopHeaderType.
			(oopHeaderType bitAnd: 1) = 1
				ifTrue: [oopSize := oopHeader bitAnd: self sizeMask]
				ifFalse: [oopHeaderType = HeaderTypeSizeAndClass
						ifTrue: [oopSize := (self sizeHeader: oop) bitAnd: self longSizeMask]
						ifFalse: ["free chunk" oopSize := oopHeader bitAnd: self longSizeMask]].
			(oopHeader bitAnd: self markBit) = 0
				ifTrue: ["object is not marked; free it"
					"<-- Finalization support: We need to mark each oop chunk as free -->"
					self longAt: oop - hdrBytes put: HeaderTypeFree.
					freeChunk ~= -1
						ifTrue: ["enlarge current free chunk to include this oop"
							freeChunkSize := freeChunkSize + oopSize + hdrBytes]
						ifFalse: ["start a new free chunk"
							freeChunk := oop - hdrBytes.
							"chunk may start 4 or 8 bytes before oop"
							freeChunkSize := oopSize + (oop - freeChunk).
							"adjust size for possible extra header bytes"
							firstFree = -1 ifTrue: [firstFree := freeChunk]]]
				ifFalse: ["object is marked; clear its mark bit and possibly adjust 
					the compaction start"
					self longAt: oop put: (oopHeader bitAnd: self allButMarkBit).
					"<-- Finalization support: Check if we're running about a weak class -->"
					(self isWeakNonInt: oop) ifTrue: [self finalizeReference: oop].
					entriesAvailable > 0
						ifTrue: [entriesAvailable := entriesAvailable - 1]
						ifFalse: ["start compaction at the last free chunk before this object"
							firstFree := freeChunk].
					freeChunk ~= -1
						ifTrue: ["record the size of the last free chunk"
							self longAt: freeChunk put: ((freeChunkSize bitAnd: self longSizeMask) bitOr: HeaderTypeFree).
							freeChunk := -1].
					survivors := survivors + 1].
			oop := self oopFromChunk: oop + oopSize].
	freeChunk ~= -1
		ifTrue: ["record size of final free chunk"
			self longAt: freeChunk put: ((freeChunkSize bitAnd: self longSizeMask) bitOr: HeaderTypeFree)].
	oop = endOfMemory
		ifFalse: [self error: 'sweep failed to find exact end of memory'].
	firstFree = -1
		ifTrue: [self error: 'expected to find at least one free object']
		ifFalse: [compStart := firstFree].

	^ survivors