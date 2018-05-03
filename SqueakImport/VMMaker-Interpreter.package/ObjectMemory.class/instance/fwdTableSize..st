gc -- compaction
fwdTableSize: blkSize
	"Estimate the number of forwarding blocks available for compaction"
	self subclassResponsibility