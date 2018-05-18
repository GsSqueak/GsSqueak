events-filtering-capturing
removeMouseCaptureFilter: anObject
	self mouseCaptureFilters: (self removeFilter: anObject from: self mouseCaptureFilters).