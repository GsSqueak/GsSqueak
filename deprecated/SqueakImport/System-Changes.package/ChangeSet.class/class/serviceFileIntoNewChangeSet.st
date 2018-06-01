file list services
serviceFileIntoNewChangeSet
	"Answer a service for installing a file into a new change set"

	^ SimpleServiceEntry 
		provider: self 
		label: 'install into new change set'
		selector: #fileIntoNewChangeSet:
		description: 'install the file as a body of code in the image: create a new change set and file-in the selected file into it'
		buttonLabel: 'install'