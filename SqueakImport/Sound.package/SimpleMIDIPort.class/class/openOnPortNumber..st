instance creation
openOnPortNumber: portNum
	"Answer a new instance of me for the given MIDI port number."
	"Details: All clients of a particular MIDI port should share the same instance of me. This allows accesses to the port to be serialized and shared port-related state state to be maintained."

	SimpleMIDIPort allSubInstancesDo: [:p |
		p portNumber = portNum ifTrue: [
			"share the existing port object for this port number"
			^ p]].

	^ super new openOnPortNumber: portNum
