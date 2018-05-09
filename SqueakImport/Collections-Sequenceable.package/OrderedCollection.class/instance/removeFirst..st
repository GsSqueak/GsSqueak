removing
removeFirst: n 
	"Remove the first n objects into an array."

	| lastIndexToRemove result |
	n < 1 ifTrue: [ self errorNoSuchElement ].
	lastIndex < (lastIndexToRemove := firstIndex + n - 1) ifTrue: [ self errorNotEnoughElements ].
	result := array copyFrom: firstIndex to: lastIndexToRemove.
	array from: firstIndex to: lastIndexToRemove put: nil.
	firstIndex := lastIndexToRemove + 1.
	^result