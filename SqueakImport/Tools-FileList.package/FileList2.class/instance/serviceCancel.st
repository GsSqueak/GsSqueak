own services
serviceCancel
	"Answer a service for hitting the cancel button"

	^ (SimpleServiceEntry new
		provider: self 
		label: 'cancel' translatedNoop
		selector: #cancelHit 
		description: 'hit here to cancel ' translatedNoop)
		buttonLabel: 'cancel' translatedNoop