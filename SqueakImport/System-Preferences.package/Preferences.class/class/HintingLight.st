standard queries
HintingLight
	^ self
		valueOfFlag: #HintingLight
		ifAbsent: [true]