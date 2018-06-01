mapping
mapCloseCodeTag

	| theDoIt |
	theDoIt := runStack top first
		detect: [:attribute | attribute isKindOf: TextDoIt]
		ifNone: [^ self "nothing found, ignore"].
	theDoIt evalString: (String withAll: (string copyFrom: runStack top third to: string size)).