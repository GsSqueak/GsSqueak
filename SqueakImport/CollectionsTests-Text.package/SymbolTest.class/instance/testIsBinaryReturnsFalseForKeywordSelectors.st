testing - testing
testIsBinaryReturnsFalseForKeywordSelectors
	self deny: #do: isBinary.
	self deny: #ifTrue:ifFalse: isBinary.
	self deny: #with:with:with:with: isBinary.