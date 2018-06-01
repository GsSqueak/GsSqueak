system hookup
onMIDIFileNamed: fileName
	"Return a ScorePlayerMorph on the score from the MIDI file of the given name."

	| score player |
	score := MIDIFileReader scoreFromFileNamed: fileName	.
	player := ScorePlayer onScore: score.
	^ self new onScorePlayer: player title: fileName
