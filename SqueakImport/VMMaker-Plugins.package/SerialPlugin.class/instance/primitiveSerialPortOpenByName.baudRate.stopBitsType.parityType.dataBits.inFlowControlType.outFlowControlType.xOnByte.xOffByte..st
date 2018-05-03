primitives
primitiveSerialPortOpenByName: deviceName baudRate: baudRate stopBitsType: stopBitsType parityType: parityType dataBits: dataBits inFlowControlType: inFlowControl outFlowControlType: outFlowControl xOnByte: xOnChar xOffByte: xOffChar

	| cString |
	<var: #cString type: 'char *'>
	self primitive: 'primitiveSerialPortOpenByName'
		parameters: #(ByteArray SmallInteger SmallInteger SmallInteger SmallInteger SmallInteger SmallInteger SmallInteger SmallInteger ).
	cString := self allocateTerminatedString: deviceName.
	self cCode: 'serialPortOpenByName(
			cString, baudRate, stopBitsType, parityType, dataBits,
			inFlowControl, outFlowControl, xOnChar, xOffChar)'