instance creation
fromQuad: aQuad categoryList: aList
	"Answer an instance of DescriptionForPartsBin from the part-defining quad provided"

	^ self formalName: aQuad third categoryList: aList documentation: aQuad fourth globalReceiverSymbol: aQuad first nativitySelector: aQuad second