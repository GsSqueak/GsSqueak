class list
hierarchicalClassList

	"classNames are an arbitrary collection of classNames of the system.
	Reorder those class names so that they are sorted and indented by inheritance"
	| hierarchyTree |
	"Creating the hierarchy is *really slow* for the full class list. Skip it for now."
	self selectedSystemCategory = SystemOrganizer allCategory
		ifTrue: [^ self defaultClassList].
	
	hierarchyTree := self environment 
						hierarchyTreeOfClassNames: self defaultClassList sorted
						env: self envId.
	^ self
		flattenHierarchyTree: hierarchyTree
		on: OrderedCollection new
		indent: ''.