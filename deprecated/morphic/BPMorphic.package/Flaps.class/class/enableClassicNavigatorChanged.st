miscellaneous
enableClassicNavigatorChanged
	"The #classicNavigatorEnabled preference has changed. No senders in
	easily traceable in the image, but this is really sent by a Preference
	object! "
	Preferences classicNavigatorEnabled
		ifTrue: [Flaps disableGlobalFlapWithID: 'Navigator' translated.
			Preferences enable: #showProjectNavigator.
			self disableGlobalFlapWithID: 'Navigator' translated]
		ifFalse: [self enableGlobalFlapWithID: 'Navigator' translated.
			(Smalltalk at: #ActiveWorld) addGlobalFlaps].
	self doAutomaticLayoutOfFlapsIfAppropriate.
	Project current assureNavigatorPresenceMatchesPreference.
	(Smalltalk at: #ActiveWorld) reformulateUpdatingMenus