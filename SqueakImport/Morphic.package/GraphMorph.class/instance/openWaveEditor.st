sound
openWaveEditor

	| scaleFactor scaledData editor |
	self data: data.  "make sure maxVal and minVal are current"
	scaleFactor := 32767 // ((minVal abs max: maxVal abs) max: 1).
	scaledData := SoundBuffer newMonoSampleCount: data size.
	1 to: data size do: [:i | scaledData at: i put: (scaleFactor * (data at: i)) truncated].
	editor := WaveEditor new
		data: scaledData;
		samplingRate: 11025;
		perceivedFrequency: 220.0.
	editor openInWorld.
