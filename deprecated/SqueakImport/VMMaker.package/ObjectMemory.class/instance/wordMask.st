constants
wordMask
	"Answer a bit mask for an object word, either 32 or 64 bits."

	<inline: true>
	^self
		cCode: 'WORD_MASK'
		inSmalltalk: [(1 bitShift: self bytesPerWord * 8) - 1]
