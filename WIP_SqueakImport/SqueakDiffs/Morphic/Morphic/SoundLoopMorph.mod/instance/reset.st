playing
reset
	"Reset my internal state for a replay."

	seqSound := self buildSound reset.
	samplesUntilNextControl := (self samplingRate // self controlRate).
	controlIndex := 0.
	self positionCursor