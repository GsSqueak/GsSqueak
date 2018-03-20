event handling
mouseLeave: evt 
	"Revert to the normal hand cursor."
	super mouseLeave: evt.
	evt hand showTemporaryCursor: nil