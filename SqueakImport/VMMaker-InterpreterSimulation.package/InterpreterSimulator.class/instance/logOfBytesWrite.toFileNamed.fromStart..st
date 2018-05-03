testing
logOfBytesWrite: nBytes toFileNamed: fileName fromStart: loggingStart
	"Write a log file for testing a flaky interpreter on the same image"
	"self logOfBytesWrite: 10000 toFileNamed: 'clone32Bytecodes.log' "
	
	| logFile |
	logFile := (FileStream newFileNamed: fileName) binary.
	logging := loggingStart.
	transcript clear.
	byteCount := 0.
	quitBlock := [^ self].
	self internalizeIPandSP.
	self fetchNextBytecode.
	[logging not or: [byteCount < nBytes]] whileTrue:
		[logging ifTrue: [logFile nextPut: currentBytecode].
		self dispatchOn: currentBytecode in: BytecodeTable.
		byteCount := byteCount + 1.
		byteCount \\ 10000 = 0 ifTrue: [self fullDisplayUpdate]].
	self externalizeIPandSP.
	logFile close.
