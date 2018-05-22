accessing
minorVersionNumber

	| pointIndex |
	pointIndex := version indexOf: $..
	pointIndex = 0 ifTrue: [^ nil].
	^ (version
		copyFrom: pointIndex
		to: (self isRelease
			"e.g. Squeak5.1"
			ifTrue: [version size]
			"e.g. Squeak5.1rc5"
			ifFalse: [(pointIndex+1 to: version size) detect: [:ea | (version at: ea) isDigit not]])) asInteger