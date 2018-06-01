private
removedMorph: aMorph
	| trackSize |
	trackSize := score ambientTrack size.
	score removeAmbientEventWithMorph: aMorph.
	trackSize = score ambientTrack size ifFalse:
		["Update duration if we removed an event"
		scorePlayer updateDuration].
	^super removedMorph: aMorph