editing
eventForTrack: trackIndex after: eventIndex ticks: scoreTick

	| track evt |
	track := tracks at: trackIndex.
	eventIndex > track size ifTrue: [^ nil].
	evt := track at: eventIndex.
	evt time > scoreTick ifTrue: [^ nil].
	^ evt
