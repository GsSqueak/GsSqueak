constants
allButRootBit
	"Mask for root bit"

	<inline: true>
	^self
		cCode: 'ALL_BUT_ROOT_BIT'
		inSmalltalk: [self wordMask - self rootBit]
