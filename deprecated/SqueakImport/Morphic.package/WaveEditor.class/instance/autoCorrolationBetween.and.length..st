other
autoCorrolationBetween: index1 and: index2 length: length
	"Answer the cummulative error between the portions of my waveform starting at the given two indices and extending for the given length. The larger this error, the greater the difference between the two waveforms."

	| data error i1 e |
	data := graph data.
	error := 0.
	i1 := index1.
	index2 to: (index2 + length - 1) do: [:i2 |
		e := (data at: i1) - (data at: i2).
		e < 0 ifTrue: [e := 0 - e].
		error := error + e.
		i1 := i1 + 1].
	^ error
