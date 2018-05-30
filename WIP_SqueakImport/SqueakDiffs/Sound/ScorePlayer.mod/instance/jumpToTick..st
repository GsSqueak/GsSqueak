sound generation
jumpToTick: startTick


	self reset.
	self processTempoMapAtTick: startTick.
	self skipNoteEventsThruTick: startTick.
	self skipAmbientEventsThruTick: startTick.
	ticksSinceStart := startTick.
