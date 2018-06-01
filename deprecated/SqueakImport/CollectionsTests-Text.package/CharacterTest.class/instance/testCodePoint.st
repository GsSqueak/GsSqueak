tests - creation
testCodePoint
	self assert: (Character codePoint: $A asciiValue) = $A.
	self assert: (Character codePoint: 500) asciiValue = 500.