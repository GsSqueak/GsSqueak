class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#ClockMorph,	#authoringPrototype.	'Clock' translatedNoop.			'A simple digital clock' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#ClockMorph.	#authoringPrototype.	'Clock' translatedNoop. 'A simple digital clock' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.]