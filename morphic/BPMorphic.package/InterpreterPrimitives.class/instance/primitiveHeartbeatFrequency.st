system control primitives
primitiveHeartbeatFrequency
	"Answer the heartbeat frequency in beats per second. If the argument
	is true, reset the frequency measure."
	| _gsSqueakTemp_reset |
	_gsSqueakTemp_reset := argumentCount = 1
				and: [self stackTop = objectMemory trueObject].
	self
		pop: argumentCount + 1
		thenPush: (self
				positive32BitIntegerFor: (self ioHeartbeatFrequency: _gsSqueakTemp_reset))