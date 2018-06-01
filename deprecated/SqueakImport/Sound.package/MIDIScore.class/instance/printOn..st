printing
printOn: stream

	self source
		ifNotNil: [:s | s printOn: stream]
		ifNil: [super printOn: stream].