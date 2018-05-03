tests
testDenormalizedPrintString
	"Check that an un-normalized instance behaves reasonably."

	| i i0 |
	i := LargePositiveInteger new: 4.
	i basicAt: 2 put: 255.
	self assert: i size = 4.
	self assert: i printString = '65280'.	"256*255"
	self assert: i normalize = 65280.
	self assert: (i normalize isMemberOf: SmallInteger).
	
	i0 := LargePositiveInteger new: 0.
	self assert: i0 size = 0.
	self assert: i0 printString = '0'.
	self assert: i0 normalize = 0.
	self assert: (i0 normalize isMemberOf: SmallInteger)