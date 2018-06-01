accessing
signalAbort
	loader removeProcess: process.
	self content: 'Retrieval aborted'.
	process ifNotNil: [process terminate]