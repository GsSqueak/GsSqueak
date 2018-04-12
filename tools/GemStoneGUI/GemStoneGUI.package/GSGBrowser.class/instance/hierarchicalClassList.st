class list
hierarchicalClassList

	| hierarchyTree classesToSort |
	classesToSort := self defaultClassList.
	classesToSort ifEmpty: [^ #()].
	classesToSort size > 30 ifTrue: [^ classesToSort].
	
	hierarchyTree := self environment
						hierarchyTreeOfClassNames: classesToSort
						environmentId: self envId.
	^ self
		flattenHierarchyTree: hierarchyTree
		on: OrderedCollection new
		indent: ''.