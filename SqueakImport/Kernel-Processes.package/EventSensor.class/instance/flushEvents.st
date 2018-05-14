accessing
flushEvents
	self eventQueue ifNotNil:[:queue | queue flush].