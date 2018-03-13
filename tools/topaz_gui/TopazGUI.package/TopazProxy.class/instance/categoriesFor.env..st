api
categoriesFor: class env: envId

	| topazOutput |
	topazOutput := self run: (self codeForPrintingListCreatedBy: 
		'[:class :envId |
			| set |
			set := IdentitySet new.
			class env: envId categorysDo: [:categoryName :selectors | set add: categoryName].
			Array withAll: set] value: ' , class , ' value: ' , envId).
	^ self convertToSymbolList: (topazOutput at: 1)