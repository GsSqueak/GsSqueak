all
indexFor: char

	| triplet |
	map size > 511 ifTrue: [
		cacheIndex := 512 atRandom.
		triplet := self cache at: cacheIndex.
		triplet ifNotNil: [map removeKey: (triplet at: 1) ifAbsent: []].
		^ cacheIndex
	].
	^ (cacheIndex := cacheIndex + 1 \\ 512) + 1.
