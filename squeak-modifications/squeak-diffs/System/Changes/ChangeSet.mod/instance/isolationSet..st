isolation layers
isolationSet: setOrNil

	setOrNil == self
		ifTrue: [isolationSet := nil]  "Means this IS the isolation set"
		ifFalse: [isolationSet := setOrNil]