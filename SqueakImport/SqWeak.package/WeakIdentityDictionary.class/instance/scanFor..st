private
scanFor: anObject
	"Scan the array for the first slot containing either
	- a vacuum object indicating an empty slot
	- or a binding whose key matches anObject.
	Answer the index of that slot or raise an error if no slot is found.
	When garbage collected slots are encountered, perform a clean-up."

	| index start rescan |	
	[
		rescan := false.
		index := start := anObject scaledIdentityHash \\ array size + 1.
		[ 
			(array at: index) 
				ifNil:
					["Object at this slot has been garbage collected.
					A rescan is necessary because fixing collisions
					might have moved the target before current index."
					self cleanupIndex: index.
					rescan := true]
				ifNotNil:
					[:element | (element == vacuum or: [ element key == anObject ])
						ifTrue: [ ^index ].
					(index := index \\ array size + 1) = start ] ] whileFalse.
		rescan ] whileTrue.
	self errorNoFreeSpace