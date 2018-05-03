constants
allButMarkBit
	"Mask for mark bit"

	<inline: true>
	^self
		cCode: 'ALL_BUT_MARK_BIT'
		inSmalltalk: [self wordMask - self markBit]
