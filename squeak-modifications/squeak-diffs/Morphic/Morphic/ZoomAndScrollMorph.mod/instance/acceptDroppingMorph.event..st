layout
acceptDroppingMorph: morphToDrop event: evt

	^morphToDrop rejectDropMorphEvent: evt.		"put it back where it came from"

