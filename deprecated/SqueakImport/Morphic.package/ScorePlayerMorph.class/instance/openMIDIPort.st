initialization
openMIDIPort

	| portNum |
	portNum := SimpleMIDIPort outputPortNumFromUser.
	portNum ifNil: [^ self].
	scorePlayer openMIDIPort: portNum.
	LastMIDIPort := portNum.
