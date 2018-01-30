other
restore
	DisplayScreen startUp.
	Project current
		ifNotNil: [:p | p displaySizeChanged]