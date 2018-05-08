removing
removeAll

	tally = 0 ifTrue: [ ^self ].
	bytes atAllPut: 0. "Unlike most #removeAll implementations, we don't allocate a new ByteArray here, because this is a bit more efficient. The VM would have to fill the new array with zeroes anyway."
	tally := 0
