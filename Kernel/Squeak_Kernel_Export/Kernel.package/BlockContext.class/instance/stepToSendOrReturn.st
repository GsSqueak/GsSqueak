system simulation
stepToSendOrReturn
	pc = startpc ifTrue: [
		"pop args first"
		self numArgs timesRepeat: [self step]].
	^super stepToSendOrReturn