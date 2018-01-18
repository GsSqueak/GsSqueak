objects from disk
referencePool	^ self		valueOfProperty: #References		ifAbsentPut: [OrderedCollection new]