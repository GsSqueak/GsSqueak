evaluating
receiver: receiver withArguments: argArray executeMethod: compiledMethod
	"Execute compiledMethod against the receiver and the arguments in argArray"

	^receiver withArgs: argArray executeMethod: compiledMethod
