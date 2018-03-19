-widgets-signals-processing
signalConnections
	^ self
		valueOfProperty: #signalConnections
		ifAbsentPut: [Dictionary new]