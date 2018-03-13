parsing topaz output
convertToHierarchyTree: topazOutput

	| tree superclassInfo |
	tree := OrderedCollection new.
	superclassInfo := Dictionary new.
	topazOutput linesDo: [:line |
		| depth element treeNode |
		depth := line findFirst: [:char | char isSeparator not].
		element := (line copyFrom: depth to: line size) asSymbol.
		treeNode :=  element -> OrderedCollection new.
		superclassInfo at: depth put: treeNode.
		depth > 1
			ifTrue: [(superclassInfo at: depth - 1) value add: treeNode]
			ifFalse: [tree add: treeNode]].
	^ tree