scrolling
goToTime: scoreTime

	| track trackSize index newLeftEdgeTime |
	newLeftEdgeTime := scoreTime asInteger.
	newLeftEdgeTime < leftEdgeTime
		ifTrue: [indexInTrack := Array new: score tracks size+1 withAll: 1].
	leftEdgeTime := newLeftEdgeTime.
	1 to: score tracks size do: [:trackIndex |
		track := score tracks at: trackIndex.
		index := indexInTrack at: trackIndex.
		trackSize := track size.
		[(index < trackSize) and:
		 [(track at: index) endTime < leftEdgeTime]]
			whileTrue: [index := index + 1].
		indexInTrack at: trackIndex put: index].
	self addNotes.
