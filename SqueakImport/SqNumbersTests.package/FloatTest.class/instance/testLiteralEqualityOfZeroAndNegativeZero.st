testing compare
testLiteralEqualityOfZeroAndNegativeZero
	self assert: 1
		equals: (Compiler evaluate: '1>2 ifTrue: [0.0] ifFalse: [-0.0]') signBit
		description: 'Float zero and negativeZero are not literally substituable'.