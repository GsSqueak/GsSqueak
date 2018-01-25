initialize-release
privRefresh
	"Reinitialize the receiver so that it is in the state it was at its creation."

	pc := startpc.
	self stackp: 0.
	nargs timesRepeat: [  "skip arg popping"
		self nextInstruction selector = #popIntoTemporaryVariable:
			ifFalse: [self halt: 'unexpected bytecode instruction']
	].
