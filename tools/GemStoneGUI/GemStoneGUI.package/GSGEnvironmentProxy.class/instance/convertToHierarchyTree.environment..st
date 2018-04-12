deserializing
convertToHierarchyTree: topazOutput environment: environmentProxy

	| tree superclassInfo classProxy |
	tree := OrderedCollection new.
	superclassInfo := Dictionary new.
	topazOutput linesDo: [:line |
		| depth element treeNode |
		depth := line findFirst: [:char | char isSeparator not].
		element := (line copyFrom: depth to: line size) asSymbol.
		classProxy := self classProxyNamed: element.
		treeNode :=  classProxy -> OrderedCollection new.
		superclassInfo at: depth put: treeNode.
		depth > 1
			ifTrue: [(superclassInfo at: depth - 1) value add: treeNode]
			ifFalse: [tree add: treeNode]].
	^ tree