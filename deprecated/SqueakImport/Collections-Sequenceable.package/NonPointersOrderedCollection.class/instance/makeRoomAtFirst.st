private
makeRoomAtFirst
	"Same as super without trying to store nil in the emptied slots of array."
	
	| tally newFirstIndex newLastIndex capacity |
	tally := self size.
	capacity := array size.
	tally * 2 >= capacity ifTrue: [ ^self growAtFirst ].
	tally = 0 ifTrue: [ ^self resetTo: capacity + 1 ].
	newFirstIndex := capacity // 2 + 1.
	newLastIndex := newFirstIndex - firstIndex + lastIndex.
	0 to: tally - 1 do: [ :offset |
		array at: newLastIndex - offset put: (array at: lastIndex - offset) ].
	firstIndex := newFirstIndex.
	lastIndex := newLastIndex