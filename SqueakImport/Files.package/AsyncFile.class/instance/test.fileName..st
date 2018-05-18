as yet unclassified
test: byteCount fileName: fileName
	"AsyncFile new test: 10000 fileName: 'testData'"

	| buf1 buf2 bytesWritten bytesRead |
	buf1 := String new: byteCount withAll: $x.
	buf2 := String new: byteCount.
	self open: ( FileDirectory default fullNameFor: fileName) forWrite: true.
	self primWriteStart: fileHandle
		fPosition: 0
		fromBuffer: buf1
		at: 1
		count: byteCount.
	semaphore wait.
	bytesWritten := self primWriteResult: fileHandle.
	self close.
	
	self open: ( FileDirectory default fullNameFor: fileName) forWrite: false.
	self primReadStart: fileHandle fPosition: 0 count: byteCount.
	semaphore wait.
	bytesRead :=
		self primReadResult: fileHandle
			intoBuffer: buf2
			at: 1
			count: byteCount.
	self close.

	buf1 = buf2 ifFalse: [self error: 'buffers do not match'].
	^ 'wrote ', bytesWritten printString, ' bytes; ',
	   'read ', bytesRead printString, ' bytes'
