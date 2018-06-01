accessing
scrollBarThickness: anInteger
	
	scrollBarThickness := anInteger.
	
	self updateMinimumExtent.
	
	self
		resizeScrollBars;
		resizeScroller;
		setScrollDeltas.