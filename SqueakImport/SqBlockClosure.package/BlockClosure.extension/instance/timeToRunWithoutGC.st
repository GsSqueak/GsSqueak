*SqBlockClosure-evaluating
timeToRunWithoutGC
	"Answer the number of milliseconds taken to execute this block without GC time."

	^(Smalltalk vmParameterAt: 8) + 
		(Smalltalk vmParameterAt: 10) +
		self timeToRun -
		(Smalltalk vmParameterAt: 8) - 
		(Smalltalk vmParameterAt: 10)
