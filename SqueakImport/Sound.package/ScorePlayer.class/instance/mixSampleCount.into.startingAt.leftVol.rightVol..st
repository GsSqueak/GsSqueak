sound generation
mixSampleCount: n into: aSoundBuffer startingAt: startIndex leftVol: leftVol rightVol: rightVol
	"Play a number of sounds concurrently. The level of each sound can be set independently for the left and right channels."

	| myLeftVol myRightVol someSoundIsDone pair snd trk left right |
	myLeftVol := (leftVol * overallVolume) asInteger.
	myRightVol := (rightVol * overallVolume) asInteger.
	someSoundIsDone := false.
	1 to: activeSounds size do: [:i |
		pair := activeSounds at: i.
		snd := pair at: 1.
		trk := pair at: 2.
		left := (myLeftVol * (leftVols at: trk)) // ScaleFactor.
		right := (myRightVol * (rightVols at: trk)) // ScaleFactor.
		snd samplesRemaining > 0
			ifTrue: [
				snd mixSampleCount: n into: aSoundBuffer startingAt: startIndex leftVol: left rightVol: right]
			ifFalse: [someSoundIsDone := true]].

	someSoundIsDone ifTrue: [
		activeSounds := activeSounds select: [:p | p first samplesRemaining > 0]].
