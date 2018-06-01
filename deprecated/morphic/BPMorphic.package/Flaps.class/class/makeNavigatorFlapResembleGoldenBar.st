miscellaneous
makeNavigatorFlapResembleGoldenBar
	"At explicit request, make the flap-based navigator resemble the
	golden bar. No senders in the image, but sendable from a doit"
	"Flaps makeNavigatorFlapResembleGoldenBar"
	Preferences setPreference: #classicNavigatorEnabled toValue: false.
	Preferences setPreference: #showProjectNavigator toValue: false.
	(self globalFlapTabWithID: 'Navigator' translated)
		ifNil: [SharedFlapTabs add: self newNavigatorFlap delete].
	self enableGlobalFlapWithID: 'Navigator' translated.
	Preferences setPreference: #navigatorOnLeftEdge toValue: true.
	(self globalFlapTabWithID: 'Navigator' translated)
		arrangeToPopOutOnMouseOver: true.
	(Smalltalk at: #ActiveWorld) addGlobalFlaps.
	self doAutomaticLayoutOfFlapsIfAppropriate.
	Project current assureNavigatorPresenceMatchesPreference