as yet unclassified
withEToySound: aByteArray samplingRate: anInteger

	soundClassName := #SampledSound.
	channels := {aByteArray}.
	codecName := #GSMCodec.
	loopEnd := nil.	"???"
	loopLength :=  nil.
	perceivedPitch := 100.0.
	samplingRate  := anInteger.
	gain  := 1.0.	"???"
	firstSample := 1.
	cachedSound  := nil.	"???"