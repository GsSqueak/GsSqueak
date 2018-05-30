initialization
reset
	"Initialize the receiver to act just as a FormCanvas"
	super reset.
	foundMorph := false.
	doStop := false.
	stopMorph := nil.