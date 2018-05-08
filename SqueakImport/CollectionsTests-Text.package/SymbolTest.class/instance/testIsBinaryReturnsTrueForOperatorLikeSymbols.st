testing - testing
testIsBinaryReturnsTrueForOperatorLikeSymbols
	self assert: #+ isBinary.
	self assert: #>>= isBinary.
	self assert: #| isBinary.