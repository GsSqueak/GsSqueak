squeak protocol
localOffset: aDuration
	"Override the local time zone (for testing). This disables the #automaticTimezone: preference"
	self localTimeZone: (TimeZone offset: aDuration name: 'Local Time (override)' abbreviation: 'LTO').
