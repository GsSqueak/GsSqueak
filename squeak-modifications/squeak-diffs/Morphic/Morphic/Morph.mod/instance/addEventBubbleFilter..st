events-filtering-bubbling
addEventBubbleFilter: anObject
	self eventBubbleFilters: (self addFilter: anObject to: self eventBubbleFilters).