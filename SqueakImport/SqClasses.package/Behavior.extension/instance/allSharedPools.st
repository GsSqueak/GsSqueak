*SqClasses-accessing instances and variables
allSharedPools
	"Answer a Set of the names of the pools (Dictionaries or SharedPool subclasses) that the receiver and the receiver's ancestors share."

	^superclass allSharedPools
