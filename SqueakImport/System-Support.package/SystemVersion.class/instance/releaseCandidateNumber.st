accessing
releaseCandidateNumber
	^ self isReleaseCandidate
		ifFalse: [0]
		ifTrue: [(version findTokens: 'rc') last asInteger]