stepping
stepTime
	^ model
		ifNil: [200
			"milliseconds"]
		ifNotNil: [model stepTimeIn: self]