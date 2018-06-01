private-heap
upHeap: anIndex
	"Check the heap upwards for correctness starting at anIndex.
	 Everything below anIndex is ok."

	| index parentValue parentIndex value |
	anIndex = 1 ifTrue: [ ^self ].
	value := array at: (index := anIndex).
	[ index > 1 and: [
		parentValue := array at: (parentIndex := index bitShift: -1).
		sortBlock
			ifNil: [ value <= parentValue ]
			ifNotNil: [ sortBlock value: value value: parentValue ] ] ]
		whileTrue: [
			array at: index put: parentValue.
			indexUpdateBlock ifNotNil: [ indexUpdateBlock value: parentValue value: index ].
			index := parentIndex ].
	array at: index put: value.
	indexUpdateBlock ifNotNil: [ indexUpdateBlock value: value value: index ]