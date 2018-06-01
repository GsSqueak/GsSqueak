other
registry
	^ Registry
		ifNil: [Registry := IdentityDictionary new]
