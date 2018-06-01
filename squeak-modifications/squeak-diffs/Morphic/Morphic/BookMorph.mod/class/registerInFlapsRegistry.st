class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#BookMorph	. #nextPageButton. 'NextPage' translatedNoop. 'A button that takes you to the next page' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#BookMorph. #previousPageButton. 'PreviousPage' translatedNoop. 'A button that takes you to the previous page' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#BookMorph. #authoringPrototype. 'Book' translatedNoop. 'A multi-paged structure' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#BookMorph. #nextPageButton. 'NextPage' translatedNoop. 'A button that takes you to the next page' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#BookMorph. #previousPageButton. 'PreviousPage' translatedNoop. 'A button that takes you to the previous page' translatedNoop}
						forFlapNamed: 'Supplies'.
						cl registerQuad: {#BookMorph. #authoringPrototype. 'Book' translatedNoop. 'A multi-paged structure' translatedNoop}
						forFlapNamed: 'Supplies']