*Morphic-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#PolygonMorph. #authoringPrototype. 'Polygon'	translatedNoop. 'A straight-sided figure with any number of sides' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#PolygonMorph. #authoringPrototype. 'Polygon'	translatedNoop. 'A straight-sided figure with any number of sides' translatedNoop}
						forFlapNamed: 'Supplies'.]