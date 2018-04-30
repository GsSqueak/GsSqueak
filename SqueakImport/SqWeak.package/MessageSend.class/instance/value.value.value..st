evaluating
value: firstArg value: secondArg value: thirdArg
	"Send the message with these arguments and answer the return value"

	^receiver perform: selector with: firstArg with: secondArg with: thirdArg