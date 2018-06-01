file reader services
servicePlayMidiFile
	"Answer a service for opening player on a midi file"

	^ SimpleServiceEntry 
		provider: self 
		label: 'play MIDI file'
		selector: #playFileNamed:
		description: 'play the MIDI file directly'
		buttonLabel: 'play'