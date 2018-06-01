class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#TrashCanMorph. #new. 'Trash' translatedNoop. 'A tool for discarding objects' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#TrashCanMorph. #new. 'Trash'	 translatedNoop. 'A tool for discarding objects' translatedNoop}
						forFlapNamed: 'Widgets'.
						cl registerQuad: {#TrashCanMorph. #new. 'Trash' translatedNoop. 'A tool for discarding objects' translatedNoop}
						forFlapNamed: 'Scripting']