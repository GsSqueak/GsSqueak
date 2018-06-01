constants
allButTypeMask
	"Mask for type field"

	<inline: true>
	^self
		cCode: 'ALL_BUT_TYPE_MASK'
		inSmalltalk: [self wordMask - TypeMask]
