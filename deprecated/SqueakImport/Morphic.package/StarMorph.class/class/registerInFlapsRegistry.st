class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#StarMorph. #authoringPrototype. 'Star' translatedNoop. 'A star' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#StarMorph. #authoringPrototype. 'Star' translatedNoop. 'A star' translatedNoop}
						forFlapNamed: 'Supplies'.]