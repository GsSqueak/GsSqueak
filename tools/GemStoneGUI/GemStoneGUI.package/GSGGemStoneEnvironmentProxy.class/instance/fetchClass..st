querying
fetchClass: queryCode

	| class |
	class := self repository fetch: self classProxyClass name query: queryCode.
	^ class ifNotNil: [class environment: self]