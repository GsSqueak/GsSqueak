file menu action
addNewFile
	self 
		addNew: 'File'
		byEvaluating: [:newName | (directory newFileNamed: newName) close]
