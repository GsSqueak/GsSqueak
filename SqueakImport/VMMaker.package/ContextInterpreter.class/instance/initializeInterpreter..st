initialization
initializeInterpreter: bytesToShift 
	"Initialize Interpreter state before starting execution of a new image."
	self initializeInterpreter.
	interpreterProxy := self sqGetInterpreterProxy.
	self dummyReferToProxy.
	objectMemory initializeObjectMemory: bytesToShift.
	self initCompilerHooks.
	activeContext := objectMemory getNilObj.
	theHomeContext := objectMemory getNilObj.
	method := objectMemory getNilObj.
	receiver := objectMemory getNilObj.
	messageSelector := objectMemory getNilObj.
	newMethod := objectMemory getNilObj.
	methodClass := objectMemory getNilObj.
	lkupClass := objectMemory getNilObj.
	receiverClass := objectMemory getNilObj.
	newNativeMethod := objectMemory getNilObj.
	self flushMethodCache.
	self loadInitialContext.
	self initialCleanup.
	interruptCheckCounter := 0.
	interruptCheckCounterFeedBackReset := 1000.
	interruptChecksEveryNms := 1.
	nextPollTick := 0.
	nextWakeupTick := 0.
	lastTick := 0.
	interruptKeycode := 2094. "cmd-. as used for Mac but no other OS"
	interruptPending := false.
	deferDisplayUpdates := false.
	pendingFinalizationSignals := 0.
	globalSessionID := 0.
	[globalSessionID = 0]
		whileTrue: [globalSessionID := self
						cCode: 'time(NULL) + ioMSecs()'
						inSmalltalk: [(Random new next * SmallInteger maxVal) asInteger]].
	jmpDepth := 0.
	jmpMax := MaxJumpBuf. "xxxx: Must match the definition of jmpBuf and suspendedCallbacks"
