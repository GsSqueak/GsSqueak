own services
serviceGetHex
	^ SimpleServiceEntry
		provider: self
		label: 'view as hex' translatedNoop
		selector: #getHex
		description: 'view as hex' translatedNoop