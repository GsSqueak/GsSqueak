ansi protocol
now
	| clockAndOffset localSeconds |
	clockAndOffset := self clock utcMicrosecondClockWithOffset.
	localSeconds := self localOffset asSeconds.
	(self automaticTimezone and: [localSeconds ~= clockAndOffset second])
		ifTrue: [self setLocalOffsetAutomatically: (Duration seconds: (localSeconds := clockAndOffset second))].
	^self now: clockAndOffset first + (localSeconds * 1000000) offset: self localOffset