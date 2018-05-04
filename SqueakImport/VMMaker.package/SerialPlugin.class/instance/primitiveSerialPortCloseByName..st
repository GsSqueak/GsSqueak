primitives
primitiveSerialPortCloseByName: deviceName

	| cString |
	<var: #cString type: 'char *'>
	self primitive: 'primitiveSerialPortCloseByName'
		parameters: #(ByteArray).
	cString := self allocateTerminatedString: deviceName.
	self serialPortCloseByName: cString