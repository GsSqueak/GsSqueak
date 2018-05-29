commands
playOnce

	| scaledData scale |
	data isEmpty ifTrue: [^ self].  "nothing to play"
	scale := 1.
	data do: [:v |
		| absV |
		(absV := v abs) > scale ifTrue: [scale := absV]].
	scale := 32767.0 / scale.
	scaledData := SoundBuffer newMonoSampleCount: data size.
	1 to: data size do: [:i | scaledData at: i put: (scale * (data at: i)) truncated].
	SoundService default playSampledSound: scaledData rate: 11025.
