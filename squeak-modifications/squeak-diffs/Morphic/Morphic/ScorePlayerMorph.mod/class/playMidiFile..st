class initialization
playMidiFile: fullName
	"Play a MIDI file."
 
	Smalltalk at: #MIDIFileReader ifPresent: [:midiReader |
			| f score |
			f := (FileStream oldFileNamed: fullName) binary.
			score := (midiReader new readMIDIFrom: f) asScore.
			f close.
			self openOn: score title: (FileDirectory localNameFor: fullName)]
