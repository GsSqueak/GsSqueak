testing - testing
testIsBinaryReturnsFalseForUnarySelectors
	self deny: #timesRepeat isBinary.
	self deny: #once isBinary.
	self deny: #isBinary isBinary.