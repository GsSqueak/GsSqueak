sorting
sort: aSortBlock
	"Like in OrderedCollection, sort the associations according to the sort block."

	tally <= 1 ifTrue: [ ^self ].
	order
		mergeSortFrom: 1
		to: tally
		by: aSortBlock