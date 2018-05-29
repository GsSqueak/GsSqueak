system category list
systemCategorySingleton

	| cat |
	cat := self selectedSystemCategory.
	^ cat ifNil: [Array new]
		ifNotNil: [Array with: cat]