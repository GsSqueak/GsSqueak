class list
hierarchicalClassList

	"classNames are an arbitrary collection of classNames of the system.
	Reorder those class names so that they are sorted and indended by inheritance"
	| classes |
	"Creating the hierarchy is *really slow* for the full class list. Skip it for now."
	self selectedSystemCategory = SystemOrganizer allCategory
		ifTrue: [^ self defaultClassList].
		
	classes := self defaultClassList collect: [:sym | self environment classNamed: sym].
	^ self
		flattenHierarchyTree: (self createHierarchyTreeOf: classes)
		on: OrderedCollection new
		indent: ''.