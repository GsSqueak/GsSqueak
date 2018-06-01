simple keyboard
mouseDownPitch: midiKey event: event noteMorph: noteMorph
	| pitch |
	event hand hasSubmorphs ifTrue: [^ self  "no response if drag something over me"].
	event hand mouseFocus ifNil:
		["If dragged into me, then establish focus so I'll see moves"
		event hand newMouseFocus: noteMorph event: event].
	noteMorph color: playingKeyColor.
	pitch := AbstractSound pitchForMIDIKey: midiKey + 23.
	soundPlaying ifNotNil: [soundPlaying stopGracefully].
	soundPlaying := soundPrototype soundForPitch: pitch dur: 100.0 loudness: 0.3.
	SoundPlayer resumePlaying: soundPlaying quickStart: true.
