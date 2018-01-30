fileIn/Out
serviceLoadMorphFromFile
	"Answer a service for loading a .morph file"
	^ SimpleServiceEntry
		provider: self
		label: 'load as morph'
		selector: #fromFileName:
		description: 'load as morph'
		buttonLabel: 'load'