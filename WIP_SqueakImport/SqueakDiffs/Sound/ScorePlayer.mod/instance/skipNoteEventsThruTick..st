sound generation
skipNoteEventsThruTick: startTick
	"Skip note events through the given score tick using internal Squeak sound synthesis."

	| j evt |
	1 to: score tracks size do: [:i |
		j := trackEventIndex at: i.
		[evt := score eventForTrack: i after: j ticks: startTick.
		 evt == nil] whileFalse: [
			evt isNoteEvent
				ifTrue: [
					(((evt time + evt duration) > startTick) and: [(muted at: i) not]) ifTrue: [
						self startNote: evt forStartTick: startTick trackIndex: i]]
				ifFalse: [
					midiPort == nil ifFalse: [evt outputOnMidiPort: midiPort]].
			j := j + 1].
		trackEventIndex at: i put: j].
