api
systemCategoryFor: class

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: '(ClassOrganizer cachedOrganizer categories detectAssociations: [:assoc | assoc value includes: ' , class , '] ifNone: [nil]) key'.
	^ (topazOutput at: 1) asSymbol