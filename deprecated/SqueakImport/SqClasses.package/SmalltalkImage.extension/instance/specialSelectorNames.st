*SqClasses-*SqClasses-*SqClasses-special objects
specialSelectorNames
	"Return a collection with the names of the special selectors."
	
	| arrayOfPairs |
	arrayOfPairs := self specialSelectors.
	^Array new: arrayOfPairs size // 2 streamContents: [ :stream |
		arrayOfPairs pairsDo: [ :selector :numArgs |
			stream nextPut: selector ] ]
