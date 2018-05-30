accessing
duration
	"Answer the duration in seconds of my MIDI score when played at the current rate. Take tempo changes into account."

	| totalSecs currentTempo lastTempoChangeTick |
	totalSecs := 0.0.
	currentTempo := 120.0.  "quarter notes per minute"
	lastTempoChangeTick := 0.
	score tempoMap ifNotNil: [
		score tempoMap do: [:tempoEvt |
			"accumulate time up to this tempo change event"
			secsPerTick := 60.0 / (currentTempo * rate * score ticksPerQuarterNote).
			totalSecs := totalSecs + (secsPerTick * (tempoEvt time - lastTempoChangeTick)).

			"set the new tempo"
			currentTempo := (120.0 * (500000.0 / tempoEvt tempo)) roundTo: 0.01.
			lastTempoChangeTick := tempoEvt time]].

	"add remaining time through end of score"
	secsPerTick := 60.0 / (currentTempo * rate * score ticksPerQuarterNote).
	totalSecs := totalSecs + (secsPerTick * (score durationInTicks - lastTempoChangeTick)).
	^ totalSecs
