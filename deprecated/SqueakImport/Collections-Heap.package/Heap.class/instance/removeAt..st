removing
removeAt: index
	"Remove the element at the given index and make sure the sorting order is okay."

	index > tally ifTrue: [ self errorSubscriptBounds: index ].
	^self privateRemoveAt: index