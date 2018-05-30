piano rolls
encounteredAtTime: ticks inScorePlayer: scorePlayer atIndex: index inEventTrack: track secsPerTick: secsPerTick

	"hack... since we are called from within the SoundPlayer loop, the Semaphore will
	block attempts to play directly from here"
	WorldState addDeferredUIMessage: [sound play].