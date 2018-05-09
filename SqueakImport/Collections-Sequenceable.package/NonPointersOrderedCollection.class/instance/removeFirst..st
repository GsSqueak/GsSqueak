removing
removeFirst: n 
	"Same as super without trying to store nil in the emptied slots of array."

	| lastIndexToRemove result |
	n < 1 ifTrue: [ self errorNoSuchElement ].
	lastIndex < (lastIndexToRemove := firstIndex + n - 1) ifTrue: [ self errorNotEnoughElements ].
	result := array copyFrom: firstIndex to: lastIndexToRemove.
	firstIndex := lastIndexToRemove + 1.
	^result