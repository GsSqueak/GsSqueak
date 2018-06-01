own services
serviceAllFileOptions
	^ {SimpleServiceEntry
		provider: self
		label: 'more...' translatedNoop
		selector: #offerAllFileOptions
		description: 'show all the options available' translatedNoop}