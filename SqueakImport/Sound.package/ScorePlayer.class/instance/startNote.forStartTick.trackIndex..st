sound generation
startNote: noteEvent forStartTick: startTick trackIndex: trackIndex
	"Prepare a note to begin playing at the given tick. Used to start playing at an arbitrary point in the score. Handle both MIDI and built-in synthesis cases."

	| snd |
	midiPort
		ifNil: [
			snd := (instruments at: trackIndex)
				soundForMidiKey: noteEvent midiKey
				dur: secsPerTick * (noteEvent endTime - startTick)
				loudness: noteEvent velocity asFloat / 127.0.
			activeSounds add: (Array with: snd with: trackIndex)]
		ifNotNil: [
			noteEvent startNoteOnMidiPort: midiPort.
			activeMIDINotes add: (Array with: noteEvent with: trackIndex)].
