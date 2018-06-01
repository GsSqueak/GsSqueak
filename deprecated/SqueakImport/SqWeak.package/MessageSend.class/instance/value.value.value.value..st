evaluating
value: firstArg value: secondArg value: thirdArg value: fourthArg
	"Send the message with these arguments and answer the return value"

	^receiver perform: selector withArguments: { firstArg. secondArg. thirdArg. fourthArg }