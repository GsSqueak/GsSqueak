querying
fetchClass: queryCode

	^ (self repository fetch: self classProxyClass name query: queryCode)
		ifNotNil: [:class | class environment: self]