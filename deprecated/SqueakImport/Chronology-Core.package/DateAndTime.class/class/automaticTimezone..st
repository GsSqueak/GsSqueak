preferences
automaticTimezone: aBoolean
	"Accessor for the system-wide preference.
	Note this gets disabled in localTimeZone: to make that override stick"
	
	AutomaticTimezone := aBoolean.
	aBoolean ifTrue: [self now].		"fetch timezone immediately"