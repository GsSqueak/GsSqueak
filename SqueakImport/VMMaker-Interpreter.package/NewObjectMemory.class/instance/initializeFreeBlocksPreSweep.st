initialization
initializeFreeBlocksPreSweep
	"Set up the free block in preparation for any kind of sweep through all of memory."
	<inline: true>
	self setSizeOfFree: freeStart to: endOfMemory - freeStart. "bytes available for oops"
	self assert: (self isFreeObject: freeStart).
	self assert: freeStart + (self sizeOfFree: freeStart) = endOfMemory.
	self assert: (freeStart < endOfMemory and: [endOfMemory < memoryLimit])