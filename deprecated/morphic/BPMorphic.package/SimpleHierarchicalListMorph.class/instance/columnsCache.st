private - caching
columnsCache
	columnsCache
		ifNil: [self clearColumnsCache].
	^ columnsCache