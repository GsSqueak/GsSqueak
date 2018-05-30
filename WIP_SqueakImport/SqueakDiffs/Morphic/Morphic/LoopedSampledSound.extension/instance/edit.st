*Morphic-MorphicExtras-Sound
edit
	"Open a WaveEditor on this sound."

	| loopLen ed |
	loopLen := scaledLoopLength asFloat / LoopIndexScaleFactor.
	ed := WaveEditor new
		data: leftSamples;
		samplingRate: originalSamplingRate;
		loopEnd: loopEnd;
		loopLength: loopLen;
		loopCycles: (loopLen / (originalSamplingRate asFloat / perceivedPitch)) rounded.
	ed openInWorld.
