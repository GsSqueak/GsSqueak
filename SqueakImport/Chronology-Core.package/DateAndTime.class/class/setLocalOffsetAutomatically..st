squeak protocol
setLocalOffsetAutomatically: aDuration
	"Set the duration we are offset from UTC (done automatically in #now)"
	LocalTimeZone := (TimeZone offset: aDuration name: 'Local Time' abbreviation: 'LT').
