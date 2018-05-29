private-socket
receiveData
	self waitForData.
	^self receiveAvailableData