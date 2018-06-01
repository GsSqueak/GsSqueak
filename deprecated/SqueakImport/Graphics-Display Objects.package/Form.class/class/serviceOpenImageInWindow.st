file list services
serviceOpenImageInWindow
	"Answer a service for opening a graphic in a window"

	^ SimpleServiceEntry 
		provider: self 
		label: 'open graphic in a window' translatedNoop
		selector: #openImageInWindow:
		description: 'open a graphic file in a window' translatedNoop
		buttonLabel: 'open' translatedNoop