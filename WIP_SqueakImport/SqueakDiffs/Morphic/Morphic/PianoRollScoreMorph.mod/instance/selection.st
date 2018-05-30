accessing
selection
	"Returns an array of 3 elements:
		trackIndex
		indexInTrack of first note
		indexInTrack of last note"

	| trackIndex track |
	selection ifNil:  "If no selection, return last event of 1st non-muted track (or nil)"
		[trackIndex := (1 to: score tracks size)
			detect: [:i | (scorePlayer mutedForTrack: i) not] ifNone: [^ nil].
		track := score tracks at: trackIndex.
		^ Array with: trackIndex with: track size with: track size].
	(scorePlayer mutedForTrack: selection first)
		ifTrue: [selection := nil.  ^ self selection].
	^ selection