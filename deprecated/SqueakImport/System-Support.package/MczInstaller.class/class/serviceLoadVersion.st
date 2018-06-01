services
serviceLoadVersion
	^ SimpleServiceEntry
		provider: self
		label: 'load' translatedNoop
		selector: #loadVersionFile:
		description: 'load a package version' translatedNoop