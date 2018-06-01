miscellaneous
automaticFlapLayoutChanged
	"Sent when the automaticFlapLayout preference changes.  No senders in easily traceable in the image, but this is really sent by a Preference object!"

	Preferences automaticFlapLayout ifTrue:
		[self positionNavigatorAndOtherFlapsAccordingToPreference]