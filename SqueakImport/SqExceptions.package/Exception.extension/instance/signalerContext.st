*SqExceptions-handling
signalerContext
	"Find the first sender of signal(:)"
	self shouldBeImplemented
	"^ signalContext findContextSuchThat: [:ctxt |
		(ctxt receiver == self or: [ctxt receiver == self class]) not]"
