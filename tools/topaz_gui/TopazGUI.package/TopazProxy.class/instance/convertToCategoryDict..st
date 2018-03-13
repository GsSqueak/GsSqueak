parsing topaz output
convertToCategoryDict: tpzOutput

	| categoryDict currentCategory |
	categoryDict := Dictionary new.
	tpzOutput linesDo: [:line |
		(line beginsWith: 'category ') ifTrue: [
			currentCategory := (line allButFirst: 9) asSymbol.
			categoryDict at: currentCategory put: OrderedCollection new].
		(line beginsWith: '  ') ifTrue: [
			| selector |
			selector := line withBlanksTrimmed asSymbol.
			(categoryDict at: currentCategory) add: selector]].
	^ categoryDict