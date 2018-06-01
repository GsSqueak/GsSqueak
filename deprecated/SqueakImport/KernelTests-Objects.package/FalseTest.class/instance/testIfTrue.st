tests
testIfTrue

	self assert: (false ifTrue: ['alternativeBlock']) = nil. 