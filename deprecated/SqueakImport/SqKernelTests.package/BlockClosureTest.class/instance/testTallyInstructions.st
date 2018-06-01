tests
testTallyInstructions
	self assert: (Context tallyInstructions: aBlockClosure asContext) size = 15