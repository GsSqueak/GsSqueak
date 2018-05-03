constants
markBit
	"Top bit"

	<inline: true>
	^self
		cCode: 'MARK_BIT'
		inSmalltalk: [1 bitShift: self bytesPerWord*8 - 1]
