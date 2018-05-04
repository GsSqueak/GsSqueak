garbage collection
fullCompaction
	"Move all accessible objects down to leave one big free chunk 
	at the end of memory."
	"Assume: Incremental GC has just been done to maximimize 
	forwarding table space."
	"need not move objects below the first free chunk"
	self subclassResponsibility