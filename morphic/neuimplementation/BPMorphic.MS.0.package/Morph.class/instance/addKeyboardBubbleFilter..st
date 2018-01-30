events-filtering-bubbling
addKeyboardBubbleFilter: anObject 
	self
		keyboardBubbleFilters: (self addFilter: anObject to: self keyboardBubbleFilters)