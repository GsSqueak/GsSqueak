parts bin
initializeToStandAlone
	super initializeToStandAlone.
	showSeconds := false.
	self font: (Preferences standardMenuFont emphasized: 1).
	self step