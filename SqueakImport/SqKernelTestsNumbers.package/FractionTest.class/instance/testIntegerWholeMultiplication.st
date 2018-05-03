tests - arithmetic
testIntegerWholeMultiplication
	
	self assert: 4 * (3/2) classAndValueEquals: 6.
	
	self assert: 4 * (-3/2) classAndValueEquals: -6.
	
	self assert: -4 * (-3/2) classAndValueEquals: 6.
	
	self assert: -4 * (3/2) classAndValueEquals: -6.