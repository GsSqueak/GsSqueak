instance creation
openDefault
	"Answer a new instance of me opened on the default MIDI port."

	^ self openOnPortNumber: DefaultPortNumber
