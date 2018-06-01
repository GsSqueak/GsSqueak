private-heap
downHeap: anIndex
	"Check the heap downwards for correctness starting at anIndex.
	 Everything above (i.e. left of) anIndex is ok."

	| childIndex childValue index value |
	index := anIndex.
	value := array at: anIndex.
	[ (childIndex := 2 * index) >= tally or: [
		"Select the child with the larger value. We know there are two children."
		childValue := array at: childIndex.
		(sortBlock
			ifNil: [ (array at: childIndex + 1) <= childValue ]
			ifNotNil: [ sortBlock value: (array at: childIndex + 1) value: childValue ])
			ifTrue: [ 
				childValue := array at: (childIndex := childIndex + 1) ].
		"Check if the value at index is at the right position."
		sortBlock
			ifNil: [ value <= childValue ]
			ifNotNil: [ sortBlock value: value value: childValue ] ] ]
		whileFalse: [
			"Move value downwards the tree."
			array at: index put: childValue.
			indexUpdateBlock ifNotNil: [ indexUpdateBlock value: childValue value: index ].
			"Contine from childIndex"
			index := childIndex ].
	childIndex = tally ifTrue: [ "Special case: there's only one child."
		"Check if the value at index is at the right position."
		childValue := array at: childIndex.
		(sortBlock
			ifNil: [ value <= childValue ]
			ifNotNil: [ sortBlock value: value value: childValue ]) 
			ifFalse: [
				"Move value downwards the tree."
				array at: index put: childValue.
				indexUpdateBlock ifNotNil: [ indexUpdateBlock value: childValue value: index ].
				"Contine from childIndex"
				index := childIndex ] ].
	array at: index put: value.
	indexUpdateBlock ifNotNil: [ indexUpdateBlock value: value value: index ]