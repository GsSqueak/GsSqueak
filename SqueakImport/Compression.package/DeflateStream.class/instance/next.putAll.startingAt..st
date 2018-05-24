accessing
next: bytesCount putAll: aCollection startingAt: startIndex

	| start count max |
	bytesCount > 0 ifFalse: [ ^aCollection ].
	aCollection species = collection species
		ifFalse:
			[startIndex to: startIndex + bytesCount - 1 do: [:i | self nextPut: (aCollection at: i)].
			^aCollection].
	start := startIndex.
	count := bytesCount.
	[count = 0] whileFalse:[
		position = writeLimit ifTrue:[self deflateBlock].
		max := writeLimit - position.
		max > count ifTrue:[max := count].
		collection replaceFrom: position+1
			to: position+max
			with: aCollection
			startingAt: start.
		start := start + max.
		count := count - max.
		position := position + max].
	^aCollection