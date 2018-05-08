ansi protocol
= comparand
	^ self class = comparand class 
		and: [((self noTimezone or: [ comparand noTimezone ])
			ifTrue: [ self start hasEqualTicks: comparand start ]
			ifFalse: [ self start = comparand start ])
		and: [ self duration = comparand duration ] ]
.