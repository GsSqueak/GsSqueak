private-debugger
cachesStack

	^ false
	"^self selector == #valueUninterruptably
		and: [self receiver class == BlockContext]"