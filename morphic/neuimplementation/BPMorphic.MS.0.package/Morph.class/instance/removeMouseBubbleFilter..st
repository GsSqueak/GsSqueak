events-filtering-bubbling
removeMouseBubbleFilter: anObject 
	self
		mouseBubbleFilters: (self removeFilter: anObject from: self mouseBubbleFilters)