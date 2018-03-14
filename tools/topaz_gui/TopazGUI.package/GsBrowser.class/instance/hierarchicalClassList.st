class list
hierarchicalClassList

	"Creating the hierarchy is *really slow* for the full class list. Skip it for now."
	self selectedSystemCategory = SystemOrganizer allCategory
		ifTrue: [^ self defaultClassList].
		
	^ self
		flattenHierarchyTree: (self topazProxy hierarchyTreeForCategory: self selectedSystemCategory env: self envId)
		on: OrderedCollection new
		indent: ''.