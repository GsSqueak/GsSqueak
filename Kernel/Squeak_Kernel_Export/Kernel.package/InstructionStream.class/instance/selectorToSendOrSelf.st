scanning
selectorToSendOrSelf
	"If this instruction is a send, answer the selector, otherwise answer self."

	| method |
	method := self method.
	^method encoderClass selectorToSendOrItselfFor: self in: method at: pc