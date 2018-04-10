own services
serviceDeleteFile
	^ (SimpleServiceEntry
		provider: self
		label: 'delete' translatedNoop
		selector: #deleteFile)
		description: 'delete the seleted item' translatedNoop