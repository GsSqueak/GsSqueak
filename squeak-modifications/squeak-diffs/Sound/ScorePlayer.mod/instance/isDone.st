sound generation
isDone

	| track |
	activeSounds size > 0 ifTrue: [^ false].
	activeMIDINotes size > 0 ifTrue: [^ false].
	1 to: score tracks size do: [:i |
		track := score tracks at: i.
		(trackEventIndex at: i) <= track size ifTrue: [^ false]].
	(trackEventIndex last) <= score ambientTrack size ifTrue: [^ false].
	^ true
