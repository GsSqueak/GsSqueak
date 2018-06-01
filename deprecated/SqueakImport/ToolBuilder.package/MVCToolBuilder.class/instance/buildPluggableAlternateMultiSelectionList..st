widgets optional
buildPluggableAlternateMultiSelectionList: aSpec
	
	"Trim selector to one argument to match list expectations."
	aSpec setIndex: (aSpec setIndex first: (aSpec setIndex findString: ':')) asSymbol.
	^ self buildPluggableList: aSpec.