exceptionBuilder
messageText
	"Return an exception's message text."

	^messageText == nil
		ifTrue:
			[message == nil
				ifTrue: [super messageText]
				ifFalse: [message lookupClass printString, '>>', message selector asString]]
		ifFalse: [messageText]