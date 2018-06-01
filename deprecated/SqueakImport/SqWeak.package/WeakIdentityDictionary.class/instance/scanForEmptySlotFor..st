private
scanForEmptySlotFor: anObject
	"Scan the array for the first empty slot marked by vacuum object.
	Answer the index of that slot or raise an error if no slot is found.
	Ignore the slots that have been garbage collected (those containing nil)."

	| index start |	
	index := start := anObject scaledIdentityHash \\ array size + 1.
	[ 
		(array at: index) 
			ifNotNil:
				[:element | element == vacuum ifTrue: [ ^index ] ].
		(index := index \\ array size + 1) = start ] whileFalse.
	self errorNoFreeSpace