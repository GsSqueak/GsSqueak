*Morphic-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#CurveMorph, #authoringPrototype. 'Curve'	translatedNoop, 'A curve' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#CurveMorph. #authoringPrototype. 'Curve'	 translatedNoop. 'A curve' translatedNoop}
						forFlapNamed: 'Supplies'.]