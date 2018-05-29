editing
jitterStartAndEndTimesBy: mSecs

	| r range halfRange |
	r := Random new.
	range := 2.0 * mSecs.
	halfRange := mSecs.
	tracks do: [:t |
		t do: [:e | | newEnd newStart oldEnd |
			e isNoteEvent ifTrue: [
				oldEnd := e time + e duration.
				newEnd := oldEnd + ((r next * range) asInteger - halfRange).
				newStart := e time + ((r next * range) asInteger - halfRange).
				e time: newStart.
				e duration: (newEnd - newStart)]]].

				