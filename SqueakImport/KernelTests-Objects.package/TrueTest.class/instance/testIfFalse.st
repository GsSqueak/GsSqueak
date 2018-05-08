testing
testIfFalse

	self assert: (true ifFalse: ['alternativeBlock']) = nil. 