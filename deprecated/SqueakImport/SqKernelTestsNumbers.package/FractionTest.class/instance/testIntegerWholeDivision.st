tests - arithmetic
testIntegerWholeDivision
	
	self assert: 4 / (2/3) classAndValueEquals: 6.
	
	self assert: 4 / (-2/3) classAndValueEquals: -6.
	
	self assert: -4 / (-2/3) classAndValueEquals: 6.
	
	self assert: -4 / (2/3) classAndValueEquals: -6.