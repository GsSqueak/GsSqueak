common requests
commonRequestStrings
	(CommonRequestStrings == nil
			or: [CommonRequestStrings isKindOf: Array])
		ifTrue: [self initializeCommonRequestStrings].
	^ CommonRequestStrings