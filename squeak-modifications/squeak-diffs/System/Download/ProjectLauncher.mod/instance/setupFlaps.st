initialization
setupFlaps
	"Only called when the image has been launched in a browser.  If I am requested to show etoy flaps, then remove any pre-existing shared flaps and put up the supplies flap only.  if I am requested to show all flaps, then if flaps already exist, use them as is, else set up to show the default set of standard flaps."

	((whichFlaps = 'etoy')
		or: [Preferences eToyFriendly])
		ifTrue:
			[Flaps addAndEnableEToyFlaps].
	whichFlaps = 'all'
		ifTrue: [Flaps sharedFlapsAllowed
				ifFalse: [Flaps enableGlobalFlaps]]