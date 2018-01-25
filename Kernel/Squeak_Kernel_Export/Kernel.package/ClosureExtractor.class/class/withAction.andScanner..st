instance creation
withAction: aBlock andScanner: anInstructionStream
	"The passed block must accept one value, which will be a BlockClosure."
	^ self new action: aBlock; scanner: anInstructionStream