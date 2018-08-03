wrapper
fetchUtf8: anOop size: bufferSize session: gciSession

	| bytes returnedSize requiredSizeMemory requiredSize |
	bytes := ByteArray new: bufferSize.
	requiredSizeMemory := ByteArray new: self wordSize.
	self errorType newDuring: [:error |
		returnedSize := self GciTsFetchUtf8: gciSession sessionHandle
							a: anOop
							a: bytes
							a: bytes size
							a: requiredSizeMemory
							err: error.
		returnedSize < 0 ifTrue: [self error: 'Gci FetchUtf8 Error']].
	requiredSize := requiredSizeMemory integerAt: 1 size: self wordSize signed: true.
	^ bytes size <= returnedSize
		ifTrue: [self fetchUtf8: anOop size: 2 * requiredSize session: gciSession]
		ifFalse: [(bytes copyFrom: 1 to: returnedSize) asString]