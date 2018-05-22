testing
isCodeFreeze
	^ self isFeatureFreeze and: [(version endsWith: #beta) not]