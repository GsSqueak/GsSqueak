event handling
mouseUp: evt
	"Since mouseUp likely changes our state, do a step so we're updated immediately"
	super mouseUp: evt.
	self step