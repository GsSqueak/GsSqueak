accessing
setHasNoCountersFlag
	self
		objectAt: 1
		put: (self header bitOr: 32768)