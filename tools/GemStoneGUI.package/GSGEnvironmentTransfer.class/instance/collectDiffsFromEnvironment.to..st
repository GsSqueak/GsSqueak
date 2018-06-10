diffing
collectDiffsFromEnvironment: targetEnvironment to: sourceEnvironment

	| classDict |
	self sourceClasses: (self collectClassesIn: sourceEnvironment).
	self targetClasses: (self collectClassesIn: targetEnvironment).
	classDict := self mergeDictionary: self targetClasses with: self sourceClasses.
	'Comparing ' , targetEnvironment , ' to ' , targetEnvironment
		displayProgressFrom: 0
		to: classDict size
		during: [:progress |
			classDict asArray withIndexDo: [:classes :index |
				self collectDiffsFromClass: classes first to: classes second.
				progress value: index]]