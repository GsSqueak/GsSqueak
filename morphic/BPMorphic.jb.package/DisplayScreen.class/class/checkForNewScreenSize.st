display box access
checkForNewScreenSize
	"Check whether the screen size has changed and if so take appropriate
	actions "
	Display extent = DisplayScreen actualScreenSize
		ifFalse: [Display restore]