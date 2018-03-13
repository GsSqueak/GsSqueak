api
systemCategoryFor: class

	| topazOutput |
	topazOutput := self run: '(ClassOrganizer cachedOrganizer categories detectAssociations: [:assoc | assoc value includes: ' , class , '] ifNone: [nil]) key'.
	^ (topazOutput at: 1) asSymbol