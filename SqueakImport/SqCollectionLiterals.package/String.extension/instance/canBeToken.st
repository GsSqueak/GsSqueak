*SqCollectionLiterals-testing
canBeToken
	"Extracted from #numArgs to allow specialization by subclasses"
	
	^ self allSatisfy: [:c | c tokenish]
