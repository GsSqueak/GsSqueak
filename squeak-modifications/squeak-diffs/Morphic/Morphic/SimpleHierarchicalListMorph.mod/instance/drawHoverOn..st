drawing
drawHoverOn: aCanvas 

	self hoveredMorph ifNil: [^ self].
	PluggableListMorph highlightHoveredRow ifFalse: [^ self].
	
	aCanvas
		transformBy: scroller transform
		clippingTo: scroller innerBounds
		during: [:c | self hoveredMorph drawHoverOn: c].