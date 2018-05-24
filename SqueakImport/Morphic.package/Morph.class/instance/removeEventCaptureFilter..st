events-filtering-capturing
removeEventCaptureFilter: anObject
	self eventCaptureFilters: (self removeFilter: anObject from: self eventCaptureFilters).