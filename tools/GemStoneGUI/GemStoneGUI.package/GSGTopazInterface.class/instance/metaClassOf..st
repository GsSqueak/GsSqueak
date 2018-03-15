api
metaClassOf: class

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: class , ' theMetaClass'.
	^ (topazOutput at: 1) asSymbol