image save/restore
wordSwapped: w
	"Return the given 64-bit integer with its halves in the reverse order."

	<inline: true>
	self isDefinedTrueExpression: 'BYTES_PER_WORD == 8'
		inSmalltalk: [self bytesPerWord = 8]
		comment: 'swap 32-bit ends of a 64-bit object word'
		ifTrue: [^ ((w bitShift: self byte4ShiftNegated) bitAnd: self bytes3to0Mask)
	  					+ ((w bitShift: self byte4Shift) bitAnd: self bytes7to4Mask)]
		ifFalse: [self error: 'This cannot happen.']
