testing
willSend
	"Answer whether the next bytecode is a message-send."
	| method |
	method := self method.
	^method encoderClass isSendAt: pc in: method