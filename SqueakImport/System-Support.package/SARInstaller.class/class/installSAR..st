class initialization
installSAR: relativeOrFullName
	FileDirectory splitName: (FileDirectory default fullNameFor: relativeOrFullName)
		to: [ :dir :fileName | (self directory: (FileDirectory on: dir) fileName: fileName) fileIn ]