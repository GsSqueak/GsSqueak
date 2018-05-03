garbage collection
incrementalCompaction
	"Move objects down to make one big free chunk. Compact the 
	last N objects (where N = number of forwarding table 
	entries) of the young object area."
	"Assume: compStart was set during the sweep phase"
	self subclassResponsibility