own services
serviceGetEncodedText
	^ SimpleServiceEntry
		provider: self
		label: 'view as encoded text' translatedNoop
		selector: #getEncodedText
		description: 'view as encoded text' translatedNoop