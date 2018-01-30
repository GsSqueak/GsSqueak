world menu
toggleClassicNavigatorIfAppropriate
	"If appropriate, toggle the presence of classic navigator"
	Preferences classicNavigatorEnabled
		ifTrue: [^ Preferences toggle: #showProjectNavigator]