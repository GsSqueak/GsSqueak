as yet unclassified
wordingSelector: aSelector
	wordingSelector := aSelector.
	wordingProvider ifNil: [wordingProvider := target]