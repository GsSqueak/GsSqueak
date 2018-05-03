object enumeration
clearLeakMapAndMapAccessibleObjects
	"Perform an integrity/leak check using the heapMap.  Set a bit at each object's header."
	| obj sz |
	<inline: false>

	self flag: #FIXME. "Requires Cross/vm/sqHeapMap.c in support code, disabled for now."

	"self clearHeapMap.
	obj := self firstObject.
	[self oop: obj isLessThan: freeStart] whileTrue:
		[(self isFreeObject: obj)
			ifTrue:
				[sz := self sizeOfFree: obj]
			ifFalse:
				[self heapMapAtWord: (self pointerForOop: obj) Put: 1.
				 sz := self sizeBitsOf: obj].
		 obj := self oopFromChunk: obj + sz]"