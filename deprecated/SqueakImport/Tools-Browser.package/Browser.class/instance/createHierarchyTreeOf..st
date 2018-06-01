class list
createHierarchyTreeOf: col

	"Create a tree from a flat collection of classes"
	| transformed |
	transformed := col collect: [:ea | 
		| childs indexes |
		childs := col select: [:class | class isTrait not and: [class superclass = ea]].
		indexes := childs collect: [:child | col indexOf: child].
		ea -> indexes].
	transformed copy do: [:ea |
		ea value: (ea value collect: [:idx | 
			| val |
			val := transformed at: idx.
			transformed at: idx put: nil.
			val])].
	^ transformed select: [:ea | ea notNil].
