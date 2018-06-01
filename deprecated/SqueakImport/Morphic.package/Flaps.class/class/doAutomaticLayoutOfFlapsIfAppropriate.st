miscellaneous
doAutomaticLayoutOfFlapsIfAppropriate
	"Do automatic layout of flaps if appropriate"

	Preferences automaticFlapLayout ifTrue:
		[self positionNavigatorAndOtherFlapsAccordingToPreference]