note playing
soundOfDuration: duration

	| sound |
	sound := MixedSound new.
	sound add: (self noteOfDuration: duration)
		pan: (owner scorePlayer panForTrack: trackIndex)
		volume: owner scorePlayer overallVolume *
				(owner scorePlayer volumeForTrack: trackIndex).
	^ sound reset
