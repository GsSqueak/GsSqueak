preferences
automaticTimezone
	"Accessor for the system-wide preference"
	
	<preference: 'Automatically set local timezone'
		category: 'general'
		description: 'If enabled, the timezone will automatically be kept in sync with the system''s time (daylight savings changes etc.)'
		type: #Boolean>
	^AutomaticTimezone ifNil: [ true ]