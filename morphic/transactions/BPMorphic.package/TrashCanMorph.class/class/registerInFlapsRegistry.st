class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | 
			cl registerQuad: #(#TrashCanMorph #new 'Trash' 'A tool for discarding objects' ) forFlapNamed: 'PlugIn Supplies'.
			cl registerQuad: #(#TrashCanMorph #new 'Trash' 'A tool for discarding objects' ) forFlapNamed: 'Widgets'.
			cl registerQuad: #(#TrashCanMorph #new 'Trash' 'A tool for discarding objects' ) forFlapNamed: 'Scripting']