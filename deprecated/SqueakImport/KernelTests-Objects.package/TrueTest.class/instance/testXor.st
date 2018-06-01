testing
testXor
	self assert: (true xor: true) = false.
	self assert: (true xor: false) = true.
	
	self
		should: [(true xor: [true])
			ifTrue: ["This should never be true, do not signal an Error and let the test fail"]
			ifFalse: [self error: 'OK, this should be false, raise an Error']]
		raise: Error
		description: 'a Block argument is not allowed. If it were, answer would be false'.