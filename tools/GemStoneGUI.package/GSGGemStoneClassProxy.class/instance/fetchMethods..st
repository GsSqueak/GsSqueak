querying
fetchMethods: queryCode

	| methods |
	methods := self repository
					fetch: #Array -> {self methodProxyClass name}
					query: queryCode.
	methods do: [:method | method inClass: self].
	^ methods