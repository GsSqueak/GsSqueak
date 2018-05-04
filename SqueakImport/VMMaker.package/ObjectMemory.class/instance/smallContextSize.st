constants
smallContextSize
	"16 indexable fields, calculated as ContextFixedSizePlusHeader + 16 * BytesPerWord"
	"n.b. Unused in Interpreter, but required for StackInterpreter"

	<inline: true>
	^self
		cCode: 'SMALL_CONTEXT_SIZE'
		inSmalltalk: [ContextFixedSizePlusHeader + 16 * self bytesPerWord]
