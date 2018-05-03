primitives
primitiveSerialPortRead: portNum into: array startingAt: startIndex count: count 
	| bytesRead |
	self primitive: 'primitiveSerialPortRead'
		parameters: #(SmallInteger ByteArray SmallInteger SmallInteger ).

	interpreterProxy success: (startIndex >= 1 and: [startIndex + count - 1 <= (interpreterProxy byteSizeOf: array cPtrAsOop)]).
	"adjust for zero-origin indexing"
	bytesRead := self
			serialPort: portNum
			Read: count
			Into: array + startIndex - 1.
	^ bytesRead asSmallIntegerObj