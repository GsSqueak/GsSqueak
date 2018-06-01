removing
removeLast
	"Same as super without trying to store nil in the emptied slot of array."
	
	| lastObject |
	firstIndex > lastIndex ifTrue: [ self errorEmptyCollection ].
	lastObject := array at: lastIndex.
	lastIndex := lastIndex - 1.
	^ lastObject