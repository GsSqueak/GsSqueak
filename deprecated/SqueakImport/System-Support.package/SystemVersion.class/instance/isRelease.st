testing
isRelease
	^ self isReleaseCandidate not and: [version last isDigit]