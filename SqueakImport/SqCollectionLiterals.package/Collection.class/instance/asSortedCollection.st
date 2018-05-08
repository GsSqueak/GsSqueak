converting
asSortedCollection
	"Answer a SortedCollection whose elements are the elements of the 
	receiver. The sort order is the default less than or equal. 
	Use #sorted: if you don't really need a SortedCollection, but a sorted collection!"
	
	^self as: SortedCollection
