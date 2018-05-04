constants
longSizeMask
	"One of the base header word bit fields. For 64-bit word size, lose
	the 4 bit in temp 64-bit chunk format."

	<inline: true>
	^self
		cCode: 'LONG_SIZE_MASK'
		inSmalltalk: [self wordMask - 16rFF + self sizeMask]
