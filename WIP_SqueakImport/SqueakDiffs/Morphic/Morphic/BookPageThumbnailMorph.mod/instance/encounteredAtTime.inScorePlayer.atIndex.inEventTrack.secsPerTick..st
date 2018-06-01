piano rolls
encounteredAtTime: ticks inScorePlayer: scorePlayer atIndex: index inEventTrack: track secsPerTick: secsPerTick
	"Flip to this page with no extra sound"
	BookMorph turnOffSoundWhile: [self doPageFlip]