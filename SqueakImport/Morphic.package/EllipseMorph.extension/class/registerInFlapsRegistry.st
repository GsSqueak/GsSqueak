*Morphic-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#EllipseMorph. #authoringPrototype. 'Ellipse'	 translatedNoop. 'An ellipse or circle' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#EllipseMorph. #authoringPrototype. 'Ellipse' translatedNoop. 'An ellipse or circle' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.]