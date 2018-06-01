other
interpolatedWindowAt: index width: nSamples
	"Return an array of N samples starting at the given index in my data."

	| scale data baseIndex scaledFrac scaledOneMinusFrac prevSample |
	scale := 10000.
	data := graph data.
	index isInteger
		ifTrue: [^ (index to: index + nSamples - 1) collect: [:i | data at: i]].
	baseIndex := index truncated.
	scaledFrac := ((index asFloat - baseIndex) * scale) truncated.
	scaledOneMinusFrac := scale - scaledFrac.
	prevSample := data at: baseIndex.
	^ (baseIndex + 1 to: baseIndex + nSamples) collect: [:i | | v nextSample |
		nextSample := data at: i.
		v := ((nextSample * scaledFrac) + (prevSample * scaledOneMinusFrac)) // scale.
		prevSample := nextSample.
		v].
