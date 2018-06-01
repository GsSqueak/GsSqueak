own services
serviceOkay
	"Answer a service for hitting the okay button"

	^ (SimpleServiceEntry new
		provider: self 
		label: 'okay' translatedNoop
		selector: #okHit 
		description: 'hit here to accept the current selection' translatedNoop)
		buttonLabel: 'ok' translatedNoop