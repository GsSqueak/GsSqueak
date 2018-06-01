-signals-morphic
signalConnectionsForOwnerChain
	^ self
		valueOfProperty: #signalConnectionsForOwnerChain
		ifAbsentPut: [Dictionary new]