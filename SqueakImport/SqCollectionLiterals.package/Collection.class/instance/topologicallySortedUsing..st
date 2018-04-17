converting
topologicallySortedUsing: aSortBlock 
	"Answer a SortedCollection whose elements are the elements of the 
	receiver, but topologically sorted. The topological order is defined 
	by the argument, aSortBlock."

	| aSortedCollection |
	aSortedCollection := SortedCollection new: self size.
	aSortedCollection sortBlock: aSortBlock.
	self do: [:each | aSortedCollection addLast: each].	"avoids sorting"
	^ aSortedCollection sortTopologically
