own services
serviceCopyName
	^ SimpleServiceEntry
		provider: self
		label: 'copy name to clipboard' translatedNoop
		selector: #copyName
		description: 'copy name to clipboard' translatedNoop