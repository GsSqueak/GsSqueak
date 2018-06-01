examples
example
	"Here's one way to run the MIDI synth. It will get a nice Morphic UI later. Click the mouse to stop running it. (Mac users note: be sure you have MIDI interface adaptor plugged in, or Squeak will hang waiting for the external clock signal.)."
	"MIDISynth example"

	| portNum synth |
	portNum := SimpleMIDIPort inputPortNumFromUser.
	portNum ifNil: [^ self].
	SoundPlayer useShortBuffer.
	synth := MIDISynth new
		midiPort: (SimpleMIDIPort openOnPortNumber: portNum).
	synth midiParser ignoreCommand: 224.  "filter out pitch bends"
	1 to: 16 do: [:i |
		(synth channel: i) instrument:
 			 (AbstractSound soundNamed: 'oboe1')].
	1 to: 16 do: [:ch | synth volumeForChannel: ch put: 0.2].

	synth processMIDIUntilMouseDown.
	SoundPlayer shutDown: true; initialize.  "revert to normal buffer size"
