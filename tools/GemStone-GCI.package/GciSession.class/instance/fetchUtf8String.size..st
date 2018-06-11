wrapper
fetchUtf8String: anOop size: bufferSize

	| bytes returnedSize requiredSizeMemory requiredSize |
	bytes := ByteArray new: bufferSize.
	requiredSizeMemory := ByteArray new: self gciLibrary wordSize.
	self gciLibrary errorType newDuring: [:error |
		returnedSize := self gciLibrary
							GciTsFetchUtf8: self sessionHandle
							a: anOop
							a: bytes
							a: bytes size
							a: requiredSizeMemory
							err: error.
		returnedSize < 0 ifTrue: [self error: 'GciError']].
	requiredSize := requiredSizeMemory integerAt: 1 size: self gciLibrary wordSize signed: true.
	^ requiredSize > bytes size
		ifTrue: [self fetchUtf8String: anOop size: requiredSize]
		ifFalse: [bytes copyFrom: 1 to: returnedSize]