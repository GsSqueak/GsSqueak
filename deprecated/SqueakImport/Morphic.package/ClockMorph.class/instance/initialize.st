initialization
initialize
	"initialize the state of the receiver"

	super initialize.

	showSeconds := true.
	show24hr := false.
	self font: Preferences standardMenuFont emphasis: 1.
	self step