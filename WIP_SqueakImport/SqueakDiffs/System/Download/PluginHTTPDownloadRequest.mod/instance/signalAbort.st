accessing
signalAbort
	fileStream ifNotNil: [
		fileStream close].
	fileStream := nil.
	super signalAbort.