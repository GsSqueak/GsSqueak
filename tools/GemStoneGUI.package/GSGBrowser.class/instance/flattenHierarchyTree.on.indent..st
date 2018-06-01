class list
flattenHierarchyTree: hierarchy on: col indent: indent

	^ self
		flattenHierarchyTree: hierarchy
		on: col
		indent: indent
		by: '  '.