removing
removeLast: n
	"Same as super without trying to store nil in the emptied slots of array."

	| firstIndexToRemove result |
	n < 1 ifTrue: [ self errorNoSuchElement ].
	(firstIndexToRemove := lastIndex - n + 1) < firstIndex ifTrue: [ self errorNotEnoughElements ].
	result := array copyFrom: firstIndexToRemove to: lastIndex.
	lastIndex := firstIndexToRemove - 1.
	^result