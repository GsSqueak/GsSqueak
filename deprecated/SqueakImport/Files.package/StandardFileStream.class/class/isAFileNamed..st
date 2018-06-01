file creation
isAFileNamed: fileName
	"Answer true if a file of the given name exists."

	^ FileDirectory default fileExists: fileName