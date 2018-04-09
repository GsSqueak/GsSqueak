class list
flattenHierarchyTree: classHierarchy on: col indent: indent

	^ self
		flattenHierarchyTree: classHierarchy
		on: col
		indent: indent
		by: '  '.