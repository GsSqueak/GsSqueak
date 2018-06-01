initialize-release
release
	debugger ifNotNil:
		[debugger interruptedProcess ifNotNil:
			[:p |	p isTerminated ifFalse:
				[p terminate]]].