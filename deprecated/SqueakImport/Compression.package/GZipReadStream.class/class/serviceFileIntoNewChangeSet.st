fileIn/Out
serviceFileIntoNewChangeSet
	"Answer a service for filing in an entire file"
	^ SimpleServiceEntry
		provider: self
		label: 'install into new change set' translatedNoop
		selector: #fileIntoNewChangeSet:
		description: 'install the decompressed contents of the file as a body of code in the image: create a new change set and file-in the selected file into it' translatedNoop
		buttonLabel: 'install' translatedNoop