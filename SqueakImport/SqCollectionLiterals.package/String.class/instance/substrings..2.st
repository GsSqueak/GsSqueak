*SqCollectionLiterals-*SqCollectionLiterals-converting
substrings
	"Answer an array of the substrings that compose the receiver."
	| result end beginning |
	result := WriteStream on: (Array new: 10).
	end := 0.
	"find one substring each time through this loop"
	[ "find the beginning of the next substring"
	beginning := end+1.
	[beginning <= self size and:[(self at: beginning) isSeparator]]
		whileTrue:[beginning := beginning + 1].
	beginning <= self size] whileTrue: [
		"find the end"
		end := beginning.
		[end <= self size and:[(self at: end) isSeparator not]]
			whileTrue:[end := end + 1].
		end := end - 1.
		result nextPut: (self copyFrom: beginning to: end).
	].
	^result contents
