as yet unclassified
hasEquivalentIn: aCollection

	^aCollection anySatisfy: [ :each | 
		each withoutListWrapper = item withoutListWrapper]