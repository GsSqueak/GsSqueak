initialization
initializeForStone: stoneName inPath: devKitPath

	self initializePipes.
	self initializeProcessForStone: stoneName inPath: devKitPath.
	[(Delay forMilliseconds: 500) wait] 
		doWhileTrue: [self clearPipes isEmpty]