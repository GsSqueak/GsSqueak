querying
fetchObject: queryCode

	^ (self repository fetch: self objectProxyClass name query: queryCode)
		ifNotNil: [:object | object environment: self]