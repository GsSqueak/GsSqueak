class list
hierarchicalClassList

	| hierarchyTree classesToSort |
	classesToSort := self defaultClassList.
	classesToSort ifEmpty: [^ #()].
	classesToSort size > 50 ifTrue: [^ classesToSort].
	
	hierarchyTree := self environment	hierarchyTreeOfClassNames: classesToSort.
	^ self
		flattenHierarchyTree: hierarchyTree
		on: OrderedCollection new
		indent: ''.