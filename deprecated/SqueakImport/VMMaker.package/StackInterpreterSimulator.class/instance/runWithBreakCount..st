testing
runWithBreakCount: theBreakCount
	"Just run, halting when byteCount is reached"
	quitBlock := [(displayView notNil
				   and: [UIManager default confirm: 'close?']) ifTrue:
					[(displayView outermostMorphThat: [:m| m isSystemWindow]) ifNotNil:
						[:topWindow| topWindow delete]].
				  ^self].
	breakCount := theBreakCount.
	self initStackPages.
	self loadInitialContext.
	self internalizeIPandSP.
	self fetchNextBytecode.
	[true] whileTrue:
		[self assertValidExecutionPointers.
		 self dispatchOn: currentBytecode in: BytecodeTable.
		 self incrementByteCount].
	localIP := localIP - 1.
	"undo the pre-increment of IP before returning"
	self externalizeIPandSP