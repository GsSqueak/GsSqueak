constants
shiftForWord

	<inline: true>
	^self
		cCode: 'SHIFT_FOR_WORD'
		inSmalltalk: [(self bytesPerWord log: 2) rounded]
