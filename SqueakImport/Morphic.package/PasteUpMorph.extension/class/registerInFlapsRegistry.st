*Morphic-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#PasteUpMorph. #authoringPrototype. 'Playfield'	 translatedNoop. 'A place for assembling parts or for staging animations' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#PasteUpMorph. #authoringPrototype. 'Playfield' translatedNoop. 'A place for assembling parts or for staging animations' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#PasteUpMorph. #authoringPrototype. 'Playfield' translatedNoop. 'A place for assembling parts or for staging animations' translatedNoop}
						forFlapNamed: 'Scripting']