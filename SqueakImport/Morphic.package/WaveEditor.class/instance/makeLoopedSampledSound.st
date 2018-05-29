menu
makeLoopedSampledSound
	| data end snd basePitch |
	data := graph data.
	snd := (loopEnd = 0 or: [loopLength = 0]) 
				ifTrue: 
					["save as unlooped"

					basePitch := perceivedFrequency = 0 
						ifTrue: [100.0]
						ifFalse: [perceivedFrequency].
					LoopedSampledSound new 
						unloopedSamples: data
						pitch: basePitch
						samplingRate: samplingRate]
				ifFalse: 
					[end := (loopEnd min: data size) max: 1.
					basePitch := samplingRate * loopCycles / loopLength.
					LoopedSampledSound new 
						samples: data
						loopEnd: end
						loopLength: end
						pitch: basePitch
						samplingRate: samplingRate].
	snd addReleaseEnvelope.
	^snd