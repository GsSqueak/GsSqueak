private-decoding
nextWord
	^self next + (self next bitShift: 8)