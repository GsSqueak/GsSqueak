project window creation
serviceOpenProjectFromFile
	"Answer a service for opening a .pr project file"

	^ (SimpleServiceEntry 
		provider: self 
		label: 'load as project' translatedNoop
		selector: #openFromDirectoryAndFileName:
		description: 'open project from file' translatedNoop
		buttonLabel: 'load' translatedNoop
	)
		argumentGetter: [ :fileList | fileList dirAndFileName]