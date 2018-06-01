evaluating
value: firstArg value: secondArg
	"Send the message with these arguments and answer the return value"

	^receiver perform: selector with: firstArg with: secondArg