classes and traits
renameClass: aClass as: newName 
	^ self
		renameClass: aClass
		from: aClass @env7: name
		to: newName
