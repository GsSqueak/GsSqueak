class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#RecordingControlsMorph.	#authoringPrototype.	'Sound' translatedNoop. 	'A device for making sound recordings.' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#RecordingControlsMorph.	#authoringPrototype.	'Sound' translatedNoop.	'A device for making sound recordings.'}
						forFlapNamed: 'Widgets'.]