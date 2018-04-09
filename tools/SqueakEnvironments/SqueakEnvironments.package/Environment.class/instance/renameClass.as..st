classes and traits
renameClass: aClass as: newName 
	^ self
		renameClass: aClass
		from: aClass name
		to: newName