sound generation
skipAmbientEventsThruTick: startTick
	"Skip ambient events through the given score tick."

	score ambientTrack withIndexDo:
		[:evt :i | evt time > startTick ifTrue:
			[^ trackEventIndex at: trackEventIndex size put: i]].
