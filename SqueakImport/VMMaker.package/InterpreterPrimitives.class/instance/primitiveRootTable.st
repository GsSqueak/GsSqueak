memory space primitives
primitiveRootTable
	"Primitive. Answer a copy (snapshot) element of the root table.
	The primitive can cause GC itself and if so the return value may
	be inaccurate - in this case one should guard the read operation
	by looking at the gc counter statistics."
	| oop sz |
	<export: true>
	sz := objectMemory getRootTableCount.
	oop := objectMemory instantiateClass: objectMemory classArray indexableSize: sz. "can cause GC"
	sz > objectMemory getRootTableCount ifTrue:[sz := objectMemory getRootTableCount].
	1 to: sz do:[:i| 
		objectMemory storePointer: i-1 ofObject: oop withValue: (objectMemory rootTableAt: i).
	].
	self pop: argumentCount + 1.
	self push: oop.