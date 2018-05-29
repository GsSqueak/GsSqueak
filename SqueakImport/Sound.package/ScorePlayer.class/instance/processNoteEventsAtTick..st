sound generation
processNoteEventsAtTick: scoreTick
	"Process note events through the given score tick using internal Squeak sound synthesis."

	| instr j evt snd |
	1 to: score tracks size do: [:i |
		instr := instruments at: i.
		j := trackEventIndex at: i.
		[evt := score eventForTrack: i after: j ticks: scoreTick.
		 evt ~~ nil] whileTrue: [
			(evt isNoteEvent and: [(muted at: i) not]) ifTrue: [
				snd := instr
					soundForMidiKey: evt midiKey
					dur: secsPerTick * evt duration
					loudness: evt velocity asFloat / 127.0.
				activeSounds add: (Array with: snd with: i)].
			j := j + 1.
			trackEventIndex at: i put: j]].
