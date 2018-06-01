ambient track
ambientEventAfter: eventIndex ticks: scoreTicks
	| evt |
	(ambientTrack == nil or: [eventIndex > ambientTrack size]) ifTrue: [^ nil].
	evt := ambientTrack at: eventIndex.
	evt time <= scoreTicks ifTrue: [^ evt].
	^ nil