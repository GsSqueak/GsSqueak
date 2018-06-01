objects from disk
referencePool
	^ self 
		valueOfProperty: #References 
		ifAbsentPut: [WeakValueDictionary new]
