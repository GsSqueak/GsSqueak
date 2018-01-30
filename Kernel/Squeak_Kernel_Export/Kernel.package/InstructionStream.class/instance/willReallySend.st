testing
willReallySend
	"Answer whether the next bytecode is a real message-send, not blockCopy:."
	| method |
	method := self method.
	^method encoderClass isRealSendAt: pc in: method