*SqClasses-pool variables
sharedPools
	"Answer a Set of the pool dictionaries declared in the receiver."

	sharedPools == nil
		ifTrue: [^OrderedCollection new]
		ifFalse: [^sharedPools]
