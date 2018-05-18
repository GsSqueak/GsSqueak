accessing
sortedCounts
	"Answer with a collection of counts with elements, sorted by decreasing
	count."

	^(Array new: contents size streamContents: [ :stream |
		contents associationsDo: [ :each |
			stream nextPut: each value -> each key ] ])
		sort: [:x :y | x >= y ];
		yourself