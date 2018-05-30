playing
mixSampleCount: n into: aSoundBuffer startingAt: startIndex leftVol: leftVol rightVol: rightVol
	"Repeatedly play my sounds."

	| i count samplesNeeded |
	i := startIndex.
	samplesNeeded := n.
	[samplesNeeded > 0] whileTrue: [
		count := seqSound samplesRemaining min: samplesNeeded.
		count = 0 ifTrue: [
			self reset.
			count := seqSound samplesRemaining min: samplesNeeded.
			count = 0 ifTrue: [^ self]].  "zero length sound"
		seqSound mixSampleCount: count into: aSoundBuffer startingAt: i leftVol: leftVol rightVol: rightVol.
		i := i + count.
		samplesNeeded := samplesNeeded - count].
