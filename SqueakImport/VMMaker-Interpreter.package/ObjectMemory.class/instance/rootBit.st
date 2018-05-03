constants
rootBit
	"Next-to-Top bit"

	<inline: true>
	^self
		cCode: 'ROOT_BIT'
		inSmalltalk: [1 bitShift: self bytesPerWord * 8 - 2]
