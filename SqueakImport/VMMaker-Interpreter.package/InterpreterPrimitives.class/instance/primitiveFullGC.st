memory space primitives
primitiveFullGC
	"Do a full garbage collection and return the number of bytes available (including swap space if dynamic memory management is supported)."

	self pop: 1.
	objectMemory incrementalGC.  "maximimize space for forwarding table"
	objectMemory fullGC.
	self push: (self positive64BitIntegerFor: (objectMemory bytesLeft: true))
