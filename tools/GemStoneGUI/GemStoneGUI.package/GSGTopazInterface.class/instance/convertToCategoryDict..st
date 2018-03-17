parsing topaz output
convertToCategoryDict: topazOutput

	| categoryDict currentCategory |
	categoryDict := Dictionary new.
	topazOutput linesDo: [:line |
		(line beginsWith: '  ') 
			ifFalse: [
				currentCategory := line asSymbol.
				categoryDict at: currentCategory put: OrderedCollection new]
			ifTrue: [
				| selector |
				selector := line withBlanksTrimmed asSymbol.
				(categoryDict at: currentCategory) add: selector].
		].
	^ categoryDict