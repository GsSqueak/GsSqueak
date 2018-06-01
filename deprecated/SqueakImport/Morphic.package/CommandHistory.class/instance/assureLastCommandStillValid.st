called by programmer
assureLastCommandStillValid
	"If the lastCommand is not valid, set it to nil; answer the lastCommand."

	lastCommand ifNotNil:
		[lastCommand stillValid ifFalse:
			[self cantUndo]].
	^ lastCommand