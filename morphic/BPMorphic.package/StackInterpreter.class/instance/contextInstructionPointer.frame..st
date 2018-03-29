frame access
contextInstructionPointer: theIP frame: theFP 
	self
		assert: (self validInstructionPointer: theIP + 1 inFrame: theFP).
	^ objectMemory integerObjectOf: theIP
			- (self iframeMethod: theFP) - objectMemory baseHeaderSize + 2