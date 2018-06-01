utilities
signFiles: fileNames in: dirName key: privateKey
	"Sign the files in the current directory and put them into a folder signed."

	|  newNames oldNames |
	oldNames := fileNames collect:[:fileName | dirName , FileDirectory slash, fileName].
	newNames := fileNames collect:[:fileName | dirName , FileDirectory slash, 'signed', FileDirectory slash, fileName].
	CodeLoader
		signFilesFrom: oldNames
		to: newNames
		key: privateKey