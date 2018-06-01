initialization
initialize
"initialize the state of the receiver"

	super initialize.
""
	waitingForClickInside := true.
	Preferences noviceMode
		ifTrue: [self setBalloonText: 'stretch']