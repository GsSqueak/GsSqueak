menu
playLoop

	| sz i1 i2 snd len |
	sz := graph data size.
	i1 := ((loopEnd - loopLength) truncated min: sz) max: 1.
	i2 := (loopEnd min: sz) max: i1.
	len := (i2 - i1) + 1.
	len < 2 ifTrue: [^ self].

	snd := LoopedSampledSound new
		samples: (graph data copyFrom: i1 to: i2)
		loopEnd: len
		loopLength: loopLength
		pitch: 100.0
		samplingRate: samplingRate.

	"sustain for the longer of four loops or two seconds"
	snd setPitch: 100.0
		dur: (((4.0 * loopLength) / samplingRate) max: 2.0)
		loudness: 0.5.
	snd play.
