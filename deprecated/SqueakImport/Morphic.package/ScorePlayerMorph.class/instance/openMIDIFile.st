initialization
openMIDIFile
	"Open a MIDI score and re-init controls..."
	| score fileName f player |
	fileName := UIManager default chooseFileMatchingSuffixes: #('mid' 'midi') label: 'Choose a MIDI file to open' translated.
	fileName isNil 
		ifTrue: [^ self ].

	f := FileStream readOnlyFileNamed: fileName.
	score := (MIDIFileReader new readMIDIFrom: f binary) asScore.
	f close.
	player := ScorePlayer onScore: score.
	self onScorePlayer: player title: fileName