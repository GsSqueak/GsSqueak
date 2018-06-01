class initialization
servicePlayMidiFile
	"Answer a service for opening player on a midi file"

	^ SimpleServiceEntry 
		provider: self 
		label: 'open in midi player'
		selector: #playMidiFile:
		description: 'open the midi-player tool on this file'
		buttonLabel: 'open'