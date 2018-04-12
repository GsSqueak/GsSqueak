accessing
filterableList
	^ (self
			valueOfProperty: #filterableList
			ifAbsent: [false])
		or: [self class filterableLists]