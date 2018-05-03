testing compare
testLiteralEqualityOfNan
	| nan |
	nan := Float nan.
	self assert: (nan literalEqual: nan)
		description: 'Float nan is not equal to itself, though it is literally equal'.