removing
removeLast: n 
	"Remove the last n objects into an array with last in last position."

	| firstIndexToRemove result |
	n < 1 ifTrue: [ self errorNoSuchElement ].
	(firstIndexToRemove := lastIndex - n + 1) < firstIndex ifTrue: [ self errorNotEnoughElements ].
	result := array copyFrom: firstIndexToRemove to: lastIndex.
	array from: firstIndexToRemove to: lastIndex put: nil.
	lastIndex := firstIndexToRemove - 1.
	^result