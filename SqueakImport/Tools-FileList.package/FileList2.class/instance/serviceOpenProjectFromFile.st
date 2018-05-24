own services
serviceOpenProjectFromFile
	"Answer a service for opening a .pr project file"

	^ SimpleServiceEntry 
		provider: self 
		label: 'load as project' translatedNoop
		selector: #openProjectFromFile
		description: 'open project from file' translatedNoop
		buttonLabel: 'load' translatedNoop