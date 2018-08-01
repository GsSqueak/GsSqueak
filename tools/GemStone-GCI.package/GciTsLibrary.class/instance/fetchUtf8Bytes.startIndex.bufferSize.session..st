wrapper
fetchUtf8Bytes: anOop startIndex: startIndex bufferSize: bufferSize session: gciSession

	| buffer utf8Oop utf8OopMemory resultSize result |
	buffer := ByteArray new: bufferSize.
	utf8OopMemory := ByteArray new: self wordSize.
	self errorType newDuring: [:error |
		resultSize := self GciTsFetchUtf8Bytes: gciSession sessionHandle
						a: anOop
						a: startIndex
						a: buffer
						a: bufferSize
						a: utf8OopMemory
						err: error
						a: 0.
		resultSize < 0 ifTrue: [self error: 'Gci FetchUtf8Bytes Error']].
	utf8Oop := utf8OopMemory integerAt: 1 size: self wordSize signed: false.
	result := buffer copyFrom: 1 to: resultSize.
	self halt.
	^ resultSize < bufferSize
		ifTrue: [result]
		ifFalse: [result , (self 
							fetchUtf8Bytes: ((utf8Oop = 0)
												ifTrue: [anOop]
												ifFalse: [utf8Oop])
							startIndex: startIndex + bufferSize
							bufferSize: bufferSize
							session: gciSession)]