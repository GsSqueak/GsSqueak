*Morphic-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#Workspace. #prototypicalToolWindow.	 'Workspace' translatedNoop.		'A Workspace is a simple window for editing text.  You can later save the contents to a file if you desire.' translatedNoop}						forFlapNamed: 'Tools'.]