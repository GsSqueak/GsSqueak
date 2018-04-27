private
fixCollisionsFrom: start
	"The element at start has been removed and replaced by vacuum.
	This method moves forward from there, relocating any entries
	that had been placed below due to collisions with this one."

	| element index |
	index := start.
	[ (element := array at: (index := index \\ array size + 1)) == vacuum ] whileFalse: [
		element
			ifNil:
				[ "The binding at this slot was reclaimed - finish the cleanup"
				array at: index put: vacuum.
				tally := tally - 1 ]
			ifNotNil:
				[| newIndex |
				(newIndex := self scanWithoutGarbagingFor: element key) = index ifFalse: [
					array 
						at: newIndex put: element;
						at: index put: vacuum ] ] ]