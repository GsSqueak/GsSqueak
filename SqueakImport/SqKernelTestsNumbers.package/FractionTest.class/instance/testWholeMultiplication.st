tests - arithmetic
testWholeMultiplication
	
	self assert: (3/2) * (4/3) classAndValueEquals: 2.
	
	self assert: (3/2) * (-4/3) classAndValueEquals: -2.
	
	self assert: (-3/2) * (-4/3) classAndValueEquals: 2.
	
	self assert: (-3/2) * (4/3) classAndValueEquals: -2.