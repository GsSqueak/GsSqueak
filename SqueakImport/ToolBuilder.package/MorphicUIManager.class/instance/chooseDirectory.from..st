ui requests
chooseDirectory: label from: dir
	"Let the user choose a directory"

	^DirectoryChooserDialog openOn: dir label: label