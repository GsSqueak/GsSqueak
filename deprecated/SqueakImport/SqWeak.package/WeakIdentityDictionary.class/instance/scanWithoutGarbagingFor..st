private
scanWithoutGarbagingFor: anObject
	"Scan the array for the first slot containing either
	- a vacuum object indicating an empty slot
	- or a binding whose key matches anObject.
	Answer the index of that slot or raise an error if no slot is found.
	Ignore the slots that have been garbage collected (those containing nil)"

	| index start |	
	index := start := anObject scaledIdentityHash \\ array size + 1.
	[ 
		(array at: index) 
			ifNotNil:
				[:element | (element == vacuum or: [ element key == anObject ])
					ifTrue: [ ^index ] ].
		(index := index \\ array size + 1) = start ] whileFalse.
	self errorNoFreeSpace