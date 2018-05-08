tests
testSetUp
	"Note: In addition to verifying that the setUp worked the way it was expected to, testSetUp is used to illustrate the meaning of the simple access methods, methods that are not normally otherwise 'tested'"
	self deny: aBlockClosure isContext.
	self assert: aBlockClosure isClosure.
	self assert: aBlockClosure home = homeOfABlockClosure.
	self assert: aBlockClosure receiver = self.
	self assert: aBlockClosure method isCompiledMethod