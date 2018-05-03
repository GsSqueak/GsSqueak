jump bytecodes
longUnconditionalJump
	| offset |
	offset := (((currentBytecode bitAnd: 7) - 4) * 256) + self fetchByte.
	localIP := localIP + offset.
	(offset < 0 "backward jump means we're in a loop; check for possible interrupts"
	 and: [localSP < stackLimit]) ifTrue:
		[self externalizeIPandSP.
		 self checkForEventsMayContextSwitch: true.
		 self browserPluginReturnIfNeeded.
		 self internalizeIPandSP].
	self fetchNextBytecode