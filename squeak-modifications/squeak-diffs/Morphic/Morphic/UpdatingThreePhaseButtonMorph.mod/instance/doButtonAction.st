button
doButtonAction
	"Since the action likely changes our state, do a step so we're updated immediately"
	super doButtonAction.
	self step
