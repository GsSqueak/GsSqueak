fileIn/Out
serviceLoadMorphFromFile
	"Answer a service for loading a .morph file"

	^ SimpleServiceEntry 
		provider: self 
		label: 'load as morph' translatedNoop
		selector: #fromFileName:
		description: 'load as morph' translatedNoop
		buttonLabel: 'load' translatedNoop