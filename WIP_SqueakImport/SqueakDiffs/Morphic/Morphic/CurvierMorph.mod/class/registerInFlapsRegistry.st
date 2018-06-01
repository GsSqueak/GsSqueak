class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | 
			cl registerQuad: #(#CurvierMorph #authoringPrototype 'Curvier' 'A curve' ) forFlapNamed: 'PlugIn Supplies'.
			cl registerQuad: #(#CurvierMorph #authoringPrototype 'Curvier' 'A curve' ) forFlapNamed: 'Supplies']