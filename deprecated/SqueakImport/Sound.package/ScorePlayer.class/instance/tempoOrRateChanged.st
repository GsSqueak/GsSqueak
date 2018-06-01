operating
tempoOrRateChanged
	"This method should be called after changing the tempo or rate."

	secsPerTick := 60.0 / (tempo * rate * score ticksPerQuarterNote).
	ticksClockIncr := (1.0 / self controlRate) / secsPerTick.
