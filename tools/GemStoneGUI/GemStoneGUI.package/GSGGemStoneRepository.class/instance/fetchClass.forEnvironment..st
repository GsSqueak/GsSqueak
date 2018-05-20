querying
fetchClass: queryCode forEnvironment: anEnvironment

	| class |
	class := self fetch: anEnvironment classProxyClass name asSymbol query: queryCode.
	class ifNotNil: [class environment: anEnvironment].
	^ class