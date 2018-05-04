primitives
primitiveSerialPortWriteByName: deviceName from: array startingAt: startIndex count: count 
	| bytesWritten cString |
	<var: #cString type: 'char *'>
	self primitive: 'primitiveSerialPortWriteByName'
		parameters: #(ByteArray ByteArray SmallInteger SmallInteger ).
	interpreterProxy success: (startIndex >= 1 and: [startIndex + count - 1 <= (interpreterProxy byteSizeOf: array cPtrAsOop)]).
	interpreterProxy failed
		ifFalse: [cString := self allocateTerminatedString: deviceName.
				bytesWritten := self
						serialPort: cString
						Write: count
						FromByName: array + startIndex - 1].
	^ bytesWritten asSmallIntegerObj