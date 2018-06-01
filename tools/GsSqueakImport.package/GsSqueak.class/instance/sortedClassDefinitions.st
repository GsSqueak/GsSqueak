dependency sorting
sortedClassDefinitions

	| sorter |
	sorter := MCDependencySorter items: self classDefinitions values.
	sorter externalRequirements ifNotEmpty: [:reqs |
		self notify: 'The following classes could not be resolved: ' , reqs storeString].
	^ sorter orderedItems.