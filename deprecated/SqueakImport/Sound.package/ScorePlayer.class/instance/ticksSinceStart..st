accessing
ticksSinceStart: newTicks
	"Adjust ticks to folow, eg, piano roll autoscrolling"

	self isPlaying ifFalse: [ticksSinceStart := newTicks]
