class initialization
initialize
	"Locale initialize"
	Smalltalk addToStartUpList: Locale.
	Preferences
		addPreference: #useLocale
		categories: #('general' )
		default: false
		balloonHelp: 'Use the system locale to set the system language, etc., at startup.  For time-zone handling, see automaticTimezone.'