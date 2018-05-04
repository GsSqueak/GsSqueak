gc -- compaction
incCompBody
	"Move objects to consolidate free space into one big chunk. Return the newly created free chunk."
	self subclassResponsibility