events
soundForEvent: noteEvent inTrack: trackIndex

	| sound player |
	player := pianoRoll scorePlayer.
	sound := MixedSound new.
	sound add: ((player instrumentForTrack: trackIndex)
					soundForMidiKey: noteEvent midiKey
					dur: noteEvent duration / (pianoRoll scorePlayer ticksForMSecs: 1000)
					loudness: (noteEvent velocity asFloat / 127.0))
			pan: (player panForTrack: trackIndex)
			volume: player overallVolume *
						(player volumeForTrack: trackIndex).
	^ sound
