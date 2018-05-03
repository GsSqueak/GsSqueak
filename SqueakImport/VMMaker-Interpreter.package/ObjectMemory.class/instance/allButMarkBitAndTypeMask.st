constants
allButMarkBitAndTypeMask

	<inline: true>
	^self
		cCode: 'ALL_BUT_MARK_BIT_AND_TYPE_MASK'
		inSmalltalk: [self allButTypeMask - self markBit]
