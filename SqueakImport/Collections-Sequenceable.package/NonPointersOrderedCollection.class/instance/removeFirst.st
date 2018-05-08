removing
removeFirst
	"Same as super without trying to store nil in the emptied slot of array."

	| firstObject |
	firstIndex > lastIndex ifTrue: [ self errorEmptyCollection ].
	firstObject := array at: firstIndex.
	firstIndex := firstIndex + 1.
	^firstObject