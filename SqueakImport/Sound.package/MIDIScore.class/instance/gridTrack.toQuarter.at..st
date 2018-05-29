editing
gridTrack: trackIndex toQuarter: quarterDelta at: indexInTrack

	| track selStartTime delta |
	track := tracks at: trackIndex.
	selStartTime := (track at: indexInTrack) time.
	delta := (self gridToQuarterNote: selStartTime + (quarterDelta*ticksPerQuarterNote))
				- selStartTime.
	indexInTrack to: track size do:
		[:i | (track at: i) adjustTimeBy: delta].
