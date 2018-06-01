accessing
contentStream
	semaphore wait.
	fileStream
		ifNotNil: [^ fileStream].
	^ content
		ifNotNil: [content isString
				ifTrue: [self error: 'Error loading ' , self url printString]
				ifFalse: [content contentStream]]