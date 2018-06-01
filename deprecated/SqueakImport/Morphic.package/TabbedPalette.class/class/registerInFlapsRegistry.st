class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: #(TabbedPalette	authoringPrototype	'TabbedPalette'	'A structure with tabs')
						forFlapNamed: 'Supplies'.]