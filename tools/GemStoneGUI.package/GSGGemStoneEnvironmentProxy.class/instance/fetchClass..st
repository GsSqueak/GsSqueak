querying
fetchClass: queryCode

	^ (self repository fetch: self classProxyDescription query: queryCode)
		ifNotNil: [:class | class environment: self]