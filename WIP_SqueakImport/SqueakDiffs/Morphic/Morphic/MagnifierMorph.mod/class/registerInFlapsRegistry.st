class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#MagnifierMorph. #newRound. 'Magnifier' translatedNoop.	'A magnifying glass' translatedNoop}
						forFlapNamed: 'Widgets']