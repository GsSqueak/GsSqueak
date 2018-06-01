system startup
startUp: startingAfresh
	"Set local timezone"
	startingAfresh & self automaticTimezone ifTrue: [self now].
