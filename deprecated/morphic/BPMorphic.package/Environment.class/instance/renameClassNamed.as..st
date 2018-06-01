classes and traits
renameClassNamed: oldName as: newName 
	declarations
		at: oldName
		ifPresent: [:class | class rename: newName]
		ifAbsent: [Transcript cr; show: 'Class-rename for ' , oldName , ' ignored because ' , oldName , ' does not exist.']