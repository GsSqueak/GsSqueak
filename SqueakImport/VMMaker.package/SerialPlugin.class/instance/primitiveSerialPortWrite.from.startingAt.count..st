primitives
primitiveSerialPortWrite: portNum from: array startingAt: startIndex count: count 
	| bytesWritten |
	self primitive: 'primitiveSerialPortWrite'
		parameters: #(SmallInteger ByteArray SmallInteger SmallInteger ).

	interpreterProxy success: (startIndex >= 1 and: [startIndex + count - 1 <= (interpreterProxy byteSizeOf: array cPtrAsOop)]).
	interpreterProxy failed
		ifFalse: [bytesWritten := self
						serialPort: portNum
						Write: count
						From: array + startIndex - 1].
	^ bytesWritten asSmallIntegerObj