initialization
initialize

	"Smalltalk addToStartUpList: self before: ProcessorScheduler." "added anyway"
	Smalltalk addToShutDownList: self.
	
	self installKeyDecodeTable.
	self installMouseDecodeTable.
	self install.

