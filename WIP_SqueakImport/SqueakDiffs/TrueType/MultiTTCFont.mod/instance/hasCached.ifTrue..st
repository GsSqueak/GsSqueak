all
hasCached: char ifTrue: aBlock

	| value triplet |
	value := char asciiValue.
	triplet := cache at: (map at: value ifAbsent: [^ false]).
	triplet ifNil: [^ false].
	(triplet at: 1) ~= value ifTrue: [^ false].
	(triplet at: 2) ~= foregroundColor ifTrue: [^ false].
	^ aBlock value: (triplet at: 3).
