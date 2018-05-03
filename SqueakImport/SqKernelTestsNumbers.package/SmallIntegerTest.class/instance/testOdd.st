testing - basic
testOdd
	
	self deny: (SmallInteger minVal odd).
	self assert: (SmallInteger maxVal odd).
	
	self assert: ((SmallInteger minVal + 1) odd).
	self deny: ((SmallInteger maxVal - 1) odd).
	
	self assert: (1 odd).
	self assert: (-1 odd).
	
	self deny: (2 odd).
	self deny: (-2 odd).
	
	self deny: (0 odd).