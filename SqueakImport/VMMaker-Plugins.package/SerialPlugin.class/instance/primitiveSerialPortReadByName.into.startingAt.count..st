primitives
primitiveSerialPortReadByName: deviceName into: array startingAt: startIndex count: count 
	| bytesRead cString |
	<var: #cString type: 'char *'>
	self primitive: 'primitiveSerialPortReadByName'
		parameters: #(ByteArray ByteArray SmallInteger SmallInteger ).

	interpreterProxy success: (startIndex >= 1 and: [startIndex + count - 1 <= (interpreterProxy byteSizeOf: array cPtrAsOop)]).
	cString := self allocateTerminatedString: deviceName.
	"adjust for zero-origin indexing"
	bytesRead := self
			serialPort: cString
			Read: count
			IntoByName: array + startIndex - 1.
	^ bytesRead asSmallIntegerObj