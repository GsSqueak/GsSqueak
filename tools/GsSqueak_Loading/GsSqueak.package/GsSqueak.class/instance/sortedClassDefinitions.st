dependency sorting
sortedClassDefinitions

	| sorter |
	sorter :=MCDependencySorter sortItems: self classDefinitions values.
	^ sorter