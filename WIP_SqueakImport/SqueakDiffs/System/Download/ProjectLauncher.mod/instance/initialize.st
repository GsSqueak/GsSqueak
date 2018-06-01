initialization
initialize
	super initialize.
	showSplash := true.
	HTTPClient isRunningInBrowser
		ifTrue: [whichFlaps := 'etoy']