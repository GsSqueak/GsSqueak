playing
doControl

	seqSound doControl.
	controlIndex := controlIndex + 1.
	controlIndex >= (self controlRate * (self innerBounds width // 128))
		ifTrue: [controlIndex := 0].
