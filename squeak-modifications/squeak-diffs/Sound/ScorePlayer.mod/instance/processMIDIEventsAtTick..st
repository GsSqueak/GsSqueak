midi output
processMIDIEventsAtTick: scoreTick
	"Process note events through the given score tick using MIDI."

	| j evt |
	1 to: score tracks size do: [:i |
		j := trackEventIndex at: i.
		[evt := score eventForTrack: i after: j ticks: scoreTick.
		 evt ~~ nil] whileTrue: [
			evt isNoteEvent
				ifTrue: [
					(muted at: i) ifFalse: [
						evt startNoteOnMidiPort: midiPort.
						activeMIDINotes add: (Array with: evt with: i)]]
				ifFalse: [evt outputOnMidiPort: midiPort].
			j := j + 1.
			trackEventIndex at: i put: j]].
	self turnOffActiveMIDINotesAt: scoreTick.
