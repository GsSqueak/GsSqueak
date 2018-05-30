layout
acceptDroppingMorph: aMorph event: evt

	super acceptDroppingMorph: aMorph event: evt.
	somethingChanged := true.
	