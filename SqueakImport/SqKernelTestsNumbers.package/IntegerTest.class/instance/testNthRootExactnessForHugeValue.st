tests - mathematical functions
testNthRootExactnessForHugeValue
	self assert: ((10 raisedTo: 600) nthRoot: 300) classAndValueEquals: 100.
	self assert: ((10 raisedTo: 600) + 1 nthRoot: 300) classAndValueEquals: 100.0