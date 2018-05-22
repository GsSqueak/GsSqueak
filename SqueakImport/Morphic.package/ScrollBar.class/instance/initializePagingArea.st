initialize
initializePagingArea
	
	"Appearance"
	pagingArea := RectangleMorph newBounds: self totalSliderArea.
	self addMorphBack: pagingArea.
			
	"Interactions"
	pagingArea
		on: #mouseDown
		send: #scrollPageInit:
		to: self.
	pagingArea
		on: #mouseUp
		send: #finishedScrolling
		to: self.
	
