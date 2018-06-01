menu
playTestNote

	| data end snd loopDur dur |
	(loopEnd = 0 or: [loopLength = 0]) ifTrue: [^ self].
	data := graph data.
	end := (loopEnd min: data size) max: 1.
	snd := LoopedSampledSound new
		samples: data loopEnd: end loopLength: loopLength
		pitch: 100.0 samplingRate: samplingRate.

	loopDur := (4.0 * loopLength / samplingRate) max: 2.0.  "longer of 4 loops or 2 seconds"
	dur := (data size / samplingRate) + loopDur.
	(snd
		addReleaseEnvelope;
		setPitch: 100.0 dur: dur loudness: 0.5) play.
