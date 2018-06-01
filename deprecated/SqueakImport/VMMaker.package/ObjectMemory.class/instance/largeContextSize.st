constants
largeContextSize
	"56 indexable fields"
	"n.b. Unused in Interpreter, but required for StackInterpreter"

	<inline: true>
	^self
		cCode: 'LARGE_CONTEXT_SIZE'
		inSmalltalk: [CtxtTempFrameStart + 1 + 56 * self bytesPerWord]
