sound generation
processAmbientEventsAtTick: scoreTick
	"Process ambient events through the given tick."

	| i evt |
	i := trackEventIndex at: trackEventIndex size.
	[evt := score ambientEventAfter: i ticks: scoreTick.
	 evt ~~ nil] whileTrue: [
		i := i + 1.
		evt occurAtTime: scoreTick inScorePlayer: self atIndex: i inEventTrack: score ambientTrack secsPerTick: secsPerTick].
	trackEventIndex at: trackEventIndex size put: i.
