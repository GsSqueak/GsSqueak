events-filtering-bubbling
removeEventBubbleFilter: anObject 	self		eventBubbleFilters: (self removeFilter: anObject from: self eventBubbleFilters)