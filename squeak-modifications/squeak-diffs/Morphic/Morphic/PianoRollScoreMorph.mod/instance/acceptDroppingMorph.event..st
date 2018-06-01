layout
acceptDroppingMorph: aMorph event: evt
	"In addition to placing this morph in the pianoRoll, add a corresponding
	event to the score so that it will always appear when played, in addition
	to possibly triggering other actions"

	aMorph justDroppedIntoPianoRoll: self event: evt.
	super acceptDroppingMorph: aMorph event: evt.

