menu
showEnvelope
	"Show an envelope wave constructed by collecting the maximum absolute value of the samples in fixed-size time windows of mSecsPerQuantum."

	| data mSecsPerQuantum samplesPerQuantum result endOfQuantum maxThisQuantum s nSamples |
	data := graph data.
	mSecsPerQuantum := 10.
	samplesPerQuantum := (mSecsPerQuantum / 1000.0) * self samplingRate.
	result := WriteStream on: (Array new: data size // samplesPerQuantum).
	endOfQuantum := samplesPerQuantum.
	maxThisQuantum := 0.
	nSamples := (data isKindOf: SoundBuffer)
		ifTrue: [data monoSampleCount]
		ifFalse: [data size].
	1 to: nSamples do: [:i |
		i asFloat > endOfQuantum ifTrue: [
			result nextPut: maxThisQuantum.
			maxThisQuantum := 0.
			endOfQuantum := endOfQuantum + samplesPerQuantum].
		s := data at: i.
		s < 0 ifTrue: [s := 0 - s].
		s > maxThisQuantum ifTrue: [maxThisQuantum := s]].
	WaveEditor openOn: result contents.
