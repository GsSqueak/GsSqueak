*SqClasses-pool variables
sharedPools
	"Answer a Set of the pool dictionaries declared in the receiver."

	^ poolDictionaries
		ifNil: [OrderedCollection new]
		ifNotNil: [:sharedPools | OrderedCollection withAll: sharedPools]
