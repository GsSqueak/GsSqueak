tests - mathematical functions
testNthRootExactness
	| inexactRoots largeRaisedTo6 |
	largeRaisedTo6 := (2 to: 100) collect: [:k | (k raisedTo: 11) raisedTo: 6].
	inexactRoots := largeRaisedTo6 reject: [:e | (e nthRoot: 6) isInteger].
	self assert: inexactRoots isEmpty description: 'Failed to find the exact 6th root of these numbers'