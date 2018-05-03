tests - arithmetic
testWholeDivision
	
	self assert: (3/2) / (3/4) classAndValueEquals: 2.
	
	self assert: (3/2) / (-3/4) classAndValueEquals: -2.
	
	self assert: (-3/2) / (-3/4) classAndValueEquals: 2.
	
	self assert: (-3/2) / (3/4) classAndValueEquals: -2.