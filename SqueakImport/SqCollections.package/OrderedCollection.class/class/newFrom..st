instance creation
newFrom: aCollection 
	"Answer an instance of me containing the same elements as aCollection."

	^(self new: aCollection size)
		addAll: aCollection;
		yourself

"	OrderedCollection newFrom: {1. 2. 3}
	{1. 2. 3} as: OrderedCollection
	{4. 2. 7} as: SortedCollection
"