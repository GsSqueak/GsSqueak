tests
testRunSimulated
	self assert: Rectangle equals: (Context runSimulated: aBlockClosure asContext) class