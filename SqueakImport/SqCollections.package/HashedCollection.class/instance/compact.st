*SqCollectionLiterals-*SqCollectionLiterals-private
compact
	"Reduce the size of array so that the load factor will be ~75%."
	
	| newCapacity |
	newCapacity := self class goodPrimeAtLeast: tally * 4 // 3.
	self growTo: newCapacity
