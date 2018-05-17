testing
isReleaseCandidate
	^ (version findTokens: 'rc') size > 1