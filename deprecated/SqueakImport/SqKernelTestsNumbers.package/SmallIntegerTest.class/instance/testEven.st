testing - basic
testEven
	
	self assert: (SmallInteger minVal even).
	self deny: (SmallInteger maxVal even).
	
	self deny: ((SmallInteger minVal + 1) even).
	self assert: ((SmallInteger maxVal - 1) even).
	
	self deny: (1 even).
	self deny: (-1 even).
	
	self assert: (2 even).
	self assert: (-2 even).
	
	self assert: (0 even).