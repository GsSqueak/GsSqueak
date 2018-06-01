*Morphic-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#RectangleMorph, #roundRectPrototype, 'RoundRect'	translatedNoop. 'A rectangle with rounded corners' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#RectangleMorph. #authoringPrototype. 'Rectangle' 	translatedNoop. 'A rectangle' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#RectangleMorph. #roundRectPrototype. 'RoundRect'	 translatedNoop. 'A rectangle with rounded corners' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#RectangleMorph. #authoringPrototype. 'Rectangle' 	translatedNoop. 'A rectangle' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.]