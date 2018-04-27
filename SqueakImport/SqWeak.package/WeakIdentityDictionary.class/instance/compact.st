private
compact
	"Reduce the size of array so that the load factor will be ~75%."
	
	| newCapacity |
	tally := self slowSize.
	newCapacity := self class goodPrimeAtLeast: tally * 4 // 3.
	self growTo: newCapacity