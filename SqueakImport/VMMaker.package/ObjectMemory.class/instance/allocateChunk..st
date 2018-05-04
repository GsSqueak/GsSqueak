allocation
allocateChunk: byteSize 
	"Allocate a chunk of the given size. Sender must be sure that  the requested size includes enough space for the header  word(s). " 
	"Details: To limit the time per incremental GC, do one every so many allocations. The number is settable via primitiveVMParameter to tune your memory system"
	self subclassResponsibility